-- 유니코드 적용에 따른 길이와 데이터길이

select convert(nchar(10), '가나다라마바사아자차카타파하')

-- 다른 언어기반 sql 사용시에는 문자 앞에 대문자N을 사용!
select convert(nchar(10), N'가나다라마바사아자차카타파하')

-- 컬럼의 도메인에 따른 데이터 자료형을 선택한다.
 -- 날짜를 표현한다면 char를 쓰지말고 반드시 날짜형을 선택한다.
 -- 영어외의 언어가 입출력 된다면