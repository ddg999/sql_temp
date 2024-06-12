create table tb_student(
	no int not null primary key,
	name varchar(20) not null,
    gender enum('F','M') not null,
    grade char(1),
    foreign key(grade) references tb_grade(grade)
);

create table tb_grade(
	grade char(1) primary key,
    score int
);

select * from tb_grade;
-- 테이블은 정보의 최소 단위이다.
insert into tb_grade values('A', 100);
insert into tb_grade values('B', 80);
insert into tb_grade values('C', 60);
insert into tb_grade values('D', 40);
insert into tb_grade values('E', 20);
insert into tb_grade values('F', 0);

select * from tb_student;
-- insert into tb_student(no, name, gender, age, grade)
-- values(100,'길동','F', 25,'B');

-- 스키마 구조 변경이 필요하다
alter table tb_student add column age int;
insert into tb_student(no, name, gender, age, grade)
values(100,'길동','F', 25,'B');
insert into tb_student(no, name, gender, age, grade)
values(200,'둘리','M', 25,'A');
insert into tb_student(no, name, gender, age, grade)
values(300,'마이콜','F', 15,'C');
insert into tb_student(no, name, gender, age, grade)
values(400,'야스오','M', 21,'B');
insert into tb_student(no, name, gender, age, grade)
values(500,'티모','F', 24,'A');

select * from tb_student;
desc tb_student;
-- JOIN 연산의 ON 절 사용 안해보기
-- 크로스 조인이 된다
select *
from tb_student
join tb_grade;

select *
from tb_grade
join tb_student;

-- 조인연산은 가능한 ON절과 함께 사용하자.
-- JOIN --> INNER JOIN, OUTER JOIN
-- INNER JOIN --> join

-- 1단계
select *
from tb_student
join tb_grade
on tb_student.grade = tb_grade.grade;

-- 2단계 (필요한 부분만 가져오기)
select s.no, s.name, s.grade, s.age, g.score
from tb_student as s
join tb_grade as g
on s.grade = g.grade;