create database employee
use employee
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
