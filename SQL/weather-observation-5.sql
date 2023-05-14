/* Query the two cities in STATION with the shortest and longest CITY names,
as well as their respective lengths (i.e.: number of characters in the name).
If there is more than one smallest or largest city,
choose the one that comes first when ordered alphabetically. */

select city, char_length(city) from station
where char_length(city) = (select min(char_length(city)) from station)
order by city asc
limit 1;

select city, char_length(city) from station
where char_length(city) = (select max(char_length(city)) from station);