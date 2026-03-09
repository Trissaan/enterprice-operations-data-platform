# Business Problem

## Overview
Modern businesses generate large volumes of transactional data across customers, products, warehouses, inventory, orders, payments, shipments, suppliers, and returns. While this raw data exists in operational systems, it is often fragmented and not structured for analytics or decision-making.

In this project, the business lacks a central analytics layer to monitor sales performance, revenue trends, customer activity, warehouse stock levels, and inventory risk. Operational data is stored across multiple relational tables, but leadership cannot easily answer important business questions without time-consuming manual analysis.

## Problem Statement
The company needs a data platform that can transform raw operational data into analytics-ready datasets. Without this, business users struggle to:

- track monthly revenue trends
- identify top-selling products
- monitor customer purchase behaviour
- detect inventory risks across warehouses
- assess operational performance across orders, payments, shipments, and returns

## Objective
The objective of this project is to design and build an end-to-end enterprise operations data platform that:

- models core operational entities in a relational database
- ingests and stores transactional business data
- transforms raw source data into analytics-ready tables
- supports reporting and KPI analysis for business users
- demonstrates practical data engineering and analytics engineering workflows

## Key Business Questions
This platform is designed to help answer questions such as:

- How much revenue is generated each month?
- Which products contribute the most to sales?
- Which customer segments generate the highest revenue?
- Which products or warehouses are at risk of stock shortages?
- How do returns and shipment activity affect business performance?

## Business Value
By transforming transactional source data into a structured analytics layer, the platform improves visibility across commercial and operational processes. It enables faster reporting, supports data-driven decisions, and provides a foundation for dashboards, trend analysis, and operational monitoring.

## Project Outcome
The final solution includes:

- PostgreSQL source tables representing operational business systems
- synthetic enterprise-style data across 10 core entities
- a Python ETL pipeline for extract, transform, and load processing
- analytics-ready tables for sales, monthly revenue, and inventory risk
- SQL-based business analysis for reporting and insight generation