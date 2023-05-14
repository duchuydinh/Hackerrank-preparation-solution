/* Amber's conglomerate corporation just acquired some new companies.
Each of the companies follows this hierarchy: 

Given the table schemas below, write a query to print the company_code, founder name,
total number of lead managers, total number of senior managers, total number of managers,
and total number of employees. Order your output by ascending company_code.

Note:
The tables may contain duplicate records.
The company_code is string, so the sorting should not be numeric.
For example, if the company_codes are C_1, C_2, and C_10, then the ascending company_codes will be C_1, C_10, and C_2. */

select c.company_code, c.founder, count(distinct l.lead_manager_code), count(distinct s.senior_manager_code), count(distinct m.manager_code), count(distinct e.employee_code)
from company c
join lead_manager l on c.company_code=l.company_code
join senior_manager s on c.company_code=s.company_code and l.lead_manager_code=s.lead_manager_code
join manager m on m.company_code=c.company_code and m.lead_manager_code=l.lead_manager_code and m.senior_manager_code=s.senior_manager_code
join employee e on e.company_code=c.company_code and e.lead_manager_code=l.lead_manager_code and e.senior_manager_code=s.senior_manager_code and e.manager_code=m.manager_code
group by c.company_code, c.founder
order by c.company_code;

/* select c.company_code, c.founder, count(distinct e.lead_manager_code), 
count(distinct e.senior_manager_code), count(distinct e.manager_code), 
count(distinct e.employee_code) from company c 
join employee e on c.company_code = e.company_code group by c.company_code, c.founder order by c.company_code; */
