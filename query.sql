--membuat database
create database task_db;

--masuk ke db
\c task_db

--5 Produk Terlaris Berdasarkan Total Pendapatan (Revenue)
SELECT
    product_id,
    product_name,
    product_category,
    SUM(total_price) AS total_revenue
FROM master_data
GROUP BY product_id, product_name, product_category
ORDER BY total_revenue DESC
LIMIT 5;


--10 Pelanggan Teratas Berdasarkan Total Uang yang Dihabiskan
SELECT
    customer_id,
    customer_location,
    SUM(total_price) AS total_spent
FROM master_data
GROUP BY customer_id, customer_location
ORDER BY total_spent DESC
LIMIT 10;

--Tren Penjualan Bulanan
SELECT
    TO_CHAR(month, 'YYYY-MM') AS month_year,
    SUM(total_price) AS total_revenue
FROM (
    SELECT DATE_TRUNC('month', timestamp) AS month, total_price
    FROM master_data
) sub
GROUP BY month
ORDER BY month;


