-- Create Dimension Tables with Surrogate Keys
CREATE TABLE DimCustomer (
    customer_sk INT PRIMARY KEY IDENTITY,
    customer_id INT NOT NULL, -- Natural Key (optional)
    name VARCHAR(255),
    email VARCHAR(255) NOT NULL,
    phone VARCHAR(50),
    address TEXT
);

CREATE TABLE DimDate (
    date_sk INT PRIMARY KEY IDENTITY,
    full_date DATE, -- Stores the complete date (can be split into day, month, year if needed)
    day INT,
    month INT,
    year INT
);

CREATE TABLE DimPayment (
    payment_sk INT PRIMARY KEY IDENTITY,
    payment_id INT NOT NULL, -- Natural Key (optional)
    payment_method VARCHAR(50)
);

-- Updated DimSeller: Remove salary
CREATE TABLE DimSeller (
    seller_sk INT PRIMARY KEY IDENTITY,
    seller_id INT NOT NULL, -- Natural Key (optional)
    seller_name VARCHAR(255),
    email VARCHAR(255),
    phone VARCHAR(50)
);

-- Updated DimProduct: Remove price, include category and subcategory names
CREATE TABLE DimProduct (
    product_sk INT PRIMARY KEY IDENTITY,
    product_id INT NOT NULL, -- Natural Key (optional)
    Product_name VARCHAR(255),
    description TEXT,
    category_name VARCHAR(255),  -- Contains the category name
    subcategory_name VARCHAR(255) -- Contains the subcategory name
);

CREATE TABLE DimShipping_method (
    shipping_method_sk INT PRIMARY KEY IDENTITY,
    shipping_method_id INT NOT NULL, -- Natural Key (optional)
    shipping_method_name VARCHAR(255),
);

-- Create the Fact Table (FactOrders) with price and seller's salary
CREATE TABLE FactOrders (
    order_id_sk INT PRIMARY KEY IDENTITY,  -- Surrogate key for each order
    customer_sk INT,   -- Surrogate key from DimCustomer
    seller_sk INT,     -- Surrogate key from DimSeller
    product_sk INT,    -- Surrogate key from DimProduct
    payment_sk INT,    -- Surrogate key from DimPayment
    shipping_method_sk INT, -- Surrogate key from DimShipping_method
    order_date_sk INT, -- Surrogate key from DimDate for the order date
    payment_date_sk INT, -- Surrogate key from DimDate for the payment date (optional)
    
    quantity INT,       -- Order quantity
    total_amount DECIMAL(10, 2),  -- Total amount of the order
    discount DECIMAL(5, 2),      -- Discount applied to the order
    product_price DECIMAL(10, 2), -- Price of the product at the time of the order
    seller_salary DECIMAL(10, 2), -- Salary of the seller at the time of the order
    shipping_cost DECIMAL(10, 2), -- Cost of the shipping method at the time of the order
    
    -- Foreign key references
    FOREIGN KEY (customer_sk) REFERENCES DimCustomer(customer_sk),
    FOREIGN KEY (seller_sk) REFERENCES DimSeller(seller_sk),
    FOREIGN KEY (product_sk) REFERENCES DimProduct(product_sk),
    FOREIGN KEY (payment_sk) REFERENCES DimPayment(payment_sk),
    FOREIGN KEY (shipping_method_sk) REFERENCES DimShipping_method(shipping_method_sk),
    FOREIGN KEY (order_date_sk) REFERENCES DimDate(date_sk),
    FOREIGN KEY (payment_date_sk) REFERENCES DimDate(date_sk)
);
