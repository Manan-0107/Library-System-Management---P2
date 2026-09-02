-- =========================================
-- LIBRARY MANAGEMENT SYSTEM
-- TABLE CREATION
-- =========================================

-- Drop tables in correct dependency order
DROP TABLE IF EXISTS return_status CASCADE;
DROP TABLE IF EXISTS issued_date CASCADE;
DROP TABLE IF EXISTS issued_status CASCADE;
DROP TABLE IF EXISTS employees CASCADE;
DROP TABLE IF EXISTS books CASCADE;
DROP TABLE IF EXISTS members CASCADE;
DROP TABLE IF EXISTS branch CASCADE;


-- =========================================
-- BRANCH TABLE
-- =========================================

CREATE TABLE branch(
    branch_id VARCHAR(5) PRIMARY KEY,
    manager_id VARCHAR(5),
    branch_address VARCHAR(30),
    contact_no VARCHAR(15)
);


-- =========================================
-- EMPLOYEES TABLE
-- =========================================

CREATE TABLE employees(
    emp_id VARCHAR(5) PRIMARY KEY,
    emp_name VARCHAR(25),
    position VARCHAR(20),
    salary INT,
    branch_id VARCHAR(5),
    FOREIGN KEY (branch_id)
        REFERENCES branch(branch_id)
);


-- =========================================
-- BOOKS TABLE
-- =========================================

CREATE TABLE books(
    isbn VARCHAR(50) PRIMARY KEY,
    book_title VARCHAR(50),
    category VARCHAR(20),
    rental_price FLOAT,
    status VARCHAR(5),
    author VARCHAR(50),
    publisher VARCHAR(50)
);


-- =========================================
-- MEMBERS TABLE
-- =========================================

CREATE TABLE members(
    member_id VARCHAR(10) PRIMARY KEY,
    member_name VARCHAR(25),
    member_address VARCHAR(75),
    reg_date DATE
);


-- =========================================
-- ISSUED STATUS TABLE
-- =========================================

CREATE TABLE issued_status(
    issued_id VARCHAR(10) PRIMARY KEY,
    issued_member_id VARCHAR(10),
    issued_book_name VARCHAR(75),
    issued_date DATE,
    issued_book_isbn VARCHAR(50),
    issued_emp_id VARCHAR(10),

    FOREIGN KEY (issued_member_id)
        REFERENCES members(member_id),

    FOREIGN KEY (issued_emp_id)
        REFERENCES employees(emp_id),

    FOREIGN KEY (issued_book_isbn)
        REFERENCES books(isbn)
);


-- =========================================
-- RETURN STATUS TABLE
-- =========================================

CREATE TABLE return_status(
    return_id VARCHAR(10) PRIMARY KEY,
    issued_id VARCHAR(10),
    return_book_name VARCHAR(75),
    return_date DATE,
    return_book_isbn VARCHAR(50),

    FOREIGN KEY (issued_id)
        REFERENCES issued_status(issued_id),

    FOREIGN KEY (return_book_isbn)
        REFERENCES books(isbn)
);