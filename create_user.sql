### Syntax NO: 1

mysql> select version();
+-----------+
| version() |
+-----------+
| 5.7.32    |
+-----------+
1 row in set (0.00 sec)

mysql> select user();
+----------------+
| user()         |
+----------------+
| root@localhost |
+----------------+
1 row in set (0.00 sec)

mysql> select user,host,authentication_string from mysql.user;  
+---------------+-----------+-------------------------------------------+
| user          | host      | authentication_string                     |
+---------------+-----------+-------------------------------------------+
| root          | localhost | *6BB4837EB74329105EE4568DDA7DC67ED2CA2AD9 |
| mysql.session | localhost | *THISISNOTAVALIDPASSWORDTHATCANBEUSEDHERE |
| mysql.sys     | localhost | *THISISNOTAVALIDPASSWORDTHATCANBEUSEDHERE |
+---------------+-----------+-------------------------------------------+
3 rows in set (0.00 sec)

mysql> create user zabbix01@'localhost' identified by '123456';
Query OK, 0 rows affected (0.00 sec)

mysql> select user,host,authentication_string from mysql.user;  
+---------------+-----------+-------------------------------------------+
| user          | host      | authentication_string                     |
+---------------+-----------+-------------------------------------------+
| root          | localhost | *6BB4837EB74329105EE4568DDA7DC67ED2CA2AD9 |
| mysql.session | localhost | *THISISNOTAVALIDPASSWORDTHATCANBEUSEDHERE |
| mysql.sys     | localhost | *THISISNOTAVALIDPASSWORDTHATCANBEUSEDHERE |
| zabbix01      | localhost | *6BB4837EB74329105EE4568DDA7DC67ED2CA2AD9 |
+---------------+-----------+-------------------------------------------+
4 rows in set (0.00 sec)

mysql> grant all privileges on *.* to zabbix01@'localhost';
Query OK, 0 rows affected (0.00 sec)

mysql> show grants for zabbix01@'localhost';
+-------------------------------------------------------+
| Grants for zabbix01@localhost                         |
+-------------------------------------------------------+
| GRANT ALL PRIVILEGES ON *.* TO 'zabbix01'@'localhost' |
+-------------------------------------------------------+
1 row in set (0.00 sec)

mysql> flush privileges;
Query OK, 0 rows affected (0.00 sec)


### Syntax NO: 2
mysql> grant all privileges on *.* to zabbix02@'10.10.10.0/255.255.255.0' identified by '123456';
Query OK, 0 rows affected, 1 warning (0.00 sec)

mysql> select user,host,authentication_string from mysql.user;
+---------------+--------------------------+-------------------------------------------+
| user          | host                     | authentication_string                     |
+---------------+--------------------------+-------------------------------------------+
| root          | localhost                | *6BB4837EB74329105EE4568DDA7DC67ED2CA2AD9 |
| mysql.session | localhost                | *THISISNOTAVALIDPASSWORDTHATCANBEUSEDHERE |
| mysql.sys     | localhost                | *THISISNOTAVALIDPASSWORDTHATCANBEUSEDHERE |
| zabbix02      | 10.10.10.0/255.255.255.0 | *6BB4837EB74329105EE4568DDA7DC67ED2CA2AD9 |
| zabbix01      | localhost                | *6BB4837EB74329105EE4568DDA7DC67ED2CA2AD9 |
+---------------+--------------------------+-------------------------------------------+
5 rows in set (0.00 sec)

mysql> flush privileges;
Query OK, 0 rows affected (0.00 sec)




