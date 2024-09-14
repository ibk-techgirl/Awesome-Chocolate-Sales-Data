-- working on awesome chocolates as practical
show tables;
desc sales;
desc people;
desc geo;
desc products;
select *
from sales;
select
saledate,
amount,
customers
from sales;
select
amount,
customers,
geoid
from sales;
select
saledate,
amount,
boxes,
amount / boxes
from sales;

select
saledate,
amount,
boxes,
amount / boxes 'amount per box'
from sales;
select * 
from sales
where amount > 10000;
select * 
from sales
where amount > 10000
order by amount;
select *
from sales
where geoid = 'g1'
order by pid, amount desc;
select *
from sales
where amount > 10000 
and saledate >= 2020-01-01;
select 
saledate, 
amount
from sales
where amount > 10000
and year(saledate) = 2022
order by amount desc;
select * 
from sales
where boxes >0 and boxes <= 50;
select * 
from sales
where boxes between 0 and 50
order by boxes;
select
saledate,
amount,
boxes,
weekday(saledate) as 'day of week'
from sales
where weekday(saledate) = 4;
select *
from people;

select *
from people
where team = 'delish' or team = 'jucies';
select *
from people
where team in('delish', 'jucies');
select * 
from people
where salesperson like 'b%';
select * 
from people
where salesperson like '%b%';

select * 
from sales;

select
	saledate,
	amount,
case 
when amount < 1000 then 'under 1k'
when amount < 5000 then 'under 5k'
when amount < 10000 then 'uder 10k'
else '10k or more'
end as 'amount category'
from sales; 	

-- join function
select * from sales;
select * from people;
select s.saledate, s.amount, p.salesperson, s.spid, p.spid
from sales s
join people p on p.spid = s.spid;
select s.saledate, s.amount, pr.product
from sales s
left join products pr on pr.pid = s.pid;
select s.saledate, s.amount, pr.product, p.salesperson,  p.team
from sales s
left join products pr on pr.pid = s.pid
join people p on p.spid = s.spid;
select s.saledate, s.amount, pr.product, p.salesperson,  p.team
from sales s
left join products pr on pr.pid = s.pid
join people p on p.spid = s.spid
where s.amount < 500;
select s.saledate, s.amount, pr.product, p.salesperson,  p.team
from sales s
left join products pr on pr.pid = s.pid
join people p on p.spid = s.spid
where s.amount < 500
and p.team = 'delish';
select s.saledate, s.amount, pr.product, p.salesperson,  p.team
from sales s
left join products pr on pr.pid = s.pid
join people p on p.spid = s.spid
where s.amount < 500
and p.team = ''; 
select s.saledate, s.amount, pr.product, p.salesperson,  p.team, g.geoid
from sales s
join products pr on pr.pid = s.pid
join people p on p.spid = s.spid
join geo g on g.geoid = s.geoid
where s.amount < 500
and p.team = ''
and g.geo in ('new zealand', 'india');
select s.saledate, s.amount, pr.product, p.salesperson,  p.team
from sales s
join products pr on pr.pid = s.pid
join people p on p.spid = s.spid
join geo g on g.geoid = s.geoid
where s.amount < 500
and p.team = ''
and g.geo in ('new zealand', 'india')
order by saledate;

-- group by functions 
select geoid, sum(amount)
from sales
group by GeoID;
select geoid, sum(amount), avg(amount)
from sales
group by GeoID;
select geoid, sum(amount), avg(amount), sum(boxes)
from sales
group by GeoID;
select g.geo, sum(amount), avg(amount), sum(boxes)
from sales s
join geo g on s.geoID = g.geoID
group by G.geo;
select pr.category, p.team, sum(boxes), sum(amount)
from sales s
join people p on p.spid = s.spid
join products pr on pr.pid = s.pid
group by pr.category, p.team;
select pr.category, p.team, sum(boxes), sum(amount), g.Geo
from sales s
join people p on p.spid = s.spid
join products pr on pr.pid = s.pid
join geo g on s.geoID = g.geoID
group by pr.category, p.team, g.geo;
select pr.category, p.team, sum(boxes), sum(amount), g.Geo
from sales s
join people p on p.spid = s.spid
join products pr on pr.pid = s.pid
join geo g on s.geoID = g.geoID
group by pr.category, p.team, g.geo
order by pr.category, p.team, g.geo;
select pr.category, p.team, sum(boxes), sum(amount), g.Geo
from sales s
join people p on p.spid = s.spid
join products pr on pr.pid = s.pid
join geo g on s.geoID = g.geoID
where p.team <> ''
group by pr.category, p.team, g.geo
order by pr.category, p.team, g.geo;
select pr.product, sum(s.amount) as 'total amount'
from sales s
join products pr on pr.pid = s.pid
group by pr.Product
order by 'total amount' desc;
select pr.product, sum(s.amount) as 'total amount'
from sales s
join products pr on pr.pid = s.pid
group by pr.Product
order by 'total amount' desc
limit 10;


-- just creating queries 
SELECT *,
       CASE 
           WHEN WEEKDAY(saledate) = 0 THEN 'Monday'
           WHEN WEEKDAY(saledate) = 1 THEN 'Tuesday'
           WHEN WEEKDAY(saledate) = 2 THEN 'Wednesday'
           WHEN WEEKDAY(saledate) = 3 THEN 'Thursday'
           WHEN WEEKDAY(saledate) = 4 THEN 'Friday'
           WHEN WEEKDAY(saledate) = 5 THEN 'Saturday'
           WHEN WEEKDAY(saledate) = 6 THEN 'Sunday'
       END AS "Day of the Week"
