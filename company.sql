create table divyanshi.emp
(
 FName char(30),
 MName char(10),
 LName char(30),
 SSN numeric(20) primary key,
 BDate date,
 Address char(30),
 Sex char(6),
 Salary decimal,
 SuperSSN numeric references divyanshi.emp(SSN)
);

alter table divyanshi.emp add column DNO numeric references divyanshi.dept(Dnum) on update cascade on delete restrict;

create table divyanshi.dept
(Dnum numeric primary key,
 Dname char(100) unique,
 MGRSSN numeric references divyanshi.emp(SSN),
 MGDate date
);
alter table divyanshi.dept add column Dname char(20) unique;
create table divyanshi.dept_loc
(
DLocation char(50),
DNumber numeric references divyanshi.dept(Dnum),
primary key(DLocation,DNumber)
);
create table divyanshi.project
(
PNum numeric primary key,
PName char(50) unique,
PLocation char(100),
DNum numeric references divyanshi.dept(Dnum)
);

create table divyanshi.works_on
(
PNO numeric references divyanshi.project(PNum),
ESSN numeric references divyanshi.emp(SSN),
Hours decimal(4),
primary key(PNO,ESSN)
);

create table divyanshi.dependent
(
ESSN numeric references divyanshi.emp(SSN),
DependentName char(40),
Relationship char(10),
Bdate date,
Sex char(6)
);
