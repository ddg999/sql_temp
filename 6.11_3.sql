create table user (
	id int auto_increment primary key,
    username varchar(50) not null,
    email varchar(100) not null unique,
    password varchar(255) not null,
    address varchar(255),
    created_at timestamp default current_timestamp
);

create table product (
	id int auto_increment primary key,
    name varchar(100) not null,
    description text,
    price decimal(10, 2) not null,
    stock int default 0,
    created_at timestamp default current_timestamp
);

create table `order` (
	id int auto_increment primary key, -- 주문번호
    user_id int not null, -- 주문한 유저ID
    total_price decimal(10, 2) not null, -- 총 주문금액
    created_at timestamp default current_timestamp -- 주문시간
);

create table order_detail (
	id int auto_increment primary key, -- 주문 상세 id
    order_id int not null, -- 주문한 유저id
    product_id int not null, -- 주문한 상품id
	count int not null, -- 주문 수량
    price decimal(10, 2) not null, -- 주문 가격
    foreign key(order_id) references `order`(id),
    foreign key(product_id) references product(id)
);