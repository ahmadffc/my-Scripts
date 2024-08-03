#!/bin/bash
user=root
pass=sanjarpur
database=test_db
mysql -u $user --password=$pass $database -e "
SELECT C.customer_name, SUM(COALESCE(O.order_amt, 0)) AS total_2009
FROM Customers_test AS C
LEFT OUTER JOIN Orders_test AS O ON C.customer_nbr = O.customer_nbr
WHERE O.order_date >= '2009-01-01'
GROUP BY C.customer_name;"
