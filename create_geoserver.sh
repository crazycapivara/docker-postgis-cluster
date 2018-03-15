#!/bin/bash
docker service create \
--publish "48080:8080" \
--name geoserver_swarm \
--network fossgis_swarm \
--constraint 'node.labels.type == master' \
kartoza/geoserver

