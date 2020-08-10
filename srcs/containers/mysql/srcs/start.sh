#!/bin/sh

mysql_install_db --user=root --ldata=/var/lib/mysql
# mysql_install_db --user=__DB_USER__
tmp=sql_tmp

echo "CREATE DATABASE IF NOT EXISTS 'wordpress' CHARACTER SET utf8 COLLATE utf8_general_ci;" >> $tmp
# echo "SET PASSWORD FOR '$DB_USER'@'localhost'=PASSWORD('${DB_PASS}') ;" >> /tmp/sql
echo "GRANT ALL ON *.* TO 'root'@'127.0.0.1' WITH GRANT OPTION;" >> $tmp
echo "GRANT ALL ON *.* TO 'root'@'localhost' WITH GRANT OPTION;" >> $tmp
echo "GRANT ALL ON *.* TO 'root'@'%' WITH GRANT OPTION;" >> $tmp
echo "FLUSH PRIVILEGES;" >> $tmp

/usr/bin/mysqld --user=root --bootstrap --verbose=0 < $tmp

# rm -rf $tmp
# exec /usr/bin/mysqld --user=__DB_USER__
exec /usr/bin/mysqld --user=root