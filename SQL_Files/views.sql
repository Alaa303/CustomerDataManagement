-- View 1: Customer Basic Info
create view customer_info as
select customer_id, name, email, phone
from customer;

select * from customer_info

----------------------------------------------------------------------------------------------------
-- View 2: Seller Basic Info
create view seller_info as
select seller_id, name, email, phone
from seller;

select * from seller_info

----------------------------------------------------------------------------------------------------
-- View 3: Transaction Summary
create view tran_summary as
select t.transaction_id , c.name as custumer_name , s.name as seller_name , t.transaction_date,t.amount
from transactions t 
join customer c on t.customer_id= c.customer_id
join seller s on t.seller_id=s.seller_id

select *from tran_summary

----------------------------------------------------------------------------------------------------
--view 4: interaction summary
create view inter_summary as
select i.interaction_id,i.interaction_date,c.name as custumer_name,s.name as seller_name 
from interaction i 
join customer c on i.customer_id= c.customer_id
join transactions t on c.customer_id=t.customer_id
join seller s on t.seller_id=s.seller_id

select * from inter_summary

----------------------------------------------------------------------------------------------------
-- View 5: category summary
create view category_sum as
select c.category_id,c.name as category_name, p.name as prosuct_name, ord.quantity,ord.Price
from category c
join subcategory sc on c.category_id=sc.category_id
join product p on sc.subcategory_id=p.subcategory_id
join order_detail ord on p.product_id=ord.product_id

select * from category_sum

----------------------------------------------------------------------------------------------------
--view 6: customer order details
create view cust_order as
select c.customer_id,c.name as custumer_name,od.order_id,od.quantity,o.total_amount,p.name as product_name
from customer c
join orders o on c.customer_id=o.customer_id
join order_detail od on o.order_id=od.order_id
join product p on od.product_id=p.product_id

select * from cust_order

----------------------------------------------------------------------------------------------------
-- View 7: Customer Orders Count
CREATE VIEW customer_orders_count AS
SELECT c.customer_id, c.name, COUNT(o.order_id) AS total_orders
FROM customer c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name;

select * from customer_orders_count


----------------------------------------------------------------------------------------------------
--view 8: seller prodect details
create view seller_pro as 
select s.seller_id, s.name as seller_name,p.product_id,p.name as product_name, p.price,o.order_date
from seller s 
join orders o on s.seller_id=o.seller_id
join order_detail od on o.order_id=od.order_id
join product p on p.product_id=od.product_id

select * from seller_pro

----------------------------------------------------------------------------------------------------
--view 9: sales details
create view sales_det as
select sa.sales_id,sa.sales_date,sa.total_sales, s.name as seller_name, s.phone, shi_met.shipping_method_id,shi_met.cost
from sales sa 
join seller s on sa.seller_id=s.seller_id
join orders o on s.seller_id=o.seller_id
join shipping_method shi_met on o.shipping_method_id=shi_met.shipping_method_id

select * from sales_det

----------------------------------------------------------------------------------------------------
--View 10: Customer Reviews Summary
CREATE VIEW customer_reviews AS
SELECT c.customer_id, c.name, p.name AS product_name, r.rating, r.comment, r.review_date
FROM customer c
JOIN review r ON c.customer_id = r.customer_id
JOIN product p ON r.product_id = p.product_id;

select * from customer_reviews

----------------------------------------------------------------------------------------------------
-- View 11: Product Review Summary
CREATE VIEW product_review_summary AS
SELECT p.product_id, p.name AS product_name, AVG(r.rating) AS average_rating, COUNT(r.review_id) AS total_reviews
FROM product p
JOIN review r ON p.product_id = r.product_id
GROUP BY p.product_id, p.name;

select * from product_review_summary

----------------------------------------------------------------------------------------------------
--view 12 payment details
create view payment_det as
select py.payment_id, py.amount, py.payment_date, py.payment_method, p.product_id,p.name as product_name, p.description,s.name as seller_name,sa.sales_id, sa.total_sales,sa.sales_date
from payment py 
join orders o on py.order_id=o.order_id
join order_detail od on o.order_id=od.order_id
join product p on p.product_id=od.product_id
join seller s on o.seller_id=s.seller_id
join sales sa on s.seller_id=sa.seller_id

select * from payment_det

----------------------------------------------------------------------------------------------------
-- View 13: Total Payments Per Order
create view Total_PyO as
select o.order_id,sum(py.amount) as Total_Payment
from orders o 
join payment py on o.order_id=py.order_id
group by o.order_id;

select * from Total_PyO

----------------------------------------------------------------------------------------------------
-- View 14: Category Products
create view cat_Pro as
select c.category_id,c.name as category_name, count(p.product_id) as Total_Products
from category c 
join subcategory sc on c.category_id=sc.category_id
join product p on sc.subcategory_id=p.subcategory_id
group by c.category_id,c.name;

select * from cat_Pro


----------------------------------------------------------------------------------------------------
-- View 15: Total Sales Per Seller
create view Total_sales as
select s.seller_id,s.name as seller_name, sum(o.total_amount) as Total_Sales
from seller s
join orders o on s.seller_id=o.seller_id
group by s.seller_id,s.name;


select * from Total_sales


----------------------------------------------------------------------------------------------------
-- View 16: Daily Sales Amount
create view daily_sales as
select sa.sales_date, sum(sa.total_sales) as total_sales_amount
from sales sa
group by sa.sales_date;

select * from daily_sales

----------------------------------------------------------------------------------------------------
-- View 17: Total Products Sold
create view Total_pr_sold as 
select p.product_id,p.name as product_name, sum(od.quantity) as Total_Quantity_sold
from product p
join order_detail od on p.product_id=od.product_id
group by p.product_id,p.name;

select * from Total_pr_sold


----------------------------------------------------------------------------------------------------
-- View 18: Seller Total Orders Handled
create view seller_order as
select s.seller_id,s.name as seller_name, count(o.order_id) as total_orders_handled
from seller s 
join orders o on s.seller_id=o.seller_id
group by s.seller_id,s.name;

select * from seller_order

----------------------------------------------------------------------------------------------------
-- View 19: Customer Orders Count
create view cus_order as 
select c.customer_id,c.name as custoumer_name, count(o.order_id) as total_amount
from customer c
join orders o on c.customer_id=o.customer_id
group by c.customer_id,c.name;

select * from cus_order

----------------------------------------------------------------------------------------------------
-- View 20: Products Per Subcategory
create view prd_subcat as
select sc.subcategory_id, sc.name as subcategory_name, count(p.product_id) as total_products
from subcategory sc
JOIN product p ON sc.subcategory_id = p.subcategory_id
group by sc.subcategory_id, sc.name;

select * from prd_subcat


----------------------------------------------------------------------------------------------------
-- View 21: Order Shipping Information
create view order_ship_info as
select o.order_id, sm.name as shipping_method, o.total_amount, sm.cost as shipping_cost
from orders o
JOIN shipping_method sm on o.shipping_method_id = sm.shipping_method_id;

select * from order_ship_info

