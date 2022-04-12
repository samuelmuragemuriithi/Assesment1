
                                                  --session2 queries
--SUBQUERY
SELECT ename,hire_date,salary
FROM Employment 
WHERE hire_date>='01-JAN-00'
and  salary=( select max(salAry)FROM Employment );


SELECT ename,hire_date,salary
FROM Employment
WHERE salary=(SELECT MAX(salary) FROM Employment) AND  hire_date> =DATE '2000-01-01' ;

INSERT INTO Employment VALUES( 5,'suzie',2,'01-JAN-00',65000);

--GROUPBY
SELECT dname,  MAX(salary)
FROM Employment e join dept1 d on d.did=e.did
GROUP BY dname;

SELECT dname,  MAX(salary)
FROM Employment e , dept1 d
WHERE d.did=e.did
GROUP BY dname;

--AGRAGATE FUNCTION
SELECT AVG(salary) "Average"
FROM Employment 
WHERE hire_date>'01-JAN-05'; 

SELECT COUNT(*)"COUNT",AVG(salary) "Average",MAX(salary)"SALARY"
FROM Employment ;

SELECT MAX(SALARY)
FROM EMPLOYMENT;
--HAVING
SELECT did
FROM Employment
GROUP BY did
HAVING COUNT(*)>2;

select did, count(*)
from Employment
where hire_date > date '2004-1-1'
group by did
having count(*) >= 2;

SELECT did
FROM Employment
GROUP BY did 
HAVING AVG(salary)>65000;

--JOIN
SELECT dname, AVG(salary)
FROM Employment e join dept1 d 
on e.did=d.did
GROUP BY dname;

SELECT dname, AVG(salary)
FROM Employment e , dept1 d 
where e.did=d.did
GROUP BY dname;

select dname, AVG(salary)
from employment e join dept1 d
using(did)
GROUP BY dname;

SELECT AVG(salary)
FROM Employment
WHERE did=2;


--INSERT VALUES FROM ANOTHER TABLE
create table new_emp(eid int primary key);
insert into new_emp
select eid
from Employment
where hire_date > date '2005-12-3';

SELECT *
FROM new_emp;

--UPDATE 
update Employment
set salary = salary + 1000
where ename = 'jeff';

update Employment
set salary = salary - 1000
where ename = 'jeff';

---DELETE FUNCTION
DELETE  FROM  Employment
WHERE hire_date=  date '2005-6-1';


--Return name of employees whose name start with j
select ename
from Employment
where ename like 'j%';

select ename
from Employment
where ename like '%e%';

-- add 1 year
select hire_date, hire_date + interval '1'year as hiredateplus1year
from Employment;
--- add 3 months
select hire_date, hire_date + interval '3'month 
from Employment;
-- add 1 year 3 months
select hire_date, hire_date + interval '1-3' year to month 
from Employment;

--Interval day to second data type
drop table emp2;
create table Emp2(eid int, hiredate date, lastlogin timestamp);
insert into Emp2 values (1, date '2002-1-1', timestamp '2006-1-1 09:00:30.00');
-- 1 day
select lastlogin, lastlogin + interval '1' day 
from emp2;
-- 1 hour 
select lastlogin, lastlogin + interval '1' hour
from emp2;
-- 1 minute
select lastlogin, lastlogin + interval '1' minute
from emp2;
-- 1 second
select lastlogin, lastlogin + interval '1' second
from emp2;

select lastlogin,lastlogin+interval '6' month
from emp2;
select lastlogin,lastlogin+interval '7' day
from emp2;
select lastlogin,lastlogin+interval '2:30' hour TO MINUTE
from emp2;

insert into dept1 values (3, ' ');
select did
from dept1 d
where d.dname=' ';

SELECT salary*12
 FROM Employment;


select *
from emp2;

SELECT
    * FROM dept1;

SELECT
    * FROM Employment;
    COMMIT;
    
                                                                                ---Udemy
 --creating table department
    CREATE TABLE department
(
  id	   		number(5) constraint pk_department primary key,
  name	   		varchar2(50),
  monthly_budget 	number(8,2),
  last_employee_id 	number(5)
);

--creating table employee
CREATE TABLE employee
(
  id        number(5) constraint pk_employee primary key,
  name      varchar2(50),
  birthdate date,
  phone     varchar2(20),
  salary    number(7,2) not null,
  department_id number(3) constraint fk_employee_department references department,
  hire_date date,
  job_id    varchar2(20),
  email     varchar2(50)
 );

-- inserting into table department
 insert into department values (1,'ACCOUNTING',20000,8);
 insert into department values (2,'MARKETING',15000,9);
 insert into department values (3,'INFORMATION TECHNOLOGY',30000,10);
 insert into department values (4,'HUMAN RESOURCES',25000,13);
 insert into department values (5,'REGULATORY AFFAIRS',5000,null);
 insert into department values (6,'CUSTOMER SERVICE',2000,null);

