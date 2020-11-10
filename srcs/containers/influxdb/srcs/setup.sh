# influx -execute "CREATE DATABASE telegraf"

# influx -execute "CREATE USER telegraf_user WITH PASSWORD 'telegraf_password'"
CREATE USER telegraf_user WITH PASSWORD 'telegraf_password'
GRANT ALL ON influxdb TO telegraf_user
# influx -execute "GRANT ALL ON influxdb TO telegraf_user"
# politique de rétention pour déterminer la durée de conservation des données (ici 52 semaines)
# influx -execute "CREATE RETENTION POLICY "a_year" ON "telegraf" DURATION 52w REPLICATION 1 DEFAULT"

CREATE RETENTION POLICY "a_year" ON "telegraf" DURATION 52w REPLICATION 1 DEFAULT
# influx -execute "SHOW MEASUREMENTS ON telegraf"
SHOW MEASUREMENTS ON telegraf
# telegraf --config /etc/telegraf/telegraf.conf
# influxd run -config /etc/influxdb.conf