-- 01_setup.sql: membuat tabel penampung data mentah.
-- Jalankan: psql -U postgres -d retail_db -f sql\01_setup.sql
CREATE TABLE retail_raw (
    invoice       VARCHAR(20),
    stock_code    VARCHAR(20),
    description   TEXT,
    quantity      INTEGER,
    invoice_date  TIMESTAMP,
    price         NUMERIC(12, 4),
    customer_id   INTEGER,
    country       VARCHAR(60)
);

-- Import CSV: ketik perintah ini DI DALAM psql (satu baris), jangan lewat -f,
-- supaya data tidak masuk dua kali bila file ini dijalankan ulang:
-- \copy retail_raw FROM 'D:/portfolio_data/retail-sql-excel/data/csv/online_retail_ii.csv' WITH (FORMAT csv, HEADER true, NULL '')