--inserting into table employee
 insert into employee values (1,'JOHN SMITH',date '1995-01-01','1.123.456.7890',4000.00,1,date '2015-03-28','AC_ACCOUNT','JSMITH');
 insert into employee values (2,'JAMES BOSH',date '1992-02-15','1.234.567.8901',3500.00,2,date '2014-07-01','MK_REP','JBOSH');
 insert into employee values (3,'LUISA JACKSON',date '1970-03-08','1.345.678.9012',4500.00,3,date '2013-08-29','IT_PROG','LJACKSON');
 insert into employee values (4,'STUART GARCIA',date '1965-04-12','1.456.789.0123',2000.00,4,date '2010-02-15','HR_REP','SGARCIA');
 insert into employee values (5,'JUSTIN BLACK',date '1990-05-16','1.567.890.1234',2550.00,1,date '2015-05-02','AC_ACCOUNT','JBLACK');
 insert into employee values (6,'ANGIE CROOD',date '1998-06-22','1.678.901.2345',1500.00,1,date '2015-07-01','AC_ACCOUNT','ACROOD');
 insert into employee values (7,'CHARLES DEAN',date '1973-06-08','1.789.012.3456',2250.00,3,date '2002-03-01','IT_PROG','CDEAN');
 insert into employee values (8,'EDDIE FARREL',date '1980-07-28','1.890.123.4567',3000.00,1,date '2009-04-20','AC_ACCOUNT','EFARREL');
 insert into employee values (9,'GEORGE HAYES',date '1982-08-03',NULL,2500.00,2,date '2012-09-22','MK_REP','GHAYES');
 insert into employee values (10,'IGOR KEYS OSBOURNE',date '1987-09-11','144.898.7564',6000.00,3,date '2014-11-14','IT_PROG','IKEYS');
 insert into employee values (11,'LUKE MINT',date '1985-10-19','1.123.456.7890',5000.00,4,date '2011-01-08','HR_REP','LMINT');
 insert into employee values (12,'NIGEL OAKS',date '1997-11-05','52.987.654.3210',4750.00,4,date '2014-10-01','HR_REP','NOAKS');
 insert into employee values (13,'LUKE GREEN JR',date '1995-02-05',NULL,4750.00,4,date '2015-09-01','HR_REP','LGREEN');

--creating table products 
CREATE TABLE products
  (
	Product_Id   NUMBER(5),
	Product_Name VARCHAR2(100),
	Price           NUMBER(8,2),
	Expiration_Date DATE
  ) ;

--adding primary key in table products
ALTER TABLE products ADD CONSTRAINT products_PK PRIMARY KEY ( Product_Id ) ;
 
-- inserting into table products
insert into products values (1,'Aspirin',5,date '2025-12-31');
insert into products values (2,'Penicillin',10,date '2026-04-30');
insert into products values (3,'Insulin',25,date '2026-05-31');
insert into products values (4,'Acetaminophen',5,date '2027-01-31');
insert into products values (5,'Amoxicillin',8,date '2026-07-31');
commit; 

      --(query1)products where price is less than 10 0r expiration date is greater than 2025-12-31
      SELECT*
      FROM products
     wherE price < 10
     OR expiration_date > DATE '2025-12-31';
     
     ---(query2) where products are greater than 2025-12-13  and price =25 or price =25
      SELECT *
     fROM products
    where expiration_date > DATE '2025-12-31'
     AND( price =5
     OR price= 25);
     
     --(query3)where mothlybudget is greater than or equal  20000 return name and budget
     select dname,monthly_budget
     from department
     where monthly_budget>=20000;
     --(quer4) where employees  in  accounting and marketing departments and earn less than 3000 , or  born b4 1985. return department table
     select *
     from employee
     where (job_id = 'MK_REP' or job_id='AC_ACCOUNT')and(salary<3000 or birthdate<'1-jan-1985' );
     
     select *
     from department;
     
     select*
     from employee;
     
    SELECT*
    FROM employee;
    
    ---(query5)order by clause
    select *
    from employee
    order by salary desc;
     
       select *
    from employee
    order by department_id,salary;
    
     select *
    from employee
    order by 6,5;
    
    --(query6)where phone number is 1
    select *
    from employee
    where phone='1';
    
     select *
    from employee
    where phone!='1';
    
     select *
    from employee
    where phone is null;
    
     select *
    from employee
    where phone is not null;
    
    --Understanding hundling nulls
    --(query7)salary greater than 4000
     select *
    from employee
    where salary > 4000 ;
    
    select *
    from employee
    order by phone nulls first;
    
    select 'phone:' || phone as phone
    from employee;
    
    --use of nvr
    ALTER TABLE EMPLOYEE ADD BONUS NUMBER;
    
    select salary,email,salary+nvl(salary,0) as total
    from employee;
    
    select name ,COALESCE(phone, email, 'no contact info')
    from employee;
    
    
    --New Table
