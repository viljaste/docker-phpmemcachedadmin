#!/usr/bin/env bash

MEMCACHED_PORT="$(echo "${MEMCACHED_PORT}" | sed 's/tcp:\/\///')"

export FACTER_MEMCACHED_HOST="$(echo "${MEMCACHED_PORT}" | cut -d ":" -f1)"
export FACTER_MEMCACHED_PORT="$(echo "${MEMCACHED_PORT}" | cut -d ":" -f2)"

puppet apply --modulepath=/src/run/modules /src/run/run.pp

/usr/bin/supervisord
