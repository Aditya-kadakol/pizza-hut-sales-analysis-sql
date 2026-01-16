-- ADVANCED ANALYSIS

-- Percentage contribution of each pizza type to total revenue
SELECT
    pt.name AS pizza_type,
    ROUND(
        SUM(od.quantity * p.price) /
        (SELECT SUM(od2.quantity * p2.price)
         FROM order_details od2
         JOIN pizzas p2
           ON od2.pizza_id = p2.pizza_id
        ) * 100,
        2
    ) AS revenue_percentage
FROM order_details od
JOIN pizzas p
    ON od.pizza_id = p.pizza_id
JOIN pizza_types pt
    ON p.pizza_type_id = pt.pizza_type_id
GROUP BY pt.name
ORDER BY revenue_percentage DESC;

-- Cumulative revenue over time
SELECT
    o.order_date,
    ROUND(SUM(od.quantity * p.price), 2) AS daily_revenue,
    ROUND(
        SUM(SUM(od.quantity * p.price))
        OVER (ORDER BY o.order_date),
        2
    ) AS cumulative_revenue
FROM orders o
JOIN order_details od
    ON o.order_id = od.order_id
JOIN pizzas p
    ON od.pizza_id = p.pizza_id
GROUP BY o.order_date
ORDER BY o.order_date;

-- Top 3 pizzas by revenue within each category
SELECT
    category,
    pizza_type,
    total_revenue
FROM (
    SELECT
        pt.category,
        pt.name AS pizza_type,
        SUM(od.quantity * p.price) AS total_revenue,
        RANK() OVER (
            PARTITION BY pt.category
            ORDER BY SUM(od.quantity * p.price) DESC
        ) AS revenue_rank
    FROM order_details od
    JOIN pizzas p
        ON od.pizza_id = p.pizza_id
    JOIN pizza_types pt
        ON p.pizza_type_id = pt.pizza_type_id
    GROUP BY pt.category, pt.name
) ranked
WHERE revenue_rank <= 3
ORDER BY category, total_revenue DESC;
