-- 6월 12일
-- 1조 
-- 문제 1
-- 가장 인원이 많은 부서의 매니저 이름을 출력하세요. db = employees
-- (정답 = first_name : Leon , last_name : DasSarma)
-- (퇴사한 매니저는 제외 && 퇴사 직원 제외)
-- (서브쿼리를 사용 안해도 가능)
-- select dm.dept_no, e.first_name, e.last_name
-- from dept_manager dm
-- join employees e on dm.emp_no = e.emp_no
-- where dept_no = (select de.dept_no
-- from employees e
-- join dept_emp de on e.emp_no = de.emp_no
-- where de.to_date = '9999-01-01'
-- group by de.dept_no
-- order by count(*) desc
-- limit 1) and dm.to_date = '9999-01-01';
select de.dept_no, count(*)
from employees e
left join dept_emp de on e.emp_no = de.emp_no
where de.to_date = '9999-01-01' -- and dm.to_date = '9999-01-01'
group by de.dept_no, ;

-- 문제 2 
-- 데이터베이스 db_denco_market 에서 '김범수' 고객의 최종합계금액을 조회하세요.

-- 분노하는 2조
-- (문제 : demo3에서 남성슬랙스, 여성면바지의 상품이름, 가격, 사이즈, 색상을 출력하시오 단, 서브쿼리를 쓰시오.)

-- 문제 2
-- 제일 비싼 상품을 가지고 있는 카테고리를 출력(카테고리 이름 + 상품 이름 + 가격 )  mydb3 의 tb_products, tb_categories 사용

-- 3조
-- 문제 1
-- 현재 근무 중인 직원들 중에 38년 이상 근무했으나 직급이 Staff이고 salary_standard가 Low인 직원만 출력해주세요.
-- (salary가 70000 이상이면 'High', 50000 이상이면 'Medium', 50000 미만이면 'Low'라고 표시하되 표기명은 salary_standard입니다.)
-- (단, 같은 직원일 경우 가장 높은 급여만 'max_salary'라는 표기로 출력해야 합니다.)


-- 문제 2. db sakila 에서
-- 각 언어 마다 몇개의 영화가 있는지 조회하라 (데이터상 모든 영화가 영어지만, 다른 언어가 0개 임을 표현해야함)

-- 4조
-- 부서 번호가 d009인 부서에서 재직중이며 매니저가 있는 직원을 조회하여라.(직원 번호, 이름, 부서명)
-- 단, 서브쿼리를 사용하여 departments 테이블의 dept_name에 담아서 출력하여라.

-- demo3 데이터베이스를 사용하여 색깔이 '퍼플' 인 남성복 셔츠의 정보를 조회하시오.
-- ( 서브쿼리 사용 )


-- 5조 
-- 현재 어느 부서의 매니저도 아닌 직원 중, 재직중이며 연봉이 100000이 넘는 직원을 조회하세요. (사원번호,first_name,last_name,연봉)
select e.emp_no, e.first_name, e.last_name, s.salary
from employees e
join salaries s on e.emp_no = s.emp_no
where s.salary > 100000 and s.to_date = '9999-01-01'
and e.emp_no not in (select emp_no from dept_manager where to_date = '9999-01-01');

-- 직원번호 10033 직원의 최고 연봉액과 근무일수를 구하시오


-- 6조

-- 문제 1. (demo3 DB 사용)
-- 남성 셔츠  여성 면바지 남성 슬랙스의 각자의 가격을 구하시오

-- 문제 2. (employees DB 사용)
-- 재직중이고 1995년 이후 입사한 Senior Engineer 직원이 가장 많은 부서 3개를 출력하세요