# #!/bin/sh
# apk upgrade
# apk add openrc
# apk add mysql mysql-client --no-cache
# # apk add telegraf --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted --no-cache

# mkdir -p /run/mysqld
# cp -rp /var/run/mysqld /var/run/mysqld.bak

# openrc
# touch /run/openrc/softlevel

# mysql_install_db --user=root
# tmp=sql_tmp
# # GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'password' WITH GRANT OPTION;\n

# echo -ne "FLUSH PRIVILEGES;\n
# GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' WITH GRANT OPTION;\n
# FLUSH PRIVILEGES;\n" >> $tmp 

# # CREATE USER 'username'@'localhost' IDENTIFIED BY 'password';

# # GRANT ALL PRIVILEGES ON *.* TO 'username'@'localhost' WITH GRANT OPTION;

# # CREATE USER 'username'@'%' IDENTIFIED BY 'password';

# # GRANT ALL PRIVILEGES ON *.* TO 'username'@'%' WITH GRANT OPTION;

# # FLUSH PRIVILEGES;


# /usr/bin/mysqld --user=root --bootstrap --verbose=0 < $tmp
# rm -rf $tmp

# exec /usr/bin/mysqld --user=root

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

# echo -ne "FLUSH PRIVILEGES;\n
# GRANT ALL ON *.* TO 'root'@'%' WITH GRANT OPTION ;\n
# GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' WITH GRANT OPTION;\n
# FLUSH PRIVILEGES;\n" >> $tmp 
# echo -ne "FLUSH PRIVILEGES;\n
# GRANT ALL ON *.* TO '__DB_USER__'@'%' identified by '__DB_PASSWORD__' WITH GRANT OPTION ;\n
# GRANT ALL PRIVILEGES ON *.* TO '__DB_USER__'@'localhost' IDENTIFIED BY '__DB_PASSWORD__' WITH GRANT OPTION;\n
# FLUSH PRIVILEGES;\n" >> $tmp
# /usr/bin/mysqld --user=__DB_USER__ --bootstrap --verbose=0 < $tmp
/usr/bin/mysqld --user=root --bootstrap --verbose=0 < $tmp
# /usr/bin/mysqld_safe --datadir='./data'

# rm -rf $tmp
# exec /usr/bin/mysqld --user=__DB_USER__
exec /usr/bin/mysqld --user=root