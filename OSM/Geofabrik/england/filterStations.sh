
#osmosis --read-pbf $1 --log-progress --tf accept-ways railway=station --used-node --write-pbf $2
#osmosis --read-pbf $1 --log-progress --tf accept-ways building=train_station --used-node --write-pbf $2
osmosis --read-pbf $1 --log-progress --tf accept-nodes railway=station --tf reject-ways --tf reject-relations --write-pbf $2


