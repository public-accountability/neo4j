# LittleSis and Neo4j


## Queries

Return node of Exxon

``` cypher

MATCH (e:Entity) WHERE e.entity_id = 2 RETURN e;
MATCH (e:Entity { entity_id: 2}) RETURN e;

```

All related entities to Exxon

``` cypher

MATCH (e:Entity { entity_id: 2})--(related)
RETURN related, e

```

everyone with a position relationship with exxon

``` cypher

MATCH (e:Entity { entity_id: 2})-[:POSITION]-(related)
RETURN related, e

```

Everyone with a position relationship with the New York State Senate and sub relatationships

``` cypher

MATCH (e:Entity { entity_id: 40816}),
      (e)-[:POSITION]-(related)
OPTIONAL MATCH (related)--(related2)-[:POSITION]-(e)
RETURN related, related2, e

```

Everyone with a position relationship with the New York State Senate who have inter-relationships in the network

``` cypher

MATCH (e:Entity { entity_id: 40816}),
      (e)-[:POSITION]-(related),
	  (related)--(related2)-[:POSITION]-(e)
RETURN related, related2, e

```
