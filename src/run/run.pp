node default {
  if $memcached_host {
    include phpmemcachedadmin
  }
}
