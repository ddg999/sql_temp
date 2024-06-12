create database m_board;
use m_board;

-- User 테이블 명세서
create table user (
	id int primary key auto_increment,
    username varchar(100) not null unique,
    password varchar(255) not null,
    email varchar(100) not null,
    userRole varchar(20),
    createDate timestamp
);

-- Board 테이블 명세서
create table board (
	id int primary key auto_increment,
    userId int,
    title varchar(100) not null,
    content text,
    foreign key(userId) references user(id)
);

-- Reply 테이블 명세서
create table reply (
	id int primary key auto_increment,
    userId int,
    boardId int,
    content varchar(300) not null,
    createDate timestamp,
    foreign key(userId) references user(id) on delete set null,
    foreign key(boardId) references board(id)
);

INSERT INTO user (username, password, email, address, userRole, createDate)
VALUES
('홍길동', '1234', 'hong@example.com', '서울시 강남구', 'admin', NOW()),
('이순신', '1234', 'lee@example.com', '부산시 해운대구', 'user', NOW()),
('김유신', '1234', 'kim@example.com', '대구시 수성구', 'user', NOW());

-- 스키마 구조를 변경하는 쿼리 --- DDL, DML, DCL 
-- user 테이블에 address 컬럼을 추가해주세요 
alter table user add address varchar(100) not null;

desc board;
INSERT INTO board (userId, title, content, readCount)
VALUES
(1, '첫 번째 글입니다', '안녕하세요, 홍길동입니다. 이것은 테스트 게시글입니다.', 150),
(2, '이순신의 포스팅', '부산에서 이순신입니다. 바다가 아름다운 날입니다.', 45),
(3, '대구의 뜨거운 여름', '여름이 기승을 부리는 대구에서 김유신입니다.', 30);
alter table board add readCount int;

INSERT INTO reply (userId, boardId, content, createDate)
VALUES
(2, 1, '홍길동님의 글 잘 읽었습니다!', NOW()),
(3, 1, '저도 의견이 같네요.', NOW()),
(1, 2, '부산도 좋지만 서울도 좋아요!', NOW()),
(1, 3, '대구가 그렇게 덥군요, 조심하세요!', NOW());
