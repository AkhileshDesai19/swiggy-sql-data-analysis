-- created a new swiggy_data_clean table by removing duplicates

CREATE TABLE swiggy_data_clean AS 
WITH CTE AS(
SELECT *, ROW_NUMBER() OVER(PARTITION BY state,city,order_date,restaurant_name,location,category,
dish_name,price_inr,rating,rating_count
ORDER BY (SELECT NULL)
) AS rn
FROM swiggy_data
)
SELECT state,city,order_date,restaurant_name,location,category,
dish_name,price_inr,rating,rating_count
FROM CTE 
WHERE rn = 1;

--  duplicates removed 

SELECT COUNT(*)
FROM swiggy_data_clean;