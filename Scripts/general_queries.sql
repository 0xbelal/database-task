USE ecommerce;

/* 
 * SELECT QUIRIES
*/










SELECT name, price
FROM product_catalog
ORDER BY price DESC
LIMIT 5;


SELECT name, email, phone
FROM Customers
WHERE address LIKE '%Cairo%';

SELECT name, price, quantity
FROM product_catalog
WHERE price BETWEEN 50 AND 300
ORDER BY price ASC;


SELECT id, date, total_amount
FROM orders
WHERE status = 4
ORDER BY date DESC;


SELECT review, rating, date
FROM reviews 
WHERE rating >= 4.5
ORDER BY rating DESC;


/*GROUP BY*/


SELECT c.name, SUM(o.total_amount) AS total_spent
FROM Customers c
JOIN orders o ON c.id = o.customer_id
GROUP BY c.name
ORDER BY total_spent DESC;

SELECT pc.category_name, COUNT(p.id) AS total_products
FROM product_category pc
JOIN product_catalog p ON pc.id = p.category_id
GROUP BY pc.category_name
ORDER BY total_products DESC;

SELECT p.name, ROUND(AVG(r.rating), 1) AS avg_rating
FROM product_catalog p
JOIN reviews r ON p.id = r.product_id
GROUP BY p.name
ORDER BY avg_rating DESC;

SELECT
	method, 
	COUNT(*) AS count, 
	SUM(amount) AS total
FROM payments
GROUP BY method
ORDER BY total DESC;


/* JOINS */

SELECT
    c.name        AS customer,
    o.date        AS order_date,
    p.name        AS product,
    p.price,
    o.total_amount
FROM orders o
JOIN Customers c       ON o.customer_id = c.id
JOIN order_items oi    ON o.id = oi.order_id
JOIN product_catalog p ON oi.product_id = p.id;


SELECT
    o.id          AS order_id,
    c.name        AS customer,
    s.carrier_name,
    s.tracking_no,
    s.estimated_delivery_date
FROM orders o
JOIN Customers c ON o.customer_id = c.id
JOIN shipping s  ON o.id = s.order_id;

SELECT
    c.name  AS customer,
    p.name  AS product,
    r.rating,
    r.review
FROM reviews r
JOIN Customers c       ON r.customer_id = c.id
JOIN product_catalog p ON r.product_id  = p.id
ORDER BY r.rating DESC;

SELECT p.name, p.price, COALESCE(AVG(r.rating), 0) AS avg_rating
FROM product_catalog p
LEFT JOIN reviews r ON p.id = r.product_id
GROUP BY p.name, p.price;


/* NESTED QUERIES */


SELECT name, price
FROM product_catalog
WHERE price = (SELECT MAX(price) FROM product_catalog);

SELECT id, total_amount, date
FROM orders
WHERE total_amount > (SELECT AVG(total_amount) FROM orders)
ORDER BY total_amount DESC;

SELECT name, price
FROM product_catalog
WHERE id NOT IN (SELECT DISTINCT product_id FROM order_items);

SELECT name, email
FROM Customers
WHERE id IN (
    SELECT customer_id
    FROM orders
    GROUP BY customer_id
    HAVING SUM(total_amount) > 500
);


/* UPDATE */

UPDATE orders
SET status = 4
WHERE id = 5;

UPDATE shipping
SET status = 4,
    actual_delivery_date = NOW()
WHERE order_id = 4;


/*DELETE */


DELETE FROM reviews
WHERE rating < 3;
