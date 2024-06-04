create database mydb;

use mydb;

create table student(
	student_id int,
    name varchar(50) not null, -- 동적으로 크기가 변함, 최대 50글자
    grade int not null,
    major varchar(50) not null
);

select * from student;
desc student;

-- 과목 테이블 생성
create table subject(
	subject_id int,
    subject_name varchar(50) not null,
    credit int not null, -- 학점
    department varchar(50),
    professor char(50) not null
);

select * from subject;
desc subject;

-- 이미 생성된 테이블에 기본키를 추가하는 방법
alter table student add primary key(student_id);
desc student;

-- 사전 기반 지식
-- 데이터가 들어가 있는 상태에서 빈 값이 포함되어 있다면
-- 기본키를 추가할 수 없다. 즉, NULL 값이 있어서는 안됨

alter table subject add primary key(subject_id);
desc subject;

-- 주문
-- order
-- row --> id : pk
-- 고객 주문 내용 - 문자
-- 상품 이름
-- 상품 가격
-- 수량

-- 예약어는 기본적으로 테이블 이름으로 쓸 수 없다
-- 하지만 강제적으로 `` 을 사용해서 테이블 이름이라고 명시할 수 있다.
create table `order`(
	id int primary key,
    price bigint,
    customer_order varchar(50),
    product_name varchar(20) not null,
    quantity int not null,
    order_date date not null
);
select * from `order`;
desc `order`;

-- 도전 과제 : 위 형식에 맞는 insert 를 진행하세요
insert into `order`(id, price, customer_order, product_name, quantity, order_date)
values (1,50000,'경비실호출','구찌',1,now()),
		(2,150000,'배송전연락바람','나이키',2,'20240529');
		(3,250000,'문앞에놓아주세요','돈가스',30,'20240527');

-- 도전 과제 1      
create table employee(
	id int primary key,
    name varchar(50) not null,
    age int,
    department varchar(50)
);
select * from employee;
desc employee;

-- 도전 과제 2
create table customer(
	id int,
    name varchar(50) not null,
    email varchar(50),
    address varchar(50) not null,
    primary key(id)
);
select * from customer;
desc customer;
