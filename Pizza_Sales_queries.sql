-- ========================================================
-- PROJECT: Pizza Sales Data Analytics
-- ANALYST: Devansh Joshi
-- ========================================================
USE pizza_db;
-- KPI 1: Calculate Total Revenue	
SELECT * FROM pizza_sales;
SELECT ROUND(SUM(total_price),2) AS Total_Revenue
FROM pizza_sales;

-- KPI 2: Calculate Average Order Value (AOV)
SELECT ROUND(SUM(total_price) / COUNT(DISTINCT(order_id)),2) AS Avg_Order_Val
FROM pizza_sales;

-- KPI 3: Total Pizzas Sold
SELECT SUM(quantity) AS Total_pizzas_sold
FROM pizza_sales;

-- KPI 4: Total order placed
SELECT COUNT(DISTINCT order_id) AS Total_order_placed
FROM pizza_sales;

-- KPI 5: Average Pizzas Per order 
SELECT ROUND(SUM(quantity) / COUNT(DISTINCT order_id),2) AS Avg_pizzas_per_order
FROM pizza_sales;

-- CHART 1: Daily sales Data
SELECT DAYNAME(order_date) AS Order_day, COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales
GROUP BY DAYNAME(order_date)
ORDER BY total_orders DESC;

-- CHART 2: Monthly sales Data
SELECT MONTHNAME(order_date) AS ORDER_MONTH, COUNT(DISTINCT order_id) AS TOTAL_ORDERS
FROM pizza_sales
GROUP BY MONTHNAME(order_date)
ORDER BY total_orders DESC;

-- CHART 3: sales percentage distribution by category
SELECT pizza_category,
ROUND(SUM(total_price) * 100 / (SELECT SUM(total_price) FROM pizza_sales),2) AS SALES_BY_CATEGORY
FROM pizza_sales
GROUP BY pizza_category
ORDER BY SALES_BY_CATEGORY DESC;

-- CHART 4: sales percentage distribution by pizza size
SELECT pizza_size,
ROUND(SUM(total_price) * 100 / (SELECT SUM(total_price) FROM pizza_sales),2) AS SALES_BY_SIZE 
FROM pizza_sales
GROUP BY pizza_size
ORDER BY SALES_BY_SIZE DESC;

-- top 5 pizzas by revenue
SELECT pizza_name, SUM(total_price) AS TOP_REVENUE_ITEMS
FROM pizza_sales 
GROUP BY pizza_name
ORDER BY TOP_REVENUE_ITEMS DESC 
LIMIT 5;

-- bottom 5 pizzas by revenue
SELECT pizza_name, SUM(total_price) AS BOTOM_REVENUE_ITEMS
FROM pizza_sales 
GROUP BY pizza_name
ORDER BY BOTOM_REVENUE_ITEMS ASC
LIMIT 5;

-- TOP 5 PIZZAS BY ORDER QUANTITY
SELECT pizza_name, SUM(quantity) AS TOP_pizzas_by_quantity
FROM pizza_sales
GROUP BY pizza_name
ORDER BY TOP_pizzas_by_quantity DESC
LIMIT 5;

-- BOTTOM 5 PIZZAS BY ORDER QUANTITY
SELECT pizza_name, SUM(quantity) AS BOTTOM_pizzas_by_quantity
FROM pizza_sales
GROUP BY pizza_name
ORDER BY BOTTOM_pizzas_by_quantity ASC
LIMIT 5;



