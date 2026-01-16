# Pizza Hut Sales Analysis using SQL

# Project Overview
This project analyzes Pizza Hut sales data using SQL to uncover meaningful business insights.
The analysis focuses on revenue trends, customer ordering behavior, and product performance.

# Tools & Technologies
- MySQL
- SQL (Joins, Aggregations, Subqueries, Window Functions)
- GitHub

# Dataset Description
The project uses four datasets:
- `orders` – order date and time information
- `order_details` – pizzas ordered per transaction
- `pizzas` – pizza size and price details
- `pizza_types` – pizza category and names

# Analysis Breakdown

# Basic Analysis
- Total number of orders placed
- Total revenue generated
- Highest priced pizza
- Most common pizza size ordered
- Top 5 most ordered pizzas

# Intermediate Analysis
- Total quantity of pizzas ordered by category
- Hourly distribution of orders
- Category-wise pizza distribution
- Average number of pizzas ordered per day
- Top 3 pizza types by revenue

# Advanced Analysis
- Revenue contribution percentage of each pizza type
- Cumulative revenue generated over time
- Top 3 revenue-generating pizzas within each category using window functions

# How to Run This Project
1. Create the database using `database_setup/schema.sql`
2. Import CSV files from the `data/` folder into MySQL
3. Execute SQL scripts from the `sql_analysis/` folder in order:
   - `basic.sql`
   - `intermediate.sql`
   - `advanced.sql`

# Key Skills Demonstrated
- Data analysis using SQL
- Complex joins and aggregations
- Subqueries and window functions
- Business-focused data insights
- Project structuring and documentation

## 👤 Author
**Aditya Kadakol**
