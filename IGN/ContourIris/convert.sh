#ogr2ogr -f ‘ESRI Shapefile’ -a_srs EPSG:4326 Output_fileName.shp Input_FileName.geojson
cp contours-iris.geojson tmp.geojson
ogr2ogr -f 'ESRI Shapefile' -s_srs EPSG:4326 -t_srs EPSG:2154 CONTOURS-IRIS.shp tmp.geojson -sql "SELECT insee_com AS INSEE_COM, code_iris AS CODE_IRIS from tmp"
rm tmp.geojson

