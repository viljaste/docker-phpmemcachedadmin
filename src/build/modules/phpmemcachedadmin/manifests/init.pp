class phpmemcachedadmin {
  require phpmemcachedadmin::php
  require phpmemcachedadmin::httpd

  file { '/tmp/phpMemcachedAdmin-1.2.2-r262.tar.gz':
    ensure => present,
    source => 'puppet:///modules/phpmemcachedadmin/tmp/phpMemcachedAdmin-1.2.2-r262.tar.gz'
  }

  exec { 'tar xzf /tmp/phpMemcachedAdmin-1.2.2-r262.tar.gz':
    cwd => '/phpmemcachedadmin/data',
    path => ['/bin'],
    require => File['/tmp/phpMemcachedAdmin-1.2.2-r262.tar.gz']
  }
}
