-- Database created and manually and then inserted a data
-- Created Table and Imported a data in swiggy_data table

CREATE TABLE swiggy_data (
    state VARCHAR(100),
    city VARCHAR(100),
    order_date DATE,
    restaurant_name VARCHAR(255),
    location VARCHAR(255),
    category VARCHAR(100),
    dish_name VARCHAR(255),
    price_inr NUMERIC(10,2),
    rating NUMERIC(3,1),
    rating_count INT
);

SELECT * FROM swiggy_data;

