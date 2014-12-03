class phpmemcachedadmin::php {
  require phpmemcachedadmin::packages

  file { '/etc/php5/apache2/php.ini':
    ensure => present,
    source => 'puppet:///modules/phpmemcachedadmin/etc/php5/apache2/php.ini',
    mode => 644
  }
}
