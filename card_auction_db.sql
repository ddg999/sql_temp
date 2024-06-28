drop database db_card_auction;
create database db_card_auction;
use db_card_auction;

create table user(
    name varchar(50) primary key,
    password varchar(50),
    nickname varchar(50),
    point int
);

create table card(
    id int auto_increment primary key,
    url varchar(100),
    name varchar(50),
    price int
);

create table auction(
    id int auto_increment primary key,
    name varchar(50),
    card_id int,
    bid_price int,
    start_date date,
    end_date date,
    foreign key(name) references user(name),
    foreign key(card_id) references card(id)
);

create table inventory(
	id int auto_increment primary key,
    name varchar(50),
    card_id int,
    foreign key(name) references user(name),
    foreign key(card_id) references card(id)
);


insert into user(name,password,nickname,point) 
    VALUES("a","a","a",50000);
insert into card (url,name,price) values
    ("image/card/card1.png","나오하",3000),
    ("image/card/card2.png","찬란한 개굴닌자",13000),
    ("image/card/card3.jpg","이상해꽃 ex",3000),
    ("image/card/card4.jpg","라이츄",40000),
    ("image/card/card5.jpg","리자몽 V",22000),
    ("image/card/card6.png","루카리오 ex", 26000),
    ("image/card/card7.jpg","레시라무 GX",18000),
    ("image/card/card8.jpg","마자용",1100),
    ("image/card/card9.png","파이리",600),
    ("image/card/card10.jpg","빠모",5000),
    ("image/card/card11.png","원석이니",7000000),
    ("image/card/card12.jpg","앱솔",10000),
    ("image/card/card13.jpg","루기아",13000),
    ("image/card/card14.jpg","피카츄",6000),
    ("image/card/card15.jpg","볼부비부비 피카츄",6000),
    ("image/card/card16.png","페로코체",17000),
    ("image/card/card17.jpg","글레이시아",12000),
    ("image/card/card18.png","뮤츠&뮤",27000),
    ("image/card/card19.png","염버니",600),
    ("image/card/card20.jpg","저승갓숭",14000),
    ("image/card/card21.jpg","싸리용",7000),
    ("image/card/card22.jpg","팽도리",6500),
    ("image/card/card23.png","모부기",7000),
    ("image/card/card24.png","에브이",20000),
    ("image/card/card25.png","비구슬",4000),
    ("image/card/card26.png","노고고치",14000),
    ("image/card/card27.jpg","나오하",6600),
    ("image/card/card28.jpg","로토무V",19000);

insert into auction(id,name,card_id,bid_price,start_date,end_date)
    values(1,"a",2,14000,"2024-06-18","2024-06-21"),
    (2,"a",3,5000,"2024-06-19","2024-06-22"),
    (3,"a", 10, 9900, "2024-06-23","2024-06-19"),
    (4,"a", 10, 9800, "2024-06-23","2024-06-08"),
    (5,"a", 10, 8800, "2024-06-24","2024-06-07"),
    (6,"a",5,24000,"2024-06-23","2024-06-03"),
    (7,"a",1,3500,"2024-06-01","2024-06-03"),
    (8,"a",4,42000,"2024-06-02","2024-06-08"),
    (9,"a",6,26000,"2024-06-12","2024-06-19"),
    (10,"a",7,19000,"2024-06-17","2024-06-17"),
    (11,"a",8,4000,"2024-06-19","2024-06-19"),
    (12,"a",11,"7000000","2024-06-20","2024-06-21");

insert into inventory (name,card_id) values
    ("a",1),
    ("a",2),
    ("a",11);

select * from user;
select * from card;
select * from auction;
select * from inventory;
update card set price = 7000 where id = 23;

