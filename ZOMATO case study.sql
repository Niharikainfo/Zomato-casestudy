use zomato;
-- Find customers who have never ordered
select name from zomato.users
where user_id not in (select user_id from orders);

-- Average Price/dish
select f.f_name, avg(price) as 'Avg price'
from menu as m
join food as f
on m.f_id=f.f_id
group by m.f_id,f.f_name
order by avg(price) desc;

select r.r_name,count(*) as 'months' 
from orders as o
join restaurants as r
on o.r_id= r.r_id
where monthname(date)='June'
group by o.r_id, r.r_name
order by count(*) desc 
limit 1;

select r.r_name,count(*) as 'months' 
from orders as o
join restaurants as r
on o.r_id= r.r_id
group by o.r_id, r.r_name
order by count(*) desc ;

select r.r_name,sum(amount) as revenue
from orders as o
join restaurants as r
on o.r_id=r.r_id
where monthname(date) like 'june'
group by o.r_id,r.r_name
having revenue>500;

-- Show all orders with order details for a particular customer in a particular date range

select o.order_id,r.r_name,f.f_name
from orders as o
join restaurants as r
on o.r_id = r.r_id
join order_details as od
on o.order_id= od.order_id
join food as f
on f.f_id=od.f_id
where user_id =(select user_id from users where name = 'ankit')
AND (date >'2022-06-10' and date < '2022-07-10');

-- Find restaurants with max repeated customers 

select r.r_name,count(*) as 'loyal_customers'
from
( 
select r_id, user_id,count(*) as 'visits' 
from orders
group by r_id,user_id
having visits > 1
) as t
join restaurants r
on t.r_id= r.r_id
group by t.r_id,r.r_name
order by loyal_customers desc limit 1;

SET SESSION sql_mode = '';

-- Month over month revenue growth of swiggy

select months,((revenue-prev)/prev)*100 from (with sales as
 (
select monthname(date) as 'months', sum(amount) as 'revenue'
from orders
group by months
order by MONTH(date)
)
select months,revenue,lag(revenue,1) over (order by revenue) as 'prev' from sales
) t;


-- Customer - favorite food


 with temp as 
 (
 select  o.user_id,od.f_id, count(*) as 'frequency'
 from orders as o
 join order_details as od
 on o.order_id = od.order_id
 group by o.user_id,od.f_id
 )
 select  u.name,f.f_name,frequency
 from temp t1 
 join users u
 on u.user_id=t1.user_id
 join food f
 on f.f_id=t1.f_id
 where t1.frequency =(
 select max(frequency) 
 from temp t2
 where t2.user_id=t1. user_id
 );
 
 -- Find the most loyal customers for all restaurant
 
select u.name,r.r_name,count(*) as 'loyal_customers'
from
(select r_id, user_id,count(*) as 'visits' 
from orders
group by r_id,user_id
having visits > 1)
as t
join restaurants r
on t.r_id= r.r_id
join orders o
on o.r_id=r.r_id
join users u
on u.user_id=o.user_id
group by t.r_id,r.r_name ;

-- Month over month revenue growth of a restaurant

select r_name,((revenue-prev)/prev)*100 from (with sales as
 (
select r_name, sum(amount) as 'revenue'
from orders as o
join restaurants as r
on o.r_id=r.r_id
group by r_name
)
select r_name,revenue,lag(revenue,1) over (order by revenue) as 'prev' from sales
) t;
















