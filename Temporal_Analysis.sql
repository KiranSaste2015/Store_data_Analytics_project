--Temporal Analysis:

--1.How does the number of orders vary across different months?
SELECT TO_CHAR(ORDER_DATE,'MM') AS MONTH,
COUNT(*) AS ORDER_COUNT
FROM STORE
GROUP BY  TO_CHAR(ORDER_DATE,'MM')
ORDER BY MONTH;

--2.Is there any noticeable trend or seasonality in the order dates?

SELECT TO_CHAR(ORDER_DATE,'MM')AS MONTH,TO_CHAR(ORDER_DATE,'YYYY')AS YEAR,COUNT(ORDER_DATE)AS COUNT_OF_DATES
FROM STORE
GROUP BY TO_CHAR(ORDER_DATE,'MM'),TO_CHAR(ORDER_DATE,'YYYY')
ORDER BY MONTH;


--3.What is the average order amount for each month?
SELECT TO_CHAR(ORDER_DATE,'MM') AS MONTH ,ROUND(AVG(AMOUNT),3) AS AVG_AMOUNT
FROM STORE 
GROUP BY TO_CHAR(ORDER_DATE,'MM')
ORDER BY MONTH;




