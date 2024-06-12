use employees;
select * from departments;
select * from dept_emp;
select * from dept_manager;
select * from employees;
select * from salaries;
select * from titles;

-- 1조 문제 
-- 전직원 2000년도의 연봉을 출력하세요(출력 예시 :  id , firstname, lastname,slalary)
-- 'd004'  부서의 남자직원의 이름을 출력하세요 (출력예시 : firstname , M , 'd004' )

select e.emp_no, e.first_name, e.last_name, s.salary
from employees as e
left join salaries as s
on e.emp_no = s.emp_no
where s.from_date like '2000%';

select e.first_name, e.gender, d.dept_no
from employees as e
left join dept_emp as d
on e.emp_no = d.emp_no
where e.gender = 'M' and d.dept_no = 'd004';

-- 2조 문제
-- 각 직원의 정보를 확인하기 (직원번호, 생년월일, 이름, 성,부서번호, 부서명, 직업명)
-- 1990년 이상 입사자 이름과 급여 부서 직책

select e.emp_no, e.birth_date, e.first_name, e.last_name, e.gender, de.dept_no, d.dept_name
from employees as e
left join dept_emp as de
on e.emp_no = de.emp_no
left join departments as d
on de.dept_no = d.dept_no;

select e.first_name, e.last_name, s.salary, d.dept_name, t.title
from employees as e
left join salaries as s
on e.emp_no = s.emp_no
left join dept_emp as de
on e.emp_no = de.emp_no
left join departments as d
on de.dept_no = d.dept_no
left join titles as t
on e.emp_no = t.emp_no
where e.hire_date >= '1990-01-01' and s.to_date = '9999-01-01' and t.to_date = '9999-01-01';

-- 3조 문제
-- dept_emp 와 employees 테이블 에 모든 데이터를  emp_no를 기준으로 조인하여 조회
-- 단(employees의 birth_date가 '05'를 포함하고,성별은 '남성'일 경우)
-- 모든 마케팅 부서 직원의 이름을 조회

select *
from employees as e
left join dept_emp as d
on e.emp_no = d.emp_no
where e.birth_date like '%05%' and e.gender = 'M';

select e.first_name, e.last_name
from employees as e
left join dept_emp as d
on e.emp_no = d.emp_no
where d.dept_no = 'd001';

-- 4조 문제 
-- 아직 재직중인 사람의 이름과 성 직급 입사일자를 출력해 보자.
-- 부서 매니저들의 평균 연봉을 추출해 보자.

select e.first_name, e.last_name, t.title, e.hire_date
from employees as e
left join titles as t
on e.emp_no = t.emp_no
where t.to_date = '9999-01-01';

select d.dept_name, avg(s.salary)
from dept_manager as m
left join salaries as s
on m.emp_no = s.emp_no
left join departments as d
on d.dept_no = m.dept_no
where m.to_date = '9999-01-01' and s.to_date = '9999-01-01'
group by d.dept_name;

-- 5조 문제 
-- 문제1.  
-- 부서 매니저의 연봉이 100,000 달러 이상인 사람 확인하시오 (출력예시 : 사원번호,입사날짜,연봉) 
-- 문제2. 
-- 8월 15일에 고용한 직원들에게 태극기를 지급하기로 했다. 사원 번호, 고용 날짜와 last_name을 조회하시오

select e.emp_no, e.hire_date, s.salary
from employees as e
left join dept_manager as m
on e.emp_no = m.emp_no
left join salaries as s
on m.emp_no = s.emp_no
where s.salary >= 100000 and s.to_date = '9999-01-01';

select emp_no , hire_date, last_name
from employees
where hire_date like '%08-15';
 
-- 6조 문제 
-- 문제 1. 현재  재직중인 사람중 입사일이 1991-10-10 인 사람의 부서를 찾아주세요
-- 문제 2. 시니어 엔지니어의 월급중 6만달러가 넘는 사람이 몇명인지 찾아주세요.

select concat(e.first_name, ' ', e.last_name), d.dept_name, e.hire_date
from employees as e
left join dept_emp as detitles
on e.emp_no = de.emp_no
left join departments as d
on d.dept_no = de.dept_no
where e.hire_date = '1991-10-10' and de.to_date = '9999-01-01';

select t.emp_no, s.salary 
from titles as t
left join salaries as s
on t.emp_no = s.emp_no
where s.salary >= 60000 and t.title = 'Senior Engineer' and s.to_date = '9999-01-01';
