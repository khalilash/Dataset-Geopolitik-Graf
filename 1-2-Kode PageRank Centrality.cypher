CALL gds.pageRank.stream('geoGraph')
YIELD nodeId, score
WHERE labels(gds.util.asNode(nodeId))[0] = 'Language'
RETURN gds.util.asNode(nodeId).name AS Language, 
       score
ORDER BY score DESC
