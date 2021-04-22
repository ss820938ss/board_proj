select max(BOARD_NUM) from board;
select now() from dual;

INSERT INTO web_gradle_erp.board
(BOARD_NUM, BOARD_NAME, BOARD_PASS, BOARD_SUBJECT, BOARD_CONTENT, BOARD_FILE, BOARD_RE_REF, BOARD_RE_LEV, BOARD_RE_SEQ, BOARD_READCOUNT, BOARD_DATE)
VALUES(1, '김상건', '1111', '마칠시간', '5시', 'test.txt', 0, 0, 0, 0, '2021-03-03');

select * from board where BOARD_NUM = 26;

INSERT INTO web_gradle_erp.board
(BOARD_NUM, BOARD_NAME, BOARD_PASS, BOARD_SUBJECT, BOARD_CONTENT, BOARD_FILE, BOARD_RE_REF)
VALUES(1, '김상건', '1111', '마칠시간', '5시', 'test.txt', 0);

-- listcount
select count(*) from board;


-- list 페이징
/*
 *  [1][2][3]
 * 
 * (page -1) * 10 => 1 page 0, 2 page => 10, 3 page => 20
 */

select BOARD_NUM, BOARD_NAME, BOARD_PASS, BOARD_SUBJECT, BOARD_CONTENT
     , BOARD_FILE, BOARD_RE_REF, BOARD_RE_LEV, BOARD_RE_SEQ, BOARD_READCOUNT, BOARD_DATE
  from board
 order by BOARD_RE_REF desc, BOARD_RE_SEQ asc 
 limit 0, 10;

select BOARD_NUM, BOARD_NAME, BOARD_PASS, BOARD_SUBJECT, BOARD_CONTENT
     , BOARD_FILE, BOARD_RE_REF, BOARD_RE_LEV, BOARD_RE_SEQ, BOARD_READCOUNT, BOARD_DATE
  from board
 order by BOARD_RE_REF desc, BOARD_RE_SEQ asc 
 limit 1, 10;
 
-- read board
select * from board;

-- 조회수 증가
update board 
   set BOARD_READCOUNT = BOARD_READCOUNT + 1
 where BOARD_NUM = 23;

-- 글 삭제
select * from board where board_num = 23;

delete 
  from board
 where BOARD_NUM = 26;

select 1 from board where BOARD_NUM = 25 and BOARD_PASS = '234';

-- 수정
select BOARD_NUM, BOARD_NAME, BOARD_PASS, BOARD_SUBJECT, BOARD_CONTENT
     , BOARD_FILE, BOARD_RE_REF, BOARD_RE_LEV, BOARD_RE_SEQ, BOARD_READCOUNT, BOARD_DATE
  from board
where BOARD_NUM = 21;

update board 
   set BOARD_SUBJECT = 'aaa', BOARD_CONTENT = 'aaa'
 where BOARD_NUM = 22;


-- 답변
select * from board where BOARD_RE_REF = 23;


-- 23 글에 대한 답변
update board set BOARD_RE_SEQ = BOARD_RE_SEQ+1 
 where BOARD_RE_REF= 23 and BOARD_RE_SEQ > 0;

insert into board 
(BOARD_NUM, BOARD_NAME, BOARD_PASS, BOARD_SUBJECT, BOARD_CONTENT, BOARD_FILE, 
 BOARD_RE_REF, BOARD_RE_LEV, BOARD_RE_SEQ) 
values(26, '김상건?111', '1111', '6시', 'ggggg', '', 23, 1, 1);


select BOARD_NUM, BOARD_NAME, BOARD_PASS, BOARD_SUBJECT, BOARD_CONTENT
     , BOARD_FILE, BOARD_RE_REF, BOARD_RE_LEV, BOARD_RE_SEQ, BOARD_READCOUNT, BOARD_DATE
  from board
 order by BOARD_RE_REF desc, BOARD_RE_SEQ;
