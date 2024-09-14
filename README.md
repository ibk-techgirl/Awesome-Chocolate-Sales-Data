# Awesome-Chocolate-Sales-Data

## Project Overview

This project involves querying and analyzing data from a relational database to extract meaningful insights, focusing on sales performance across various regions, product categories, and customer segmentation. The SQL scripts perform a variety of operations, including:

- **Data Retrieval**: Extracting detailed information from the `sales`, `people`, `geo`, and `products` tables to understand sales performance.
  
- **Conditional Filtering**: Identifying high-value transactions, filtering based on specific criteria like sales amounts over 10,000, specific geographical locations, or date ranges such as sales made after January 2020.
  
- **Complex Queries**: Calculating sales per product, region, and customer type to generate performance insights, such as the average amount per box and sales trends over time.
  
- **Join Operations**: Integrating data across multiple tables like `sales` and `geo` to analyze geographical trends in sales, or linking product data with sales to provide a more holistic view.

The goal of this project is to derive actionable insights regarding sales patterns, customer behavior, and product performance, helping businesses optimize their marketing and sales strategies.

## Retrieving and Filtering Sales Data

### 1. General Sales Overview

The following query retrieves all records from the `sales` table, giving an overview of the sales transactions:

```sql
SELECT * FROM sales;
```

This forms the baseline for understanding overall sales trends before applying any filters or calculations.

### 2. Filtering High-Value Sales

To focus on sales that are greater than 10,000 units, the following query is used:

```sql
SELECT * 
FROM sales 
WHERE amount > 10000;
```

This query allows us to target high-value transactions, providing insights into premium customer behaviors and identifying high-contributing sales regions or products.

### 3. Sales by Date and Region

The query below filters sales from January 2020 onwards to analyze sales growth over time and identify potential seasonal spikes:

```sql
SELECT * 
FROM sales 
WHERE amount > 10000 
AND saledate >= '2020-01-01';
```

By applying this filter, we can understand how sales performance has evolved since 2020 and whether external factors (e.g., promotions or global events) have impacted performance.

## Aggregate Functions and Grouping Data

### 4. Calculating Amount per Box

To understand product efficiency, we calculate the amount earned per box sold using the following query:

```sql
SELECT saledate, amount, boxes, amount / boxes AS 'amount per box'
FROM sales;
```

This calculation helps assess the profitability of each product by comparing sales revenue against the number of boxes sold.

### 5. Weekly Sales Analysis

The following query focuses on sales made on Fridays (represented by `4` as the weekday) to identify patterns of increased sales during specific days of the week:

```sql
SELECT saledate, amount, boxes, WEEKDAY(saledate) AS 'day of week'
FROM sales 
WHERE WEEKDAY(saledate) = 4;
```

This provides actionable insights for planning targeted marketing campaigns around peak sales days.

## Joining Sales and Geographic Data

### 6. Sales Performance by Region

To evaluate geographical trends, this query integrates sales data with geographic identifiers, focusing on high-performance regions like `g1`:

```sql
SELECT * 
FROM sales 
WHERE geoid = 'g1' 
ORDER BY pid, amount DESC;
```

This helps the business optimize regional strategies by identifying top-performing products in specific locations.

## Usage Instructions

1. **Clone the Repository**: Download or clone this repository to your local machine.
  
2. **Setup Database**: Set up the database using any SQL environment (e.g., MySQL) and import the provided SQL scripts.
  
3. **Execute SQL Scripts**: Run the SQL scripts on your database to perform the analysis. Each query offers insights into different aspects of sales performance.
  
4. **Expected Output**: Use critical and analytical thinking to interpret the results of each query, particularly focusing on trends, high-value sales, and regional performance.

### Sample Exercise: High-Value Sales by Date

**Objective**: Retrieve all sales transactions over 10,000 units, focusing on sales made after 2020-01-01.

```sql
SELECT * 
FROM sales 
WHERE amount > 10000 
AND saledate >= '2020-01-01';
```

This query will output high-value sales records from 2020 onward, allowing you to evaluate recent sales trends and performance.

## Recommendations

Based on the analysis, several recommendations can be made:

- **High-Value Sales Focus**: Target marketing and sales strategies towards high-value customers and products with sales greater than 10,000 units, particularly in top-performing regions like `g1`.
  
- **Day-of-Week Promotions**: Consider running promotions on Fridays, as the data shows increased sales on this day of the week.

- **Product Profitability**: Evaluate products based on their sales amount per box. Products yielding higher revenue per box can be prioritized for inventory stocking and promotional activities.

## Conclusion

This SQL project provides a detailed analysis of sales data for "Awesome Chocolates," offering insights into customer behaviors, regional sales performance, and product profitability. By utilizing advanced SQL queries, we can derive actionable insights that contribute to more effective business decisions, whether it's optimizing marketing campaigns, understanding customer trends, or improving regional strategies.

Contributions to this repository are welcome. If you have additional insights or queries that could enhance the analysis, feel free to submit a pull request.
