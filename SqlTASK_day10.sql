mysql> use ttask
Database changed
mysql> select * from course;
+--------+----------+---------+
| rollno | studname | cname   |
+--------+----------+---------+
|      1 | shanju   | java    |
|      2 | kalai    | java    |
|      3 | sudee    | C++     |
|      4 | madhu    | phython |
|      5 | surya    | java    |
+--------+----------+---------+
5 rows in set (0.00 sec)

mysql> select count(studname) from course where cname ='java';
+-----------------+
| count(studname) |
+-----------------+
|               3 |
+-----------------+
1 row in set (0.00 sec)

mysql> select count(studname) from course where cname ='phython';
+-----------------+
| count(studname) |
+-----------------+
|               1 |
+-----------------+
1 row in set (0.00 sec)

mysql> select count(studname) from course where cname ='c++';
+-----------------+
| count(studname) |
+-----------------+
|               1 |
+-----------------+
1 row in set (0.00 sec)

mysql> create table deptdetails(
    -> deptno int,
    -> deptname,
    -> deptsalary iny;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near '
deptsalary iny' at line 3
mysql> create table deptdetails(
    -> deptno int,
    -> deptname varchar(225);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near '' at line 3
mysql> create table deptdetails(
    -> deptno int,
    -> deptname varchar(225),
    -> deptsalary int);
Query OK, 0 rows affected (0.01 sec)

mysql> insert into deptdetails values(01,'CS',50,000),(02,'IT',45,000),(03,'CT',30,000),(04,'BCA',25,000),(05,'SS',35,000);
ERROR 1136 (21S01): Column count doesn't match value count at row 1
mysql> insert into deptdetails values(01,'CS',50000),(02,'IT',45000),(03,'CT',30000),(04,'BCA',25000),(05,'SS',35000);
Query OK, 5 rows affected (0.00 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> select * from deptdetails;
+--------+----------+------------+
| deptno | deptname | deptsalary |
+--------+----------+------------+
|      1 | CS       |      50000 |
|      2 | IT       |      45000 |
|      3 | CT       |      30000 |
|      4 | BCA      |      25000 |
|      5 | SS       |      35000 |
+--------+----------+------------+
5 rows in set (0.00 sec)

mysql> select min(deptsalary) from deptdetails ;
+-----------------+
| min(deptsalary) |
+-----------------+
|           25000 |
+-----------------+
1 row in set (0.00 sec)

mysql> create table product(
    -> prodid int,
    -> prodname varchar(225),
    -> prodprice int);
Query OK, 0 rows affected (0.01 sec)

mysql> insert into products values(01,'soap',50),(02,'shampoo',80),(03,'comb',15),(04,'powder',30),(05,'bindi',10);
ERROR 1146 (42S02): Table 'ttask.products' doesn't exist
mysql> insert into product values(01,'soap',50),(02,'shampoo',80),(03,'comb',15),(04,'powder',30),(05,'bindi',10);
Query OK, 5 rows affected (0.00 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> select * from product;
+--------+----------+-----------+
| prodid | prodname | prodprice |
+--------+----------+-----------+
|      1 | soap     |        50 |
|      2 | shampoo  |        80 |
|      3 | comb     |        15 |
|      4 | powder   |        30 |
|      5 | bindi    |        10 |
+--------+----------+-----------+
5 rows in set (0.00 sec)

mysql> select max(prodprice) from product;
+----------------+
| max(prodprice) |
+----------------+
|             80 |
+----------------+
1 row in set (0.00 sec)

mysql> select min(prodprice) from product;
+----------------+
| min(prodprice) |
+----------------+
|             10 |
+----------------+
1 row in set (0.00 sec)

mysql> select prodprice from product where group by proname;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'group by proname' at line 1
mysql> select prodprice from product group by proname;
ERROR 1054 (42S22): Unknown column 'proname' in 'group statement'
mysql> select prodprice from product group by prodname;
+-----------+
| prodprice |
+-----------+
|        10 |
|        15 |
|        30 |
|        80 |
|        50 |
+-----------+
5 rows in set (0.00 sec)

mysql> ;
ERROR: 
No query specified

mysql> select prodname,avg(prodprice) from student group by prodname;
ERROR 1146 (42S02): Table 'ttask.student' doesn't exist
mysql> select prodname,avg(prodprice) from product group by prodname;
+----------+----------------+
| prodname | avg(prodprice) |
+----------+----------------+
| bindi    |        10.0000 |
| comb     |        15.0000 |
| powder   |        30.0000 |
| shampoo  |        80.0000 |
| soap     |        50.0000 |
+----------+----------------+
5 rows in set (0.00 sec)

