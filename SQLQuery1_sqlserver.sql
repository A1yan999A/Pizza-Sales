use pizza_db;
select * from pizza_sales;

-- 1. Total Revenue:

select round(sum(total_price),2) as total_revenue from pizza_sales;

-- 2. Average Order Value

select round(sum(total_price)/count(distinct order_id),2) as avg_Order_Value from pizza_sales;

--3. Total Pizzas Sold

select sum(quantity) as total_quantity from pizza_sales;

--4. Total Orders

select count(distinct order_id) as total_order from pizza_sales;

--5. Average Pizzas Per Order

select round(sum(quantity)/count(distinct order_id),2) as pizza_per_order from pizza_sales;

--cast() convert it to decimal data type
SELECT CAST(CAST(SUM(quantity) AS DECIMAL(10,2)) / 
CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS DECIMAL(10,2))
AS Avg_Pizzas_per_order
FROM pizza_sales;


--6. Daily Trend for Total Orders

select datename(DW,order_date) as order_day,count(distinct order_id) as order_perday from pizza_sales
group by datename(DW,order_date)
order by datename(DW,order_date);

--7. Monthly Trend for Orders


select datename(MONTH,order_date) as order_day,count(distinct order_id) as order_permonth from pizza_sales
group by datename(MONTH,order_date)
order by order_permonth desc;


--8. % of Sales by Pizza Category
SELECT pizza_category, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales) AS DECIMAL(10,2)) AS PCT
FROM pizza_sales
GROUP BY pizza_category;

--9. % of Sales by Pizza Size

SELECT pizza_size, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales) AS DECIMAL(10,2)) AS PCT
FROM pizza_sales
GROUP BY pizza_size
ORDER BY pizza_size;


--10. Total Pizzas Sold by Pizza Category
SELECT pizza_category, SUM(quantity) as Total_Quantity_Sold
FROM pizza_sales
GROUP BY pizza_category
ORDER BY Total_Quantity_Sold DESC;

-- 11.  Top 5 Pizzas by Revenue
SELECT Top 5 pizza_name, round(SUM(total_price),2) AS Total_Revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue desc;



-- 12.Bottom 5 Pizzas by Revenue H. 

SELECT Top 5 pizza_name, round(SUM(total_price),2) AS Total_Revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue asc;


-- 13. Top 5 Pizzas by Quantity

SELECT Top 5 pizza_name, round(SUM(quantity),2) AS Total_quantity
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_quantity desc;

-- 14. Bottom 5 Pizzas by Quantity
SELECT Top 5 pizza_name, round(SUM(quantity),2) AS Total_quantity
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_quantity asc;



--Top 5 Pizzas by Total Orders
SELECT Top 5 pizza_name, count(distinct order_id) AS Total_order
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_order desc;

--Bottom 5 Pizzas by Total Orders
SELECT Top 5 pizza_name, count(distinct order_id) AS Total_order
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_order asc;



















