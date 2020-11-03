influx -execute "CREATE DATABASE telegraf"
influx -execute "CREATE USER telegraf_user WITH PASSWORD 'telegraf_password' WITH ALL PRIVILEGES"
influx -execute "GRANT ALL ON telegraf TO telegraf_user"
influx -execute "SHOW MEASUREMENTS ON _internal"
# influx -execute "SHOW MEASUREMENTS ON _internal TO telegraf_user"
# politique de rétention pour déterminer la durée de conservation des données (ici 52 semaines)
influx -execute "CREATE RETENTION POLICY "a_year" ON "telegraf" DURATION 52w REPLICATION 1 DEFAULT"
# influx -execute "CREATE USER admin WITH PASSWORD 'admin' WITH ALL PRIVILEGES"
# $INFLUX_ADM_PASS
