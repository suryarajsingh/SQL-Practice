Create Database FISSQL

Create table Emp
(
	EmpNo int primary key,
	EName varchar(30) not null,
	Job varchar(30),
	MGRID int,
	HireDate date,
	Sal int,
	Comm int,
	DeptNo int,
	Foreign Key (DeptNo) references Dept(DeptNo)
)

insert into Emp values(7369, 'SMITH', 'CLERK', 7902, '17-DEC-80', 800, null, 20),
                      (7499, 'ALLEN', 'SALESMAN', 7698, '20-FEB-81', 1600, 300, 30), 
                      (7521, 'WARD', 'SALESMAN', 7698, '22-FEB-81', 1250, 500, 30),
					  (7566, 'JONES', 'MANAGER', 7839, '02-APR-81', 2975, null, 20),
                      (7654, 'MARTIN', 'SALESMAN', 7698, '28-SEP-81', 1250, 1400, 30), 
					  (7698, 'BLAKE', 'MANAGER', 7839, '01-MAY-81', 2850, null, 30),
                      (7782, 'CLARK', 'MANAGER', 7839, '09-JUN-81', 2450, null, 10), 
                      (7788, 'SCOTT', 'ANALYST', 7566, '19-APR-87', 3000, null, 20),
					  (7839, 'KING', 'PRESIDENT', NULL, '17-NOV-81', 5000, null, 10),
                      (7844, 'TURNER', 'SALSMAN', 7698, '08-SEP-81', 1500, null, 30),
                      (7876, 'ADAMS', 'CLERK', 7788, '23-MAY-87', 1100, null, 20),
					  (7900, 'JAMES', 'CLERK', 7698, '03-DEC-81', 950, null, 30),
					  (7902, 'FORD', 'ANALYST', 7566, '03-DEC-81', 3000, null, 20),
					  (7934, 'MILLER', 'CLERK', 7782, '23-JAN-82', 1300, null, 10)

Select * from Emp

create table Dept
(
	DeptNo int primary key,
	DName varchar(30),
	Loc varchar(50)
)

INSERT INTO Dept values(10, 'ACCOUNTING', 'NEW YORK'),
                       (20, 'RESEARCH', 'DALLAS'),
					   (30, 'SALES', 'CHICAGO'),
					   (40, 'OPERATIONS', 'BOSTON')

Select * from Dept

--Assignment 2

---Q1 Retrieve a list of MANAGERS. 

Select EName, EmpNo from Emp where EmpNo in(Select distinct(MGRID) from Emp) 

---Q2  Find out the names and salaries of all employees earning more than 1000 per Month

Select EName, Sal from Emp where Sal > 1000;

---Q3  Display the names and salaries of all employees except JAMES.

Select EName, Sal from Emp where EName != 'James';

---Q4 Find out the details of employees whose names begin with ‘S’. 

Select * from Emp where EName like 'S%'

---Q5 Find out the names of all employees that have ‘A’ anywhere in their name. 

Select * from Emp where EName like '%A%'

---Q6 Find out the names of all employees that have ‘L’ as their third character in their name. 

Select * from Emp where EName like '__L%'

---Q7 Compute daily salary of JONES. 

Select EName , Sal / 30 as 'Daily-Salary' from Emp where EName = 'JONES';

---Q8 Calculate the total monthly salary of all employees. 

Select sum(Sal) as 'Total Salary Paid' from Emp

---Q9 Print the average annual salary . 

Select avg(Sal*12) as 'Average yearly Salary' from Emp

---Q10 Select the name, job, salary, department number of all employees except SALESMAN from department number 30. 

Select Ename , Job , Sal , Deptno from Emp where EmpNo not in ( Select EmpNo from Emp where Job = 'SALESMAN' and DeptNo = 30);

---Q11  List unique departments of the EMP table. 

Select distinct(DeptNo) from Emp

---Q12 List the name and salary of employees who earn more than 1500 and are in department 10 or 30. Label the columns Employee and Monthly Salary respectively.

Select Ename as 'Employee' , Sal as 'Monthly Salary' from Emp where Sal > 1500 and Deptno not in (10,30)

---Q13 Display the name, job, and salary of all the employees whose job is MANAGER or 
---ANALYST and their salary is not equal to 1000, 3000, or 5000.

Select Ename , Job , Sal  from Emp where (Job = 'Manager' or Job = 'Analyst') and (Sal not in (1000,3000,5000))

---Q14  Display the name, salary and commission for all employees whose commission 
---amount is greater than their salary increased by 10%. 

Select Ename  , Sal , Comm from Emp where Comm > (Sal + Sal*.1)

---Q15  Display the name of all employees who have two Ls in their name and are in 
---Department 30 or their manager is 7782.

SELECT EName FROM Emp WHERE (EName LIKE '%l%l%' OR EName LIKE '%ll%') AND (DeptNo = 30 AND MgrID = 7782) ;

---Q16 Display the names of employees with experience of over 10 years and under 20 yrs.

SELECT EName  as 'Employee Name' FROM Emp WHERE  (YEAR(GETDATE()) - YEAR(HireDate))  between 10 and 20

---Q17 Retrieve the names of departments in ascending order and their employees in 
---Descending order.

SELECT D.DName, E.EName FROM Dept D INNER join Emp E on D.DeptNo = E.DeptNo Order by D.DName, E.Ename DESC

---Q18 Find out experience of MILLER. 

Select Ename, (YEAR(GETDATE()) - YEAR(HireDate) AS 'Experience' from Emp where EName = 'MILLER'