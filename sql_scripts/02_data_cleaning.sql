--  Data Cleaning and validation
--  Null Check
-- if 1 null value present
-- if 0 no null value
SELECT
     SUM(CASE WHEN state IS NULL THEN 1 ELSE 0 END) AS null_state,
	 SUM(CASE WHEN city IS NULL THEN 1 ELSE 0 END) AS null_city,
	 SUM(CASE WHEN order_date IS NULL THEN 1 ELSE 0 END ) AS null_order_date,
	 SUM(CASE WHEN restaurant_name IS NULL THEN 1 ELSE 0 END) AS null_resturant_name,
	 SUM(CASE WHEN location IS NULL THEN 1 ELSE 0 END) AS null_location,
	 SUM(CASE WHEN category IS NULL THEN 1 ELSE 0 END) AS null_category,
     SUM(CASE WHEN dish_name IS NULL THEN 1 ELSE 0 END) AS null_dish_name,
	 SUM(CASE WHEN price_inr IS NULL THEN 1 ELSE 0 END) AS null_price_inr,
	 SUM(CASE WHEN rating IS NULL THEN 1 ELSE 0 END) AS null_rating,
	 SUM(CASE WHEN rating_count IS NULL THEN 1 ELSE 0 END) AS null_rating_count
FROM swiggy_data;
--  no null values present

SELECT * FROM swiggy_data;

-- Blank or Empty Strings

SELECT * FROM swiggy_data 
WHERE 
state = '' OR city = '' OR restaurant_name = '' OR location = '' OR category = '' OR dish_name = '';

--  No blank values


-- Duplicate Detection

SELECT 
state,city,order_date,restaurant_name,location,category,
dish_name,price_inr,rating,rating_count, COUNT(*) AS count_data
FROM swiggy_data
GROUP BY state,city,order_date,restaurant_name,location,category,
dish_name,price_inr,rating,rating_count
HAVING COUNT(*) > 1;

-- Delete A duplicates 
--  instead of deleting a duplicates let make new table swiggy_data_clean where no duplicates will present
--  using CTE creted a new swiggy_data_clean table 









