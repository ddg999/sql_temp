use mydb;

drop table tb_user;
create table tb_user(
	user_id int auto_increment,
    username varchar(50) not null,
    password varchar(50) not null,
    primary key(user_id)
);

create table tb_user_details(
	details_id int auto_increment,
    user_id int unique,
    address varchar(100),
    phone_number varchar(15),
    email varchar(50),
	primary key(details_id),
    foreign key(user_id) references tb_user(user_id)
);

create table tb_team(
	team_id int auto_increment primary key,
	name varchar(50),
    found_year date
);

create table tb_player(
	player_id int auto_increment primary key,
	name varchar(50),
    age int,
    team varchar(20)
);

select * from tb_team;

insert into tb_team (name, found_year)
values	('롯데', '1975-05-06'),
		('해태', '1982-01-30'),
        ('기아', '2001-08-01'),
        ('넥센', '2008-03-24');

select * from tb_player;

insert into tb_player (name, age, team)
values	('홍길동', 30, '롯데'),
		('김부식', 21, '롯데'),
        ('나석주', 29, '해태'),
        ('박언신', 25, '넥센'),
        ('이성계', 19, '기아'),
        ('최치원', 27, '넥센');
		
