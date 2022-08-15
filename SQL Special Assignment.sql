--~~~~~~~~~~~~~~~~~~~~ . . . CREATE COMMAND . . . ~~~~~~~~~~~~~~~~~~~~

Create Table Clients
(
	Client_ID Int Primary Key,
	Cname Varchar(50) Not Null,
	Addresses Varchar(80),
	Email Varchar(40) Unique,
	Phone_No Varchar(30),
	Business Varchar(50) Not Null
)

Create Table Departments
(
	DeptNo Int Primary Key,
	DName Varchar(30) Not Null,
	Loc Varchar(80)
)

Create Table Employees(
	EmpNo Int Primary Key,
	Ename Varchar(50) Not Null,
	Job Varchar(50),
	Salary Int Check (Salary >= 0),
	DeptNo int,
	Foreign Key (DeptNo) References Departments(DeptNo)
)

Create Table Projects
(
	Project_Id Int Primary Key,
	Descr Varchar(30) Not Null,
	Start_Date Date,
	Planned_End_Date Date,
	Actual_End_Date Date ,
	Budget Int Check (Budget >= 0),
	Client_id int,
	Foreign Key (Client_id) References Clients(Client_id)
)

Create Table EmpProjectTasks
(
	Project_Id Int,
	EmpNo Int,
	Start_Date Date,
	End_Date Date,
	Task Varchar(25) Not Null,
	Status Varchar(15) Not Null,
	Primary Key(Project_ID, EmpNo),
	Foreign Key(Project_Id) References Projects(Project_Id),
	Foreign Key(EmpNo) References Employees(EmpNo)
)

--~~~~~~~~~~~~~~~~~~~~ . . . INSERT COMMAND . . . ~~~~~~~~~~~~~~~~~~~~

Insert Into Clients Values(1001, 'ACME Utilities', 'Noida', 'contact@acmeutil.com', 9567880032,'Manufacturing' ),
						  (1002, 'Trackon Consultants', 'Mumbai', 'consult@trackon.com' , 8734210090, 'Consultant'),
						  (1003, 'MoneySaver Distributors', 'Kolkata', 'save@moneysaver.com', 7799886655, 'Reseller'),
						  (1004, 'Lawful Corp', 'Chennai', 'justice@lawful.com', 9210342219, 'Professional')

Insert Into Departments Values(10, 'Design', 'Pune' ) , 
							  (20, 'Development', 'Pune'),
							  (30, 'Testing', 'Mumbai'),
							  (40, 'Document', 'Mumbai')

Insert Into Employees Values(7001, 'Sandeep', 'Analyst', 25000, 10),
							(7002, 'Rajesh', 'Designer', 30000, 10),
							(7003, 'Madhav', 'Developer',40000, 20),
							(7004, 'Manoj', 'Developer', 40000, 20),
							(7005, 'Abhay', 'Designer', 35000, 10),
							(7006, 'Uma', 'Tester', 30000, 30),
							(7007, 'Gita', 'Tech.Writer', 30000, 40),
							(7008, 'Priya', 'Tester', 35000, 30),
							(7009, 'Nutan', 'Developer', 45000,20),
							(7010, 'Smita',  'Analyst', 20000, 10),
							(7011, 'Anand', 'Project Mgr', 65000, 10)

Insert Into Projects Values(401, 'Inventory', '01-Apr-11', '01-Oct-11', '31-Oct-11' , 150000, 1001),
					       (402, 'Accounting', '01-Aug-11', '01-Jan-12', Null, 500000, 1002),
						   (403, 'Payroll', '01-Oct-11', '31-Dec-11', Null, 75000, 1003),
						   (404, 'Contact Mgmt', '01-Nov-11', '31-Dec-11', Null, 50000, 1004)

Insert Into EmpProjectTasks Values(401, 7001, '01-Apr-11', '20-Apr-11', 'System Analysis', 'Completed'),
							   	  (401, 7002, '21-Apr-11', '30-May-11', 'System Design', 'Completed'),
								  (401, 7003, '01-Jun-11', '15-Jul-11', 'Coding', 'Completed'),
								  (401, 7004, '18-Jul-11', '01-Sep-11', 'Coding', 'Completed'),
								  (401, 7006, '03-Sep-11', '15-Sep-11', 'Testing', 'Completed'),
								  (401, 7009, '18-Sep-11', '05-Oct-11', 'Code Change', 'Completed'),
								  (401, 7008, '06-Oct-11', '16-Oct-11', 'Testing', 'Completed'),
								  (401, 7007, '06-Oct-11', '22-Oct-11', 'Documentation', 'Completed'),
								  (401, 7011, '22-Oct-11', '31-Oct-11', 'Sign Off', 'Completed'),
								  (402, 7010, '01-Aug-11', '20-Aug-11', 'System Analysis', 'Completed'),
								  (402, 7002, '22-Aug-11', '30-Sep-11', 'System Design','Completed'),
								  (402, 7004, '01-Oct-11', Null, 'Coding', 'In Progress')

--~~~~~~~~~~~~~~~~~~~~ . . . SELECT COMMAND . . . ~~~~~~~~~~~~~~~~~~~~

Select * From Clients
Select * from Departments
Select * from Employees
Select * from projects
Select * from EmpProjectTasks

--~~~~~~~~~~~~~~~~~~~~ . . . DROP COMMAND . . . ~~~~~~~~~~~~~~~~~~~~

DROP table Clients
DROP table Departments
DROP table Employees
DROP Table projects
DROP Table EmpProjectTasks

