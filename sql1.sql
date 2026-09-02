-- Library Management System

-- Creating table branch
CREATE TABLE BRANCH(
branch_id VARCHAR(5) PRIMARY KEY,
manager_id VARCHAR(5),
branch_address VARCHAR(30),
contact_no VARCHAR(15)
);

DROP TABLE BRANCH;

CREATE TABLE EMPLOYEES(
emp_id VARCHAR(5) PRIMARY KEY,
emp_name VARCHAR(25),
position VARCHAR(20),
salary INT,
branch_id VARCHAR(5),
FOREIGN KEY (branch_id) REFERENCES BRANCH(branch_id)
)

CREATE TABLE BOOKS(
isbn VARCHAR(50) PRIMARY KEY,
book_title VARCHAR(50),
category VARCHAR(20),
rental_price FLOAT,
status VARCHAR(5),
author VARCHAR(25),
publisher VARCHAR(50)
)

CREATE TABLE MEMBERS(
member_id VARCHAR(10) PRIMARY KEY,
member_name VARCHAR(25),
member_address VARCHAR(75),
reg_date DATE
)

DROP TABLE MEMBERS

CREATE TABLE issued_date(
issued_id VARCHAR(10) PRIMARY KEY,
issued_member_id VARCHAR(10),
issued_book_name VARCHAR(75),
issued_date DATE, 
issued_book_isbn VARCHAR(25),
issued_emp_id VARCHAR(10),
FOREIGN KEY (issued_member_id) REFERENCES MEMBERS(member_id),
FOREIGN KEY(issued_emp_id) REFERENCES EMPLOYEES(emp_id),
FOREIGN KEY(issued_book_isbn) REFERENCES BOOKS(isbn)
)
DROP TABLE ISSUED_DATE
CREATE TABLE return_status(
return_id VARCHAR(10) PRIMARY KEY,
issued_id VARCHAR(10),
return_book_name VARCHAR(75),
return_date DATE,
return_book_isbn VARCHAR(50),
FOREIGN KEY (issued_id) REFERENCES issued_date(issued_id),
FOREIGN KEY(return_book_isbn) REFERENCES BOOKS(isbn)
)
DROP TABLE return_status