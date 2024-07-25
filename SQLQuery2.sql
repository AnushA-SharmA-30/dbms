create database banking
use banking
create table branch(
bname varchar(10) primary key,
bcity varchar(10),
assets int
)
create table account(
accno int primary key,
bname varchar(10) references branch(bname),
balance decimal(10,2)
)
create table customer(
cname varchar(10) primary key,
cstreet varchar(10),
ccity varchar(10)
)
create table depositor(
cname varchar(10) references customer(cname),
accno int references account(accno),
primary key(cname,accno)
)
create table loan(
loanno int primary key,
bname varchar(10) references branch(bname),
amount decimal(10,2)
)
create table borrower(
cname varchar(10) references customer(cname),
loanno int references loan(loanno),
primary key(loanno,cname)
)
insert into branch values('sbi','udupi',2344.43)
insert into branch values('sbikarkala','karkala',312344.43)
insert into branch values('sbimang','manglore',3122344.43)
insert into branch values('icici','manglore',312344.43)
insert into branch values('canara','manipal',2344321.43)
insert into branch values('baroda','karkala',232344.43)
insert into branch values('karnataka','kundapura',42432344.43)

insert into account values(1,'sbi',73198.32)
insert into account values(2,'sbikarkala',3273198.32)
insert into account values(3,'sbimang',3273198.32)
insert into account values(4,'sbi',7323198.32)
insert into account values(5,'sbi',73123198.32)
insert into account values(6,'icici',73123198.32)

insert into customer values('anusha','hdj','wqed')
insert into customer values('gojo','hdj','wqed')
insert into customer values('byakuya','hdj','wqed')
insert into customer values('levi','hdj','wqed')
insert into customer values('rin','hdj','wqed')

insert into depositor values('anusha',1)
insert into depositor values('anusha',6)
insert into depositor values('anusha',3)
insert into depositor values('anusha',2)
insert into depositor values('gojo',2)
insert into depositor values('gojo',6)
insert into depositor values('gojo',3)
insert into depositor values('gojo',4)
insert into depositor values('levi',3)
insert into depositor values('levi',6)
insert into depositor values('byakuya',1)
insert into depositor values('byakuya',4)
insert into depositor values('rin',5)
insert into depositor values('rin',1)

insert into loan values(10,'sbi',234.98)
insert into loan values(11,'sbi',28734.98)
insert into loan values(12,'sbi',23487.98)
insert into loan values(13,'sbimang',25734.98)
insert into loan values(14,'sbikarkala',65234.98)

insert into borrower values ('anusha',10)
insert into borrower values ('gojo',11)
insert into borrower values ('rin',12)
insert into borrower values ('levi',13)
insert into borrower values ('byakuya',14)

select c.cname from account a,depositor d,customer c where a.bname='sbi' and a.accno=d.accno and d.cname=c.cname group by c.cname having count(*)>=2


select d.cname from depositor d,account a,branch b where b.bname=a.bname and a.accno=d.accno and bcity='manglore' group by d.cname having count(distinct a.bname)=(select count(bname) from branch where bcity='manglore')

select d.cname,count(distinct a.bname) as no_of_branches from depositor d,account a,branch b where b.bname=a.bname and a.accno=d.accno and bcity='manglore' group by d.cname having count(distinct a.bname)>=2

select top 1 count(a.accno) as maxacc,a.bname from account a,branch b where a.bname=b.bname and bcity='manglore' group by a.bname order by maxacc desc

select cname from branch,loan ,borrower  where loan.loanno=borrower.loanno and loan.bname=branch.bname and bcity='manglore' group by cname having count(loan.bname)>=1