CREATE TABLE company (
    id                  NUMBER(3) CONSTRAINT pk_company PRIMARY KEY,
    name                VARCHAR2(100) NOT NULL,
    commercial_contact  VARCHAR2(50),
    technical_contact   VARCHAR2(50),
    president           VARCHAR2(50),
    last_contacted      DATE,
    budget              NUMBER(8,2),
    budget_range_start  NUMBER(8,2) NOT NULL,
    budget_range_end    NUMBER(8,2) NOT NULL
);

INSERT INTO company (id,name,commercial_contact,president,budget_range_start,budget_range_end ) VALUES (1,'OUR BRILLIANT FUTURE LTD','LUISA JACKSON','JOHN SMITH',25000,50000);
INSERT INTO company (id,name,president,budget,budget_range_start,budget_range_end ) VALUES (2,'TESTING MAGIC','JUSTIN BLACK',35000,25000,50000);
INSERT INTO company (id,name,technical_contact,president,last_contacted,budget,budget_range_start,budget_range_end ) VALUES (3,'MAKING PROGRESS','ANGIE CROOD','CHARLES DEAN',DATE '2020-01-01',350000,125000,500000);
INSERT INTO company (id,name,commercial_contact,technical_contact,last_contacted,budget,budget_range_start,budget_range_end ) VALUES (4,'SKILL MASTERY','NIGEL OAKS','NIGEL OAKS',DATE '2020-02-15',12000,10000,24000);
INSERT INTO company (id,name,last_contacted,budget,budget_range_start,budget_range_end ) VALUES (5,'UNDECIDED AND CO.',DATE '2015-12-31',51000,51000,100000);
COMMIT;

--query to get a list of companies from the COMPANY table
    --return commercial contact  If we don’t have the commercial contact, 
    --then return the technical contact If we don’t have the technical contact,
    --return the president if we don’t have the president either, return ‘*NO CONTACT DATA*'
