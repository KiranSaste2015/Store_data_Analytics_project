----------------Exploratory Data Analysis-------------------------------------
--Generic Questions
SELECT *FROM STORE;
--1.Display distinct age_group.
SELECT DISTINCT (AGE_GROUP)
FROM STORE;

--2.Display distinct category 
SELECT DISTINCT (CATEGORY)
FROM STORE;


--3.Display customers who have purchased Kurta
SELECT CUST_ID,CATEGORY
FROM STORE
WHERE UPPER(CATEGORY)='KURTA';

--4.Display details of  Teenagers  from karnataka.
SELECT *
FROM STORE
WHERE UPPER(SHIP_STATE)='KARNATAKA'
AND LOWER(AGE_GROUP)='teenager';

--5.Find category that has been shiped to New Delhi
SELECT CATEGORY,SHIP_CITY
FROM STORE
WHERE UPPER(SHIP_CITY)='DELHI';

--6.Show total number of columns  in Store table
SELECT COUNT(*) AS total_columns
FROM USER_TAB_COLUMNS
WHERE TABLE_NAME = 'STORE';

--7.How many orders have a status of 'Pending'?
SELECT COUNT(STATUS)
FROM STORE
WHERE UPPER(STATUS)='PENDING';

--8.Which media type is the most common for orders?
SELECT MEDIA ,COUNT(ORDER_NUMBER) AS MOST_COMMON
FROM STORE
GROUP BY MEDIA
ORDER BY COUNT(ORDER_NUMBER) DESC;

SELECT *FROM (
SELECT MEDIA,COUNT(ORDER_NUMBER) AS CNT
FROM STORE
GROUP BY MEDIA
ORDER BY CNT DESC
)WHERE ROWNUM<=1;

--9.What category has the highest average order amount?
SELECT CATEGORY,ROUND(AVG(AMOUNT),3) AS AVERAGE_ORDER_AMOUNT
FROM STORE
GROUP BY CATEGORY
ORDER BY AVERAGE_ORDER_AMOUNT DESC;

SELECT *FROM(
SELECT CATEGORY,ROUND(AVG(AMOUNT),1) AS HIGHEST_AVG
FROM STORE
GROUP BY CATEGORY
ORDER BY HIGHEST_AVG DESC
)WHERE ROWNUM<=1;



--10.What is the total quantity of items ordered across all transactions?
SELECT SUM(QTY) AS TOTAL_QUANTITY
FROM STORE;

--11.Which currency is most commonly used in the dataset?
--ANS1
SELECT MAX(CURRENCY) AS MAX_CURRENCY
FROM STORE;


--ANS2
SELECT CURRENCY, COUNT(*) AS CURRENCY_COUNT
FROM STORE
GROUP BY CURRENCY
ORDER BY CURRENCY_COUNT DESC;


--12.How many orders have a ship country of 'United States'?
SELECT COUNT(SHIP_COUNTRY)AS COUNT_ORDERS 
FROM STORE 
WHERE SHIP_COUNTRY  IN 'UNITED STATES';


SELECT COUNT(*)
FROM STORE
WHERE UPPER(SHIP_COUNTRY)='UNITED STATES';



--13.What is the average age of customers for each category?
SELECT CATEGORY ,TRUNC(AVG(AGE)) AS AVERAGE_AGE 
FROM STORE
GROUP BY CATEGORY ;

