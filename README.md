# 📊 Smartphone Data Analysis using SQL

This repository contains SQL queries for analyzing a smartphone dataset. The dataset is structured in a schema called `campusx`, and the queries include calculations, filtering, sorting, updating, and deleting records based on smartphone specifications.

## 🗂️ Table of Contents
1. [View All Smartphones](#view-all-smartphones)
2. [PPI Calculation](#ppi-calculation)
   - [PPI Formula](#ppi-formula)
3. [Convert Rating to 10% Scale](#convert-rating-to-10-scale)
4. [Find All Smartphone Brands](#find-all-smartphone-brands)
5. [Find All Smartphone Brands with Processor Details](#find-all-smartphone-brands-with-processor-details)
6. [Find Samsung Smartphones with Price Above 10000](#find-samsung-smartphones-with-price-above-10000)
7. [Find Smartphones in Price Range 10000 to 20000](#find-smartphones-in-price-range-10000-to-20000)
8. [Find Smartphones with Rating > 80 and Price < 25000](#find-smartphones-with-rating-greater-than-80-and-price-less-than-25000)
9. [Find Samsung Phones with 8GB RAM or More](#find-samsung-phones-with-8gb-ram-or-more)
10. [Find Brands Selling Phones Above 50000](#find-brands-selling-phones-above-50000)
11. [Filter Phones by Processor Brand](#filter-phones-by-processor-brand)
12. [Update Processor Brand](#update-processor-brand)
13. [Delete IQOO Phones with Primary Camera Above 50MP](#delete-iqoo-phones-with-primary-camera-above-50mp)
14. [Find Most and Least Expensive Mobiles](#find-most-and-least-expensive-mobiles)
15. [Find Samsung's Highest Flagship Mobile Price](#find-samsungs-highest-flagship-mobile-price)
16. [Find Average Rating of iPhones](#find-average-rating-of-iphones)
17. [Count of OnePlus Phones](#count-of-oneplus-phones)
18. [Count Distinct Brands](#count-distinct-brands)
19. [Calculate Screen Size Variance](#calculate-screen-size-variance)
20. [Sorting Data](#sorting-data)
21. [Grouping Data](#grouping-data)
22. [Using HAVING Clause](#using-having-clause)

---

## 1. View All Smartphones

```sql
SELECT * FROM campusx.smartphones;
```
# Smartphone Data Analysis:

## 2. PPI Calculation

### PPI Formula

This section outlines the steps to calculate the Pixels Per Inch (PPI) for each smartphone model in your database.

#### 1. Calculate Diagonal Resolution

First, you need to determine the diagonal resolution of each smartphone model. This can be done using the following SQL query:

```
SELECT model, sqrt(resolution_width * resolution_width + resolution_height * resolution_height) 
FROM campusx.smartphones;
```

##  3. Convert Rating to 10% Scale
Convert the rating of each smartphone from a 100% scale to a 10% scale:
```
SELECT model, rating / 10 AS 'Rating_10_Scale'
FROM campusx.smartphones;
```

## 4. Find All Smartphone Brands
Fetch all distinct smartphone brands:
```
SELECT DISTINCT(brand_name) AS 'ALL Brands'
FROM campusx.smartphones;
```
##  5. Find All Smartphone Brands with Processor Details
Fetch distinct brands with their corresponding processor brands:
```
SELECT DISTINCT brand_name, processor_brand AS 'Processor Brand'
FROM campusx.smartphones;
```
## 6. Find Samsung Smartphones with Price Above 10000
Fetch all Samsung smartphones that are priced above 10000:
```
SELECT * FROM campusx.smartphones
WHERE brand_name = 'samsung' AND price > 10000;
```
##  7. Find Smartphones in Price Range 10000 to 20000
Fetch all smartphones priced between 10000 and 20000:
```
SELECT * FROM campusx.smartphones
WHERE price BETWEEN 10000 AND 20000;
```

## 8. Find Smartphones with Rating Greater than 80 and Price Less than 25000
Fetch all smartphones with a rating greater than 80 and priced below 25000:
```
SELECT * FROM campusx.smartphones
WHERE price < 25000 AND rating > 80;
```
## 9. Find Samsung Phones with 8GB RAM or More
Fetch all Samsung phones with RAM capacity of 8GB or more:
```
SELECT * FROM campusx.smartphones
WHERE brand_name = 'samsung' AND ram_capacity >= 8;
```
## 10. Find Brands Selling Phones Above 50000
Fetch all brands that sell phones priced above 50000:
```
SELECT DISTINCT brand_name, price
FROM campusx.smartphones
WHERE price > 50000;
```
## 11. Filter Phones by Processor Brand
Fetch all smartphones with processor brands: Snapdragon, Dimensity, or Helio:
```
SELECT * FROM campusx.smartphones
WHERE processor_brand IN ('snapdragon', 'dimensity', 'helio');
```
## 12. Update Processor Brand
Update all phones with processor brand 'mediatek' to 'dimensity':
```
UPDATE campusx.smartphones
SET processor_brand = 'dimensity'
WHERE processor_brand = 'mediatek';
```
## 13. Delete IQOO Phones with Primary Camera Above 50MP
Delete all IQOO phones with a rear camera resolution above 50MP:
```
DELETE FROM campusx.smartphones
WHERE primary_camera_rear > 50 AND brand_name = 'iqoo';
```
## 14. Find Most and Least Expensive Mobiles
Fetch the most expensive mobile:
```
SELECT MAX(price) FROM campusx.smartphones;
Fetch the least expensive mobile:


SELECT MIN(price) FROM campusx.smartphones;
```
## 15. Find Samsung's Highest Flagship Mobile Price
Fetch the price of the most expensive Samsung phone:
```
SELECT MAX(price)
FROM campusx.smartphones
WHERE brand_name = 'samsung';
```
## 16. Find Average Rating of iPhones
Fetch the average rating of iPhone models:
```
SELECT AVG(rating)
FROM campusx.smartphones
WHERE brand_name = 'apple';
```
## 17. Count of OnePlus Phones
Count how many OnePlus phones are available:
```
SELECT COUNT(*)
FROM campusx.smartphones
WHERE brand_name = 'oneplus';
```
## 18. Count Distinct Brands
Count how many unique brands are available in the dataset:
```
SELECT COUNT(DISTINCT brand_name)
FROM campusx.smartphones;
```
## 19. Calculate Screen Size Variance
Find the variance of screen sizes in the dataset:
```
SELECT VARIANCE(screen_size)
FROM campusx.smartphones;
```
## 20. Sorting Data
Find the top 5 Samsung phones with the biggest screen size:
```
SELECT model, screen_size
FROM campusx.smartphones
WHERE brand_name = 'samsung'
ORDER BY screen_size DESC
LIMIT 5;
```
### Sort all phones in descending order of the total number of cameras:

```
SELECT model, num_rear_cameras + num_front_cameras AS 'Total_Camera'
FROM campusx.smartphones
ORDER BY Total_Camera DESC;
```
### Sort phones based on PPI in decreasing order:
```
SELECT model, ROUND(sqrt(resolution_width * resolution_width + resolution_height * resolution_height) / screen_size) AS 'PPI'
FROM campusx.smartphones
ORDER BY PPI DESC;
```
## 21. Grouping Data
Group smartphones by brand and calculate the count, average price, max rating, average screen size, and average battery capacity:
```
SELECT brand_name, COUNT(*) AS 'Total Smartphones',
ROUND(AVG(price)) AS 'AVG Price',
MAX(rating) AS 'Max Ratings',
ROUND(AVG(screen_size)) AS 'Avg Screen Size',
ROUND(AVG(battery_capacity)) AS 'Avg Battery Capacity'
FROM campusx.smartphones
GROUP BY brand_name;
```
## 22. Using HAVING Clause
Find the average rating of smartphone brands that have more than 20 models:
```
SELECT brand_name, COUNT(*) AS 'Count',
ROUND(AVG(rating)) AS 'AVG_Rating'
FROM campusx.smartphones
GROUP BY brand_name
HAVING COUNT(*) > 20
ORDER BY AVG_Rating DESC;
```
## 🔍 Project Overview

This project explores various SQL concepts including:

- `SELECT`, `WHERE`, `GROUP BY`, `HAVING`
- Aggregation functions (`AVG`, `MAX`, `MIN`, `COUNT`, etc.)
- `JOIN`, `UPDATE`, `DELETE` queries
- Sorting and filtering
