class phpmemcachedadmin {
  if ! file_exists('/phpmemcachedadmin/ssl/certs/phpmemcachedadmin.crt') {
    require phpmemcachedadmin::httpd::ssl
  }

  file { '/var/www/Config/Memcache.php':
    ensure => present,
    content => template('phpmemcachedadmin/Memcache.php.erb')
  }
}
