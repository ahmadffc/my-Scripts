#!/bin/bash
user=root
pass=sanjarpur
database=test_db
mysql -u $user --password=$pass $database -e "select * from sales;

select distinct status from salesdata;
select distinct year_id from salesdata;
select distinct PRODUCTLINE from salesdata; 
select distinct COUNTRY from salesdata ;
select distinct DEALSIZE from salesdata ;
select distinct TERRITORY from salesdata ;
select distinct MONTH_ID from salesdata
where year_id = 2003;

-- --ANALYSIS
-- --Let's start by grouping sales by productline


select PRODUCTLINE, sum(sales) Revenue
from salesdata
group by PRODUCTLINE
order by 2 desc;


select YEAR_ID, sum(sales) Revenue
from salesdata
group by YEAR_ID
order by 2 desc;

select  DEALSIZE,  sum(sales) Revenue
from salesdata
group by  DEALSIZE
order by 2 desc;


-- What was the best month for sales in a specific year? How much was earned that month? 
select  MONTH_ID, sum(sales) Revenue, count(ORDERNUMBER) Frequency
from salesdata
where YEAR_ID = 2004  -- change year to see the rest
group by  MONTH_ID
order by 2 desc;


-- November seems to be the month, what product do they sell in November, Classic I believe
select  MONTH_ID, PRODUCTLINE, sum(sales) Revenue, count(ORDERNUMBER)
from salesdata
where YEAR_ID = 2003 and MONTH_ID = 11 -- --change year to see the rest
group by  MONTH_ID, PRODUCTLINE
order by 3 desc;"
