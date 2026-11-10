-- sql/02_eksplorasi.sql
-- Bagian 2: SELECT dan WHERE, kenalan dengan data.

-- Langkah 2.1: intip isi tabel
SELECT * FROM retail_raw LIMIT 10;

-- Langkah 2.2: pilih kolom yang dibutuhkan, beri nama tampilan
SELECT invoice, description, quantity, price FROM retail_raw LIMIT 10;

SELECT invoice AS no_faktur,
       description AS nama_produk,
       quantity AS jumlah
FROM retail_raw
LIMIT 10;

-- Langkah 2.3: tipe data tiap kolom
SELECT column_name, data_type
FROM information_schema.columns
WHERE table_name = 'retail_raw'
ORDER BY ordinal_position;

-- Langkah 2.4: berapa data yang kosong
SELECT COUNT(*)           AS total_baris,
       COUNT(description) AS baris_ada_nama,
       COUNT(customer_id) AS baris_ada_pelanggan
FROM retail_raw;

SELECT COUNT(*) AS tanpa_pelanggan
FROM retail_raw
WHERE customer_id IS NULL;

-- Langkah 2.5a: perbandingan angka
SELECT invoice, description, quantity, price
FROM retail_raw
WHERE quantity > 100
LIMIT 20;

-- Langkah 2.5b: teks memakai kutip tunggal
SELECT DISTINCT country FROM retail_raw WHERE country = 'France';

-- Langkah 2.5c: AND
SELECT invoice, country, quantity, price
FROM retail_raw
WHERE country = 'Germany'
  AND quantity >= 12
  AND price < 1;

-- Langkah 2.5d: IN dan BETWEEN
SELECT DISTINCT country
FROM retail_raw
WHERE country IN ('Germany', 'France', 'Spain');

SELECT invoice, price
FROM retail_raw
WHERE price BETWEEN 1 AND 2
LIMIT 20;

-- Langkah 2.5e: pola teks
SELECT DISTINCT description
FROM retail_raw
WHERE description LIKE '%MUG%'
LIMIT 20;

-- Langkah 2.5f: pembatalan (invoice diawali C)
SELECT invoice, description, quantity, price
FROM retail_raw
WHERE invoice LIKE 'C%'
LIMIT 20;

-- Langkah 2.6: berburu keanehan
SELECT COUNT(*) FROM retail_raw WHERE price <= 0;

SELECT invoice, stock_code, description, quantity, price
FROM retail_raw
WHERE quantity < 0
  AND invoice NOT LIKE 'C%'
LIMIT 20;

SELECT DISTINCT stock_code, description
FROM retail_raw
WHERE stock_code !~ '[0-9]';

-- Langkah 2.7: kolom hasil hitungan
SELECT invoice, description, quantity, price,
       quantity * price AS total_baris
FROM retail_raw
WHERE invoice NOT LIKE 'C%'
LIMIT 20;

-- Langkah 2.8: urutkan dan batasi
SELECT description, price
FROM retail_raw
WHERE price > 0
ORDER BY price DESC
LIMIT 10;

-- Latihan Bagian 2 (tulis jawabanmu di bawah ini)