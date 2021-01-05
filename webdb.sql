--테이블 / 시퀀스 삭제
drop table guestbook;
drop SEQUENCE seq_no;

commit;
rollback;

--테이블 생성
create table guestbook(
    no number,
    name VARCHAR2(80),
    password VARCHAR2(20),
    content VARCHAR2(2000),
    reg_date date,
    PRIMARY KEY (no)
);

--시퀀스 생성
create SEQUENCE seq_no
  INCREMENT BY 1
  start with 1;
  
--출력
SELECT  no,
        name,
        password,
        content,
        reg_date
FROM guestbook;