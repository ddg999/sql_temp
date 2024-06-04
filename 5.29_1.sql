	-- 테이블 생성 PK/FK 개념

-- 데이터 집합 생성
create database db_tenco_market;

-- 사용 ( 왼쪽 스키마에서 더블클릭 하는 것과 같음 )
use db_tenco_market;

-- db 삭제 명령어
-- drop database db_tenco_market;

-- 사전 기반 지식 : mysql은 대소문자를 구별하지 않습니다.
-- 단, 구분 하는 RDBMS 도 있습니다.

-- 테이블 설계하기
-- 고객 테이블 생성
create table userTBL(
	userName char(3) not null primary key,
    birthYear int not null,
    addr char(2) not null,
    mobile char(12)
);

show tables;
select * from userTBL;
desc userTBL;

-- 구매 테이블 생성
create table buyTBL(
	id int not null auto_increment, -- 1씩 증가
    userName char(3) not null,
    prodName char(3) not null,
    price int not null,
    amount int,
    primary key(id),
    -- 어떤 table의 어떤 column을 참조하는지
    foreign key(userName) references userTBL(userName)
);

show tables;
select * from buyTBL;
desc buyTBL;