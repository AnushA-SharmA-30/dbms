create database emp1
use emp1
create table department(
dname varchar(10),
dno int primary key,
mgrssn varchar(10) 
)
create table employee(
name varchar(10),
ssn varchar(10) primary key,
bdate date,
superssn varchar(10),
salary decimal(10,2),
dno int references department(dno) on update cascade
)
create table dept_location(
dno int references department(dno) on update cascade,
dlocation varchar(10),
primary key(dno,dlocation)
)
create table project(
pname varchar(10),
pnum int primary key,
dnum int references department(dno) on update cascade
)
create table works_on(
ssn varchar(10) references employee(ssn),
pno int references project(pnum) on update cascade,
hours int,
primary key(ssn,pno)
)

insert into department values('sales',1,'nnm22')
insert into department values('research',2,'nnm23')
insert into department values('finance',3,'nnm24')

insert into employee values('anusha','nnm22','11-30-2004','nnm22',123143.34,1)
insert into employee values('pam','nnm23','12-30-2004','nnm23',2342.54,2)
insert into employee values('anusha','nnm24','11-30-2004','nnm24',32454.4,3)
insert into employee values('anusha','nnm25','11-30-2004','nnm24',32456632,3)
insert into employee values('anusha','nnm26','11-30-2004','nnm23',234567,2)
insert into employee values('anusha','nnm27','11-30-2004','nnm22',213456,1)
insert into employee values('fg','nnm28','11-30-2004','nnm22',23456,1)
insert into employee values('df','nnm29','11-30-2004','nnm23',23456,2)
insert into employee values('fggf','nnm30','11-30-2004','nnm22',765432,1)
alter table employee add foreign key(superssn) references employee(ssn)
alter table department add foreign key(mgrssn) references employee(ssn)

insert into dept_location values(1,'udupi')
insert into dept_location values(2,'manglore')
insert into dept_location values(3,'manipal')
insert into dept_location values(1,'manipal')
insert into dept_location values(2,'udupi')


insert into project values('abc',10,1)
insert into project values('dfc',11,2)
insert into project values('gdfgc',12,3)

insert into works_on values('nnm22',10,23)
insert into works_on values('nnm23',10,23)
insert into works_on values('nnm24',12,23)
insert into works_on values('nnm25',11,23)
insert into works_on values('nnm26',12,23)
insert into works_on values('nnm27',11,23)
insert into works_on values('nnm28',10,23)

select pno from works_on,employee where works_on.ssn=employee.ssn and name='anusha' union select pnum from project,department,employee where name='anusha' and mgrssn=ssn and project.dnum=department.dno

select name,salary as og_salary,salary+salary*0.1 as raise_salary from employee,project,works_on where pnum=pno and works_on.ssn=employee.ssn and pname='abc'
select sum(e.salary) as total_salary,max(e.salary) as max_salary,min(e.salary) as min_salary,avg(e.salary) as average_salary from employee e,department d where dname='sales' and d.dno=e.dno

select dno,count(*) as num_of_emps from employee where salary>30000 and dno in(select dno from employee group by dno having count(*)>2) group by dno 