### create localhost user and setup password
create user zabbix01@'localhost' identified by '123456';
grant all privileges on *.* to zabbix01@'localhost';
show grants for zabbix01@'localhost';
flush privieges;
mysql> show grants for zabbix01@'localhost';
+-------------------------------------------------------+
| Grants for zabbix01@localhost                         |
+-------------------------------------------------------+
| GRANT ALL PRIVILEGES ON *.* TO 'zabbix01'@'localhost' |
+-------------------------------------------------------+
1 row in set (0.00 sec)
