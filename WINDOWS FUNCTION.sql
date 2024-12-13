-- window functions

select gender, avg(salary) over()
from employee_demographics dem
join employee_salary sal
	on dem. employee_id = sal. employee_id
    group by gender;


select dem.first_name,dem.last_name, gender, avg(salary) over(partition by gender)
from employee_demographics dem
join employee_salary sal
	on dem. employee_id = sal.employee_id;
    
    
    select dem.first_name,dem.last_name, gender, salary,
    sum(salary) over(partition by gender order by dem.employee_id) AS Rolling_total
from employee_demographics dem
join employee_salary sal
	on dem. employee_id = sal.employee_id;
    
    select dem.first_name,dem.last_name, gender, salary,
ROW_NUMBER() OVER(partition by GENDER order by salary DESC) AS row_num,
Rank() OVER(partition by GENDER order by salary DESC) AS rank_num,
dense_rank() OVER(partition by GENDER order by salary DESC) AS dense_rank_num

from employee_demographics dem
join employee_salary sal
	on dem. employee_id = sal.employee_id;