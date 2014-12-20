class phpmemcachedadmin::httpd::supervisor {
  file { '/etc/supervisor/conf.d/httpd.conf':
    ensure => present,
    source => 'puppet:///modules/phpmemcachedadmin/etc/supervisor/conf.d/httpd.conf',
    mode => 644
  }
}
