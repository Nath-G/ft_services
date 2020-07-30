#!/bin/sh
mysql_install_db --user=root
# mysql_install_db --user=__DB_USER__
tmp=sql_tmp

echo -ne "FLUSH PRIVILEGES;\n
GRANT ALL ON *.* TO 'root'@'%' identified by 'pass' WITH GRANT OPTION ;\n
GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' IDENTIFIED BY 'pass' WITH GRANT OPTION;\n
FLUSH PRIVILEGES;\n" >> $tmp 
# echo -ne "FLUSH PRIVILEGES;\n
# GRANT ALL ON *.* TO '__DB_USER__'@'%' identified by '__DB_PASSWORD__' WITH GRANT OPTION ;\n
# GRANT ALL PRIVILEGES ON *.* TO '__DB_USER__'@'localhost' IDENTIFIED BY '__DB_PASSWORD__' WITH GRANT OPTION;\n
# FLUSH PRIVILEGES;\n" >> $tmp
# /usr/bin/mysqld --user=__DB_USER__ --bootstrap --verbose=0 < $tmp
/usr/bin/mysqld --user=root --bootstrap --verbose=0 < $tmp
rm -rf $tmp
# exec /usr/bin/mysqld --user=__DB_USER__
exec /usr/bin/mysqld --user=root
