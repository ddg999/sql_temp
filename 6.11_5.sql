-- 특정 사용자의 게시글 조회 (사용자 ID가 1인 홍길동의 모든 게시글을 보고 싶다면)
select b.title, b.content, b.readCount
from board b
where b.userId= 1;

-- 1번 게시글에 대한 모든 댓글 조회
select u.username, r.content, r.createDate
from reply r
left join user u on r.userId= u.id
where r.boardId = 1;

-- 게시글에 댓글 달기
-- 예를 들어, 사용자 id 2가 게시글 id 1에
-- "새로운 댓글입니다" 라는 내용의 댓글을 추가하려면 다음 쿼리를 사용합니다.
insert into reply (userId, boardId, content, createDate)
values (2, 1, '새로운 댓글입니다', now());

-- 특정 사용자의 게시글, 해당 게시글의 댓글 수 조회
-- 제목, 내용, 작성자명, 댓글 수
select b.title, b.content, u.username , count(r.id)
from user u
left join board b
on u.id = b.userId
left join reply r
on r.boardId = b.id
group by b.id;

-- 조회수가 가장 높은 게시글 상위 2개만 조회
select title, content, readCount
from board
order by readCount desc
limit 2;
