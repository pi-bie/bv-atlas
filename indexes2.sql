-- These are additional indexes for rendering performance with OpenStreetMap Carto.

CREATE INDEX planet_osm_line_roads
  ON planet_osm_line USING GIST (way)
  WHERE highway IN ('motorway','motorway_link','trunk','primary','secondary') OR railway is not null;
  
CREATE INDEX planet_osm_line_tertiary
  ON planet_osm_line USING GIST (way)
  WHERE highway = 'tertiary';
  
CREATE INDEX planet_osm_point_major_airports
  ON planet_osm_point USING GIST (way)
  WHERE aeroway='aerodrome' AND tags->'aerodrome:type' IN ('regional','international');

CREATE INDEX planet_osm_polygon_major_airports
  ON planet_osm_polygon USING GIST (way)  
  WHERE aeroway='aerodrome' AND (tags->'aerodrome:type' IN ('regional','international') OR tags->'aerodrome' IN ('regional','international'));

CREATE INDEX planet_osm_polygon_nparks
  ON planet_osm_polygon USING GIST (way)  
  WHERE ((boundary='national_park' AND tags->'protect_class'='2')
  OR (boundary = 'protected_area' AND tags->'protection_title'='Naturpark')
  AND building IS NULL);

CREATE INDEX planet_osm_polygon_islands
  ON planet_osm_polygon USING GIST (way)s
  WHERE place = 'island' AND name IS NOT null;
