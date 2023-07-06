#! /bin/bash


## CLEAR ALL DATA
rm -rf /c/volume

# WIRESHARK
mkdir -p /c/volume/wireshark/config

# FREEIPA
 mkdir -p /c/volume/freeipa/data

# REDIS
 mkdir -p /c/volume/redis/data

# RABBITMQQ
 mkdir -p /c/volume/rabbitmq/data
 mkdir -p /c/volume/rabbitmq/logs

# MONGODB
 mkdir -p /c/volume/mongodb/data

# COUCHDB
 mkdir -p /c/volume/couchdb/log
 mkdir -p /c/volume/couchdb/data
 mkdir -p /c/volume/couchdb/config

# EVENTSTORE
 mkdir -p /c/volume/eventstore/logs
 mkdir -p /c/volume/eventstore/data
 mkdir -p /c/volume/eventstore/index

#  mkdir -p /c/volume/elastic/data
 mkdir -p /c/volume/elastic/data01
 mkdir -p /c/volume/elastic/data02
 mkdir -p /c/volume/elastic/data03

# NATS
 mkdir -p /c/volume/nats/stream01

# POSTGRESQL
 mkdir -p /c/volume/postgres/data

# SPACEDECK
 mkdir -p /c/volume/spacedeck/storage
 mkdir -p /c/volume/spacedeck/db

# KAFKA
 mkdir -p /c/volume/kafka/data

# COCKROACHDB
 mkdir -p /c/volume/crdb/data


#  chown $USER -R /c/volume/
#  chown 1001 -R /c/volume/mongodb  # https://hub.docker.com/_/mongo


git submodule update --remote

docker-compose -f couchdb.yml \
               -f nats.yml \
               -f eventstore.yml \
               -f redis.yml \
               -f rabbitmq.yml \
               -f jaeger.yml \
               -f postgres.yml \
               -f wireshark.yml \
               -f networks.yml \
               down

docker-compose -f couchdb.yml \
               -f nats.yml \
               -f eventstore.yml \
               -f redis.yml \
               -f rabbitmq.yml \
               -f jaeger.yml \
               -f postgres.yml \
               -f wireshark.yml \
               -f networks.yml \
               up --build $1 


