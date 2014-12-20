class phpmemcachedadmin::httpd::ssl {
  exec { 'openssl genrsa -out /phpmemcachedadmin/ssl/private/phpmemcachedadminCA.key 4096':
    timeout => 0,
    path => ['/usr/bin']
  }

  exec { "openssl req -x509 -new -nodes -key /phpmemcachedadmin/ssl/private/phpmemcachedadminCA.key -days 365 -subj /C=/ST=/L=/O=/CN=phpmemcachedadmin -out /phpmemcachedadmin/ssl/certs/phpmemcachedadminCA.crt":
    timeout => 0,
    path => ['/usr/bin'],
    require => Exec['openssl genrsa -out /phpmemcachedadmin/ssl/private/phpmemcachedadminCA.key 4096']
  }

  exec { 'openssl genrsa -out /phpmemcachedadmin/ssl/private/phpmemcachedadmin.key 4096':
    timeout => 0,
    path => ['/usr/bin'],
    require => Exec["openssl req -x509 -new -nodes -key /phpmemcachedadmin/ssl/private/phpmemcachedadminCA.key -days 365 -subj /C=/ST=/L=/O=/CN=phpmemcachedadmin -out /phpmemcachedadmin/ssl/certs/phpmemcachedadminCA.crt"]
  }

  $subj = "/C=/ST=/L=/O=/CN=$server_name"

  exec { "openssl req -sha256 -new -key /phpmemcachedadmin/ssl/private/phpmemcachedadmin.key -subj $subj -out /phpmemcachedadmin/ssl/certs/phpmemcachedadmin.csr":
    timeout => 0,
    path => ['/usr/bin'],
    require => Exec['openssl genrsa -out /phpmemcachedadmin/ssl/private/phpmemcachedadmin.key 4096']
  }

  exec { "openssl x509 -req -in /phpmemcachedadmin/ssl/certs/phpmemcachedadmin.csr -CA /phpmemcachedadmin/ssl/certs/phpmemcachedadminCA.crt -CAkey /phpmemcachedadmin/ssl/private/phpmemcachedadminCA.key -CAcreateserial -out /phpmemcachedadmin/ssl/certs/phpmemcachedadmin.crt -days 365":
    timeout => 0,
    path => ['/usr/bin'],
    require => Exec["openssl req -sha256 -new -key /phpmemcachedadmin/ssl/private/phpmemcachedadmin.key -subj $subj -out /phpmemcachedadmin/ssl/certs/phpmemcachedadmin.csr"]
  }
}
