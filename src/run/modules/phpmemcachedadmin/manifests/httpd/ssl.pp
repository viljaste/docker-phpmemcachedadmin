class phpmemcachedadmin::httpd::ssl {
  exec { 'mkdir -p /phpmemcachedadmin/ssl':
    path => ['/bin']
  }

  exec { 'mkdir -p /phpmemcachedadmin/ssl/private':
    path => ['/bin'],
    require => Exec['mkdir -p /phpmemcachedadmin/ssl']
  }

  exec { 'mkdir -p /phpmemcachedadmin/ssl/certs':
    path => ['/bin'],
    require => Exec['mkdir -p /phpmemcachedadmin/ssl/private']
  }

  file { '/root/opensslCA.cnf':
    ensure => present,
    content => template('phpmemcachedadmin/opensslCA.cnf.erb'),
    require => Exec['mkdir -p /phpmemcachedadmin/ssl/certs']
  }

  exec { 'openssl genrsa -out /phpmemcachedadmin/ssl/private/phpmemcachedadminCA.key 4096':
    timeout => 0,
    path => ['/usr/bin'],
    require => File['/root/opensslCA.cnf']
  }

  exec { "openssl req -sha256 -x509 -new -days 3650 -extensions v3_ca -config /root/opensslCA.cnf -key /phpmemcachedadmin/ssl/private/phpmemcachedadminCA.key -out /phpmemcachedadmin/ssl/certs/phpmemcachedadminCA.crt":
    timeout => 0,
    path => ['/usr/bin'],
    require => Exec['openssl genrsa -out /phpmemcachedadmin/ssl/private/phpmemcachedadminCA.key 4096']
  }

  exec { 'openssl genrsa -out /phpmemcachedadmin/ssl/private/phpmemcachedadmin.key 4096':
    timeout => 0,
    path => ['/usr/bin'],
    require => Exec["openssl req -sha256 -x509 -new -days 3650 -extensions v3_ca -config /root/opensslCA.cnf -key /phpmemcachedadmin/ssl/private/phpmemcachedadminCA.key -out /phpmemcachedadmin/ssl/certs/phpmemcachedadminCA.crt"]
  }

  file { '/root/openssl.cnf':
    ensure => present,
    content => template('phpmemcachedadmin/openssl.cnf.erb'),
    require => Exec['openssl genrsa -out /phpmemcachedadmin/ssl/private/phpmemcachedadmin.key 4096']
  }

  exec { "openssl req -sha256 -new -config /root/openssl.cnf -key /phpmemcachedadmin/ssl/private/phpmemcachedadmin.key -out /phpmemcachedadmin/ssl/certs/phpmemcachedadmin.csr":
    timeout => 0,
    path => ['/usr/bin'],
    require => File['/root/openssl.cnf']
  }

  exec { "openssl x509 -req -sha256 -CAcreateserial -days 3650 -extensions v3_req -extfile /root/opensslCA.cnf -in /phpmemcachedadmin/ssl/certs/phpmemcachedadmin.csr -CA /phpmemcachedadmin/ssl/certs/phpmemcachedadminCA.crt -CAkey /phpmemcachedadmin/ssl/private/phpmemcachedadminCA.key -out /phpmemcachedadmin/ssl/certs/phpmemcachedadmin.crt":
    timeout => 0,
    path => ['/usr/bin'],
    require => Exec["openssl req -sha256 -new -config /root/openssl.cnf -key /phpmemcachedadmin/ssl/private/phpmemcachedadmin.key -out /phpmemcachedadmin/ssl/certs/phpmemcachedadmin.csr"]
  }
}
