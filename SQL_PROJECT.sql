-- Who are the top 10 earners in the organization

select emp.id,emp.first_name,emp.last_name,sal.salary
from employees emp
inner join salaries sal
on emp.id= sal.id
order by sal.salary desc
limit 10

-- What is employee count by job title
	
select t.name ,count(emp.id)
from titles t
inner join employees emp
on t.id=emp.title_id
group by t.name
order by count(emp.id)desc

-- What is the average salary by job title
	
select t.name,round(avg(sal.salary),2)
from titles t
inner join employees emp
on t.id=emp.title_id
inner join salaries sal
on emp.id=sal.employee_id
group by t.name
order by round(avg(sal.salary),2)desc

-- How are the employees distributed in the departments,what is the employee cound in each department
	
select dep.name,count(emp.id)
from departments dep
inner join employees emp
on dep.id=emp.department_id
group by dep.name
order by count(emp.id) desc
limit 10

-- What is the average salary by department
	
select dep.name, round(avg(sal.salary),0)
from departments dep
inner join employees emp
on dep.id=emp.department_id
inner join salaries sal
on emp.id= sal.id
group by dep.name
order by round(avg(sal.salary),0)desc
limit 10

-- Show employees with multiple salaries
	
select emp.id,emp.first_name ,emp.last_name,sal.salary
from employees emp
inner join salaries sal
on emp.id=sal.employee_id
where emp.id IN
(
	select employee_id from salaries
	group by employee_id
	having count(*) > 1
)
	
-- How has the average salary changed over time,and are there any notable trends
	
select extract(year from start_date)start_year,round(avg(salary),2)
from salaries
group by start_year
order by start_year






































