--  Data prepartion 
-- Dimensional Modeling (Star Schema)
-- we will create fact_table and dimensional Table here

-- DIMENSION TABLES 
-- DATE TABLE

CREATE TABLE dim_date(
date_id SERIAL PRIMARY KEY,
Full_Date DATE,
Year INT,
Month INT,
Month_Name VARCHAR(20),
Quarter INT,
Day INT,
Week INT
);

SELECT * FROM dim_date;

-- dim_location
CREATE TABLE dim_location(
location_id SERIAL PRIMARY KEY,
state VARCHAR(200),
city VARCHAR(200),
location VARCHAR(200)
);

-- dim_restaurant
CREATE TABLE dim_restaurant(
restaurant_id SERIAL PRIMARY KEY,
restaurant_name VARCHAR(200)
);

-- dim_category
CREATE TABLE dim_category(
category_id SERIAL PRIMARY KEY,
category VARCHAR(200)
);

-- dim_dish
CREATE TABLE dim_dish(
dish_id SERIAL PRIMARY KEY,
dish_name VARCHAR(200)
);



--  FACT TABLE

CREATE TABLE fact_swiggy_orders (
order_id SERIAL PRIMARY KEY,

date_id INT,
price_inr DECIMAL(10,2),
rating DECIMAL(4,2),
rating_count INT,

location_id INT,
restaurant_id INT,
category_id INT,
dish_id INT,

FOREIGN KEY (date_id) REFERENCES dim_date(date_id),
FOREIGN KEY (location_id) REFERENCES dim_location(location_id),
FOREIGN KEY (restaurant_id) REFERENCES dim_restaurant(restaurant_id),
FOREIGN KEY (category_id) REFERENCES dim_category(category_id),
FOREIGN KEY (dish_id) REFERENCES dim_dish(dish_id)
);

SELECT * FROM fact_swiggy_orders;

--  INSERTION OF DATA IN TABLES
-- dim_date
INSERT INTO dim_date
(full_date, year, month, month_name, quarter, day, week)
SELECT DISTINCT
    order_date,
    EXTRACT(YEAR FROM order_date),
    EXTRACT(MONTH FROM order_date),
    TO_CHAR(order_date, 'Month'),
    EXTRACT(QUARTER FROM order_date),
    EXTRACT(DAY FROM order_date),
    EXTRACT(WEEK FROM order_date)
FROM swiggy_data_clean
WHERE order_date IS NOT NULL;

SELECT * FROM dim_date;


-- insert into dim_location

INSERT INTO dim_location (state,city,location)
SELECT DISTINCT
state,
city,
location
FROM swiggy_data_clean;

-- dim_resturant
INSERT INTO dim_restaurant (restaurant_name)
SELECT DISTINCT
restaurant_name
FROM swiggy_data_clean;

-- dim_category
INSERT INTO dim_category (category)
SELECT DISTINCT
category
FROM swiggy_data_clean;

-- dim_dish

INSERT INTO dim_dish(dish_name)
SELECT DISTINCT
dish_name
FROM swiggy_data_clean;


-- insert into facr_table

INSERT INTO fact_swiggy_orders(
date_id,
price_inr,
rating,
rating_count,
location_id,
restaurant_id,
category_id,
dish_id
)
SELECT
dd.date_id,
s.price_inr,
s.rating,
s.rating_count,

d1.location_id,
dr.restaurant_id,
dc.category_id,
dsh.dish_id
FROM swiggy_data_clean AS s
JOIN dim_date dd 
ON dd.Full_Date = s.order_date

JOIN dim_location d1
ON d1.state = s.state
AND d1.city = s.city
AND d1.location = s.location

JOIN dim_restaurant dr
ON dr.restaurant_name = s.restaurant_name

JOIN dim_category dc 
ON dc.category = s.category

JOIN dim_dish dsh
ON dsh.dish_name = s.dish_name;



SELECT * FROM fact_swiggy_orders f
JOIN dim_date d ON f.date_id = d.date_id
JOIN dim_location l ON f.location_id  = l.location_id
JOIN dim_restaurant r ON f.restaurant_id  = r.restaurant_id
JOIN dim_category c ON f.category_id = c.category_id
JOIN dim_dish di ON f.dish_id = di.dish_id;

--  this our main table
