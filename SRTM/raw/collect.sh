
ls data > tmp

curl -s --user `cat usr`:`cat psswd` http://data.cgiar-csi.org/srtm/tiles/GeoTIFF/ | awk -F"href=" '{print $2}' | awk -F">" '{print $1}' | tr -d '\"' | grep -v "tiles" | grep -v "C=N" |awk '{if(length($0)>0){print "curl --user '`cat usr`':'`cat psswd`' http://data.cgiar-csi.org/srtm/tiles/GeoTIFF/"$0" > data/"$0}}' | grep -v -f tmp | sh

rm tmp


