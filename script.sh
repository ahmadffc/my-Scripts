#!/bin/bash
user=root
pass=sanjarpur
database=test_db
mysql -u $user --password=$pass $database -e "select * from sales;"
