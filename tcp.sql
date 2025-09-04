-- ============================================
-- PROJECT: SQL Indexing and Optimization
-- TOPIC: Optimizing a Pharmacy Database
-- ============================================

-- STEP 1: Create Database
CREATE DATABASE PharmacyDB;
USE PharmacyDB;

-- STEP 2: Create Tables
CREATE TABLE Medicines (
    medicine_id INT PRIMARY KEY,
    name VARCHAR(100),
    category VARCHAR(50),
    expiry_date DATE,
    price DECIMAL(10,2)
);

CREATE TABLE Suppliers (
    supplier_id INT PRIMARY KEY,
    supplier_name VARCHAR(100),
    contact VARCHAR(50)
);

CREATE TABLE Sales (
    sale_id INT PRIMARY KEY,
    medicine_id INT,
    sale_date DATE,
    quantity INT,
    total_amount DECIMAL(10,2),
    FOREIGN KEY (medicine_id) REFERENCES Medicines(medicine_id)
);

-- STEP 3: Insert Sample Data
INSERT INTO Medicines VALUES
(101, 'Paracetamol', 'Painkiller', '2025-11-10', 50.00),
(102, 'Amoxicillin', 'Antibiotic', '2026-01-05', 120.00),
(103, 'Ibuprofen', 'Painkiller', '2025-12-15', 80.00);

INSERT INTO Suppliers VALUES
(1, 'Global Pharma Ltd', '0712345678'),
(2, 'MedSupply Co', '0798765432'),
(3, 'Wellness Distributors', '0722334455');

INSERT INTO Sales VALUES
(1, 101, '2025-08-01', 5, 250.00),
(2, 102, '2025-08-03', 2, 240.00),
(3, 101, '2025-08-05', 3, 150.00),
(4, 103, '2025-08-06', 10, 800.00);

-- STEP 4: Queries BEFORE Indexing (slower on large data)
-- 4.1 Find medicines expiring before 2025-12-31
SELECT name, expiry_date 
FROM Medicines
WHERE expiry_date < '2025-12-31';

-- 4.2 Get total sales for Paracetamol (medicine_id = 101)
SELECT medicine_id, SUM(total_amount) AS total_sales
FROM Sales
WHERE medicine_id = 101
GROUP BY medicine_id;

-- 4.3 Find supplier by name
SELECT * FROM Suppliers
WHERE supplier_name LIKE '%Pharma%';

-- STEP 5: Create Indexes (Optimization)
CREATE INDEX idx_medicines_expiry ON Medicines(expiry_date);
CREATE INDEX idx_sales_medicine ON Sales(medicine_id);
CREATE INDEX idx_supplier_name ON Suppliers(supplier_name);

-- STEP 6: Queries AFTER Indexing (faster with large data)
-- Use EXPLAIN to show the execution plan and index usage
EXPLAIN SELECT name, expiry_date 
FROM Medicines
WHERE expiry_date < '2025-12-31';

EXPLAIN SELECT medicine_id, SUM(total_amount) 
FROM Sales
WHERE medicine_id = 101
GROUP BY medicine_id;

EXPLAIN SELECT * FROM Suppliers
WHERE supplier_name LIKE '%Pharma%';

-- ============================================
-- END OF PROJECT
-- ============================================
