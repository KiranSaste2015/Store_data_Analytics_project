--Categorical Analysis:
--1.What are the top 5 most frequently ordered 'CATEGORY' items?
SELECT CATEGORY, ORDER_COUNT
FROM (
SELECT
CATEGORY,COUNT(*) AS ORDER_COUNT,
DENSE_RANK() OVER (ORDER BY COUNT(*) DESC) AS RNK
FROM STORE
GROUP BY CATEGORY) 
WHERE RNK <= 5;

--1.What are the top 5 most frequently ordered 'CATEGORY' items?
SELECT *FROM(
SELECT CATEGORY,COUNT(*) AS CNT
FROM STORE
GROUP BY CATEGORY
ORDER BY CNT DESC
)WHERE ROWNUM<=5;



--2.Is there a significant difference in the average order amount between different 'MEDIA' sources?
SELECT MEDIA,AVG(AMOUNT)
FROM STORE
GROUP BY MEDIA;


--3.Can you identify the most common 'SIZE_ORDERED'?
SELECT SIZE_ORDERED, COUNT(*) AS SIZE_COUNT
FROM STORE
GROUP BY SIZE_ORDERED
ORDER BY SIZE_ORDERED DESC;

