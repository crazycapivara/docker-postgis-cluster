#!/bin/bash
node="$1"

docker network create --driver overlay futuregis
docker node update --label-add type=master $node

