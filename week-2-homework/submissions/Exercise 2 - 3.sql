--WORLD

--- 1. What is the population of the world ?

	SELECT sum(population) AS 'World Population'
	FROM country;

			--- result: '6078749450' 



2. What is the name and the population of the most populated city in India?

	select name, population from city 
	where population = (select max(Population) from city where countrycode = 'IND');

			---  Mumbai (Bombay) |   10500000


3. Find which countries do not have a capital.

	select name as 'Countries without Capital' from country where capital is null;
 
			--- |Antarctica                                   |
			---| French Southern territories                  |
			--- | Bouvet Island                                |
			--- | Heard Island and McDonald Islands            |
			--- | British Indian Ocean Territory               |
			--- | South Georgia and the South Sandwich Islands |
			--- | United States Minor Outlying Islands


--- 4. Which country has the lowest population? List all if more than one?
	
    SELECT name, population FROM country
    WHERE population = (SELECT min(population) FROM country);


--- 5. What are the names of all the cities in Vietnam?

	select code from country where name = 'Vietnam';
		--- Vietnam country code = VNM



--- 6. Find the average life expectancy per continent.

	select Continent, avg(LifeExpectancy) as 'Average Life Expectancy'
	from country group by Continent; 


--- 7. Find the name and population of each USA district.

	select District as 'USA Districts' , sum(Population) as 'Total Population' 
	from city where CountryCode = "USA" group by District order by district;


--- 8. Find the name of the cities that appear more than 2 times in the table.

select name,  count(*) as 'Nomber of appears in table' from city 
group by name 
having count(*) > 2;


--- 9. Find all the names of the districts in the Netherlands. (names should appear only once)

	SELECT DISTINCT city.district FROM city 
	JOIN country ON country.code = city.CountryCode 
	WHERE country.name = 'Netherlands' ;
    
    
    --IMDB
    
--- 1. Find the minimum and the maximum age of the actors per gender.

	select Gender, max(age) as ' Max Age', min(age) as 'Min Age'

	from actors group by gender;

--- 2. Find how many actors are in their 20’s, 30’s, 40’s, 50’s etc (grouped by decade).

	select floor(age/10)*10 as decades, count(age) 
    from actors group by decades order by decades;

--- 3. Print the names and biographies of the actors in this format “ANNE HATHAWAY BIO: 1 golden globe”

select concat(upper(fname),' ', upper(lname), ' ', 'BIO:',' ', biography) as 'Actors Name & Biography'
from actors;

---4. Find the names of the directors who have more than 2 films in the database.

	select Director, count(*) as 'Number of Films Directed' 
    from films group by director having count(*) > 2;
