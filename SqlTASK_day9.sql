-- Task 1: Fetch students with >80 marks
-- SQL Query


SELECT s.id, s.name, m.mark
FROM students s
JOIN marks m ON s.id = m.student_id
WHERE m.mark > 80;



-- Task 2: List courses by ascending fees
-- SQL Query


SELECT * FROM course
ORDER BY fee ASC;


-- Task 3: Search books by keyword using LIKE
-- SQL Query


SELECT * FROM books
WHERE title LIKE '%Java%';


-- Task 4: Customer record filtering system
-- Filter customers by city

SELECT * FROM customers
WHERE city = 'Bangalore';


-- Filter customers by minimum purchase amount

SELECT c.id, c.name, c.city, SUM(o.amount) AS total_purchase
FROM customers c
JOIN orders o ON c.id = o.customer_id
GROUP BY c.id, c.name, c.city
HAVING total_purchase >= 5000;



