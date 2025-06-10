create_tables_sql = [
    '''
    CREATE SCHEMA IF NOT EXISTS oltp;
    CREATE SCHEMA IF NOT EXISTS olap;

    -- OLTP Tables
    CREATE TABLE IF NOT EXISTS oltp.customers (
        customer_id SERIAL PRIMARY KEY,
        customer_name VARCHAR(150),
        city VARCHAR(150),
        state VARCHAR(150)
    );

    CREATE TABLE IF NOT EXISTS oltp.products (
        product_id SERIAL PRIMARY KEY,
        category VARCHAR(150),
        sub_category VARCHAR(150)
    );

    CREATE TABLE IF NOT EXISTS oltp.payments (
        payment_id SERIAL PRIMARY KEY,
        payment_mode VARCHAR(150)
    );

    CREATE TABLE IF NOT EXISTS oltp.location (
        location_id SERIAL PRIMARY KEY,
        city VARCHAR(150),
        state VARCHAR(150)
    );

    CREATE TABLE IF NOT EXISTS oltp.orders (
        order_id SERIAL PRIMARY KEY,
        order_no VARCHAR(50),
        order_date DATE,
        year_month VARCHAR(10),
        customer_id INT REFERENCES oltp.customers(customer_id),
        product_id INT REFERENCES oltp.products(product_id),
        payment_id INT REFERENCES oltp.payments(payment_id),
        location_id INT REFERENCES oltp.location(location_id),
        quantity INT,
        amount NUMERIC(10, 2),
        profit NUMERIC(10, 2)
    );

    -- OLAP Dimension Tables
    CREATE TABLE IF NOT EXISTS olap.dim_customers (
        customer_id SERIAL PRIMARY KEY,
        customername VARCHAR(150)
    );

    CREATE TABLE IF NOT EXISTS olap.dim_products (
        product_id SERIAL PRIMARY KEY,
        category VARCHAR(150),
        sub_category VARCHAR(150)
    );

    CREATE TABLE IF NOT EXISTS olap.dim_payments (
        payment_id SERIAL PRIMARY KEY,
        paymentmode VARCHAR(150)
    );

    CREATE TABLE IF NOT EXISTS olap.dim_location (
        location_id SERIAL PRIMARY KEY,
        city VARCHAR(150),
        state VARCHAR(150)
    );

    CREATE TABLE IF NOT EXISTS olap.dim_date (
        date_id SERIAL PRIMARY KEY,
        order_date DATE,
        day INT,
        month INT,
        quarter INT,
        year INT,
        dow VARCHAR(15)
    );

    -- OLAP Fact Table
    CREATE TABLE IF NOT EXISTS olap.fact_sales (
        order_id INT PRIMARY KEY,
        customer_id INT REFERENCES olap.dim_customers(customer_id),
        product_id INT REFERENCES olap.dim_products(product_id),
        payment_id INT REFERENCES olap.dim_payments(payment_id),
        location_id INT REFERENCES olap.dim_location(location_id),
        date_id INT REFERENCES olap.dim_date(date_id),
        quantity INT,
        amount NUMERIC(10, 2),
        profit NUMERIC(10, 2)
    );
    '''
]
