# Swiggy Sales Analysis using PostgreSQL

## Project Overview

This project analyzes Swiggy sales data using PostgreSQL to generate business insights related to revenue, customer behavior, restaurant performance, and order trends.

The project follows a complete analytics workflow including data preparation, data modeling, exploratory data analysis (EDA), KPI development, and business analysis.

---

## Objectives

* Analyze sales performance across different states and cities.
* Identify top-performing restaurants and customers.
* Understand customer ordering behavior.
* Discover revenue-driving factors.
* Generate actionable business insights using SQL.

---

## Tools & Technologies

* PostgreSQL
* pgAdmin 4
* SQL
* Git
* GitHub

---

## Data Modeling

To improve analytical efficiency and reduce redundancy, the dataset was transformed into a Star Schema structure.

### Fact Table

* fact_swiggy_orders

### Dimension Tables

* dim_customer
* dim_restaurant
* dim_location
* dim_delivery

The fact table stores transactional data while dimension tables provide descriptive business information.

---

## Project Workflow

### 1. Data Preparation

* Imported raw data into PostgreSQL
* Performed data validation
* Removed duplicate records
* Standardized data formats

### 2. Exploratory Data Analysis (EDA)

Performed exploratory analysis to understand:

* Total records
* Revenue distribution
* Customer activity
* Restaurant activity
* Order patterns

### 3. KPI Development

Developed key performance indicators including:

* Total Revenue
* Total Orders
* Average Order Value
* Total Customers
* Total Restaurants

### 4. Business Analysis

Analyzed:

* Revenue by State
* Revenue by City
* Top Restaurants
* Top Customers
* Day-wise Order Trends
* Monthly Sales Trends

---

## Key Insights

* Karnataka generated the highest revenue among all states.
* Weekend orders were significantly higher than weekday orders.
* A small number of restaurants contributed a large portion of total revenue.
* Customer ordering activity showed clear peak demand periods.
* Revenue contribution varied significantly across locations.

---

## SQL Concepts Used

* SELECT
* WHERE
* GROUP BY
* ORDER BY
* JOINS
* Aggregate Functions
* CASE Statements
* Date Functions
* Common Table Expressions (CTEs)
* Window Functions

---

## Repository Structure

Swiggy_Sales_Analysis/

├── dataset/

├── sql_scripts/

│ ├── 01_data_preparation.sql

│ ├── 02_eda.sql

│ ├── 03_kpi_analysis.sql

│ └── 04_business_analysis.sql

├── screenshots/

└── README.md

---

## Business Value

This project demonstrates how SQL can be used to transform raw transactional data into meaningful business insights that support decision-making.

---

## Author

Akhilesh Desai

Aspiring Data Analyst

GitHub:
https://github.com/AkhileshDesai19
