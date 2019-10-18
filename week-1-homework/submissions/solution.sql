--- 1. Which car has the highest accelerate value?





		select id from cars_data where accelerate in (select max(accelerate) from cars_data);


		select make from car_names where id in (307,403);


			 --- Answer = peugeot 504, vw pickup





--- 2. List the weight of the cars made in the 1980s (1980 and later).





		select weight from cars_data where year between 1980 and 1989;








 --- 3. List all the cars made by chevrolet (where the model is chevrolet).





		select make from car_names where model = "chevrolet";








 --- 4. What is the full name of the maker of the plymouth model?





		select full_name from car_makers where id = (select maker from models where name = "plymouth");








--- 5. Which continent is the Volvo car maker from?





		 select continent 


			from countries 


				where id = (select country from car_makers where maker = "volvo");





					--- content id = 2 





			select continent from continents where id = 2;





					--- Answer = Europ 





--- 6. How many car models are audi?





		select count(model) from car_names where model = "audi";


					--- Answer = 7





--- 7. List all makers whose names start with s.





			select maker from car_makers where maker like "s%";








--- 8. How many cars have a horsepower more than 100 but less than 200?





		select count(horsepower) from cars_data where horsepower > 100 and horsepower < 200;


								--- or


		select count(horsepower) from cars_data where horsepower between 101 and 199;





				--- Answer = 146








--- 9. List all car makers from australia.





		select maker from car_makers where country = (select id from countries where name = "australia");


					--- Answer = 0








--- 10. List all car makers not from sweden, japan, france or germany.





			select maker from car_makers where country not in (select id from countries where name in ("sweden","japan", "france", "germany"));





				--- Answer: amc, gm, ford, chrysler, fiat, triumph, kia,hyundai








                     ------  Bonus Question 


--- 1. List all cars where the make starts with an a and ends with an r.





		select * from car_names where make like "a%r";








--- 2. How many cars have more than 6 cylinders, weight less than 4000 but more than 3000, and was not made in the years 1970, 1975 or 1981.





		select count(cylinders) from cars_data where cylinders > 6 and weight between 3001 and 3999 and year not in (1970,1975,1981);


					--- Answer = 26
