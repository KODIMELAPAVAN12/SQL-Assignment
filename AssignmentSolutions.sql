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

select * from employee;

select * from department;

select Empno,EmpName,Job from employee;

select Deptno,Dname from department;

select distinct job from employee;

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





