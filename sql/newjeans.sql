Create table customers (
  customers_id int ,
  customers_name text,
  city text,
  country text
);

insert into customers values
  (1, 'Hanni','Melbourne', 'Australia'),
  (2, 'Minji', 'Gangwondo', 'South Korea'),
  (3, 'Haerin', 'Seoul', 'South Korea'),
  (4, 'Danielle', 'Newcastle', 'Australia'),
  (5, 'Hyein', 'Incheon', 'South Korea');

create table menu (
  menu_id int,
  menu_name text,
  price real
);

insert into menu values
  (1, 'Meat Lover Pizza', 300),
  (2, 'Crispy Chicken Pizza', 250),
  (3, 'Hawaiian Pizza', 200),
  (4, 'Fried Chicken', 150),
  (5, 'French Fries', 150),
  (6, 'Coke', 100),
  (7, 'Sprite', 100);

create table orders (
  id int,
  customers_id int,
  amount real,
  date text,
  menu_name text
);

insert into orders values
  (1,1,300, '2022-01-01', 'Meat Lover Pizza'),
  (2,3,250, '2022-02-02', 'Crispy Chicken Pizza'),
  (3,4,200, '2022-02-03', 'Hawaiian Pizza'),
  (4,3,150, '2022-08-04', 'French Fries'),
  (5,2,100, '2022-08-05', 'Coke'),
  (6,2,300, '2022-08-12', 'Meat Lover Pizza'),
  (7,1,150, '2022-08-13', 'French Fries')
  ;

.mode box
.header on
select * from customers;
select * from menu;
select * from orders;

--Top5 Best seller menu
select orders.menu_name as Best_seller
  ,count(*) as Sales_amount 
  ,sum(orders.amount) as Total_income
from orders
join menu on orders.menu_name = menu.menu_name
group by orders.menu_name
order by Sales_amount desc
limit 5;

--Most orders month
select
  max(strftime('%m',date)) as Most_orders_month,
  sum(orders.amount) as total_income
from orders
where date like '%08%';


--Top3 spenders
select
  orders.customers_id,
  customers.customers_name,
  sum(orders.amount) as total_spend
from orders
join customers on orders.customers_id = customers.customers_id
group by orders.customers_id
order by total_spend desc
limit 3;

--Most spent country
select
  country as customer_country,
  count(*) as Country_amount
from customers
group by country
ORDER by count(*) desc ;
