--2021-04-29
-- database�� �����Ѵ�.

create database CafeManagement

use CafeManagement

--���̺� �����ϱ�
create table ȸ��
(
-- �÷���, �ڷ���, ��� �Ծ�
	ȸ��id	char(13)	not null	
,	���� char(1)	not null
,	��ȣ�޴�1 smallint
,	��ȣ�޴�2 smallint
)

select * from ȸ��

-- ���̺� ������ �Է��ϱ�
--insert into ���̺��̸�
--values (���� ����)

insert into ȸ�� values ('010-4613-4487','M',1,2)

insert into ȸ�� (ȸ��id,����) 
values ('010-5398-9633','F')


insert into ȸ�� (����,ȸ��id) 
values ('F','010-1234-5678')

create table �޴�
(
	�޴�ID smallint not null
,	��з� char(1)	not null
,	�Һз� nvarchar (8) not null
,	�ǸŰ��� int	not null
,	�����Ǹſ��� tinyint not null
)
select * from �޴�

insert into �޴�
values (1,'A',N'�Ƹ޸�ī��',3000,1)

create table �ֹ����
(
	�ֹ���ȣ char(12) not null
,	�ֹ�ȸ��ID char(13)	not null
,	���ݰ����� int 
,	ī������� int
,	Npay������ int
,	�ֹ����� datetime not null
)

insert into �ֹ����
values ('202104290001','010-4613-4487',0,2000,1000,'2021-04-29 10:06:25')

select * from �ֹ����

create table �ֹ�������
(
	�ֹ���ȣ char(12) not null
,	�ֹ�����ȣ tinyint	not null
,	�޴�ID	tinyint	not null
,	�ֹ����� tinyint not null
)

insert into �ֹ�������
values('202104290001',1,1,1)

select * from �ֹ�������

create table ��з�
(
	��з�ID char(1)	not null
,	��з��̸� nvarchar(5)	not null
)

insert into ��з�
values('A', N'Ŀ�Ƿ�')

select * from ��з�


-- ���� ��ɾ� delete

delete ��з� 

select * from ȸ��

delete ȸ��
where ȸ��id = '010-1234-5678'