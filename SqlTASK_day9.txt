***************TASKS:MAIN PROGRAM*************
mysql> create database mycase
    -> ;
Query OK, 1 row affected (0.00 sec)

mysql> create table students;
ERROR 1046 (3D000): No database selected
mysql> use mycase
Database changed
mysql> create table students(
    -> name varchar(225),
    -> rollno int,
    -> department varchar(225),
    -> age int);
Query OK, 0 rows affected (0.01 sec)

mysql> insert into students values('shanju',01,'CS',20),('sudee',02,'IT',20);
Query OK, 2 rows affected (0.01 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql> select * from students;
+--------+--------+------------+------+
| name   | rollno | department | age  |
+--------+--------+------------+------+
| shanju |      1 | CS         |   20 |
| sudee  |      2 | IT         |   20 |
+--------+--------+------------+------+
2 rows in set (0.00 sec)

mysql> insert into students values('madhu',03,'CS',20),('kalai',04,'IT',20);
Query OK, 2 rows affected (0.00 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql> select * from students;
+--------+--------+------------+------+
| name   | rollno | department | age  |
+--------+--------+------------+------+
| shanju |      1 | CS         |   20 |
| sudee  |      2 | IT         |   20 |
| madhu  |      3 | CS         |   20 |
| kalai  |      4 | IT         |   20 |
+--------+--------+------------+------+
4 rows in set (0.00 sec)

mysql> create table marks(
    -> rollno int,
    -> name varchar(225),
    -> department varchar(225),
    -> total int);
Query OK, 0 rows affected (0.01 sec)

mysql> insert into marks values(01,'shanju','CS',500),(02,'sudee','IT',497);
Query OK, 2 rows affected (0.00 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql> select * from marks;
+--------+--------+------------+-------+
| rollno | name   | department | total |
+--------+--------+------------+-------+
|      1 | shanju | CS         |   500 |
|      2 | sudee  | IT         |   497 |
+--------+--------+------------+-------+
2 rows in set (0.00 sec)

mysql> insert into marks values(03,'madhu','CS',356),(04,'kalai','CS',477);
Query OK, 2 rows affected (0.00 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql> select * from marks;
+--------+--------+------------+-------+
| rollno | name   | department | total |
+--------+--------+------------+-------+
|      1 | shanju | CS         |   500 |
|      2 | sudee  | IT         |   497 |
|      3 | madhu  | CS         |   356 |
|      4 | kalai  | CS         |   477 |
+--------+--------+------------+-------+
4 rows in set (0.00 sec)

mysql> create table stages(
    -> rollno int,
    -> name varchar(225),
    -> current stauts (225));
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near '(225))' at line 4
mysql> create table stages(
    -> rollno int,
    -> name varchar(225),
    -> current_stauts varchar(225));
Query OK, 0 rows affected (0.01 sec)

mysql> select * from stages;
Empty set (0.00 sec)

mysql> insert into marks values(01,'shanju','pass'),(02,'kalai','fail');
ERROR 1136 (21S01): Column count doesn't match value count at row 1
mysql> insert into stages values(01,'shanju','pass'),(02,'kalai','fail');
Query OK, 2 rows affected (0.00 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql> select * from stages;
+--------+--------+----------------+
| rollno | name   | current_stauts |
+--------+--------+----------------+
|      1 | shanju | pass           |
|      2 | kalai  | fail           |
+--------+--------+----------------+
2 rows in set (0.00 sec)

mysql> insert into stages values(03,'madhu','pass'),(04,'sudee','fail');
Query OK, 2 rows affected (0.00 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql> select * from stages;
+--------+--------+----------------+
| rollno | name   | current_stauts |
+--------+--------+----------------+
|      1 | shanju | pass           |
|      2 | kalai  | fail           |
|      3 | madhu  | pass           |
|      4 | sudee  | fail           |
+--------+--------+----------------+
4 rows in set (0.00 sec)

mysql> create table stud(
    -> rollno int,
    -> name varchar(225),
    -> department varchar(225));
Query OK, 0 rows affected (0.01 sec)

mysql> insert into stud values(01,'shanju','CS'),(02,'sudee','IT'),(03,'kalai','CS'),(04,'madhu','BSC');
Query OK, 4 rows affected (0.00 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql> select * from stud;
+--------+--------+------------+
| rollno | name   | department |
+--------+--------+------------+
|      1 | shanju | CS         |
|      2 | sudee  | IT         |
|      3 | kalai  | CS         |
|      4 | madhu  | BSC        |
+--------+--------+------------+
4 rows in set (0.00 sec)

mysql> insert into stud values(05,'surya','CT');
Query OK, 1 row affected (0.00 sec)

mysql> select * from stud;
+--------+--------+------------+
| rollno | name   | department |
+--------+--------+------------+
|      1 | shanju | CS         |
|      2 | sudee  | IT         |
|      3 | kalai  | CS         |
|      4 | madhu  | BSC        |
|      5 | surya  | CT         |
+--------+--------+------------+
5 rows in set (0.00 sec)

mysql> create table course(
    -> rollno int,
    -> name varchar(225));
Query OK, 0 rows affected (0.01 sec)

mysql> insert into course values(01,'shanju'),(02,'kalai'),(03,'sudee'),(04,'surya'),(05,'madhu');
Query OK, 5 rows affected (0.00 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> select * from course;
+--------+--------+
| rollno | name   |
+--------+--------+
|      1 | shanju |
|      2 | kalai  |
|      3 | sudee  |
|      4 | surya  |
|      5 | madhu  |
+--------+--------+
5 rows in set (0.00 sec)

mysql> alter table course add column fee int;
Query OK, 0 rows affected (0.01 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> select * from course;
+--------+--------+------+
| rollno | name   | fee  |
+--------+--------+------+
|      1 | shanju | NULL |
|      2 | kalai  | NULL |
|      3 | sudee  | NULL |
|      4 | surya  | NULL |
|      5 | madhu  | NULL |
+--------+--------+------+
5 rows in set (0.00 sec)

mysql> update course set fee='500' where name='shanju';
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from course;
+--------+--------+------+
| rollno | name   | fee  |
+--------+--------+------+
|      1 | shanju |  500 |
|      2 | kalai  | NULL |
|      3 | sudee  | NULL |
|      4 | surya  | NULL |
|      5 | madhu  | NULL |
+--------+--------+------+
5 rows in set (0.00 sec)

mysql> update course set fee='500' where name='kalai';
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> update course set fee='500' where name='madhu';
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> update course set fee='500' where name='sudee';
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> update course set fee='500' where name='surya';
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from course;
+--------+--------+------+
| rollno | name   | fee  |
+--------+--------+------+
|      1 | shanju |  500 |
|      2 | kalai  |  500 |
|      3 | sudee  |  500 |
|      4 | surya  |  500 |
|      5 | madhu  |  500 |
+--------+--------+------+
5 rows in set (0.00 sec)

mysql> select * from stud;
+--------+--------+------------+
| rollno | name   | department |
+--------+--------+------------+
|      1 | shanju | CS         |
|      2 | sudee  | IT         |
|      3 | kalai  | CS         |
|      4 | madhu  | BSC        |
|      5 | surya  | CT         |
+--------+--------+------------+
5 rows in set (0.00 sec)

mysql> alter table course add column course varchar(225);
Query OK, 0 rows affected (0.01 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> select * from course;
+--------+--------+------+--------+
| rollno | name   | fee  | course |
+--------+--------+------+--------+
|      1 | shanju |  500 | NULL   |
|      2 | kalai  |  500 | NULL   |
|      3 | sudee  |  500 | NULL   |
|      4 | surya  |  500 | NULL   |
|      5 | madhu  |  500 | NULL   |
+--------+--------+------+--------+
5 rows in set (0.00 sec)

mysql> update course set course='java' where name='shanju';
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> update course set course='C++' where name='kalai';
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> update course set course='C++' where name='madhu';
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> update course set course='java' where name='surya';
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> update course set course='java' where name='sudee';
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from course;
+--------+--------+------+--------+
| rollno | name   | fee  | course |
+--------+--------+------+--------+
|      1 | shanju |  500 | java   |
|      2 | kalai  |  500 | C++    |
|      3 | sudee  |  500 | java   |
|      4 | surya  |  500 | java   |
|      5 | madhu  |  500 | C++    |
+--------+--------+------+--------+
5 rows in set (0.00 sec)

mysql> select * from course;
+--------+--------+------+--------+
| rollno | name   | fee  | course |
+--------+--------+------+--------+
|      1 | shanju |  500 | java   |
|      2 | kalai  |  500 | C++    |
|      3 | sudee  |  500 | java   |
|      4 | surya  |  500 | java   |
|      5 | madhu  |  500 | C++    |
+--------+--------+------+--------+
5 rows in set (0.00 sec)

mysql> select * from marks;
+--------+--------+------------+-------+
| rollno | name   | department | total |
+--------+--------+------------+-------+
|      1 | shanju | CS         |   500 |
|      2 | sudee  | IT         |   497 |
|      3 | madhu  | CS         |   356 |
|      4 | kalai  | CS         |   477 |
+--------+--------+------------+-------+
4 rows in set (0.00 sec)

mysql> select * from stages;
+--------+--------+----------------+
| rollno | name   | current_stauts |
+--------+--------+----------------+
|      1 | shanju | pass           |
|      2 | kalai  | fail           |
|      3 | madhu  | pass           |
|      4 | sudee  | fail           |
+--------+--------+----------------+
4 rows in set (0.00 sec)

mysql> select * from students;
+--------+--------+------------+------+
| name   | rollno | department | age  |
+--------+--------+------------+------+
| shanju |      1 | CS         |   20 |
| sudee  |      2 | IT         |   20 |
| madhu  |      3 | CS         |   20 |
| kalai  |      4 | IT         |   20 |
+--------+--------+------------+------+
4 rows in set (0.00 sec)

mysql> select * from marks;
+--------+--------+------------+-------+
| rollno | name   | department | total |
+--------+--------+------------+-------+
|      1 | shanju | CS         |   500 |
|      2 | sudee  | IT         |   497 |
|      3 | madhu  | CS         |   356 |
|      4 | kalai  | CS         |   477 |
+--------+--------+------------+-------+
4 rows in set (0.00 sec)

mysql> insert into marks values(05,'surya','CS',300);
Query OK, 1 row affected (0.00 sec)

mysql> select * from marks;
+--------+--------+------------+-------+
| rollno | name   | department | total |
+--------+--------+------------+-------+
|      1 | shanju | CS         |   500 |
|      2 | sudee  | IT         |   497 |
|      3 | madhu  | CS         |   356 |
|      4 | kalai  | CS         |   477 |
|      5 | surya  | CS         |   300 |
+--------+--------+------------+-------+
5 rows in set (0.00 sec)

mysql> alter tble marka drop row 5;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'tble marka drop row 5' at line 1
mysql> alter table marka drop row 5;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near '5' at line 1
mysql> notee
