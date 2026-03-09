# System Architecture

## Overview

This project implements a simplified enterprise data platform designed to simulate how operational business data is transformed into analytics-ready datasets.

The architecture follows a layered approach where transactional source data is extracted, transformed, and loaded into an analytics layer that supports business reporting and decision-making.

The system is built using PostgreSQL for data storage and Python for ETL processing.

---

## Architecture Layers

The platform consists of three primary layers:

### 1. Operational Source Layer

The source layer stores transactional business data in a PostgreSQL database. These tables represent operational systems such as customer management, order processing, product inventory, and supplier management.

Source tables include:

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

These tables store normalized transactional data and act as the input for the ETL pipeline.

---

### 2. Data Processing Layer (Python ETL Pipeline)

A Python-based ETL pipeline processes data from the source tables.

The pipeline is composed of three modules:

- **extract.py** – reads data from PostgreSQL source tables
- **transform.py** – performs data transformations and generates analytics datasets
- **load.py** – writes transformed datasets back into PostgreSQL analytics tables

The pipeline is executed through:  run_pipeline.py


This script orchestrates the full ETL workflow by sequentially performing extraction, transformation, and loading steps.

---

### 3. Analytics Layer

The analytics layer stores transformed datasets designed for reporting and analysis.

These tables provide structured, analytics-ready views of the business data.

Analytics tables include:

- **analytics_fact_sales** – detailed sales transaction fact table
- **analytics_monthly_revenue** – monthly revenue aggregation
- **analytics_inventory_risk** – products with potential stock shortages

These tables support business intelligence queries and reporting workflows.

---

## Data Flow

The data pipeline follows the sequence below:

1. SQL DDL scripts create the operational database schema.
2. Synthetic data is generated and inserted into source tables.
3. The Python ETL pipeline extracts data from source tables.
4. Transformations generate analytics datasets.
5. The transformed data is loaded into analytics tables.
6. SQL analytics queries generate business insights.

---

## Technology Stack

The system uses the following technologies:

Database
- PostgreSQL

Programming
- Python
- Pandas

Data Processing
- SQL
- ETL pipelines

Tools
- DBeaver
- Git / GitHub

Visualization (optional)
- Power BI or Tableau

---

## Architecture Diagram

![Architecture Diagram](architecture_diagram.png)
