--1
CREATE TABLE employee (
    Empno int,
    Empname varchar(255),
    Job varchar(255),
    Mgr int,
    HireDate Date,
    Salary int,
    Comm int,
    Deptno int
);

create table department (
Deptno int,
Dname varchar(255),
Loc varchar(255)
);

insert into employee(Empno,Empname,Job,Mgr,HireDate,Salary,Comm,Deptno)
values('325','Smith','Clerk','433','11-jan-95','3500','1400','20')

insert into employee(Empno,Empname,Job,Mgr,HireDate,Salary,Comm,Deptno)
values('825','James','Clerk','466','02-aug-81','2975',null,'20')

insert into employee(Empno,Empname,Job,Mgr,HireDate,Salary,Comm,Deptno)
values('433','James','Analyst','825','03-Dec-89','3500',null,'40')

insert into employee(Empno,Empname,Job,Mgr,HireDate,Salary,Comm,Deptno)
values('466','Mike','President',null,'18-nov-97','7000',null,'30')

insert into employee(Empno,Empname,Job,Mgr,HireDate,Salary,Comm,Deptno)
values('889','Adams','Manager','433','23-may-87','3250','0','10')

insert into employee(Empno,Empname,Job,Mgr,HireDate,Salary,Comm,Deptno)
values('435','Blake','Analyst','889','03-Dec-89','4500','0','40');



select * from employee;


insert into department(DeptNo,Dname,Loc)
values('10','Accounting','Chicago');
insert into department(DeptNo,Dname,Loc)
values('20','Research','Dallas');
insert into department(DeptNo,Dname,Loc)
values('30','Sales','NewYork');
insert into department(DeptNo,Dname,Loc)
values('40','Operations','Boston');
insert into department(DeptNo,Dname,Loc)
values('50','Purchase','Los Angeles');

--1)b
select * from employee;

select * from department;

select Empno,EmpName,Job from employee;

select Deptno,Dname from department;

select distinct job from employee;

--2
select Empname from employee 
where job='Analyst' and Salary > 2000;

select empno,Empname from employee 
where comm is null;

select Empname from employee 
where (job='Clerk' or job='Analyst' or job='Manager') and (Salary > 3000);

select Empname from employee 
where deptno=10 or deptno=20 or deptno=40 or job='Clerk' or job='Analyst';

select employee.Empname,employee.deptno,department.dname from employee,department
where employee.deptno=department.deptno and dname='Research';

select empname from employee
where empname like 'B%e'

select job from employee 
where deptno between 10 and 20;

select job from employee 
where not deptno=10;

select empname from employee
where (1.20*salary)>3000;

select empname from employee
where not job='Manager';

--3 DQL
select count(*) from employee;

select count(employee.empname) from employee,department
where department.deptno=employee.deptno and department.dname='Accounting';

select sum(salary) from employee;

select deptno,AVG(salary),max(salary),min(salary) from employee
group by deptno;

select deptno,AVG(salary),max(salary),min(salary) from employee
group by deptno
having count(empname) > 2;


select current_date;

select empname,sum(salary) from employee
group by empname;

--4 CLAUSES
select job,count(empname) from employee
group by job;

select job,sum(salary) from employee
group by job
having sum(salary) > 50000;

select empno,empname,deptno,salary from employee
order by empname,deptno,salary;

select empname,sum(salary) from employee
group by empname
order by sum(salary) desc;

--4)B
select empname from employee where salary=(select max(salary) from employee);

select empname from employee where salary>(select avg(salary) from employee);

select empname from employee where salary>(select salary from employee where deptno=30);

select empname from employee where salary>(select salary from employee e,department d  where e.deptno=d.deptno 
and d.dname='Sales');

select empname from employee where mgr in (select empno from employee where empname='James');

select empname from employee where mgr in (select empno from employee where empname='James')and salary>=(select avg(salary) from employee);

--5 JOINS
select e.empno,e.empname,e.deptno,d.dname from employee e,department d where e.deptno=d.deptno;

select e1.empname ename , e2.empname manager from employee e1,employee e2 where e1.mgr=e2.empno;

SELECT e1.empname FROM employee e1,employee e2 WHERE e1.empno=e2.mgr AND e1.deptno=e2.deptno;

select * from employee e1 left join department d1 on e1.deptno=d1.deptno;
select * from employee e1 right join department d1 on e1.deptno=d1.deptno;
select * from employee e1 full outer join department d1 on e1.deptno=d1.deptno;

--5)B
create table Cust_dtls (
cust_no int unique not null,
cust_name varchar(50) check (upper(cust_name)= cust_name),
cust_city varchar(20) check (cust_city like 'H%')
);
alter table employee add constraint PK_employee primary key (empno);

alter table employee alter column empname set not null;

alter table employee alter column comm set default 0;

alter table employee  add constraint FK_Employee foreign key (deptno) references department (deptno);

alter table employee add constraint FK_Employee  foreign key (mgr) references Employee (empno);

--all the constraints on the dept and emp table 
select * from pg_catalog.pg_constraint pc;

--Add and drop the constraints on Loc column of dept table that restricts the Loc column to have only unique values.
alter table department add constraint U_Loc unique(Loc);
alter table department drop constraint U_Loc;

--Disable the check constraint on cust_name column from cust_dtls table.
alter table cust_dtls drop constraint cust_dtls_cust_name_check;

--6)A DDL
--Add a new column to the dept table called Budget of size 10.
alter table department add column budget numeric(10);
--Modify the size of the Budget field to size 12 and add a default value of 5000.
alter table department alter column budget set data type numeric(12);
alter table department alter column budget set default 5000;

--Drop the employee table. (created by students and not the default table)
drop table employee;

--6)b DML
--Rename the department table as dept_details.
alter table department rename to dept_details;

--Delete the department with location NewYork.
delete from dept_details where loc like 'NewYork';

--Delete the records of all employees whose salary is below the average salary at the organization.
delete from employee where salary <(select avg(salary)from employee );

--Update the deptno and dname of dept table with values 70 and ‘Distribution’ where dname is ‘Sales’.
update dept_details set dname='Distribution' ,deptno =70 where dname like 'Sales';


