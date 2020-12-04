mysql> select version();
+-----------+
| version() |
+-----------+
| 5.7.32    |
+-----------+
1 row in set (0.02 sec)

mysql> create database school;
Query OK, 1 row affected (0.00 sec)

mysql> use school;
Database changed
mysql> create table student (
    -> id int(4) not null, 
    -> name char(20) not null, 
    -> age int(2) not null default '0', 
    -> dept varchar(16) default null
    -> )engine=InnoDB default character set utf8 collate utf8_general_ci;
Query OK, 0 rows affected (0.00 sec)

mysql> show tables;
+------------------+
| Tables_in_school |
+------------------+
| student          |
+------------------+
1 row in set (0.00 sec)

mysql> show create table student;
+---------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Table   | Create Table                                                                                                                                                                             |
+---------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| student | CREATE TABLE `student` (
  `id` int(4) NOT NULL,
  `name` char(20) NOT NULL,
  `age` int(2) NOT NULL DEFAULT '0',
  `dept` varchar(16) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 |
+---------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
1 row in set (0.06 sec)

mysql> show create table student\G;
*************************** 1. row ***************************
       Table: student
Create Table: CREATE TABLE `student` (
  `id` int(4) NOT NULL,
  `name` char(20) NOT NULL,
  `age` int(2) NOT NULL DEFAULT '0',
  `dept` varchar(16) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8
1 row in set (0.00 sec)

ERROR: 
No query specified

### <<=== 方法1：查看表结构
mysql> desc student;
+-------+-------------+------+-----+---------+-------+
| Field | Type        | Null | Key | Default | Extra |
+-------+-------------+------+-----+---------+-------+
| id    | int(4)      | NO   |     | NULL    |       |
| name  | char(20)    | NO   |     | NULL    |       |
| age   | int(2)      | NO   |     | 0       |       |
| dept  | varchar(16) | YES  |     | NULL    |       |
+-------+-------------+------+-----+---------+-------+
4 rows in set (0.02 sec)

### <<=== 方法2：查看表结构
mysql> show columns from school.student;
+-------+-------------+------+-----+---------+-------+
| Field | Type        | Null | Key | Default | Extra |
+-------+-------------+------+-----+---------+-------+
| id    | int(4)      | NO   |     | NULL    |       |
| name  | char(20)    | NO   |     | NULL    |       |
| age   | int(2)      | NO   |     | 0       |       |
| dept  | varchar(16) | YES  |     | NULL    |       |
+-------+-------------+------+-----+---------+-------+
4 rows in set (0.00 sec)

### <<===  方法1：修改表名
mysql> rename table student to student_info;
Query OK, 0 rows affected (0.03 sec)

mysql> show tables;
+------------------+
| Tables_in_school |
+------------------+
| student_info     |
+------------------+
1 row in set (0.00 sec)

### <<===  方法2：修改表名
mysql> alter table student_info rename to student;
Query OK, 0 rows affected (0.00 sec)

mysql> show tables;
+------------------+
| Tables_in_school |
+------------------+
| student          |
+------------------+
1 row in set (0.00 sec)


