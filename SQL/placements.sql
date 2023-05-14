/* You are given three tables: Students, Friends and Packages.
Students contains two columns: ID and Name.
Friends contains two columns: ID and Friend_ID (ID of the ONLY best friend).
Packages contains two columns: ID and Salary (offered salary in $ thousands per month).

Write a query to output the names of those students whose best friends got offered a higher salary than them.
Names must be ordered by the salary amount offered to the best friends.
It is guaranteed that no two students got same salary offer. */

with tb1 as (select f.id, f.friend_id, p.salary from friends f join packages p on f.friend_id = p.id)
select s.name from students s
join packages p on s.id = p.id
join tb1 t on s.id = t.id
where t.salary > p.salary
order by t.salary;

/*
select s.name
from students s
join packages p1 on s.id = p1.id
join friends f on s.id = f.id
join packages p2 on f.friend_id = p2.id
where p2.salary > p1.salary
order by p2.salary; */
