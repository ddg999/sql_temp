-- 테이블을 삭제하는 명령
-- drop table student;

-- 테이블 생성시 DEFAULT 값을 제약 설정하는 방법

create table student(
	student_id int primary key,
    name varchar(50) not null,
    grade int not null,
    major varchar(50) default '미정' not null
);
desc student;

-- 기본 문구 모양
-- INSERT INTO 테이블명 (컬럼명1, 컬럼명2, ...) VALUES (값1, 값2, ...);
-- INSERT INTO 테이블명 VALUES (값1, 값2, ...); -- 컬럼명 생략 가능

insert into student(student_id, name, grade, major)
values(1, '홍길동', 3, '컴퓨터공학과'); 

insert into student(student_id, name, grade)
values(2, '김철수', 1);

-- 컬럼명 생략
insert into student values(3, '이영희', 4, '경영학과');

select * from student;

-- 디폴트 제약을 사용했을 때 값을 넣는 방법 2
insert into student(student_id, name, grade, major)
values(4, '야스오', 2, default);

-- 데이터 삭제
-- delete from 구문을 사용할 때는 (실무) 반드시 필터를 걸자
-- delete from student where student_id = 4;
-- delete from student;

-- drop table `order`;

-- date 타입 형식을 사용할 때 연습
create table `order`(
	id int primary key,
    customer_order varchar(50),
    product_name varchar(20) not null,
    quantity int not null,
    order_date date not null
);

insert into `order` values(1, '빠른배송', '신라면', 2, '2024-05-30');
insert into `order` values(2, '느린배송', '신라면', 3, '20240530');

-- 오류가 발생하는 상황 보기
insert into `order` values(3, '아주느린배송', '신라면', 4, '2024530');
-- 1년은 12개월이기 때문에 13이 들어 갈 수 없다.
insert into `order` values(4, '너무느린배송', '신라면', 4, '20241330');

select * from `order`;

use employees;	
show tables;

select * from departments;
select * from employees limit 10;

select * from dept_emp;
select * from employees;
select * from departments where dept_no = 'd005';
select * from salaries where emp_no = 10002;
select * from titles;
