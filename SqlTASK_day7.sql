//Task 1: Create student and course tables
//SQL

CREATE DATABASE collegeDB;
USE collegeDB;

CREATE TABLE student (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    age INT
);

CREATE TABLE course (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    fee DECIMAL(10,2)
);

//✅ Task 2: Insert 5 records in each table
//Insert into student

INSERT INTO student (name, age) VALUES
('Alice', 20),
('Bob', 21),
('Charlie', 22),
('David', 20),
('Eva', 19);

//Insert into course

INSERT INTO course (name, fee) VALUES
('Mathematics', 2500.00),
('Physics', 3000.00),
('Chemistry', 2800.00),
('Computer Science', 3500.00),
('English', 2000.00);

//Task 3: Update a course fee

UPDATE course
SET fee = 4000.00
WHERE name = 'Computer Science';

//Task 4: Library DB – Create 3 tables and populate data

CREATE DATABASE libraryDB;
USE libraryDB;

CREATE TABLE books (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100),
    author VARCHAR(100),
    price DECIMAL(10,2)
);

CREATE TABLE members (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    membership_date DATE
);

CREATE TABLE transactions (
    id INT AUTO_INCREMENT PRIMARY KEY,
    book_id INT,
    member_id INT,
    issue_date DATE,
    return_date DATE,
    FOREIGN KEY (book_id) REFERENCES books(id),
    FOREIGN KEY (member_id) REFERENCES members(id)
);

//Insert into books
INSERT INTO books (title, author, price) VALUES
('Java Programming', 'James Gosling', 500.00),
('Database Systems', 'C.J. Date', 600.00),
('Operating Systems', 'Galvin', 550.00),
('Computer Networks', 'Tanenbaum', 450.00),
('Data Structures', 'Sahni', 400.00);


//Insert into members

INSERT INTO members (name, membership_date) VALUES
('Arjun', '2024-06-01'),
('Meera', '2024-07-15'),
('Rahul', '2024-08-10'),
('Sneha', '2024-09-05'),
('Vikram', '2024-10-20');

//Insert into transactions

INSERT INTO transactions (book_id, member_id, issue_date, return_date) VALUES
(1, 2, '2025-06-01', '2025-06-15'),
(3, 1, '2025-06-05', '2025-06-20'),
(4, 3, '2025-06-10', NULL),
(2, 5, '2025-06-12', NULL),
(5, 4, '2025-06-14', '2025-06-28');


