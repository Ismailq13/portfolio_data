-- -- 2
-- SELECT COUNT(*) as kosong_desk
-- from retail_raw
-- WHERE description is null;

-- --3
-- select * from retail_raw
-- WHERE country='United Kingdom'
-- and quantity>500
-- limit 20;

-- --4
-- select distinct country
-- from retail_raw
-- order by country;

-- select count(distinct country) from retail_raw;

-- --5
-- select * 
-- from retail_raw
-- where description ilike '%HEART%' 
-- and (price >= 2 and price <=5)
-- and invoice not like 'C%'
-- limit 20;

-- --6
-- select count(*) as jumlah_retur
-- from retail_raw
-- where invoice like 'C%';

-- select round(100.0*count(*) filter (where invoice like 'C%')/count(*),2) as persen_retur
-- from retail_raw;

-- --7
-- select count(*) from retail_raw where price=0;
-- select description, customer_id from retail_raw where price=0 limit 10;

--8
select stock_code, quantity*price as total
from retail_raw
where invoice not like 'C%'
order by total desc
limit 10;