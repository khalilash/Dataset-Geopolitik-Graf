CALL gds.nodeSimilarity.stream('countryGraph')
YIELD node1, node2, similarity
WITH 
  gds.util.asNode(node1) AS c1,
  gds.util.asNode(node2) AS c2,
  similarity
WHERE 'Country' IN labels(c1) AND 'Country' IN labels(c2)

// ambil tetangga yang sama
MATCH (c1)-->(common)<--(c2)

RETURN 
  c1.name AS Country1,
  c2.name AS Country2,
  similarity,
  collect(DISTINCT common.name) AS shared_attributes
ORDER BY similarity DESC
LIMIT 10;
