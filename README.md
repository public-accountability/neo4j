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

Second degree network of Gary Barnett

``` cypher
MATCH (barnett:Entity { entity_id: 71255 })--(related_entities)
RETURN barnett, related_entities

MATCH (barnett:Entity { entity_id: 71255 })-[*1..2]-(related_entities)
RETURN barnett, related_entities
```

Shortest path Between KKR and Trump

```
MATCH (kkr:Entity { entity_id: 33577 }),
	  (trump:Entity { entity_id: 15108 }),
	  p = shortestPath( (kkr)-[*..15]-(trump) )
RETURN p

```

Harvard Students who know or worked with people who work with Trump

```
MATCH (harvard:Entity { entity_id: 14730})<-[:EDUCATION]-(harvard_students),
       (trump:Entity { entity_id: 15108 }),
	   paths_to_trump = (harvard_students)-[:SOCIAL|:PROFESSIONAL|:POSITION]-(x)-[:POSITION]->(trump)
RETURN harvard, paths_to_trump

```


All shortest path between Code for America and Trump 164332

```
MATCH (cfa:Entity { entity_id: 164332 }),
	  (trump:Entity { entity_id: 15108 }),
	  p = allShortestPath( (cfa)-[*..15]-(trump) )
RETURN p
```


All paths between Amazon and the NYPD (max 3 degrees)

```
MATCH (amazon:Entity { entity_id: 172 }),
	  (nypd:Entity { entity_id: 35493 }),
      paths =(amazon)-[*0..3]-(nypd)
return paths

```

