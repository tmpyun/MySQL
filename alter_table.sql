mysql> select version();
+-----------+
| version() |
+-----------+
| 5.7.32    |
+-----------+
1 row in set (0.00 sec)

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| performance_schema |
| school             |
| sys                |
+--------------------+
5 rows in set (0.00 sec)

mysql> use school
Database changed
mysql> show tables;
+------------------+
| Tables_in_school |
+------------------+
| student          |
+------------------+
1 row in set (0.00 sec)

mysql> desc student;
+-------+-------------+------+-----+---------+-------+
| Field | Type        | Null | Key | Default | Extra |
+-------+-------------+------+-----+---------+-------+
| id    | int(4)      | NO   |     | NULL    |       |
| name  | char(20)    | NO   |     | NULL    |       |
| age   | int(2)      | NO   |     | 0       |       |
| dept  | varchar(16) | YES  |     | NULL    |       |
+-------+-------------+------+-----+---------+-------+
4 rows in set (0.00 sec)

mysql> alter table student add info varchar(255);
Query OK, 0 rows affected (0.05 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> desc student;
+-------+--------------+------+-----+---------+-------+
| Field | Type         | Null | Key | Default | Extra |
+-------+--------------+------+-----+---------+-------+
| id    | int(4)       | NO   |     | NULL    |       |
| name  | char(20)     | NO   |     | NULL    |       |
| age   | int(2)       | NO   |     | 0       |       |
| dept  | varchar(16)  | YES  |     | NULL    |       |
| info  | varchar(255) | YES  |     | NULL    |       |
+-------+--------------+------+-----+---------+-------+
5 rows in set (0.00 sec)

mysql> alter table student add sex char(4) after name;
Query OK, 0 rows affected (0.04 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> desc student;
+-------+--------------+------+-----+---------+-------+
| Field | Type         | Null | Key | Default | Extra |
+-------+--------------+------+-----+---------+-------+
| id    | int(4)       | NO   |     | NULL    |       |
| name  | char(20)     | NO   |     | NULL    |       |
| sex   | char(4)      | YES  |     | NULL    |       |
| age   | int(2)       | NO   |     | 0       |       |
| dept  | varchar(16)  | YES  |     | NULL    |       |
| info  | varchar(255) | YES  |     | NULL    |       |
+-------+--------------+------+-----+---------+-------+
6 rows in set (0.00 sec)

mysql> alter table student add phone int(13) first;
Query OK, 0 rows affected (0.02 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> desc student;
+-------+--------------+------+-----+---------+-------+
| Field | Type         | Null | Key | Default | Extra |
+-------+--------------+------+-----+---------+-------+
| phone | int(13)      | YES  |     | NULL    |       |
| id    | int(4)       | NO   |     | NULL    |       |
| name  | char(20)     | NO   |     | NULL    |       |
| sex   | char(4)      | YES  |     | NULL    |       |
| age   | int(2)       | NO   |     | 0       |       |
| dept  | varchar(16)  | YES  |     | NULL    |       |
| info  | varchar(255) | YES  |     | NULL    |       |
+-------+--------------+------+-----+---------+-------+
7 rows in set (0.00 sec)

mysql> alter table student add qq varchar(20),add wechat varchar(30);
Query OK, 0 rows affected (0.03 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> desc student;
+--------+--------------+------+-----+---------+-------+
| Field  | Type         | Null | Key | Default | Extra |
+--------+--------------+------+-----+---------+-------+
| phone  | int(13)      | YES  |     | NULL    |       |
| id     | int(4)       | NO   |     | NULL    |       |
| name   | char(20)     | NO   |     | NULL    |       |
| sex    | char(4)      | YES  |     | NULL    |       |
| age    | int(2)       | NO   |     | 0       |       |
| dept   | varchar(16)  | YES  |     | NULL    |       |
| info   | varchar(255) | YES  |     | NULL    |       |
| qq     | varchar(20)  | YES  |     | NULL    |       |
| wechat | varchar(30)  | YES  |     | NULL    |       |
+--------+--------------+------+-----+---------+-------+
9 rows in set (0.00 sec)

mysql> alter table student drop qq,drop wechat;    
Query OK, 0 rows affected (0.02 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> desc student;
+-------+--------------+------+-----+---------+-------+
| Field | Type         | Null | Key | Default | Extra |
+-------+--------------+------+-----+---------+-------+
| phone | int(13)      | YES  |     | NULL    |       |
| id    | int(4)       | NO   |     | NULL    |       |
| name  | char(20)     | NO   |     | NULL    |       |
| sex   | char(4)      | YES  |     | NULL    |       |
| age   | int(2)       | NO   |     | 0       |       |
| dept  | varchar(16)  | YES  |     | NULL    |       |
| info  | varchar(255) | YES  |     | NULL    |       |
+-------+--------------+------+-----+---------+-------+
7 rows in set (0.01 sec)

### <<=== 生产系统添加字段的规范语法，注意表名和字段用反单引号 `` , 字段注释(COMMENT)使用单引号 ''
mysql> ALTER TABLE `student` ADD `WECHAT` varchar(30) default NULL COMMENT '微信';
Query OK, 0 rows affected (0.00 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> desc student;
+--------+--------------+------+-----+---------+-------+
| Field  | Type         | Null | Key | Default | Extra |
+--------+--------------+------+-----+---------+-------+
| phone  | int(13)      | YES  |     | NULL    |       |
| id     | int(4)       | NO   |     | NULL    |       |
| name   | char(20)     | NO   |     | NULL    |       |
| sex    | char(4)      | YES  |     | NULL    |       |
| age    | int(2)       | NO   |     | 0       |       |
| dept   | varchar(16)  | YES  |     | NULL    |       |
| info   | varchar(255) | YES  |     | NULL    |       |
| WECHAT | varchar(30)  | YES  |     | NULL    |       |
+--------+--------------+------+-----+---------+-------+
8 rows in set (0.00 sec)
ql> desc student;
+--------+--------------+------+-----+---------+-------+
| Field  | Type         | Null | Key | Default | Extra |
+--------+--------------+------+-----+---------+-------+
| phone  | int(13)      | YES  |     | NULL    |       |
| id     | int(4)       | NO   |     | NULL    |       |
| name   | char(20)     | NO   |     | NULL    |       |
| sex    | char(4)      | YES  |     | NULL    |       |
| age    | int(2)       | NO   |     | 0       |       |
| dept   | varchar(16)  | YES  |     | NULL    |       |
| info   | varchar(255) | YES  |     | NULL    |       |
| WECHAT | varchar(30)  | YES  |     | NULL    |       |
+--------+--------------+------+-----+---------+-------+
8 rows in set (0.00 sec)

### <<=== 修改字段类型，生产环境此操作需要谨慎操作，否则会影响数据
mysql> alter table student modify phone varchar(13) after dept;
Query OK, 0 rows affected (0.05 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> desc student;
+--------+--------------+------+-----+---------+-------+
| Field  | Type         | Null | Key | Default | Extra |
+--------+--------------+------+-----+---------+-------+
| id     | int(4)       | NO   |     | NULL    |       |
| name   | char(20)     | NO   |     | NULL    |       |
| sex    | char(4)      | YES  |     | NULL    |       |
| age    | int(2)       | NO   |     | 0       |       |
| dept   | varchar(16)  | YES  |     | NULL    |       |
| phone  | varchar(13)  | YES  |     | NULL    |       |
| info   | varchar(255) | YES  |     | NULL    |       |
| WECHAT | varchar(30)  | YES  |     | NULL    |       |
+--------+--------------+------+-----+---------+-------+
8 rows in set (0.00 sec)

### <<=== 修改字段名称
mysql> alter table student change phone stuphone varchar(13);
Query OK, 0 rows affected (0.00 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> desc student;
+----------+--------------+------+-----+---------+-------+
| Field    | Type         | Null | Key | Default | Extra |
+----------+--------------+------+-----+---------+-------+
| id       | int(4)       | NO   |     | NULL    |       |
| name     | char(20)     | NO   |     | NULL    |       |
| sex      | char(4)      | YES  |     | NULL    |       |
| age      | int(2)       | NO   |     | 0       |       |
| dept     | varchar(16)  | YES  |     | NULL    |       |
| stuphone | varchar(13)  | YES  |     | NULL    |       |
| info     | varchar(255) | YES  |     | NULL    |       |
| WECHAT   | varchar(30)  | YES  |     | NULL    |       |
+----------+--------------+------+-----+---------+-------+
8 rows in set (0.00 sec)
