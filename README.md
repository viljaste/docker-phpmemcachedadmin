# docker-phpmemcachedadmin

A [Docker](https://docker.com/) container for [phpMemcachedAdmin](https://code.google.com/p/phpmemcacheadmin/).

## phpMemcachedAdmin (DEVELOPMENT BRANCH)

### Run the container

Using the `docker` command:

    CONTAINER="phpmemcachedadmin" && sudo docker run \
      --name "${CONTAINER}" \
      -h "${CONTAINER}" \
      -p 80:80 \
      -d \
      simpledrupalcloud/phpmemcachedadmin:dev

Using the `fig` command

    TMP="$(mktemp -d)" \
      && git clone http://git.simpledrupalcloud.com/simpledrupalcloud/docker-phpmemcachedadmin.git "${TMP}" \
      && cd "${TMP}" \
      && git checkout dev \
      && sudo fig up

#### Connect directly to Memcached server by linking with another Docker container

    CONTAINER="phpmemcachedadmin" && sudo docker run \
      --name "${CONTAINER}" \
      -h "${CONTAINER}" \
      -p 80:80 \
      --link memcached \
      -d \
      simpledrupalcloud/phpmemcachedadmin:dev

### Build the image

    TMP="$(mktemp -d)" \
      && git clone http://git.simpledrupalcloud.com/simpledrupalcloud/docker-phpmemcachedadmin.git "${TMP}" \
      && cd "${TMP}" \
      && git checkout dev \
      && sudo docker build -t simpledrupalcloud/phpmemcachedadmin:dev . \
      && cd -
      
## License

**MIT**
