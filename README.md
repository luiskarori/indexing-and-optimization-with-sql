# indexing-and-optimization-with-sql
Pharmacies often deal with large amounts of data, including medicines, suppliers, and sales transactions. Without optimization, frequent queries (like checking stock availability, finding suppliers, or generating sales reports) can be slow and inefficient.  This project demonstrates how SQL indexes improve query performance.
📑 SQL Project: Indexing & Optimization
📌 Project Overview

This project demonstrates how SQL indexing can improve query performance in a pharmacy management database.
The database stores information about medicines, suppliers, and sales transactions, and shows how queries run before and after optimization.

🎯 Objectives

Create a sample pharmacy database.

Run queries without indexes (slow on large datasets).

Add indexes to optimize performance.

Compare execution plans using EXPLAIN.

Understand the trade-offs of indexing.

🏗️ Database Schema
Medicines Table

Stores medicine details, expiry dates, and prices.

Suppliers Table

Stores supplier details and contacts.

Sales Table

Stores sales transactions linked to medicines.

⚡ Queries Demonstrated

Find medicines expiring soon.

Calculate total sales for a specific medicine.

Search suppliers by name.

🛠️ Optimization Applied

Index on expiry_date → Faster expiry checks.

Index on medicine_id (Sales) → Faster sales aggregation.

Index on supplier_name → Faster supplier lookups.

📊 Key Learnings

Before indexing: The database performs a full table scan, which is inefficient.

After indexing: The database uses indexes (B-Tree) to fetch results faster.

Trade-off: Indexes improve read performance but add slight overhead on inserts/updates.

🚀 How to Run the Project

Copy the SQL script (pharmacy_indexing_project.sql) into your database client (MySQL/PostgreSQL).

Run the script to:

Create database & tables.

Insert sample data.

Run queries before indexing.

Create indexes.

Run optimized queries with EXPLAIN.

Compare performance before and after indexing.

✅ Deliverables

pharmacy_indexing_project.sql → The complete SQL script with comments.

README.md → Project documentation (this file).

(Optional) Project Report (PDF).

📌 Author

Luis Karori – School SQL Project on Database Indexing & Optimization.
