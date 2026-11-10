-- -- 1 satu angka ringkasan dari seluruh tabel

-- select count(*) as jumlah_baris,
-- count(distinct invoice ) as jumlah_faktur,
-- count(distinct customer_id) as jumlah_pelanggan,
-- count(distinct stock_code) as jumlah_produk,
-- min(invoice_date) as data_mulai,
-- max(invoice_date) as data_akhir
-- from retail_raw;

-- select round(sum(quantity*price),2) as total_nilai from retail_raw;

-- --2 group by ringkasan per kelompok
-- select country,
-- count(distinct invoice) as jumlah_faktur,
-- round(sum(quantity*price),2) as pendapatan
-- from retail_raw
-- group by country
-- order by pendapatan desc
-- limit 10;

-- select country,
-- customer_id is null as tanpa_id,
-- count(*) as jumlah_baris
-- from retail_raw
-- group by country, customer_id is null
-- order by country asc, jumlah_baris desc;

-- -- 3 produk terlaris
--  
-- select stock_code,
-- max(description) as nama_produk,
-- sum(quantity) as total_terjual
-- from retail_raw
-- where invoice not like 'C%'
-- and stock_code ~ '[0-9]'
-- group by stock_code
-- order by total_terjual desc
-- limit 10;

-- select stock_code, count(distinct description) as jumlah_nama
-- from retail_raw
-- group by stock_code
-- having count(distinct description) > 1
-- order by jumlah_nama desc
-- limit 10;

-- -- 4 having menyaring hasil agregat
-- select customer_id,
-- count(distinct invoice) as jumlah_faktur
-- from retail_raw
-- where customer_id is not null
-- group by customer_id
-- having count(distinct invoice)>20
-- limit 10;

-- -- 5 pendapatan per bulan
-- select date_trunc('month', invoice_date)::date AS bulan,
-- round(sum(quantity*price),2) as pendapatan
-- from retail_raw
-- group by 1
-- order by 1;

-- -- 6 penjualan kotor, retur, dan bersih dalam satu query
-- select round(sum(quantity*price) filter (where quantity>0),2) as penjualan_kotor,
-- round(sum(quantity*price) filter (where quantity<0), 2) as retur,
-- round(sum(quantity*price), 2) as bersih
-- from retail_raw;

-- select round(sum(quantity*price)/count(distinct invoice),2) as rata_rata_nilai_faktur
-- from retail_raw
-- where invoice not like 'C%';

-- -- latihan
-- -- 1
-- select count(distinct invoice) as jumlah_faktur,
-- count(distinct customer_id) as jumlah_pelanggan,
-- count(distinct country) as jumlah_negara
-- from retail_raw;

-- --2
-- select country,
-- count(distinct invoice) as jumlah_faktur
-- from retail_raw
-- where invoice not like 'C%' 
-- group by country
-- order by jumlah_faktur desc
-- limit 5;

-- --3
-- select country , round(sum(quantity*price),2) as pendapatan
-- from retail_raw
-- where invoice not like 'C%'
-- and country <> 'United Kingdom'
-- group by country
-- order by pendapatan
-- limit 5;

-- --4
-- select stock_code, sum(quantity) as total_terjual
-- from retail_raw
-- where invoice not like 'C%' and stock_code ~ '[0-9]'
-- group by stock_code
-- order by total_terjual desc
-- limit 10;

-- --5
-- select date_trunc('month', invoice_date)::date as bulan, round(sum(quantity*price),2) as pendapatan
-- from retail_raw
-- where invoice_date >= '2011-01-01' and invoice_date < '2012-01-01' 
-- group by 1
-- order by 1;

-- --6
-- select customer_id, round(sum(quantity*price),2) as total_belanja
-- from retail_raw
-- where invoice not like 'C%' and customer_id is not null
-- group by customer_id
-- having sum(quantity*price)>5000
-- order by total_belanja desc
-- limit 10;

-- --7
-- select country, round(avg(price),2) as rata, min(price) as murah, max(price) as mahal
-- from retail_raw
-- where price > 0 and invoice not like 'C%'
-- group by country
-- order by rata desc;

-- --8
-- select country, count(distinct customer_id) as pelanggan
-- from retail_raw
-- group by country
-- having count(distinct customer_id)>=10
-- order by pelanggan desc;