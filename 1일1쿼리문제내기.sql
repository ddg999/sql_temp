use employees;
select * from departments;
select * from dept_emp;
select * from dept_manager;
select * from employees;
select * from salaries;
select * from titles;

-- 24.06.05
-- 1. 현재 근무중인 매니저들의 사번, 이름, 성별, 생년월일, 최근 급여를 나타내세요
select e.emp_no, e.first_name, e.last_name, e.gender, e.birth_date, s.salary
from employees as e
left join dept_manager as m
on e.emp_no = m.emp_no
left join salaries as sdept_emp
on e.emp_no = s.emp_no
where m.to_date = '9999-01-01' and s.to_date = '9999-01-01';

-- 2. 1965년생 중 영업팀에 일하고, 급여가 55000 이하인 사람의
-- 사번, 생년월일, 이름, 성별, 고용일, 최근 급여를 나타내세요
select e.emp_no, e.birth_date, e.first_name, e.last_name, e.gender, e.hire_date, s.salary
from employees as e
left join dept_emp as d
on e.emp_no = d.emp_no
left join salaries as s
on e.emp_no = s.emp_no
where e.birth_date like '1965%' and d.dept_no = 'd007' and s.salary < 55000 and s.to_date = '9999-01-01';

-- 24.06.07
-- 1. 현재 근무중인 근로자들의 직급(title)별 평균연봉을 나타내세요
-- 직급, 평균연봉(소수점 제외) 로 표시
select t.title as '직급', cast(avg(s.salary)as decimal(6)) as '평균연봉'
from titles as t
left join salaries as s
on t.emp_no = s.emp_no
where s.to_date = '9999-01-01' and t.to_date = '9999-01-01'
group by t.title;

-- 2. 마케팅부 30년차 근로자들 중 연봉이 80000 이상이면 O 아니면 X로 표기하세요
-- 이름(first_name + last_name), 년차, 연봉, 체크(O,X) 로 표시
select concat(e.first_name,' ',e.last_name) as '이름', (year(current_date())-year(e.hire_date))+1 as '년차', s.salary as '연봉',
	case when s.salary >= 80000 then 'O' else 'X' end as '체크'
from employees as e
left join salaries as s
on e.emp_no = s.emp_no
join dept_emp as d
on e.emp_no = d.emp_no
where d.dept_no = 'd001' and d.to_date = '9999-01-01' and s.to_date = '9999-01-01' and ((year(current_date())-year(e.hire_date))+1) = 30;

-- 24.06.10
-- 각 부서별 Staff수와 Staff의 평균연봉이 60000이하인 부서를 출력하세요
-- 칼럼 : 부서명, Staff수, Staff평균연봉 (단, 평균연봉은 소수점제외)
select d.dept_name as 부서명, count(*) as Staff수, round(avg(s.salary)) as Staff평균연봉
from departments as d
left join dept_emp as de
on d.dept_no = de.dept_no
left join titles as t
on de.emp_no = t.emp_no
left join salaries as s
on t.emp_no = s.emp_no
where de.to_date = '9999-01-01' and t.to_date = '9999-01-01'
and s.to_date = '9999-01-01' and t.title = 'Staff'
group by d.dept_name
having Staff평균연봉 <= 60000;

-- 24.06.11
-- 재직중이고 현재 연봉이 100000 이상인 직원수가 가장 많은 3개 부서를 출력하세요
-- 부서, 고소득직원수
select d.dept_name as 부서, count(*) as 고소득직원수
from salaries s
left join dept_emp de
on s.emp_no = de.emp_no
left join departments d
on d.dept_no = de.dept_no
where s.salary >= 100000 and s.to_date = '9999-01-01' and de.to_date = '9999-01-01'
group by d.dept_name
order by 고소득직원수 desc
limit 3;

-- 24.06.12
-- 2000~2001년에 Senior Engineer가 된 직원들의 평균연봉을 출력하세요
select 
from titles t
join dept_emp de
on t.emp_no = de.emp_no
where t.title = 'Senior Engineer' and t.to_date = '9999-01-01' and year(t.from_date) between 2000 and 2001;
group by year(t.from.date);

use employees;
select * from departments;
select * from dept_emp;
select * from dept_manager;
select * from employees;
select * from salaries;
select * from titles;
