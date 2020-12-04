mysql> select version();
+-----------+
| version() |
+-----------+
| 5.7.32    |
+-----------+
1 row in set (0.00 sec)

mysql> grant all privileges on *.* to xiaoming@'localhost' identified by '123456';
Query OK, 0 rows affected, 1 warning (0.00 sec)

mysql> show grants for xiaoming@'localhost';
+-------------------------------------------------------+
| Grants for xiaoming@localhost                         |
+-------------------------------------------------------+
| GRANT ALL PRIVILEGES ON *.* TO 'xiaoming'@'localhost' |
+-------------------------------------------------------+
1 row in set (0.00 sec)

mysql> revoke select on *.* from xiaoming@'localhost';
Query OK, 0 rows affected (0.00 sec)

mysql> show grants for xiaoming@'localhost';
+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Grants for xiaoming@localhost                                                                                                                                                                                                                                                                                                                              |
+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| GRANT INSERT, UPDATE, DELETE, CREATE, DROP, RELOAD, SHUTDOWN, PROCESS, FILE, REFERENCES, INDEX, ALTER, SHOW DATABASES, SUPER, CREATE TEMPORARY TABLES, LOCK TABLES, EXECUTE, REPLICATION SLAVE, REPLICATION CLIENT, CREATE VIEW, SHOW VIEW, CREATE ROUTINE, ALTER ROUTINE, CREATE USER, EVENT, TRIGGER, CREATE TABLESPACE ON *.* TO 'xiaoming'@'localhost' |
+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
1 row in set (0.00 sec)

mysql> revoke delete,create,drop,update on *.* from xiaoming@'localhost';            
Query OK, 0 rows affected (0.00 sec)

mysql> show grants for xiaoming@'localhost';
+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Grants for xiaoming@localhost                                                                                                                                                                                                                                                                                                |
+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| GRANT INSERT, RELOAD, SHUTDOWN, PROCESS, FILE, REFERENCES, INDEX, ALTER, SHOW DATABASES, SUPER, CREATE TEMPORARY TABLES, LOCK TABLES, EXECUTE, REPLICATION SLAVE, REPLICATION CLIENT, CREATE VIEW, SHOW VIEW, CREATE ROUTINE, ALTER ROUTINE, CREATE USER, EVENT, TRIGGER, CREATE TABLESPACE ON *.* TO 'xiaoming'@'localhost' |
+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
1 row in set (0.00 sec)


mysql> grant select,update,create on *.* to xiaoming@'localhost';           
Query OK, 0 rows affected (0.00 sec)

mysql> show grants for xiaoming@'localhost';                                     
+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Grants for xiaoming@localhost                                                                                                                                                                                                                                                                                                                        |
+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| GRANT SELECT, INSERT, UPDATE, CREATE, RELOAD, SHUTDOWN, PROCESS, FILE, REFERENCES, INDEX, ALTER, SHOW DATABASES, SUPER, CREATE TEMPORARY TABLES, LOCK TABLES, EXECUTE, REPLICATION SLAVE, REPLICATION CLIENT, CREATE VIEW, SHOW VIEW, CREATE ROUTINE, ALTER ROUTINE, CREATE USER, EVENT, TRIGGER, CREATE TABLESPACE ON *.* TO 'xiaoming'@'localhost' |
+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
1 row in set (0.00 sec)

mysql> flush privileges;
Query OK, 0 rows affected (0.00 sec)

### <<== 主库授权用户权限
mysql> grant select,insert,update,delete on test.* to 'xiaohong'@'10.10.10.0/255.255.255.0' identified by '123456';
Query OK, 0 rows affected, 1 warning (0.03 sec)

### <<== 从库授权用户权限
mysql> grant select on test.* to 'xiaodong'@'10.10.10.%' identified by '123456';
Query OK, 0 rows affected, 1 warning (0.00 sec)

mysql> show grants for 'xiaohong'@'10.10.10.0/255.255.255.0';
+-------------------------------------------------------------------------------------------+
| Grants for xiaohong@10.10.10.0/255.255.255.0                                              |
+-------------------------------------------------------------------------------------------+
| GRANT USAGE ON *.* TO 'xiaohong'@'10.10.10.0/255.255.255.0'                               |
| GRANT SELECT, INSERT, UPDATE, DELETE ON `test`.* TO 'xiaohong'@'10.10.10.0/255.255.255.0' |
+-------------------------------------------------------------------------------------------+
2 rows in set (0.00 sec)

mysql> show grants for 'xiaodong'@'10.10.10.%';
+-----------------------------------------------------+
| Grants for xiaodong@10.10.10.%                      |
+-----------------------------------------------------+
| GRANT USAGE ON *.* TO 'xiaodong'@'10.10.10.%'       |
| GRANT SELECT ON `test`.* TO 'xiaodong'@'10.10.10.%' |
+-----------------------------------------------------+
2 rows in set (0.00 sec)

