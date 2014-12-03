class phpmemcachedadmin {
  require phpmemcachedadmin::httpd
  require phpmemcachedadmin::php

  file { '/tmp/phpMemcachedAdmin-1.2.2-r262.tar.gz':
    ensure => present,
    source => 'puppet:///modules/phpmemcachedadmin/tmp/phpMemcachedAdmin-1.2.2-r262.tar.gz'
  }

  exec { 'mkdir -p /var/www/phpmemcachedadmin':
    path => ['/bin'],
    require => File['/tmp/phpMemcachedAdmin-1.2.2-r262.tar.gz']
  }

  exec { 'tar xzf /tmp/phpMemcachedAdmin-1.2.2-r262.tar.gz':
    cwd => '/var/www/dataphpmemcachedadmin',
    path => ['/bin'],
    require => Exec['mkdir -p /var/www/phpmemcachedadmin']
  }
}
