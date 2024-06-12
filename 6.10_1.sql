create database mydb3;
use mydb3;

CREATE TABLE tb_student (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    class CHAR(1) NOT NULL,
    score INT NOT NULL
);
  
INSERT INTO tb_student (name, class, score) VALUES
('Alice', 'A', 85),
('Bob', 'B', 75),
('Charlie', 'A', 65),
('David', 'A', 70),
('Eve', 'B', 95),
('Frank', 'C', 88),
('Grace', 'C', 92),
('Hannah', 'B', 78),
('Ian', 'A', 85),
('Jill', 'C', 90);

-- 전체 조회
select * from tb_student;

-- 1단계 : 클래스 별로 그룹화 시켜보자.
select class, avg(score) as AVERAGESCORED
from tb_student
group by class;

-- 2단계 : 클래스별로 그룹화된 결과 집합에서 필터링 적용하기
-- having 절에 조건은 결과집이 먼저 생성된 후 기준으로 필터 조건을 설정해야 한다.
select class, avg(score) as 평균
from tb_student
group by class
having 평균 <= 80;

-- 문제
-- 각 클래스에서 가장 높은 점수와 가장 낮은 점수를 찾아보세요
select class, max(score) as 고득점, min(score) as 저득점
from tb_student
group by class
having 고득점 >= 93;


