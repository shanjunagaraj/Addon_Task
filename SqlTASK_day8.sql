-- TASK 1:
--  ER DAIGRAM
-- Publisher (publisher_id PK)
--    |
--    |1
--    | 
--    |*
-- Book (book_id PK, publisher_id FK)
--    |
--    |*
--    |
--    |*
-- Book_Author (book_id FK, author_id FK, PK(book_id, author_id))
--    |
--    |*
--    |
--    |1
-- Author (author_id PK)

CREATE TABLE Publisher (
    publisher_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    address VARCHAR(200)
);

CREATE TABLE Author (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100)
);

CREATE TABLE Book (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100),
    price DECIMAL(10,2),
    publisher_id INT,
    FOREIGN KEY (publisher_id) REFERENCES Publisher(publisher_id)
);

CREATE TABLE Book_Author (
    book_id INT,
    author_id INT,
    PRIMARY KEY (book_id, author_id),
    FOREIGN KEY (book_id) REFERENCES Book(book_id),
    FOREIGN KEY (author_id) REFERENCES Author(author_id)
);

-- TASK 2:

-- | **Entity**       | **Attributes**                                  | **Functional Dependencies**              |
-- | ---------------- | ----------------------------------------------- | ---------------------------------------- |
-- | **Publisher**    | publisher\_id (PK), name, address               | publisher\_id → name, address            |
-- | **Author**       | author\_id (PK), name                           | author\_id → name                        |
-- | **Book**         | book\_id (PK), title, price, publisher\_id (FK) | book\_id → title, price, publisher\_id   |
-- | **Book\_Author** | book\_id (FK), author\_id (FK)                  | (book\_id, author\_id) → \[composite PK] |


-- TASK 3:

CREATE DATABASE OnlineBookstore;
USE OnlineBookstore;

-- Publisher table
CREATE TABLE Publisher (
    publisher_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    address VARCHAR(200)
);

-- Author table
CREATE TABLE Author (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

-- Book table
CREATE TABLE Book (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    price DECIMAL(10,2),
    publisher_id INT,
    FOREIGN KEY (publisher_id) REFERENCES Publisher(publisher_id)
);

-- Book_Author associative table (Many-to-Many between Book and Author)
CREATE TABLE Book_Author (
    book_id INT,
    author_id INT,
    PRIMARY KEY (book_id, author_id),
    FOREIGN KEY (book_id) REFERENCES Book(book_id),
    FOREIGN KEY (author_id) REFERENCES Author(author_id)
);


-- TASK 4:
CREATE DATABASE collegeDB;
USE collegeDB;

-- Department table
CREATE TABLE Department (
    department_id INT AUTO_INCREMENT PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL
);

-- Student table
CREATE TABLE Student (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES Department(department_id)
);

-- Course table
CREATE TABLE Course (
    course_id INT AUTO_INCREMENT PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    credits INT,
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES Department(department_id)
);

-- Registration table
CREATE TABLE Registration (
    reg_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT,
    course_id INT,
    registration_date DATE,
    FOREIGN KEY (student_id) REFERENCES Student(student_id),
    FOREIGN KEY (course_id) REFERENCES Course(course_id)
);
