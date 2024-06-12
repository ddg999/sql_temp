create database b_demo1;
use b_demo1;

create table 직원 (
	직원ID int auto_increment primary key,
    직원이름 varchar(100) not null,
    부서 varchar(30) not null,
    지역 varchar(10) not null
);

INSERT INTO 직원 (직원ID, 직원이름, 부서, 지역) VALUES
(1000, '김철수', '영업', '부산'),
(1001, '박영희', '마케팅', '부산'),
(1002, '이민지', '인사', '서울'),
(1003, '최민수', '디자인', '서울'),
(1004, '야스오', '디자인', '서울');

select * from 직원;
desc 직원;

-- 이상현상을 방지하고자 테이블을 분리해보자
create table tb_departments(
	부서ID int auto_increment primary key,
    부서명 varchar(30) not null,
    지역 varchar(10) not null
);

create table tb_employees(
	직원ID int auto_increment primary key,
    직원이름 varchar(100) not null,
    부서ID int,
    foreign key(부서ID) references tb_departments(부서ID)
);

select * from tb_departments;
select * from tb_employees;

INSERT INTO tb_departments (부서명, 지역) VALUES
('영업', '부산'),
('마케팅', '부산'),
('인사', '서울'),
('디자인', '서울');

INSERT INTO tb_employees (직원이름, 부서ID) VALUES
('김철수', 1),
('박영희', 2),
('이민지', 3),
('최민수', 4),
('야스오', 4);

drop table tb_departments;
drop table tb_employees;
select * from tb_departments;
select *
from tb_employees as e
left join tb_departments as d
on e.부서ID = d.부서ID;

-- 마케팅 부서의 이름을 HR로 수정해주세요
update tb_departments set 부서명 = 'HR' where 부서명 = '마케팅';



