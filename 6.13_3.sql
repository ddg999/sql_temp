create table 영화(
	영화ID int primary key,
	제목 varchar(20),
    감독 varchar(20),
    개봉년도 date,
    평점 double,
	관객수 int,
    매출액 varchar(20)
);

create table 배우(
	배우ID int primary key,
    이름 varchar(20),
    생년월일 date,
    키 double,
    몸무게 double
);

create table 출연(
	출연ID int primary key,
    영화ID int,
    배우ID int,
    foreign key(영화ID) references 영화(영화ID),
    foreign key(배우ID) references 배우(배우ID)
);
