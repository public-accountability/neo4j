#!/bin/sh

exec docker-compose exec neo4j /var/lib/neo4j/bin/cypher-shell
