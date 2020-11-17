#osmosis --read-pbf $1 --log-progress --tf accept-ways building=* --used-node --write-pbf $2
osmosis --read-pbf $1 --log-progress --tf accept-ways building=* --used-node --write-xml $2
#osmosis --read-pbf $1 --log-progress --tf accept-ways building=* --write-xml $2

