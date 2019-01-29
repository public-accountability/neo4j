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
CREATE (entity1)-[:POSITION { relationship_id: toInteger(row.id), description1: row.description1, description2: row.description2, amount: toInteger(row.amount), start_date: row.start_date, end_date: row.end_date, created_at: row.created_at }]->(entity2);


USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:///relationships.csv" AS row FIELDTERMINATOR '|'
MATCH (entity1:Entity {entity_id: toInteger(row.entity1_id)})
MATCH (entity2:Entity {entity_id: toInteger(row.entity2_id)})
WHERE row.category_id = "2"
CREATE (entity1)-[:EDUCATION { relationship_id: toInteger(row.id), description1: row.description1, description2: row.description2, amount: toInteger(row.amount), start_date: row.start_date, end_date: row.end_date, created_at: row.created_at }]->(entity2);


USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:///relationships.csv" AS row FIELDTERMINATOR '|'
MATCH (entity1:Entity {entity_id: toInteger(row.entity1_id)})
MATCH (entity2:Entity {entity_id: toInteger(row.entity2_id)})
WHERE row.category_id = "3"
CREATE (entity1)-[:MEMBERSHIP { relationship_id: toInteger(row.id), description1: row.description1, description2: row.description2, amount: toInteger(row.amount), start_date: row.start_date, end_date: row.end_date, created_at: row.created_at }]->(entity2);


USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:///relationships.csv" AS row FIELDTERMINATOR '|'
MATCH (entity1:Entity {entity_id: toInteger(row.entity1_id)})
MATCH (entity2:Entity {entity_id: toInteger(row.entity2_id)})
WHERE row.category_id = "4"
CREATE (entity1)-[:FAMILY { relationship_id: toInteger(row.id), description1: row.description1, description2: row.description2, amount: toInteger(row.amount), start_date: row.start_date, end_date: row.end_date, created_at: row.created_at }]->(entity2);


USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:///relationships.csv" AS row FIELDTERMINATOR '|'
MATCH (entity1:Entity {entity_id: toInteger(row.entity1_id)})
MATCH (entity2:Entity {entity_id: toInteger(row.entity2_id)})
WHERE row.category_id = "5"
CREATE (entity1)-[:DONATION { relationship_id: toInteger(row.id), description1: row.description1, description2: row.description2, amount: toInteger(row.amount), start_date: row.start_date, end_date: row.end_date, created_at: row.created_at }]->(entity2);


USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:///relationships.csv" AS row FIELDTERMINATOR '|'
MATCH (entity1:Entity {entity_id: toInteger(row.entity1_id)})
MATCH (entity2:Entity {entity_id: toInteger(row.entity2_id)})
WHERE row.category_id = "6"
CREATE (entity1)-[:TRANSACTION { relationship_id: toInteger(row.id), description1: row.description1, description2: row.description2, amount: toInteger(row.amount), start_date: row.start_date, end_date: row.end_date, created_at: row.created_at }]->(entity2);


USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:///relationships.csv" AS row FIELDTERMINATOR '|'
MATCH (entity1:Entity {entity_id: toInteger(row.entity1_id)})
MATCH (entity2:Entity {entity_id: toInteger(row.entity2_id)})
WHERE row.category_id = "7"
CREATE (entity1)-[:LOBBYING { relationship_id: toInteger(row.id), description1: row.description1, description2: row.description2, amount: toInteger(row.amount), start_date: row.start_date, end_date: row.end_date, created_at: row.created_at }]->(entity2);


USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:///relationships.csv" AS row FIELDTERMINATOR '|'
MATCH (entity1:Entity {entity_id: toInteger(row.entity1_id)})
MATCH (entity2:Entity {entity_id: toInteger(row.entity2_id)})
WHERE row.category_id = "8"
CREATE (entity1)-[:SOCIAL { relationship_id: toInteger(row.id), description1: row.description1, description2: row.description2, amount: toInteger(row.amount), start_date: row.start_date, end_date: row.end_date, created_at: row.created_at }]->(entity2);


USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:///relationships.csv" AS row FIELDTERMINATOR '|'
MATCH (entity1:Entity {entity_id: toInteger(row.entity1_id)})
MATCH (entity2:Entity {entity_id: toInteger(row.entity2_id)})
WHERE row.category_id = "9"
CREATE (entity1)-[:PROFESSIONAL { relationship_id: toInteger(row.id), description1: row.description1, description2: row.description2, amount: toInteger(row.amount), start_date: row.start_date, end_date: row.end_date, created_at: row.created_at }]->(entity2);


USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:///relationships.csv" AS row FIELDTERMINATOR '|'
MATCH (entity1:Entity {entity_id: toInteger(row.entity1_id)})
MATCH (entity2:Entity {entity_id: toInteger(row.entity2_id)})
WHERE row.category_id = "10"
CREATE (entity1)-[:OWNERSHIP { relationship_id: toInteger(row.id), description1: row.description1, description2: row.description2, amount: toInteger(row.amount), start_date: row.start_date, end_date: row.end_date, created_at: row.created_at }]->(entity2);


USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:///relationships.csv" AS row FIELDTERMINATOR '|'
MATCH (entity1:Entity {entity_id: toInteger(row.entity1_id)})
MATCH (entity2:Entity {entity_id: toInteger(row.entity2_id)})
WHERE row.category_id = "11"
CREATE (entity1)-[:HIERARCHY { relationship_id: toInteger(row.id), description1: row.description1, description2: row.description2, amount: toInteger(row.amount), start_date: row.start_date, end_date: row.end_date, created_at: row.created_at }]->(entity2);


USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:///relationships.csv" AS row FIELDTERMINATOR '|'
MATCH (entity1:Entity {entity_id: toInteger(row.entity1_id)})
MATCH (entity2:Entity {entity_id: toInteger(row.entity2_id)})
WHERE row.category_id = "12"
CREATE (entity1)-[:GENERIC { relationship_id: toInteger(row.id), description1: row.description1, description2: row.description2, amount: toInteger(row.amount), start_date: row.start_date, end_date: row.end_date, created_at: row.created_at }]->(entity2);

