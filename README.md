# docker-phpmemcachedadmin

A [Docker](https://docker.com/) container for [phpMemcachedAdmin](https://code.google.com/p/phpmemcacheadmin/).

## phpMemcachedAdmin (STABLE BRANCH)

### Run the container

Using the `docker` command:

    CONTAINER="phpmemcachedadmin" && sudo docker run \
      --name "${CONTAINER}" \
      -h "${CONTAINER}" \
      -p 80:80 \
      -d \
      simpledrupalcloud/phpmemcachedadmin:latest

Using the `fig` command

    TMP="$(mktemp -d)" \
      && git clone http://git.simpledrupalcloud.com/simpledrupalcloud/docker-phpmemcachedadmin.git "${TMP}" \
      && cd "${TMP}" \
      && sudo fig up

#### Connect directly to Memcached server by linking with another Docker container

    CONTAINER="phpmemcachedadmin" && sudo docker run \
      --name "${CONTAINER}" \
      -h "${CONTAINER}" \
      -p 80:80 \
      --link memcached \
      -d \
      simpledrupalcloud/phpmemcachedadmin:latest

### Build the image

    TMP="$(mktemp -d)" \
      && git clone http://git.simpledrupalcloud.com/simpledrupalcloud/docker-phpmemcachedadmin.git "${TMP}" \
      && cd "${TMP}" \
      && sudo docker build -t simpledrupalcloud/phpmemcachedadmin:latest . \
      && cd -
      
## License

**MIT**
