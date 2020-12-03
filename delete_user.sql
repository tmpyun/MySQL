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

mysql> drop user zabbix01@'localhost';
Query OK, 0 rows affected (0.00 sec)

mysql> select user,host,authentication_string from mysql.user;
+---------------+--------------------------+-------------------------------------------+
| user          | host                     | authentication_string                     |
+---------------+--------------------------+-------------------------------------------+
| root          | localhost                | *6BB4837EB74329105EE4568DDA7DC67ED2CA2AD9 |
| mysql.session | localhost                | *THISISNOTAVALIDPASSWORDTHATCANBEUSEDHERE |
| mysql.sys     | localhost                | *THISISNOTAVALIDPASSWORDTHATCANBEUSEDHERE |
| zabbix02      | 10.10.10.0/255.255.255.0 | *6BB4837EB74329105EE4568DDA7DC67ED2CA2AD9 |
+---------------+--------------------------+-------------------------------------------+
4 rows in set (0.00 sec)

mysql> delete from mysql.user where user="zabbix02" and host="10.10.10.0/255.255.255.0";
Query OK, 1 row affected (0.01 sec)

mysql> select user,host,authentication_string from mysql.user;
+---------------+-----------+-------------------------------------------+
| user          | host      | authentication_string                     |
+---------------+-----------+-------------------------------------------+
| root          | localhost | *6BB4837EB74329105EE4568DDA7DC67ED2CA2AD9 |
| mysql.session | localhost | *THISISNOTAVALIDPASSWORDTHATCANBEUSEDHERE |
| mysql.sys     | localhost | *THISISNOTAVALIDPASSWORDTHATCANBEUSEDHERE |
+---------------+-----------+-------------------------------------------+
3 rows in set (0.00 sec)
