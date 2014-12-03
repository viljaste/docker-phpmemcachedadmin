class phpmemcachedadmin {
  file { '/var/www/phpmemcachedadmin/Config/Memcache.php':
    ensure => present,
    content => template('phpmemcachedadmin/Memcache.php.erb')
  }
}
