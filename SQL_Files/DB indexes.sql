-- Customer Table Indexes
CREATE INDEX idx_customer_email ON customer(email);
CREATE INDEX idx_customer_phone ON customer(phone);

----------------------------------------------------------------------------------------------------
-- Seller Table Indexes
CREATE INDEX idx_seller_email ON seller(email);
CREATE INDEX idx_seller_phone ON seller(phone);

----------------------------------------------------------------------------------------------------
-- Transactions Table Indexes
CREATE INDEX idx_transactions_customer_id ON transactions(customer_id);
CREATE INDEX idx_transactions_seller_id ON transactions(seller_id);
CREATE INDEX idx_transactions_date ON transactions(transaction_date);

----------------------------------------------------------------------------------------------------
-- Category and Subcategory Tables Indexes
CREATE INDEX idx_subcategory_category_id ON subcategory(category_id);

----------------------------------------------------------------------------------------------------
-- Product Table Indexes
CREATE INDEX idx_product_subcategory_id ON product(subcategory_id);
CREATE INDEX idx_product_price ON product(price);

----------------------------------------------------------------------------------------------------
-- Shipping Method Table Indexes
CREATE INDEX idx_shipping_method_name ON shipping_method(name);

----------------------------------------------------------------------------------------------------
-- Orders Table Indexes
CREATE INDEX idx_orders_customer_id ON orders(customer_id);
CREATE INDEX idx_orders_seller_id ON orders(seller_id);
CREATE INDEX idx_orders_date ON orders(order_date);

----------------------------------------------------------------------------------------------------
-- Order Detail Table Indexes
CREATE INDEX idx_order_detail_order_id ON order_detail(order_id);
CREATE INDEX idx_order_detail_product_id ON order_detail(product_id);

----------------------------------------------------------------------------------------------------
-- Payment Table Indexes
CREATE INDEX idx_payment_order_id ON payment(order_id);
CREATE INDEX idx_payment_method ON payment(payment_method);

----------------------------------------------------------------------------------------------------
-- Payment Table Indexes
CREATE INDEX idx_payment_order_id ON payment(order_id);
CREATE INDEX idx_payment_method ON payment(payment_method);

----------------------------------------------------------------------------------------------------
-- Sales Table Indexes
CREATE INDEX idx_sales_seller_id ON sales(seller_id);
CREATE INDEX idx_sales_date ON sales(sales_date);

----------------------------------------------------------------------------------------------------
-- Interaction Table Indexes
CREATE INDEX idx_interaction_customer_id ON interaction(customer_id);
CREATE INDEX idx_interaction_date ON interaction(interaction_date);

----------------------------------------------------------------------------------------------------
-- Review Table Indexes
CREATE INDEX idx_review_customer_id ON review(customer_id);
CREATE INDEX idx_review_product_id ON review(product_id);
CREATE INDEX idx_review_rating ON review(rating);

----------------------------------------------------------------------------------------------------
