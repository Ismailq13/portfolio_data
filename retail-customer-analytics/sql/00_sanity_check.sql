-- 1. jumlah baris dan rentang tanggal
select count(*) as total_baris,
        min(invoice_date) as tanggal_awal,
        max(invoice_date) as tanggal_akhir
from transactions;

-- 2. berapa baris tanpa id pelanggan
select sum(case when customer_id is null then 1 else 0 end) as tanpa_customer_id,
round(avg(case when customer_id is null then 1 else 0 end)*100,1) as persen
from transactions;

-- 3. baris pembatalan (nomor invoice diawali huruf C)
select count(*) as baris_pembatalan,
count(distinct invoice) as invoice_pembatalan
from transactions
where invoice like 'C%';

-- 4. jumlah atau harga yang tidak wajar
select sum(case when quantity <=0 then 1 else 0 end) as quantity_nol_atau_negatif,
sum(case when price<=0 then 1 else 0 end) as harga_nol_atau_negatif
from transactions;

-- 5. berapa baris yang persis dobel
select count(*) - (select count(*) from(select distinct * from transactions) as t) as baris_dobel
from transactions;

-- 6. kode barang yang bukan produk (tidak diawali 5 angka)
select stockcode, description, count(*) as jumlah
from transactions
where not regexp_matches(stockcode, '^[0-9]{5}')
group by stockcode, description
order by jumlah desc
limit 20;

-- 7. berapa pelanggan dan negara
select count(distinct customer_id) as jumlah_pelanggan,
count(distinct country) as jumlah_negara
from transactions;