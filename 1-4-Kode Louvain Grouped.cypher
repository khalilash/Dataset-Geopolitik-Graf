CALL gds.louvain.stream('geoGraph')
YIELD nodeId, communityId
WITH gds.util.asNode(nodeId) AS node, communityId

RETURN 
    communityId AS ID_Komunitas,
    CASE 
        WHEN communityId = 121 THEN 'Blok Domestik Indonesia'
        WHEN communityId = 97  THEN 'Blok Afrika Tengah & Barat (Frankofon)'
        WHEN communityId = 110 THEN 'Blok Hispanik (Amerika Latin & Spanyol)'
        WHEN communityId = 114 THEN 'Blok Eropa Kontinental'
        WHEN communityId = 119 THEN 'Blok Commonwealth (Oceania & Afrika Timur)'
        WHEN communityId = 122 THEN 'Blok Regional India'
        WHEN communityId = 123 THEN 'Blok Asia Selatan (Pakistan)'
        WHEN communityId = 302 THEN 'Blok Ekonomi Asia Pasifik'
        WHEN communityId = 221 THEN 'Blok Regional Nigeria'
        WHEN communityId = 109 THEN 'Blok Budaya Amerika Tengah (Meksiko)'
        WHEN communityId = 228 THEN 'Blok Asia Tengah & Mauritania'
        ELSE 'Kelompok Lainnya'
    END AS Komunitas,
    collect(node.name) AS Semua_Anggota,
    count(*) AS Total_Entitas
ORDER BY Total_Entitas DESC
