-- INTERMEDIATE ANALYSIS

-- Total quantity of pizzas ordered by category
SELECT 
    pt.category,
    SUM(od.quantity) AS total_quantity
FROM order_details od
JOIN pizzas p
    ON od.pizza_id = p.pizza_id
JOIN pizza_types pt
    ON p.pizza_type_id = pt.pizza_type_id
GROUP BY pt.category
ORDER BY total_quantity DESC;

-- Distribution of orders by hour
SELECT 
    HOUR(o.order_time) AS order_hour,
    COUNT(o.order_id) AS total_orders
FROM orders o
GROUP BY order_hour
ORDER BY order_hour;

-- Category-wise distribution of pizzas
SELECT 
    pt.category,
    COUNT(od.pizza_id) AS total_pizzas
FROM order_details od
JOIN pizzas p
    ON od.pizza_id = p.pizza_id
JOIN pizza_types pt
    ON p.pizza_type_id = pt.pizza_type_id
GROUP BY pt.category
ORDER BY total_pizzas DESC;

-- Average number of pizzas ordered per day
SELECT 
    ROUND(AVG(daily_total), 2) AS avg_pizzas_per_day
FROM (
    SELECT 
        o.order_date,
        SUM(od.quantity) AS daily_total
    FROM orders o
    JOIN order_details od
        ON o.order_id = od.order_id
    GROUP BY o.order_date
) t;

-- Top 3 pizza types by revenue
SELECT 
    pt.name,
    SUM(od.quantity * p.price) AS total_revenue
FROM order_details od
JOIN pizzas p
    ON od.pizza_id = p.pizza_id
JOIN pizza_types pt
    ON p.pizza_type_id = pt.pizza_type_id
GROUP BY pt.name
ORDER BY total_revenue DESC
LIMIT 3;
