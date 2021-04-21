-- data type
-- 데이터 모델링을 위해서 
-- 1. 고객의 요구사항 파악
-- 2. 개념적 모델링. --> 개체 속성
-- 3. 논리적 모델링. --> 관계, 키값 도출
-- 4. 물리적 모델링. 

-- 특정 테이블의 정보조회
sp_help 'production.product'
int,  nvarchar,  smallint,  nchar,   datetime

--숫자(정수형)
--smallint
--int
--bigint

--문자
--char(10) - 여기들어가는 데이터는 문자형이고 10자리를 지정해줘
--varchar(10) - 여기들어가는 데이터는 문자형이고 0-10자리 지정해줘
--nchar
--nvarchar