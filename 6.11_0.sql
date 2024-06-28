-- 1조 
-- 재직중인 사원들 중 평균 연봉이 가장 큰 3명의 first_name, 평균 연봉(소숫점 제거),부서, 근무 년수 을 추출하시오.
select e.first_name, round(avg(s.salary)) as 평균연봉, d.dept_name as 부서, (year(current_date())-year(e.hire_date)) as 근무년수
from salaries as s
left join employees as e
on s.emp_no = e.emp_no
left join dept_emp as de
on e.emp_no = de.emp_no
left join departments as d
on de.dept_no = d.dept_no
where de.to_date = '9999-01-01'
group by s.emp_no
order by avg(salary) desc
limit 3;

-- 전직원에게 생일 상여금 지급 하기로 하였다. 월별 지급해야할 인원수를 구하세요(퇴사자 제외 || 출력예시 월, 인원수)
select month(e.birth_date) as 월, count(*) as 인원수
from employees as e
left join dept_emp as de
on de.emp_no = e.emp_no
where de.to_date = '9999-01-01'
group by 월
order by 월 asc;

-- 노력하는 2조
-- 부서별 평균급여계산 후 60000보다 높으면 'High' 낮으면 'Low' (부서, 부서평균, 급여수준 ('High' or 'Low')) 부서평균은 내림차순, 소수점 제거 해라
-- 각 부서의 이름과 총 인원수를 출력하시오
select d.dept_name as 부서, round(avg(s.salary)) as 부서평균, case when avg(s.salary) > 60000 then 'High' else 'Low' end as 급여수준, count(*) as 인원수
from departments as d
left join dept_emp as de
on d.dept_no = de.dept_no
left join salaries as s
on de.emp_no = s.emp_no
where s.to_date = '9999-01-01' and de.to_date = '9999-01-01'
group by 부서
order by 부서평균 desc;

-- 3조
-- 문제 1. 직원들 개인의 입사 이후 현재까지의 평균 연봉을 구해서 80000이 넘는 사람들만 출력하라. (내림차순으로 상위 100명만)
-- 출력 예시 (emp_no, last_name, avg)
select e.emp_no, e.last_name, avg(s.salary) as 평균연봉
from salaries as s
left join employees as e
on s.emp_no = e.emp_no
group by e.emp_no
having 평균연봉 > 80000
order by 평균연봉 desc
limit 100;

-- 문제 2
-- 전체 평균 급여를 소수점 제외 도출하고 급여가 평균을 넘는 사원의 이름을 출력하세요.
select round(avg(salary))
from salaries
where to_date = '9999-01-01';

select e.first_name, e.last_name
from salaries as s
left join employees as e
on s.emp_no = e.emp_no
where s.to_date = '9999-01-01' and s.salary > 72012
group by s.emp_no;

-- 3조
-- 문제 1. 직원들 개인의 입사 이후 현재까지의 평균 연봉을 구해서 80000이 넘는 사람들만 출력하라. (내림차순으로 상위 100명만)
-- 출력 예시 (emp_no, last_name, avg)
select e.emp_no, e.last_name, avg(s.salary) as 평균연봉
from salaries as s
left join employees as e
on s.emp_no = e.emp_no
group by e.emp_no
having 평균연봉 > 80000
order by 평균연봉 desc
limit 100;

-- 문제 2
-- 전체 평균 급여를 소수점 제외 도출하고 급여가 평균을 넘는 사원의 이름을 출력하세요.
select round(avg(salary))
from salaries
where to_date = '9999-01-01';

select e.first_name, e.last_name
from salaries as s
left join employees as e
on s.emp_no = e.emp_no
where s.to_date = '9999-01-01' and s.salary > 72012
group by s.emp_no;

-- 4조 
-- 각 부서별 인원을 체크 하고 재직 인원이 제일 적은 순서로 부서를 세개 출력하시오
select d.dept_name as 부서, count(*) as 직원수
from departments as d
left join dept_emp as de
on d.dept_no = de.dept_no
where de.to_date = '9999-01-01'
group by d.dept_name
order by 직원수 asc
limit 3;

-- 각 부서의 남자 막내 사원들을 대상으로 워크숍이 예정되어 있습니다. 참석 여부를 조사하기 위해
-- 대상자를 구분하여 부서번호, 사번, 입사일, 성, 이름을 출력하시오.
select de.dept_no, e.emp_no, e.hire_date, e.first_name, e.last_name, max(e.birth_date)
from employees e
join dept_emp de
on e.emp_no = de.emp_no
group by de.dept_no;




-- 5조
-- 문제1. Engineer에서 Senior Engineer로 승진했던 직원의 직원 번호와 first_name last_name을 합친 이름을 출력하시오
-- 문제2. 근무하는 직원이 50000명 이상인 부서와 그 부서의 직원 수를 출력하세요.
select e.emp_no as 직원번호, concat(e.first_name, " ", e.last_name) as 이름
from titles t
left join employees e
on t.emp_no = e.emp_no
left join dept_emp de
on t.emp_no = de.emp_no
where t.title = 'Engineer' and t.to_date != '9999-01-01' and de.to_date = '9999-01-01';

select d.dept_name as 부서, count(*) as 직원수
from departments d
left join dept_emp de
on d.dept_no = de.dept_no
where de.to_date = '9999-01-01'
group by d.dept_name
having count(*) >= 50000;

-- 6조 
-- 마케팅 부서의 직원들을 입사 순서대로 오름차순 정렬하세요.
-- 출력해야 할 것: 직원의 이름, 고용일, 부서
-- 근무기간이 30년이상인 Staff 직원들중에서 emp_no낮은순서부터 200명 중에서 가장 오래된 근무년수는?

select e.first_name, e.last_name, e.hire_date, d.dept_name
from dept_emp de
join employees e
on de.emp_no = e.emp_no
join departments d
on de.dept_no = d.dept_no
where de.dept_no = 'd001'
order by e.hire_date asc;

select title,emp_no ,(year(current_date()) - year(from_date)) as 근무년수 
from titles
where to_date = '9999-01-01' and title = 'Staff'
having 근무년수 >= 30
order by 근무년수 desc
limit 200;