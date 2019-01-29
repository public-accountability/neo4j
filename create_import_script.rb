#!/usr/bin/env ruby

file = File.open('./import/load.cypher', 'w')

file.write <<-CYPHER
USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:///entities.csv" AS row
FIELDTERMINATOR '|'
CREATE (:Entity { entity_id: toInteger(row.id), name: row.name, blurb: row.blurb, primary_ext: row.primary_ext, created_at: row.created_at, updated_at: row.updated_at });

CREATE CONSTRAINT ON (e:Entity) ASSERT e.entity_id IS UNIQUE;

CYPHER

{
  '1' => 'POSITION',
  '2' => 'EDUCATION',
  '3' => 'MEMBERSHIP',
  '4' => 'FAMILY',
  '5' => 'DONATION',
  '6' => 'TRANSACTION',
  '7' => 'LOBBYING',
  '8' => 'SOCIAL',
  '9' => 'PROFESSIONAL',
  '10' => 'OWNERSHIP',
  '11' => 'HIERARCHY',
  '12' => 'GENERIC'
}.each_pair do |category_id, label|

file.write <<-CYPHER

USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:///relationships.csv" AS row FIELDTERMINATOR '|'
MATCH (entity1:Entity {entity_id: toInteger(row.entity1_id)})
MATCH (entity2:Entity {entity_id: toInteger(row.entity2_id)})
WHERE row.category_id = "#{category_id}"
CREATE (entity1)-[:#{label} { relationship_id: toInteger(row.id), description1: row.description1, description2: row.description2, amount: toInteger(row.amount), start_date: row.start_date, end_date: row.end_date, created_at: row.created_at }]->(entity2);

CYPHER
end

file.close
