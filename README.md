<img width="1920" height="1080" alt="dashboard" src="https://github.com/user-attachments/assets/9a522ccc-b6e5-4ca3-8755-7a7e02b74095" /># E-Commerce Sales Analytics Dashboard

Built an end-to-end business analytics solution by designing a relational PostgreSQL database, analyzing **100,000+ e-commerce orders** using SQL, and developing an interactive Power BI dashboard to generate actionable business insights for sales performance, customer behavior, and seller analysis.

---

# Problem Statement

E-commerce businesses generate millions of transactional records across customers, products, sellers, and payments. Without structured analysis, identifying revenue drivers, customer purchasing patterns, and operational bottlenecks becomes difficult.

This project aims to transform raw transactional data into actionable business insights using SQL and Power BI, enabling stakeholders to monitor KPIs, evaluate sales performance, and support data-driven decision-making.

---

# Dataset

**Source:** Olist Brazilian E-Commerce Public Dataset (Kaggle)

### Dataset Summary

- **~99,000 Orders**
- **~100,000 Order Items**
- **~99,000 Customer Records**
- **~33,000 Products**
- **~3,000 Sellers**
- **~103,000 Payment Records**
- **27 Customer States**
- **70+ Product Categories**

The data was imported into PostgreSQL and modeled as a relational database using primary and foreign keys.

---

# Project Workflow

## Database Design

- Imported **6 CSV datasets** into PostgreSQL
- Designed a normalized relational database
- Created relationships using primary and foreign keys
- Validated data integrity before analysis

---

## SQL Analysis

Performed business analysis using:

- INNER JOINs
- Aggregate Functions
- GROUP BY
- Common Table Expressions (CTEs)
- Window Functions
- Ranking Functions
- Date Functions

Developed SQL queries to answer key business questions related to sales, customers, products, sellers, and payments.

---

# Key Performance Indicators (KPIs)

- Total Revenue
- Total Orders
- Total Customers
- Average Order Value

---

# Dashboard Overview

Built an interactive Power BI dashboard to provide an executive-level overview of business performance.

## Visualizations

- Monthly Revenue Trend
- Revenue by Product Category (Treemap)
- Revenue by State
- Top 10 Sellers by Revenue
- Payment Method Distribution

## Interactive Filters

- Customer State
- Payment Type
- Order Status

The dashboard enables users to dynamically explore business performance across multiple dimensions.

---

# Key Insights

### Revenue Trends

Sales exhibit noticeable month-to-month variation, highlighting changing customer demand and seasonal purchasing patterns.

### Product Categories

Although the dataset contains **70+ product categories**, a relatively small subset contributes a significant share of overall revenue, indicating opportunities for inventory optimization and targeted promotions.

### Regional Performance

Customers are distributed across **27 Brazilian states**, with revenue concentrated in a few high-performing regions.

### Seller Performance

Among **3,000+ sellers**, a relatively small group contributes a disproportionately large share of total revenue, demonstrating a Pareto-like distribution in marketplace performance.

### Payment Behavior

Credit cards account for the majority of transactions, while boleto, vouchers, and debit cards contribute smaller shares of overall payments.

---

# Business Recommendations

- Prioritize inventory planning for high-performing product categories.
- Strengthen partnerships with top-performing sellers while supporting lower-performing sellers.
- Develop region-specific marketing strategies to improve sales in underperforming states.
- Optimize payment experiences by focusing on preferred payment methods.
- Continuously monitor monthly sales trends for improved forecasting and operational planning.

---

# Business Impact

This dashboard enables stakeholders to:

- Monitor **4 executive KPIs** through a centralized dashboard.
- Analyze sales across **70+ product categories**.
- Compare performance across **27 customer states**.
- Evaluate **Top 10 revenue-generating sellers**.
- Explore payment behavior across **100,000+ transactions**.
- Reduce manual reporting by providing interactive business intelligence dashboards.

---

# Dashboard Preview

## Executive Dashboard

C:\Users\geshn\OneDrive\Projects\E-commerce Sales Analytics\powerbi\dashboard.png


## Interactive Dashboard

C:\Users\geshn\OneDrive\Projects\E-commerce Sales Analytics\powerbi\dashboard_filtered.png
---


# Future Improvements

- Develop Customer Lifetime Value (CLV) analysis.
- Perform customer segmentation for targeted marketing.
- Build sales forecasting models using machine learning.
- Integrate real-time data pipelines.
- Publish the dashboard using Power BI Service.

---

# Tech Stack

- PostgreSQL
- SQL
- Power BI
- pgAdmin 4
- Git
- GitHub

---

# Skills Demonstrated

### SQL

- Relational Database Design
- Complex Joins
- Aggregate Functions
- Window Functions
- Common Table Expressions (CTEs)
- Ranking Queries

### Business Intelligence

- Dashboard Development
- Interactive Reporting
- KPI Development
- Executive Dashboard Design
- Data Visualization

### Data Analytics

- Business Analytics
- Trend Analysis
- Sales Performance Analysis
- Customer Analysis
- Seller Performance Analysis

---

# Learning Outcomes

Through this project, I gained practical experience in:

- Designing relational databases in PostgreSQL
- Analyzing **100,000+ transactional records** using SQL
- Building interactive Power BI dashboards
- Developing business KPIs for executive reporting
- Translating raw data into actionable business insights