select name,
COALESCE(commercial_contact,technical_contact,president,'*NO CONTACT DATA*')as Contact_Name,
budget_range_start
from company;

    
                                                --Assignment on session 2
      --table 0 regions
      drop table regions;
      create  table regions
      (region_id      number,
      region_name  varchar(25),
       primary key (region_id)
      );
      --table 1 countries
      create table countries
      (country_id       CHAR(2) not null,
        country_name varchar(40),
        region_id         number,
        primary key (country_id),
        foreign key (region_id) references regions(region_id)
      );
      
      --table2 locations
      create table locations
      ( location_id        number,
       street_address  varchar(25),
       postal_code        varchar(25),
       city                     varchar(30),
       state_province   varchar(12),
       country_id          char(2),
       primary key (location_id),
         foreign key (country_id)references countries(country_id)
      );
   
      --table3 departments
      drop table departments;
      create table departments
      (department_id       number,
      department_name  varchar(30),
      manager_id            number,
      location_id             number,
      primary key (department_id),
      foreign key (location_id) references locations(location_id)
      );
      
      --table4 employees1
      drop  table employees1;
      create table  employees1
      (employee_id     number,
      first_name          varchar(20),
      last_name          varchar(25),
      email                  varchar(25),
      phone_number   varchar(20),
      hire_date            date,
      job_id                  varchar(10),
      salary                 number,
      commission_pct  number,
      manager_id         number,
      department_id     number,
      primary key (employee_id)
      );
        
        --alter table employees
      alter table  employees1 
    --  modify job_id varchar(10) references jobs(job_id) 
      modify department_id number references departments(department_id) ;  
      
      -- table 5 jobs
      drop table jobs;
      create table jobs
      (job_id     varchar(10),
      job_title     varchar(35),
      min_salary  number,
      max_salary    number,
      primary key(job_id)
      );
      commit;
      
      --Assesment
      --table(1) employee
      CREATE TABLE EMPLOYEE2
     ( EMPNO NUMBER(4) CONSTRAINT PK_WORKER PRIMARY KEY,
        ENAME                           VARCHAR2(10) not null,
        JOB                                VARCHAR2(9) ,
         GENDER                          CHAR(1),
         NATIONAL_IDENTITY_NO VARCHAR(10) UNIQUE,
        MGR                                    NUMBER(4),
        HIREDATE                             DATE,
        SAL                                       NUMBER(7,2),
        COMM                                   NUMBER(7,2),
        DEPTNO   NUMBER(2) CONSTRAINT FK_DEPTNUMBER REFERENCES DEPT,
         CONSTRAINT CHK_GENDER CHECK (GENDER in('M','F'))
     );
     
     --table2(admin)
     CREATE  TABLE ADMN  
     (    ADMNNO NUMBER(3) CONSTRAINT PK_ADMN PRIMARY KEY, 
          ADMN_NAME            VARCHAR(14) NOT NULL,
          ADMN_EMAIL           VARCHAR(255)UNIQUE,
          ADMN_LOC               VARCHAR(13),
          DEPTNO NUMBER(2) CONSTRAINT FK_DEPTNO1 REFERENCES DEPT
      );
      
      --2.DEPTNO is '20' and who joined in the year 1981
      select*
      from emp
      where deptno=20 and hiredate between date '1981-01-01' and  date '1981-12-31'; 
     
      SELECT * 
      FROM EMP 
      WHERE DEPTNO =20 AND HIREDATE LIKE '%81%';
      
      --*3.EMPNO ,ENAME,SALARY and  SAL + COMMISSION as total salary commission is not null and only for dept 30
      select EMPNO ,ENAME,SAL ,sal+comm as "total salary"
      from emp
      where comm is not null and deptno=30;
      
      --4.find the unique designations
      select distinct job from emp;
      
      --5.name, increased their salary by 50% in descending order.
      select ename,sal*1.5 "new salary"
      from emp
      order by sal desc ;
      
      select ename,SAL,sal+(SAL/2) as NEW_salary 
      from emp 
      order by sal Desc;
      
      --6.the min ,max, avg sal BY department job is 'SALESMAN' and'CLERK'
      select deptno,min(sal),max(sal),avg(sal)
      from emp 
      where job = 'SALESMAN' or  job ='CLERK'
      group by deptno;
      
      select DEPTNO, max(sal),min(sal),avg(sal) from emp WHERE JOB IN ('SALESMAN', 'CLERK')  GROUP BY DEPTNO ;
      
      --7.commission is null and joined in APRIL month. 
      select SUM(sal) "Total"
      from emp
      where comm is null and hiredate like '%APR%';
      
      --8.commission is more than their salary
      SELECT *
      FROM EMP
      where comm>sal;
      
      --9.salary exceeds 2000 after giving 10% increment.
      select sal*1.1,ename,sal
      from emp
      where (sal*1.1> 2000);
      
      --10.department total salary is grathan 10000.
      select deptno,sum(sal)
      from emp
      group by deptno
      having  sum(sal)>10000;
      
      --*11.employee experience in months till current month
   Select EMPNO,ENAME, HIREDATE, trunc( months_between(SYSDATE, HIREDATE)) as "EXPERIENCE IN MONTHS"
  from emp;
  
  --*11.employee experience in months till current month
   Select EMPNO,ENAME, HIREDATE, trunc( months_between(SYSDATE, HIREDATE)) as EXPERIENCE 
  from emp;
  
  --12.total salary department  number 10 and 30 commisson is null and salary less than or equal. to 1000
     SELECT sum(sal) as total_salary 
     FROM emp 
     where deptno in (10,30) and comm is null and sal<=1000;
     
     --13.write a SQL query to show $ at the begining and end of each emplyee name.
     select ename, '$'||ename||'$' as UPDATD_NAME from emp;
     
     --*14.display data from emp table whose joined in the month of may but not between year 82 to 88.
     Select *
     from emp
     where hiredate like '%MAY%' and hiredate between date '1982-1-1' and date  '1988-12-31';
     
    --15. display data from emp table whose names starts with 'A' and joined in the year '87'. 
    Select * from emp where ename like 'A%' and hiredate  like '%87';
    
    --16. write a query to show which job total salary is less than or equal to 5000;
    select *
    from emp
    where sal<= 5000;
    
    --17. write a query to display hire date in 'yyyy-mm-dd' format
    SELECT 
       to_char(hiredate,'yyyy-mm-dd')
FROM emp;
--18. write a query to replace null to '1' from comm filed .
select nvl(comm,1) as "New Commision"
    from emp;
    
--19.write a query to display  count of employees who's birthday fall in each month. 
    select count(*),hiredate
    from emp
    group by  hiredate;
 
    SELECT EXTRACT(MONTH FROM hiredate),count(*)
    from emp
    group by  EXTRACT(MONTH FROM hiredate);
   
    
--20. write a  query to insert new record in emplyee table with your name.
insert into emp values (2352,'Samuel','Analyst',1234,DATE '2022-4-1',83000,5000,20);

    
    

     
                                      ----ASSESSMENT--
      --1.                                
      
      select *
      from emp;
        select*
        from employee2;
        
        
      
      select *
      from employees1;
       
      SELECT
          * FROM department;
          
    
         
        SELECT
          * FROM employees;
         
          commit;
    