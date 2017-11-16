#!/bin/bash
MASTER_SERVICE_NAME="postgis-master"
SERVICE_NAME=postgis-worker
VOLUME_NAME=$SERVICE_NAME-volume

docker service create \
--publish "15432:5432" \
--mount type=volume,src=$VOLUME_NAME,dst=/pgdata,volume-driver=local \
--name $SERVICE_NAME \
--network futuregis \
--constraint 'node.labels.type != master' \
--env PGHOST=/tmp \
--env PG_USER=testuser \
--env PG_MODE=slave \
--env PG_MASTER_USER=master \
--env PG_ROOT_PASSWORD=password \
--env PG_PASSWORD=password \
--env PG_DATABASE=userdb \
--env PG_MASTER_PORT=5432 \
--env PG_MASTER_PASSWORD=password \
--env PG_MASTER_HOST=$MASTER_SERVICE_NAME \
--env PGDATA_PATH_OVERRIDE=persistent \
crunchydata/crunchy-postgres-gis:centos7-10.0-1.6.0

