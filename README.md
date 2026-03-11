# Enterprise Operations Data Platform

![Python](https://img.shields.io/badge/Python-3.12-blue)
![PostgreSQL](https://img.shields.io/badge/PostgreSQL-Database-blue)
![ETL](https://img.shields.io/badge/Data-Pipeline-green)
![Architecture](https://img.shields.io/badge/Data-Platform-orange)
![License](https://img.shields.io/badge/License-MIT-lightgrey)

![Architecture Diagram](docs/architecture_diagram.png)

A PostgreSQL-based enterprise data platform that ingests operational business data and transforms it into analytics-ready datasets using a modular Python ETL pipeline and DAG-based workflow orchestration.

---

## Architecture

![Architecture Diagram](docs/architecture_diagram.png)

The platform follows a layered data architecture:

1. **Operational Source Layer** – PostgreSQL transactional tables  
2. **Data Processing Layer** – Python ETL pipeline  
3. **Analytics Layer** – transformed reporting tables  
4. **Business Intelligence Layer** – SQL queries and dashboards  

---

## Features

- Enterprise-style relational data model with 10 operational tables
- Modular Python ETL pipeline (Extract → Validate → Transform → Load)
- DAG-based workflow orchestration
- Data quality validation checks
- Analytics-ready reporting tables
- SQL-based business insights
- End-to-end operational data platform architecture

---

## Business Problem

Organizations often store operational data across multiple transactional systems. While this data captures important business activity, it is not structured for analytics or reporting.

Without a centralized analytics layer, it becomes difficult to answer critical business questions such as:

- How much revenue is generated each month?
- Which products generate the most sales?
- Which customers contribute the most revenue?
- Which warehouses are at risk of stock shortages?
- How do returns and shipments affect operational performance?

This project builds a simplified enterprise data platform that transforms raw operational data into analytics-ready datasets supporting business insights and reporting.

---

## Pipeline Orchestration

The ETL workflow is modeled as a **Directed Acyclic Graph (DAG)** that defines dependencies between pipeline stages.

*Workflow*:

Extract → Validate → Transform → Load


Each stage executes only after the previous stage completes successfully, mirroring production-grade data pipelines commonly implemented using orchestration frameworks such as Apache Airflow.

---

## Pipeline Workflow

The ETL pipeline processes operational data through a structured workflow.

![Pipeline Workflow](docs/pipeline_workflow.png)

Pipeline stages:

1. **Extract**  
   Data is extracted from PostgreSQL operational tables using SQLAlchemy.

2. **Validate**  
   Data quality checks are performed including:
   - empty table detection
   - NULL value checks

3. **Transform**  
   Raw transactional data is transformed into analytics datasets.

4. **Load**  
   Transformed datasets are written into analytics-ready tables.

5. **Analytics**  
   SQL queries generate operational insights.

---

## Data Model

The operational schema includes the following core entities:

- customers  
- suppliers  
- products  
- warehouses  
- inventory  
- orders  
- order_items  
- payments  
- shipments  
- returns  

These tables capture transactional business activity and serve as inputs for the ETL pipeline.

Entity relationships and schema design are documented in:  `docs/data_model.md`


The complete entity relationship diagram is shown below:

![ERD](docs/erd.png)

---

## ETL Pipeline

The ETL pipeline is implemented in Python and consists of modular components.

```
pipeline/
│
├ extract.py
├ transform.py
├ load.py
└ run_pipeline.py
```


### Extract

Reads source tables from PostgreSQL using SQLAlchemy.

### Validate

Performs data quality checks to detect empty tables or missing values.

### Transform

Processes raw transactional data and generates analytics datasets including:

- sales fact tables
- monthly revenue aggregates
- inventory risk indicators

### Load

Writes transformed datasets back into PostgreSQL analytics tables.

---

## Pipeline Execution

Run the full ETL pipeline:

``python pipeline/run_pipeline.py``

Example pipeline output:
Extracted customers: 1000 rows
Extracted suppliers: 50 rows
Extracted products: 500 rows
Extracted warehouses: 10 rows
Extracted inventory: 1500 rows
Extracted orders: 3000 rows
Extracted order_items: 9000 rows
Extracted payments: 2500 rows
Extracted shipments: 2500 rows
Extracted returns: 400 rows
Transformed fact_sales: 9000 rows
Transformed monthly_revenue: 7 rows
Transformed inventory_risk: 42 rows
Loaded analytics_fact_sales: 9000 rows
Loaded analytics_monthly_revenue: 7 rows
Loaded analytics_inventory_risk: 42 rows
Pipeline completed successfully.


---

## Analytics Layer

The ETL pipeline produces analytics-ready tables designed for reporting.

### analytics_fact_sales

Sales fact table with one row per order item.

Supports:

- product sales analysis
- revenue calculations
- customer purchasing behavior

### analytics_monthly_revenue

Aggregated monthly revenue dataset used for trend analysis and business reporting.

### analytics_inventory_risk

Identifies products with potential stock shortages across warehouses.

---

## Business Analytics

Business insights can be generated using SQL queries located in:

`sql/analytics/business_analytics.sql`


Example analyses include:

- Monthly revenue trends
- Top selling products
- Revenue by customer segment
- Inventory risk detection
- Return rate analysis

---

## Project Structure

```
enterprise-operations-data-platform
│
├── docs
│   ├── architecture.md
│   ├── business_problem.md
│   ├── data_model.md
│   ├── erd.png
│   └── architecture_diagram.png
│
├── pipeline
│   ├── extract.py
│   ├── transform.py
│   ├── load.py
│   └── run_pipeline.py
│
├── sql
│   ├── ddl
│   │   ├── 01_customers.sql
│   │   ├── 02_suppliers.sql
│   │   ├── 03_products.sql
│   │   ├── 04_warehouses.sql
│   │   ├── 05_inventory.sql
│   │   ├── 06_orders.sql
│   │   ├── 07_order_items.sql
│   │   ├── 08_payments.sql
│   │   ├── 09_shipments.sql
│   │   └── 10_returns.sql
│   │
│   ├── seed_data.sql
│   ├── insertion_check.sql
│   │
│   └── analytics
│       └── business_analytics.sql
│
├── data_dump.sql
├── README.md
├── .gitignore
└── LICENSE
```

---

## Technology Stack

### Database

- PostgreSQL

### Programming

- Python
- Pandas

### Data Processing

- SQL
- ETL pipelines

### Tools

- DBeaver
- Git / GitHub

### Visualization

- Power BI / Tableau

---

## How to Run the Project

### 1. Create database tables

Execute SQL scripts inside: ``sql/ddl/``

---

### 2. Load synthetic data

Run: ``sql/seed_data.sql``

---

### 3. Validate data loading

Execute:``sql/insertion_check.sql``

---

### 4. Run the ETL pipeline

``python -m pipeline.run_pipeline``

---

### 5. Run business analytics queries

Execute:``sql/analytics/business_analytics.sql``


---

## Key Outcomes

This project demonstrates:

- relational schema design for operational systems
- synthetic enterprise data generation
- Python-based ETL pipeline development
- analytics-ready data modelling
- SQL-based business analytics
- DAG-based pipeline orchestration
- end-to-end data platform architecture

---

## Author

**Trissaan A. Shanmugasundaram**  
Data Analyst / Data Engineer  
Melbourne, Australia