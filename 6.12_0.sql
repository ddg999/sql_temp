-- 6월 11일 쿼리
-- 1조 
-- 재직중인 senior Engineer 들의 부서와 first_name 그리고 가장 최근 연봉을 출력하세요
select d.dept_name, e.first_name, s.salary
from employees e
join dept_emp de
on e.emp_no = de.emp_no
join departments d
on d.dept_no = de.dept_no
join titles t
on e.emp_no = t.emp_no
join salaries s
on e.emp_no = s.emp_no
where de.to_date = '9999-01-01' and t.title = 'Senior Engineer' and s.to_date = '9999-01-01'
group by e.emp_no;

-- 직급이 staff 인 직원의 평균 연봉을 구하세요
select avg(s.salary)
from titles t
join salaries s
on t.emp_no = s.emp_no
where t.title = 'Staff' and s.to_date = '9999-01-01';

-- 불쌍한 2조
-- 문제 1
-- 현직자 중 업종을 출력하고 업종별 임금 평균과 최대 임금을 출력하시오.
select d.dept_no, avg(s.salary), max(s.salary)
from salaries s
join dept_emp de
on s.emp_no = de.emp_no
join departments d
on de.dept_no = d.dept_no
where de.to_date = '9999-01-01' and s.to_date = '9999-01-01'
group by d.dept_no;

-- 문제 2
-- 각 직원(중복x)마다 부서와 직급을 구하라 (단, 오름차순,내림차순은 무시한다)
select de.emp_no, d.dept_name, t.title
from dept_emp de
join departments d
on de.dept_no = d.dept_no
join titles t
on de.emp_no = t.emp_no
where t.to_date = '9999-01-01' and de.to_date = '9999-01-01';

-- 3조
-- 생일에 입사한 사람을 모두 조회하라
-- 출력예시 employees.*
select *
from employees
where month(birth_date) = month(hire_date) and day(birth_date) = day(hire_date);

-- 낮은 번호대로 각 부서의 역대 매니저와 현 매니저의 수를 구하고 그 매니저들의 평균 급여를 구해라.
-- 출력 예시 - 부서 번호, 부서 이름, 인원수, 평균 급여
select d.dept_no as 부서번호, d.dept_name as 부서이름, count(*) as 인원수, avg(s.salary) as 평균급여
from dept_manager dm
join departments d
on dm.dept_no = d.dept_no
join salaries s
on dm.emp_no = s.emp_no and s.to_date = '9999-01-01'
group by d.dept_no;

-- 4조
-- 현재 재직중인 사람들의 부서 이름,소수점없는 평균연봉을 구하시오
select de.emp_no as 사번, d.dept_name as 부서이름, round(avg(s.salary)) as 평균연봉
from departments d
join dept_emp de
on d.dept_no = de.dept_no
join salaries s
on de.emp_no = s.emp_no
where de.to_date = '9999-01-1' and s.to_date = '9999-01-01'
group by de.emp_no;

-- 부서 이동이 있었던 사원의 사번, 부서번호, 성, 이름, 이동 전,후 부서의 소속 기간을 출력하시오.
select de.emp_no, de.dept_no, e.first_name, e.last_name, de.from_date, de.to_date,
case when de.to_date != '9999-01-01' then datediff(de.to_date, de.from_date) else datediff(now(),de.from_date) end as 근무일수
from dept_emp de
join employees e on de.emp_no = e.emp_no
join salaries s on de.emp_no = s.emp_no
where de.emp_no in (select emp_no from dept_emp where to_date != '9999-01-01') and s.to_date = '9999-01-01';

-- 5조 
-- 문제1. staff들 중 first_name이 Georgi인 동명이인을 찾고 나이가 많은 사람 순으로 정렬하시오.
-- (출력 : title, first_name, last_name, brith_date)
select t.title, e.first_name, e.last_name, e.birth_date
from employees e
join titles t on t.emp_no = e.emp_no
where e.first_name = 'Georgi' and t.title = 'Staff'
order by e.birth_date;

-- 문제2. 연봉이 10만 달러 이상인 사람의 사번, 이름, 성별, 직급을 출력하시오
select e.emp_no, e.first_name, e.last_name, e.gender, t.title
from employees e
join salaries s on e.emp_no = s.emp_no
join titles t on e.emp_no = t.emp_no
where s.salary >= 100000 and s.to_date = '9999-01-01' and t.to_date = '9999-01-01';

-- 6조
-- 문제1
-- 재직중이고 현재 연봉이 100000 이상인 직원수가 가장 많은 3개 부서를 출력하세요(부서, 고소득직원수)
select d.dept_name as 부서, count(*) as 고소득직원수
from salaries s
left join dept_emp de
on s.emp_no = de.emp_no
left join departments d
on d.dept_no = de.dept_no
where s.salary >= 100000 and s.to_date = '9999-01-01' and de.to_date = '9999-01-01'
group by d.dept_name
order by 고소득직원수 desc
limit 3;

-- 문제 2.
-- 부서중 직원수가 가장 많은 부서 하나만 찾아주세요(부서이름과, 직원 수 나오게)
select d.dept_name as 부서이름, count(*) as 직원수
from departments d
join dept_emp de on d.dept_no = de.dept_no
where de.to_date = '9999-01-01'
group by d.dept_name
limit 1;