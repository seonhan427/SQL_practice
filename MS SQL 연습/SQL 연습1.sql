select *
from HumanResources.Employee

--1. humanresources schema의 employee 테이블에서 직원key, 로그인  id, 생년월일, 컬럼만 출력하시오.--
select BusinessEntityID, LoginID, BirthDate 
from HumanResources.Employee

-- 2. humanresources schema의 employee 테이블에서 1990년 1월 1일 이전 출생자중 성별이 남자인 직원은?--
select *
from HumanResources.Employee
where Gender = 'M' and BirthDate < '1990-01-01'

--3. 위 스키마에서 급여 형식이 월급(flag = 1) 이 아닌 직원은?--

select *
from HumanResources.Employee
where SalariedFlag != 1

-- 4. 위 스키마의 직원테이블에서 jobtitle이 'Quality Assurance Manager', 'Quality Assurance Supervisor', 'Quality Assurance Technician' 인 직원을 조회--

select *
from HumanResources.Employee
where JobTitle = 'Quality Assurance Manager' or JobTitle = 'Quality Assurance Supervisor'or JobTitle = 'Quality Assurance technician'

--5. 위 스키마의 Employee 테이블 데이터에서 Jobtitle이 'Chief'로 시작되는 직원을 조회

select *
from HumanResources.Employee
where JobTitle like 'Chief%'

-- 6. 위 스키마 동일 테이블에서 성별이 남자인 직원을 조회하세요. 단 생년월일을 역순으로 직업을 역순으로 정렬하세요--

select * 
from HumanResources.Employee
where Gender = 'M'
order by BirthDate, JobTitle desc 

-- 7. 위 스키마의 EmployeePayHistory 테이블에서 시급(rate)이 높은 순서대로 20명만 나오게 하세요. --

select top(20) * 
from HumanResources.EmployeePayHistory
order by Rate desc

