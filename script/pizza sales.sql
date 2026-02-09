-- USE Pizza Sales;

-- SELECT * FROM pizza_sales;

-- Total Revenue
SELECT
	ROUND(SUM(total_price), 2) AS [Total Revenue] 
FROM pizza_sales;

-- Average Order Value
SELECT 
	SUM(Total_price) / COUNT(DISTINCT(Order_Id)) AS [Average Order Value] 
from pizza_sales;

-- Total Pizza Sold
SELECT 
	SUM(quantity) AS [Total Pizza Sold]
FROM pizza_sales;

-- Total Orders
SELECT 
	COUNT(DISTINCT order_id) AS [Total Orders] 
FROM pizza_sales;

-- Average Pizzas Per Orders
SELECT 
	CAST(CAST(SUM(Quantity) AS Decimal(10,2)) / CAST(COUNT(Distinct order_id) AS DECIMAL(10,2)) AS DECIMAL(10,2)) AS [Average Pizzas Per Orders] 
FROM pizza_sales;

-- Daily Trend for Total
SELECT 
	DATENAME(DW, order_date) AS order_day, 
	COUNT(DISTINCT order_id) AS total_orders 
FROM pizza_sales
GROUP BY DATENAME(DW, order_date)

-- Monthly Trend for Total
SELECT
	DATENAME(MONTH, order_date) as Month_Name,
	COUNT(DISTINCT order_id) as Total_Orders
from pizza_sales
GROUP BY DATENAME(MONTH, order_date)

-- % of Sales by Pizza Category
SELECT 
	pizza_category,
	CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
	CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales) AS DECIMAL(10,2)) AS PCT
FROM pizza_sales
GROUP BY pizza_category

-- % of sales by Pizza Size
SELECT 
	pizza_size,
	CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
	CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales) AS DECIMAL(10,2)) AS PCT
FROM pizza_sales
GROUP BY pizza_size
ORDER BY pizza_size

-- Total Pizzas Sold by Pizza Category
SELECT
	pizza_category,
	SUM(quantity) as Total_Quantity_Sold
FROM pizza_sales
WHERE MONTH(order_date) = 2
GROUP BY pizza_category
ORDER BY Total_Quantity_Sold DESC

-- Top 5 Pizzas by Revenue
SELECT Top 5 
	pizza_name, 
	SUM(total_price) AS Total_Revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue DESC

-- Bottom 5 Pizzas by Revenue
SELECT Top 5 
	pizza_name, SUM(total_price) AS Total_Revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue ASC

-- Top 5 Pizzas by Quantity
SELECT Top 5 
	pizza_name, 
	SUM(quantity) AS Total_Pizza_Sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold DESC

-- Bottom 5 Pizzas by Quantity
SELECT TOP 5 
	pizza_name,
	SUM(quantity) AS Total_Pizza_Sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold ASC

-- Top 5 Pizzas by Total Orders
SELECT Top 5 
	pizza_name,		
	COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders DESC

-- Bottom 5 Pizzas by Total Orders
SELECT Top 5 
	pizza_name,
	COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders ASC 
