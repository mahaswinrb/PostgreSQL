--refer data set chocolater_1 attached in the same repository

select
    current_user,
	now()
	
--1. Create a new data base. In the database, create a table for importing the
chocolate rating data.
DROP TABLE chocolate_rating;	
CREATE TABLE chocolate_rating(
    company varchar(255),select company, review, avg(rating)> 3.3125
    SpecificBeanOriginor varchar(255),
    Reference int,
	Review int,
	Cocoa real, 
	CompanyLocation varchar(30),	   
	Rating real,
	BeanType varchar(30),
	Broad varchar(30)
    );
--Import chocolate ratings to the table
COPY PUBLIC.chocolate_rating FROM 'C:\Users\Public\FE513\chocolate_1.csv' WITH CSV HEADER;	
-- Table Output	
SELECT*FROM chocolate_rating;
	
--2. How many companies are there located in U.S.A? Get the name list of these companies and report the rst 10 observations.	
	SELECT*FROM chocolate_rating
	WHERE companylocation IN ('U.S.A.')
	
--3. For U.S.A companies, how many of them have bean in Trinitario type?
--Get the name list of these companies and report the firstrst 10 observations.

SELECT*FROM chocolate_rating
	WHERE companylocation IN ('U.S.A.') AND beantype IN ('Trinitario')



--4. Get the average rating for each year. 
--rt the result by year in ascending order and report your results.


SELECT review,
       AVG(rating)
	   FROM chocolate_rating GROUP BY review
	   ORDER BY review ASC
;
 
--5. Get the average rating for each company. Sort the result alphabetically
--by company name and report first 10 observations.

Select company,
       AVG(rating)
	   FROM chocolate_rating GROUP BY company
	   ORDER BY company ASC
	   ;


--6. For each year, get the companies name and their average ratings whose ratings are above the every year's average rating. Report your results for
--year 2007.
--As maximum average rating is 3.3125 for year 2017

select company, review, avg(rating),
       avg(rating) > 3.3125 IS TRUE
       from chocolate_rating Group by 1,2 
	   Order by review IN ('2007')
	   ;

--7. For each year, get the highest rating and the company's name. Report your result in a table.
	   
select review, company, 
       max(rating) over (partition by review) as max_rating
       FROM chocolate_rating
	   ;	   


--8. For each year, get the rating spread(highest minus lowest). 
--Sort your result by spread in descending order and report it,

Select review, Max(rating)-Min(rating) AS rating_spread
FROM chocolate_rating
Group BY review
Order by rating_spread DESC, review;
       
 
