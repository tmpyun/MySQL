mysql> select version();
+------------+
| version()  |
+------------+
| 5.7.32-log |
+------------+
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

### <<===  提示导出student表数据受安全策略 --secure-file-priv限制
mysql> select * from school.student into outfile '/tmp/school_studentinfo.txt';
ERROR 1290 (HY000): The MySQL server is running with the --secure-file-priv option so it cannot execute this statement

### 当前设置只是临时生效，MySQL重启后就失效,想永久生效在/etc/my.cnf添加 sercure_file_priv='';
mysql> show global variables like '%secure_file_priv%';
+------------------+-----------------------+
| Variable_name    | Value                 |
+------------------+-----------------------+
| secure_file_priv | /var/lib/mysql-files/ |
+------------------+-----------------------+
1 row in set (0.00 sec)

### <<=== 导出TXT文本
mysql> select * from school.student into outfile '/var/lib/mysql-files/school_student.txt';    
Query OK, 4 rows affected (0.00 sec)

mysql> system cat /var/lib/mysql-files/school_student.txt
1       xiaoming        man     18      two class
2       xiaoding        man     18      two class
3       TOM     man     19      three class
4       Marria  wman    20      three class

### <<=== 导出TXT文本并指定以utf8字符集导出
mysql> select * from student into outfile "/var/lib/mysql-files/school_student01.txt" character set utf8;  
Query OK, 4 rows affected (0.00 sec)

mysql> system cat /var/lib/mysql-files/school_student01.txt
1       xiaoming        man     18      two class
2       xiaoding        man     18      two class
3       TOM     man     19      three class
4       Marria  wman    20      three class

### <<=== 导出TXT文本并以指定 "--" 为字段分隔符
mysql> select * from student into outfile "/var/lib/mysql-files/school_student02.txt" fields terminated by'--';       
Query OK, 4 rows affected, 1 warning (0.00 sec)

mysql> system cat /var/lib/mysql-files/school_student02.txt
1--xiaoming--man--18--two class
2--xiaoding--man--18--two class
3--TOM--man--19--three class
4--Marria--wman--20--three class

### <<=== 导出TXT文本并对字段内容使用""引号进行引用
mysql> select * from student into outfile "/var/lib/mysql-files/school_student03.txt" fields enclosed by '"'; 
Query OK, 4 rows affected (0.00 sec)

mysql> system cat /var/lib/mysql-files/school_student03.txt
"1"     "xiaoming"      "man"   "18"    "two class"
"2"     "xiaoding"      "man"   "18"    "two class"
"3"     "TOM"   "man"   "19"    "three class"
"4"     "Marria"        "wman"  "20"    "three class"

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

mysql> select * from student into outfile '/var/lib/mysql-files/school_student';
Query OK, 4 rows affected (0.00 sec)

mysql> system cat /var/lib/mysql-files/school_student;
1       xiaoming        man     18      two class
2       xiaoding        man     18      two class
3       TOM     man     19      three class
4       Marria  wman    20      three class

mysql> select * from student;
Empty set (0.00 sec)

### <<=== 把导出的TXT文本数据导入到数据库student表中
mysql> load data infile '/var/lib/mysql-files/school_student' into table student;
Query OK, 4 rows affected (0.01 sec)
Records: 4  Deleted: 0  Skipped: 0  Warnings: 0

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