FROM sales
WHERE WEEKDAY(saledate)=4;

SELECT p.salesperson, g.geo, s.saledate, pr.product,
       CASE 
           WHEN WEEKDAY(saledate) = 0 THEN 'Monday'
           WHEN WEEKDAY(saledate) = 1 THEN 'Tuesday'
           WHEN WEEKDAY(saledate) = 2 THEN 'Wednesday'
           WHEN WEEKDAY(saledate) = 3 THEN 'Thursday'
           WHEN WEEKDAY(saledate) = 4 THEN 'Friday'
           WHEN WEEKDAY(saledate) = 5 THEN 'Saturday'
           WHEN WEEKDAY(saledate) = 6 THEN 'Sunday'
       END AS "Day of the Week"
FROM sales s
join people p on p.spid = s.spid
join products pr on pr.pid = s.pid
join geo g on s.geoID = g.geoID
WHERE WEEKDAY(saledate)=4
order by g.geo;
SELECT pr.category, p.team, sum(boxes), sum(amount), g.geo, pr.product,
       CASE 
           WHEN WEEKDAY(saledate) = 0 THEN 'Monday'
           WHEN WEEKDAY(saledate) = 1 THEN 'Tuesday'
           WHEN WEEKDAY(saledate) = 2 THEN 'Wednesday'
           WHEN WEEKDAY(saledate) = 3 THEN 'Thursday'
           WHEN WEEKDAY(saledate) = 4 THEN 'Friday'
           WHEN WEEKDAY(saledate) = 5 THEN 'Saturday'
           WHEN WEEKDAY(saledate) = 6 THEN 'Sunday'
       END AS "Day of the Week"
FROM sales s
join people p on p.spid = s.spid
join products pr on pr.pid = s.pid
join geo g on s.geoID = g.geoID
WHERE p.team <> ''
group by pr.category, p.team, g.geo, s.saledate, pr.product;

-- homework : intermidiate problems
-- Print details of shipments (sales) where amounts are > 2,000 and boxes are <100
select * 
from sales 
where amount > 2000 
and boxes < 100;
-- How many shipments (sales) each of the sales persons had in the month of January 2022
select p.Salesperson, count(*) as Shipment_Count
from sales s
join people p on s.spid = p.spid
where s.SaleDate between '2022-1-1' and '2022-1-31'
group by p.Salesperson;
-- Which product sells more boxes? Milk Bars or Eclairs?
select pr.product, sum(boxes) as Total_Boxes
from sales s
join products pr on s.pid = pr.pid
where pr.Product in ('Milk Bars', 'Eclairs')
group by pr.product;
-- Which product sold more boxes in the first 7 days of February 2022? Milk Bars or Eclairs?
select pr.product, sum(boxes) as 'Total_Boxes'
from sales s
join products pr on s.pid = pr.pid
where pr.Product in ('Milk Bars', 'Eclairs')
and s.saledate between '2022-2-1' and '2022-2-7'
group by pr.product;
-- Which shipments had under 100 customers & under 100 boxes? Did any of them occur on Wednesday?
select * from sales
where customers < 100 and boxes < 100;
select *,
case when weekday(saledate)=2 then 'Wednesday_Shipment'
else ''
end as 'W_Shipment'
from sales
where customers < 100 and boxes < 100;


-- homework: hard problems
-- What are the names of salespersons who had at least one shipment (sale) in the first 7 days of January 2022?
select distinct p.salesperson, count(*) as shipment_count
from sales s
join people p on p.spid = s.spid
where saledate between '2022-01-01' and '2022-07-01'
group by p.salesperson
order by shipment_count
limit 7;
-- Which salespersons did not make any shipments in the first 7 days of January 2022?
select p.salesperson, s.saledate
from people p
join sales s on p.spid = s.spid
where p.spid not in
(select distinct s.spid from sales s where s.SaleDate between 2022-01-01 and 2022-01-07);
-- How many times we shipped more than 1,000 boxes in each month?
select year(saledate) ‘Year’, month(saledate) ‘Month’, count(*) 'Times we shipped 1k boxes'
from sales
where boxes>1000
group by year(saledate), month(saledate)
order by year(saledate), month(saledate);
-- Did we ship at least one box of ‘After Nines’ to ‘New Zealand’ on all the months?
set @product_name = 'After Nines';
set @country_name = 'New Zealand';
select year(saledate) ‘Year’, month(saledate) ‘Month’,
if(sum(boxes)>1, 'Yes','No') 'Status'
from sales s
join products pr on pr.PID = s.PID
join geo g on g.GeoID=s.GeoID
where pr.Product = @product_name and g.Geo = @country_name
group by year(saledate), month(saledate)
order by year(saledate), month(saledate);
--  India or Australia? Who buys more chocolate boxes on a monthly basis?
select year(saledate) ‘Year’, month(saledate) ‘Month’,
sum(CASE WHEN g.geo= 'India' = 1 THEN boxes ELSE 0 END) 'India Boxes',
sum(CASE WHEN g.geo= 'Australia' = 1 THEN boxes ELSE 0 END) 'Australia Boxes'
from sales s
join geo g on g.GeoID=s.GeoID
group by year(saledate), month(saledate)
order by year(saledate), month(saledate);