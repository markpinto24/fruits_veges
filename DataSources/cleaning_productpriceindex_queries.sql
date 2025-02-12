CREATE TABLE processed_productpriceindex
LIKE productpriceindex;

Select * from processed_productpriceindex;

INSERT INTO processed_productpriceindex
Select * from productpriceindex;

CREATE TEMPORARY TABLE testing
SELECT RIGHT(farmprice,4) FROM processed_productpriceindex;

select * from testing;

UPDATE processed_productpriceindex
SET newyorkretail = right(newyorkretail,4);

ALTER TABLE processed_productpriceindex MODIFY newyorkretail FLOAT;

SELECT newyorkretail 
FROM processed_productpriceindex
WHERE newyorkretail REGEXP '[^0-9.-]';

UPDATE processed_productpriceindex 
SET newyorkretail = NULL 
WHERE newyorkretail REGEXP '[^0-9.-]';


