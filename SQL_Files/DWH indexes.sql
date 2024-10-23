-- Indexes for DimCustomer
CREATE INDEX idx_dimcustomer_customerid ON DimCustomer(customer_id);
CREATE INDEX idx_dimcustomer_email ON DimCustomer(Email);
CREATE INDEX idx_dimcustomer_phone ON DimCustomer(Phone);

----------------------------------------------------------------------------------------------------
-- Indexes for DimProduct
CREATE INDEX idx_dimproduct_productid ON DimProduct(product_id);
CREATE INDEX idx_dimproduct_productname ON DimProduct(Product_name);
CREATE INDEX idx_dimproduct_categoryname ON DimProduct(category_name);
CREATE INDEX idx_dimproduct_subcategoryname ON DimProduct(subcategory_name);

----------------------------------------------------------------------------------------------------
-- Indexes for DimSeller
CREATE INDEX idx_dimseller_sellerid ON DimSeller(seller_id);
CREATE INDEX idx_dimseller_email ON DimSeller(Email);
CREATE INDEX idx_dimseller_phone ON DimSeller(Phone);

----------------------------------------------------------------------------------------------------
-- Indexes for DimShippingMethod
CREATE INDEX idx_dimshippingmethod_id ON DimShipping_method(shipping_method_id);
CREATE INDEX idx_dimshippingmethod_name ON DimShipping_method(shipping_method_name);

----------------------------------------------------------------------------------------------------
-- Indexes for Dimpayment
CREATE INDEX idx_dimpayment_paymentid ON Dimpayment(payment_id);
CREATE INDEX idx_dimpayment_paymentmethod ON Dimpayment(payment_method);

----------------------------------------------------------------------------------------------------
-- Indexes for DimDate
CREATE INDEX idx_dimdate_fulldate ON DimDate(full_date);
CREATE INDEX idx_dimdate_year ON DimDate(Year);
CREATE INDEX idx_dimdate_month ON DimDate(Month);
CREATE INDEX idx_dimdate_day ON DimDate(Day);

----------------------------------------------------------------------------------------------------
-- Indexes for FactOrders
CREATE INDEX idx_factorders_orderid ON FactOrders(order_id_sk);
CREATE INDEX idx_factorders_customerkey ON FactOrders(customer_sk);
CREATE INDEX idx_factorders_productkey ON FactOrders(product_sk);
CREATE INDEX idx_factorders_sellerkey ON FactOrders(seller_sk);
CREATE INDEX idx_factorders_shippingmethodkey ON FactOrders(shipping_method_sk);
CREATE INDEX idx_factorders_paymentkey ON FactOrders(payment_sk);
CREATE INDEX idx_factorders_datekey ON FactOrders(order_date_sk);

-- Indexes for Measures in FactOrders
CREATE INDEX idx_factorders_totalamount ON FactOrders(total_amount);
CREATE INDEX idx_factorders_productPrice ON FactOrders(product_price);
