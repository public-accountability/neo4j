#!/bin/sh

docker-compose exec neo4j sh -c 'cat /var/lib/neo4j/import/load.cypher | /var/lib/neo4j/bin/cypher-shell'
