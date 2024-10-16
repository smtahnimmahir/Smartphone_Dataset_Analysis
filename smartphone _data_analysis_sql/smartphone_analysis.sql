select * from campusx.smartphones

-- PPI Calculation
SELECT model, sqrt(resolution_width * resolution_width + resolution_height * resolution_height) from campusx.smartphones

SELECT model, sqrt(resolution_width * resolution_width + resolution_height * resolution_height) / screen_size AS 'PPI' from campusx.smartphones

-- Convert Rating 10% from 100%
select model, rating /10 from campusx.smartphones

-- Find All Samrtphone Brand
Select distinct(brand_name) As ' ALL Brand' from campusx.smartphones

-- Find All Samrtphone Brand with Processor 
Select distinct brand_name, processor_brand As ' ALL Brand' from campusx.smartphones

-- Find the Samsnung Smartpone which below above 10000
select * from campusx.smartphones
	where brand_name = 'samsung' and price >10000;
    
-- Find the all samrtphone which range is 10000 to 20000
select * from campusx.smartphones
	where price between 10000 and 20000;
    
-- Find all phone with ratings >80 and price < 25000
select * from campusx.smartphones
	where price <25000 and rating > 80;

-- Find all Samsung phone with 8gb and more 
select * from campusx.smartphones
	where brand_name = 'samsung' and ram_capacity >= 8;
    
-- Find brands who sell phones whith price >50000
select distinct brand_name, price from campusx.smartphones
	where price > 50000 

-- Find the smartphone their processor brand is 'snapdragon','dimensity', 'helio'
SELECT * FROM campusx.smartphones
where processor_brand in ( 'snapdragon','dimensity', 'helio')

-- Find the smartphone their processor brand is not 'dimensity', 'helio'
SELECT * FROM campusx.smartphones
where processor_brand not in ( 'dimensity', 'helio')

-- Replace the processor brand in Mediatek to dimencity

update campusx.smartphones
 set processor_brand = 'dimensity' where processor_brand = 'mediatek' 
 
-- Replace name  & password which email id is mahir@gmail.com
update campusx.users
 set name = 'Tahnim Mahir', password = 'abc' where email = 'mahir@gmail.com' 

select * from campusx.users

-- Delect iqoo brand where primary_camera_rear > 50
delete from campusx.smartphones
	where primary_camera_rear > 50 and brand_name = 'iqoo';
    
SELECT brand_name, primary_camera_rear   FROM campusx.smartphones
where brand_name = 'iqoo'

-- Find most expensive mobile 
select max(price) FROM campusx.smartphones


-- Find min expensive mobile 
select min(price) FROM campusx.smartphones

-- Find the Samsung heighest flagship mobile price
select max(price) FROM campusx.smartphones
where brand_name = 'samsung'

-- Find the avg rating in IPhone
select avg(rating)  FROM campusx.smartphones
where brand_name = 'apple'

-- How many phones are availbale in oneplus
select count(*) from campusx.smartphones
where brand_name = 'oneplus'

-- Find the number of brands availabe
SELECT COUNT(DISTINCT brand_name) FROM campusx.smartphones;

-- Find the STD of screen size
SELECT variance(screen_size) FROM campusx.smartphones;


-- Sorting Data
-- 1.. find top 5 samsung phones with biggest screen size
SELECT model, screen_size FROM campusx.smartphones
WHERE brand_name = 'samsung'
ORDER By screen_size DESC LIMIT 5

-- 2. sort all the phone in decending order of number of total cameras

SELECT model, num_rear_cameras + num_front_cameras AS 'Total_Camera' FROM campusx.smartphones
ORDER By Total_Camera DESC 

-- 3. sort data on the basis of ppi in decreasing order

SELECT model, ROUND(sqrt(resolution_width * resolution_width + resolution_height * resolution_height) / screen_size) AS 'PPI' 
from campusx.smartphones
ORDER By PPI DESC 

-- 4. find the phone with 2nd largest battery
SELECT model, battery_capacity FROM campusx.smartphones
ORDER BY battery_capacity DESC LIMIT 1,1

-- 5. find the name and rating of the worst rated apple phone

SELECT model, rating FROM campusx.smartphones
WHERE brand_name = 'apple'
ORDER By rating ASC 
-- 6. sort phones alphabetically and then on the basic of rating in desc order
SELECT * FROM campusx.smartphones
ORDER BY brand_name ASC, rating DESC 

--  7. sort phones alphabetically and then on the basic of price in asc order

SELECT * FROM campusx.smartphones
ORDER BY brand_name ASC, price ASC


-- Grouping Data
-- 1. Group smartphones by brand and get the count, average price, max rating, avg screen size and avg battery capacity 
SELECT brand_name, COUNT(*) as 'Total Smartphone',
ROUND(AVG(price)) as 'AVG Price',
MAX(rating) as 'Max Ratings',
ROUND(AVG(screen_size)) as ' Avg Screen Size',
ROUND(AVG(battery_capacity)) as ' Avg battery_capacity'
  FROM campusx.smartphones
GROUP BY brand_name

-- 2. Group smartphones by whether they have an NFC and get the average price and rating
SELECT has_nfc, 
ROUND(AVG(price)) as 'AVG Price',
ROUND(AVG(rating))as 'AVG Ratings'
FROM campusx.smartphones
GROUP BY has_nfc

-- 3. Group smartphones by the extended memory available and get the average price
SELECT extended_memory_available, 
ROUND(AVG(price)) as 'AVG Price'
FROM campusx.smartphones
GROUP BY extended_memory_available

-- 4. Group smartphones by the brand and processor brand and get the count of models and the average primary camera resolution (rear)

SELECT brand_name, processor_brand,
COUNT(*) as 'Number of Phones', 
ROUND(AVG(primary_camera_rear)) AS 'primary_camera_rear'
FROM campusx.smartphones
GROUP BY brand_name,processor_brand

-- 5. find top 5 most costly phone brands

SELECT brand_name, 
ROUND(AVG(price)) as 'AVG_Price'
FROM campusx.smartphones
GROUP BY brand_name 
ORDER BY AVG_Price DESC LIMIT 5 

-- 6. which brand makes the smallest screen smartphones

SELECT brand_name, 
ROUND(AVG(screen_size)) as 'screen_size'
FROM campusx.smartphones
GROUP BY brand_name 
ORDER BY screen_size LIMIT 1 

-- 7. Avg price of 5g phones vs avg price of non 5g phones

SELECT has_5g, 
ROUND(AVG(price)) as 'AVG Price'
FROM campusx.smartphones
GROUP BY has_5g

-- 8. Group smartphones by the brand, and find the brand with the highest number of models that have both NFC and an IR blaster

SELECT brand_name,
COUNT(*) as 'Count_Phones'
FROM campusx.smartphones
WHERE has_nfc='TRUE' AND has_ir_blaster = 'TRUE'
GROUP BY brand_name
ORDER BY Count_Phones DESC

-- 9. Find all samsung 5g enabled smartphones and find out the avg price for NFC and Non-NFC phones
SELECT  has_nfc,
ROUND(AVG(price)) as 'AVG Price'
FROM campusx.smartphones
WHERE brand_name = 'samsung'
GROUP BY has_nfc

