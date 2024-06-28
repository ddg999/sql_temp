use demo3;

-- 복합키 생성 방법 확인
create table 수강정보(
	학생ID int,
    과목코드 varchar(10),
    과목명 varchar(10),
    담당교수 varchar(10),
    primary key(학생ID, 과목코드)
);


-- 학생 수강 정보 테이블 만들기
create table 학생수강정보(
	학생ID int primary key,
    과목코드 varchar(10),
    foreign key(과목코드) references 과목정보(과목코드)
);

-- 과목 정보 테이블 만들기
create table 과목정보(
	과목코드 int primary key,
    과목명 varchar(10),
    담당교수 varchar(10)
);

drop table 학생수강정보;
drop table 과목정보;

desc 학생수강정보;
desc 과목정보;