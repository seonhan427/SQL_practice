--2021-04-29
-- database를 생성한다.

create database CafeManagement

use CafeManagement

--테이블 생성하기
create table 회원
(
-- 컬럼명, 자료형, 몇가지 규약
	회원id	char(13)	not null	
,	성별 char(1)	not null
,	선호메뉴1 smallint
,	선호메뉴2 smallint
)

select * from 회원

-- 테이블에 테이터 입력하기
--insert into 테이블이름
--values (넣을 값들)

insert into 회원 values ('010-4613-4487','M',1,2)

insert into 회원 (회원id,성별) 
values ('010-5398-9633','F')


insert into 회원 (성별,회원id) 
values ('F','010-1234-5678')

create table 메뉴
(
	메뉴ID smallint not null
,	대분류 char(1)	not null
,	소분류 nvarchar (8) not null
,	판매가격 int	not null
,	현재판매여부 tinyint not null
)
select * from 메뉴

insert into 메뉴
values (1,'A',N'아메리카노',3000,1)

create table 주문헤더
(
	주문번호 char(12) not null
,	주문회원ID char(13)	not null
,	현금결제액 int 
,	카드결제액 int
,	Npay결제액 int
,	주문일자 datetime not null
)

insert into 주문헤더
values ('202104290001','010-4613-4487',0,2000,1000,'2021-04-29 10:06:25')

select * from 주문헤더

create table 주문디테일
(
	주문번호 char(12) not null
,	주문별번호 tinyint	not null
,	메뉴ID	tinyint	not null
,	주문수량 tinyint not null
)

insert into 주문디테일
values('202104290001',1,1,1)

select * from 주문디테일

create table 대분류
(
	대분류ID char(1)	not null
,	대분류이름 nvarchar(5)	not null
)

insert into 대분류
values('A', N'커피류')

select * from 대분류


-- 삭제 명령어 delete

delete 대분류 

select * from 회원

delete 회원
where 회원id = '010-1234-5678'