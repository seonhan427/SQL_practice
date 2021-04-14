select *
from HumanResources.Employee

--1. humanresources schema�� employee ���̺��� ����key, �α���  id, �������, �÷��� ����Ͻÿ�.--
select BusinessEntityID, LoginID, BirthDate 
from HumanResources.Employee

-- 2. humanresources schema�� employee ���̺��� 1990�� 1�� 1�� ���� ������� ������ ������ ������?--
select *
from HumanResources.Employee
where Gender = 'M' and BirthDate < '1990-01-01'

--3. �� ��Ű������ �޿� ������ ����(flag = 1) �� �ƴ� ������?--

select *
from HumanResources.Employee
where SalariedFlag != 1

-- 4. �� ��Ű���� �������̺��� jobtitle�� 'Quality Assurance Manager', 'Quality Assurance Supervisor', 'Quality Assurance Technician' �� ������ ��ȸ--

select *
from HumanResources.Employee
where JobTitle = 'Quality Assurance Manager' or JobTitle = 'Quality Assurance Supervisor'or JobTitle = 'Quality Assurance technician'

--5. �� ��Ű���� Employee ���̺� �����Ϳ��� Jobtitle�� 'Chief'�� ���۵Ǵ� ������ ��ȸ

select *
from HumanResources.Employee
where JobTitle like 'Chief%'

-- 6. �� ��Ű�� ���� ���̺��� ������ ������ ������ ��ȸ�ϼ���. �� ��������� �������� ������ �������� �����ϼ���--

select * 
from HumanResources.Employee
where Gender = 'M'
order by BirthDate, JobTitle desc 

-- 7. �� ��Ű���� EmployeePayHistory ���̺��� �ñ�(rate)�� ���� ������� 20�� ������ �ϼ���. --

select top(20) * 
from HumanResources.EmployeePayHistory
order by Rate desc

