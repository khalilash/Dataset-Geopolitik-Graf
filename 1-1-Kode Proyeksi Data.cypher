CALL gds.graph.project(
  'geoGraph',
  ['City', 'Country', 'Continent', 'Language', 'Currency'],
  {
    BELONGS_TO: {orientation: 'UNDIRECTED'},
    PART_OF: {orientation: 'UNDIRECTED'},
    SPEAKS: {orientation: 'UNDIRECTED'},
    USES_CURRENCY: {orientation: 'UNDIRECTED'}
  }
)
