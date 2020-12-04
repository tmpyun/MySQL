mysql> select version();
+-----------+
| version() |
+-----------+
| 5.7.32    |
+-----------+
1 row in set (0.00 sec)

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
| sex   | char(4)     | YES  |     | NULL    |       |
| age   | int(2)      | NO   |     | 0       |       |
| dept  | varchar(16) | YES  |     | NULL    |       |
+-------+-------------+------+-----+---------+-------+
5 rows in set (0.00 sec)

### <<=== 规范插入，推荐使用
mysql> insert into student(id,name,sex,age,dept) values('1','xiaoming','man','18','two class');
Query OK, 1 row affected (0.01 sec)

mysql> select * from student;
+----+----------+------+-----+-----------+
| id | name     | sex  | age | dept      |
+----+----------+------+-----+-----------+
|  1 | xiaoming | man  |  18 | two class |
+----+----------+------+-----+-----------+
1 row in set (0.00 sec)

### <<=== 插入多行
mysql> insert into student(id,name,sex,age,dept) values('2','xiaoding','man','18','two class'),('3','xiaozhang','man','19','three class');
Query OK, 2 rows affected (0.00 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql> select * from student;
+----+-----------+------+-----+-------------+
| id | name      | sex  | age | dept        |
+----+-----------+------+-----+-------------+
|  1 | xiaoming  | man  |  18 | two class   |
|  2 | xiaoding  | man  |  18 | two class   |
|  3 | xiaozhang | man  |  19 | three class |
+----+-----------+------+-----+-------------+
3 rows in set (0.00 sec)

## <<=== 不推荐使用此方法插入
mysql> insert into student values('4','xiaohong','wman','16','three class');       
Query OK, 1 row affected (0.00 sec)

mysql> select * from student;
+----+-----------+------+-----+-------------+
| id | name      | sex  | age | dept        |
+----+-----------+------+-----+-------------+
|  1 | xiaoming  | man  |  18 | two class   |
|  2 | xiaoding  | man  |  18 | two class   |
|  3 | xiaozhang | man  |  19 | three class |
|  4 | xiaohong  | wman |  16 | three class |
+----+-----------+------+-----+-------------+
4 rows in set (0.00 sec)
