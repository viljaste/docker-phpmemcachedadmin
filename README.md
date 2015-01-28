# docker-phpmemcachedadmin

A [Docker](https://docker.com/) container for [phpMemcachedAdmin](https://code.google.com/p/phpmemcacheadmin/).

## Run the container

Using the `docker` command:

    CONTAINER="phpmemcachedadmindata" && sudo docker run \
      --name "${CONTAINER}" \
      -h "${CONTAINER}" \
      -v /phpmemcachedadmin \
      simpledrupalcloud/data:dev

    CONTAINER="phpmemcachedadmin" && sudo docker run \
      --name "${CONTAINER}" \
      -h "${CONTAINER}" \
      -p 80:80 \
      -p 443:443 \
      --volumes-from phpmemcachedadmindata \
      -e SERVER_NAME="localhost" \
      -d \
      simpledrupalcloud/phpmemcachedadmin:dev

Using the `fig` command

    TMP="$(mktemp -d)" \
      && git clone http://git.simpledrupalcloud.com/simpledrupalcloud/docker-phpmemcachedadmin.git "${TMP}" \
      && cd "${TMP}" \
      && git checkout dev \
      && sudo fig up

## Connect directly to Memcached server by linking with another Docker container

    CONTAINER="phpmemcachedadmindata" && sudo docker run \
      --name "${CONTAINER}" \
      -h "${CONTAINER}" \
      -v /phpmemcachedadmin \
      simpledrupalcloud/data:dev

    CONTAINER="phpmemcachedadmin" && sudo docker run \
      --name "${CONTAINER}" \
      -h "${CONTAINER}" \
      -p 80:80 \
      -p 443:443 \
      --volumes-from phpmemcachedadmindata \
      --link memcached:memcached \
      -e SERVER_NAME="localhost" \
      -d \
      simpledrupalcloud/phpmemcachedadmin:dev

## Build the image

    TMP="$(mktemp -d)" \
      && git clone http://git.simpledrupalcloud.com/simpledrupalcloud/docker-phpmemcachedadmin.git "${TMP}" \
      && cd "${TMP}" \
      && git checkout dev \
      && sudo docker build -t simpledrupalcloud/phpmemcachedadmin:dev . \
      && cd -

## Back up phpMemcachedAdmin data

    sudo docker run \
      --rm \
      --volumes-from phpmemcachedadmindata \
      -v $(pwd):/backup \
      simpledrupalcloud/base:latest tar czvf /backup/phpmemcachedadmindata.tar.gz /phpmemcachedadmin

## Restore phpMemcachedAdmin data from a backup

    sudo docker run \
      --rm \
      --volumes-from phpmemcachedadmindata \
      -v $(pwd):/backup \
      simpledrupalcloud/base:latest tar xzvf /backup/phpmemcachedadmindata.tar.gz

## License

**MIT**
