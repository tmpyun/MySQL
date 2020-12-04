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

mysql> update student set name='TOM' where id=3 and name='xiaozhang';
Query OK, 1 row affected (0.02 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from student;
+----+----------+------+-----+-------------+
| id | name     | sex  | age | dept        |
+----+----------+------+-----+-------------+
|  1 | xiaoming | man  |  18 | two class   |
|  2 | xiaoding | man  |  18 | two class   |
|  3 | TOM      | man  |  19 | three class |
|  4 | xiaohong | wman |  16 | three class |
+----+----------+------+-----+-------------+
4 rows in set (0.00 sec)

### <<=== 修改多个字段值
mysql> update student set name='Marria',age='20' where id='4' and name='xiaohong';
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from student;
+----+----------+------+-----+-------------+
| id | name     | sex  | age | dept        |
+----+----------+------+-----+-------------+
|  1 | xiaoming | man  |  18 | two class   |
|  2 | xiaoding | man  |  18 | two class   |
|  3 | TOM      | man  |  19 | three class |
|  4 | Marria   | wman |  20 | three class |
+----+----------+------+-----+-------------+
4 rows in set (0.00 sec)


