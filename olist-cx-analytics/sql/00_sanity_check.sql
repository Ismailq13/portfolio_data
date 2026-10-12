-- 1. Apakah order_id unik di tabel orders? (total harus = unik)
SELECT COUNT(*) AS total, COUNT(DISTINCT order_id) AS unik FROM orders;

-- 2. Status order apa saja dan berapa banyak?
SELECT order_status, COUNT(*) AS n FROM orders GROUP BY 1 ORDER BY n DESC;

-- 3. Order yang tidak punya item (orphan)
SELECT COUNT(*) AS order_tanpa_item
FROM orders o LEFT JOIN order_items i USING (order_id)
WHERE i.order_id IS NULL;

-- 4. customer_id vs customer_unique_id
SELECT COUNT(DISTINCT customer_id) AS customer_id,
       COUNT(DISTINCT customer_unique_id) AS orang_unik
FROM customers;

-- 5. Berapa order yang sudah sampai tapi tanggal sampainya kosong?
SELECT COUNT(*) FROM orders
WHERE order_status = 'delivered' AND order_delivered_customer_date IS NULL;