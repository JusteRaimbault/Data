
ts=$1

# with python gdal 3.2.2
# (difficult install https://gist.github.com/kelvinn/f14f0fc24445a7994368f984c3e37724 https://github.com/smellman/ogr2poly)

#mkdir ladpolys
#python3 $CS_HOME/Softwares/OSM/ogr2poly/ogr2poly.py --prefix ladpolys/LAD_ --field-name lad19cd -v $CS_HOME/UrbanDynamics/Data/OrdnanceSurvey/LADistricts/Local_Authority_Districts__December_2019__Boundaries_UK_BUC-shp/LAD_WGS84.shp

mkdir ladbuildings

rm splitLADs.sh

# command example: https://blog.geofabrik.de/?p=75


areas=`ls ladpolys | grep LAD_E | wc -l`
echo -n 'osmosis --read-pbf $1 --tee'$areas' ' >> splitLADs.sh

#i=0
for poly in "ladpolys"/*
do
  #data is piped into 4 following processes only: to parallise with less cores, should repeat osmosis command? does it handle --tee 382 ?
  #if (( $i % 4 == 0 ))
  #then
  #   echo -n "--tee 4 " >> splitLADs.sh
  #fi
  ladpref="$( cut -d '.' -f 1 <<< "$poly" )"
  lad="$( cut -d '/' -f 2 <<< "$ladpref" )"
  #echo $lad
  if [[ $lad == "LAD_E"* ]]
  then 
    echo -n "--bp file=$poly --write-pbf ladbuildings/"$lad"_buildings_"$ts".osm.pbf " >> splitLADs.sh
  fi
  #i=$(($i + 1))
done


chmod u+x splitLADs.sh
echo "splitLADs.sh script:"
cat splitLADs.sh

