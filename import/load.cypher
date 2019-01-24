USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:///entities.csv" AS row
FIELDTERMINATOR '|'
CREATE (:Entity { entity_id: toInteger(row.id), name: row.name, blurb: row.blurb, primary_ext: row.primary_ext, created_at: row.created_at, updated_at: row.updated_at });

CREATE CONSTRAINT ON (e:Entity) ASSERT e.entity_id IS UNIQUE;

USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:///relationships.csv" AS row FIELDTERMINATOR '|'
MATCH (entity1:Entity {entity_id: toInteger(row.entity1_id)})
MATCH (entity2:Entity {entity_id: toInteger(row.entity2_id)})
WHERE row.category_id = "1"
CREATE (entity1)-[:POSITION { category_id: toInteger(row.category_id), description1: row.description1, description2: row.description2, amount: toInteger(row.amount) }]->(entity2);

