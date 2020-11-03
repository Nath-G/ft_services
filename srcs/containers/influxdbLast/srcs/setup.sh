# influx -execute "CREATE DATABASE grafana"

# influx -execute "CREATE USER telegraf_user WITH PASSWORD 'telegraf_password'"
# influx -execute "GRANT ALL ON grafana TO telegraf_user"
# politique de rétention pour déterminer la durée de conservation des données (ici 52 semaines)
# influx -execute "CREATE RETENTION POLICY "a_year" ON "grafana" DURATION 52w REPLICATION 1 DEFAULT"

# telegraf --config /etc/telegraf/telegraf.conf
influxd run -config /etc/influxdb.conf