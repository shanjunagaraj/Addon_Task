-- Task 1: Count students per course
-- SQL Query

SELECT course_id, COUNT(student_id) AS student_count
FROM registration
GROUP BY course_id;

-- Task 2: Average salary by department

SELECT department_id, AVG(salary) AS average_salary
FROM employee
GROUP BY department_id;

-- Task 3: Max/Min product price

SELECT MAX(price) AS max_price, MIN(price) AS min_price
FROM product;

-- Task4: Sales report generator with grouping

SELECT product_id, SUM(amount) AS total_sales
FROM sales
GROUP BY product_id;
