-- 사전 데이터 확인
use employees;

select * from employees;

select * from dept_manager
where to_date = '9999-01-01';

-- 직원 테이블에서 매니저인 사원을 출력하자
select *
from employees
where emp_no in (select emp_no from dept_manager where to_date = '9999-01-01');

-- FROM 절에 사용하는 인라인 뷰
-- 현재 다니고 있는 매니저들의 평균 연봉 구하기

select * from dept_manager where to_date = '9999-01-01';
select * from salaries where emp_no = 10001;

-- 한 직원의 평균 연봉, emp_no - group by 처리
select emp_no, avg(salary) as 평균연봉
from salaries as s
group by emp_no;

-- 조건 추가
select emp_no, 평균연봉
from (select emp_no, avg(salary) as 평균연봉
		from salaries as s
		group by emp_no) as avg_salary
where emp_no = 10001;

-- 인라인뷰, 중첩서브쿼리를 동시에 사용
select emp_no, 평균연봉
from (select emp_no, avg(salary) as 평균연봉
		from salaries as s
		group by emp_no) as avg_salary
where emp_no in (select emp_no from dept_manager where to_date = '9999-01-01');

-- 23847.66 비용 발생
-- 위와 결과 집합을 INNER JOIN 을 활용해서 만들어보자
select s.emp_no, avg(s.salary) as 평균연봉
from salaries s
join dept_manager m
on s.emp_no = m.emp_no and m.to_date = '9999-01-01'
group by s.emp_no;

-- 스칼라 서브 쿼리를 이용
-- 각 직원의 평균연봉 구하기
select emp_no as outer_emp_no, (select avg(salary)
								from salaries
                                where emp_no = outer_emp_no) as 평균연봉
from employees;
