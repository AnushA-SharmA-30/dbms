create database student
use student
create table department(
dept_id int primary key,
dept_name varchar(20)
)
create table student(
usn varchar(10) primary key,
name varchar(20),
dob date,
gender varchar(1),
dept_id int references department(dept_id)
)
create table course(
course_id int primary key,
course_title varchar(10),
credits int,
dept_id int references department(dept_id)
)
create table gradereport(
usn varchar(10) references student(usn),
course_id int references course(course_id),
mse1 decimal(4,2),
mse2 decimal(4,2),
task decimal(4,2),
see decimal(4,2),
total decimal(5,2),
primary key(usn,course_id)
)
create table class(
sem int,
sec varchar(1),
usn varchar(10) references student(usn),
primary key(usn)
)
insert into department values(1,'ise')
insert into department values(2,'cse')
insert into department values(3,'cce')
insert into department values(4,'ece')

select *from department

insert into student values('nnm22','byakuya','11-30-2004','M',1)
insert into student values('nnm23','kenpachi','3-14-2003','M',2)
insert into student values('nnm24','ichigo','6-23-2004','M',3)
insert into student values('nnm25','rukia','11-30-2004','F',4)
insert into student values('nnm26','gin','12-30-2004','M',4)
insert into student values('nnm27','harribel','4-11-2004','F',3)
insert into student values('nnm28','nel','8-4-2004','F',2)
insert into student values('nnm29','shunsui','11-30-2004','M',1)
select *from student

insert into course values(20,'DS',3,1)
insert into course values(21,'IDS',4,2)
insert into course values(22,'IWP',2,3)
insert into course values(23,'IDT',1,4)
insert into course values(24,'DBMS',3,1)

insert into gradereport values('nnm22',20,18,18,4,45,null)
insert into gradereport values('nnm22',21,18,18,4,45,null)
insert into gradereport values('nnm22',22,19,16,3,23,null)
insert into gradereport values('nnm22',23,6,13,7,42,null)
insert into gradereport values('nnm22',24,2,16,7,49,null)



insert into gradereport values('nnm23',21,20,18,5,45,null)
insert into gradereport values('nnm24',22,18,11,8,24,null)
insert into gradereport values('nnm25',23,18,18,4,23,null)
insert into gradereport values('nnm26',24,14,18,4,13,null)
insert into gradereport values('nnm27',21,8,8,4,34,null)
select *from gradereport
update gradereport set total=mse1+mse1+task+see
insert into class values(2,'A','nnm22')
insert into class values(3,'B','nnm23')
insert into class values(4,'C','nnm24')
insert into class values(4,'A','nnm25')
insert into class values(5,'D','nnm26')
insert into class values(3,'B','nnm27')
insert into class values(4,'A','nnm28')
insert into class values(4,'A','nnm29')
select student.usn,name,dob,gender from student,class where student.usn=class.usn and sem='4' and sec='A'
select sem,sec,count(case when gender='F' then 1 END) as female_count,count(case when gender='M' then 1 END) as male_count from student,class where student.usn=class.usn group by sem,sec
create view mse1_marks as 
select mse1,c.course_id,course_title from gradereport,student,course c where student.usn=gradereport.usn and student.usn='nnm22' and c.course_id=gradereport.course_id
select *from mse1_marks