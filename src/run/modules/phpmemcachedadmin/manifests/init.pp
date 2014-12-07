class phpmemcachedadmin {
  file { '/httpd/data/Config/Memcache.php':
    ensure => present,
    content => template('phpmemcachedadmin/Memcache.php.erb')
  }
}
