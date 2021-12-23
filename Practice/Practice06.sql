-- 기존 SEQUENCE 삭제
drop sequence seq_book_id;
drop sequence seq_author_id;

-- 기존 테이블 삭제
drop table book;
drop table author;

-- SEQUENCE 생성
create sequence seq_book_id
increment by 1
start with 1
nocache;

create sequence seq_author_id
increment by 1
start with 1
nocache;

-- SEQUENCE 조회 --> 2개 생성되었는지 확인
select * from user_sequences;

-- author, book 테이블 생성
create table author(
    author_id       number(10),
    author_name     varchar2(100),
    author_desc     varchar2(200),
    primary key(author_id));
    
create table book(
    book_id         number(10),
    title           varchar2(100),
    pubs            varchar2(100),
    pub_date        date,
    author_id       number(10),
    primary key(book_id),
    constraint book_fk foreign key(author_id)
    references author(author_id));    

-- 테이블에 데이터 입력
-- author 테이블에 데이터 입력
insert into author
values(seq_author_id.nextval, '이문열', '경북 양양');

insert into author
values(seq_author_id.nextval, '박경리', '경상남도 통영');

insert into author
values(seq_author_id.nextval, '유시민', '17대 국회의원');

insert into author
values(seq_author_id.nextval, '기안84', '기안동에서 산 84년생');

insert into author
values(seq_author_id.nextval, '강풀', '온라인 만화가 1세대');

insert into author
values(seq_author_id.nextval, '김영하', '알쓸신잡');

-- book 테이블에 데이터 입력
insert into book
values(seq_book_id.nextval, '우리들의 일그러진 영웅', '다림', '1998-02-22', 1);

insert into book
values(seq_book_id.nextval, '삼국지', '민음사', '2002-03-01', 1);

insert into book
values(seq_book_id.nextval, '토지', '마로니에북스', '2012-08-15', 2);

insert into book
values(seq_book_id.nextval, '유시민의 글쓰기 특강', '생각의길', '2015-04-01', 3);

insert into book
values(seq_book_id.nextval, '패션왕', '중앙북스(books)', '2012-02-22', 4);

insert into book
values(seq_book_id.nextval, '순정만화', '재미주의', '2011-08-03', 5);

insert into book
values(seq_book_id.nextval, '오직두사람', '문학동네', '2017-05-04', 6);

insert into book
values(seq_book_id.nextval, '26년', '재미주의', '2012-02-04', 5);

-- 강풀의 author_desc를 '서울특별시'로 변경
update  author
set     author_desc= '서울특별시'
where   author_id= 5;

-- author 테이블에서 기안84 데이터를 삭제
delete from author
where       author_id= 4;

-- 최종출력
select  book_id "책번호", title "제목", pubs "출판사",
        to_char(pub_date, 'YYYY-MM-DD') "출판일", a.author_id "작가번호",
        author_name "작가이름", author_desc "작가설명"
from    book b, author a
where   b.author_id= a.author_id;



