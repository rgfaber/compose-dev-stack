#! /bin/bash


## CLEAR ALL DATA
rm -rf /volume

# WIRESHARK
mkdir -p /volume/wireshark/config

# FREEIPA
 mkdir -p /volume/freeipa/data

# REDIS
 mkdir -p /volume/redis/data

# RABBITMQQ
 mkdir -p /volume/rabbitmq/data
 mkdir -p /volume/rabbitmq/logs

# MONGODB
 mkdir -p /volume/mongodb/data

# COUCHDB
 mkdir -p /volume/couchdb/log
 mkdir -p /volume/couchdb/data
 mkdir -p /volume/couchdb/config

# EVENTSTORE
 mkdir -p /volume/eventstore/logs
 mkdir -p /volume/eventstore/data
 mkdir -p /volume/eventstore/index

#  mkdir -p /volume/elastic/data
 mkdir -p /volume/elastic/data01
 mkdir -p /volume/elastic/data02
 mkdir -p /volume/elastic/data03

# NATS
 mkdir -p /volume/nats/stream01

# POSTGRESQL
 mkdir -p /volume/postgres/data

# SPACEDECK
 mkdir -p /volume/spacedeck/storage
 mkdir -p /volume/spacedeck/db

# KAFKA
 mkdir -p /volume/kafka/data

# COCKROACHDB
 mkdir -p /volume/crdb/data


#  chown $USER -R /volume/
#  chown 1001 -R /volume/mongodb  # https://hub.docker.com/_/mongo


git submodule update --remote

docker-compose -f couchdb.yml \
               -f nats.yml \
               -f networks.yml \
               down

docker-compose -f couchdb.yml \
               -f nats.yml \
               -f networks.yml \
               up --build $1 


