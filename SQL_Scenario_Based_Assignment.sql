--Q1 Write a query to fetch the details of the books written by author whose name ends with er.

Create Table Books
(
	ID Int Primary Key,
	Title Varchar(40),
	Author Varchar(20),
	ISBN Varchar(20),
	Published_Date Date
)

Insert Into Books Values(1, 'My First SQL Book', 'Mary Parker', '981483029127', '2012-02-22'),
					    (2, 'My Second SQL Book', 'John Mayer', '857300923713', '1972-07-03'),
					    (3, 'My Third SQL Book', 'Cary Flint', '523120967812', '2015-10-18')

Select * From Books Where Author like '%er'

--Q2 Display the Title, Author and ReviewerName for all the books from the above table

Create Table Reviews
(
	ID Int primary Key,
	Book_ID Int,
	Reviewer_Name Varchar(30),
	Content Varchar(30),
	Rating int,
	Published_Date Date
)

Insert Into Reviews Values(1, 1, 'John Smith', 'My first Review', 4, '2017-12-10'),
						  (2, 1, 'John Smith', 'My Second Review', 5, '2017-10-13'),
						  (3, 2, 'Alice Walker', 'Another Review', 1, '2017-10-22')

Select Auth.Title, Auth.Author, Re.Reviewer_Name From Books Auth
Inner Join Reviews Re On Auth.ID = Re.Book_ID

--Q3 Display the  reviewer name who reviewed more than one book.

Select Reviewer_Name From Reviews Group By Reviewer_Name Having Count(Reviewer_Name) > 1

--Q4 Display the Name for the customer from above customer table  who live in same address which has character o anywhere in address

Create Table Customer
(
	ID Int Primary Key,
	Name Varchar(30),
	Age Int,
	Address varchar(30),
	Salary Int
)

Insert Into Customer Values(1, 'Ramesh', 32, 'Ahmedabad', 20000),
						   (2, 'Khilan', 25, 'Delhi', 1500),
						   (3, 'Kaushik', 23, 'Kota', 2000),
						   (4, 'Chaitali', 25, 'Mumbai', 6500),
						   (5, 'Hardik', 27, 'Bhopal', 8500),
						   (6, 'Komal', 22, 'MP', 4500),
						   (7, 'Muffy', 24, 'Indore', 10000)
						
Select Name from Customer Where Address In(Select Address From Customer Group By Address Having Count(*) > 1) And Address Like '%o%'

--Q5 Write a query to display the Date, Total no of customer placed order on same Date

Create Table Orders
(
	OID Int Primary Key,
	Date Date,
	Customer_ID Int,
	Amount Int,
	Foreign Key (Customer_Id) References Customer(ID)
)

Insert Into Orders Values(102, '2009-10-08 00:00:00', 3, 3000),
						 (100, '2009-10-08 00:00:00', 3, 1500),
						 (101, '2009-11-20 00:00:00', 2, 1560),
						 (103, '2008-05-20 00:00:00', 4, 2060)

Select Date, Count(Date) From Orders Group By Date

--Q6 Display the Names of the Employee in lower case, whose salary is null.

Create Table Employees(
	ID Int Primary Key,
	Name Varchar(50) Not Null,
	Age Int,
	Address Varchar(80),
	Salary Int
)

Insert Into Employees Values(1, 'Ramesh', 32, 'Ahmedabad', 2000),
							(2, 'Khilan' , 25, 'Delhi', 1500),
							(3, 'kaushik' , 23, 'Kota', 2000),
							(4, 'Chaitali' , 25, 'Mumbai', 6500),
							(5, 'Hardik' , 27, 'Bhopal', 8500),
							(6, 'Komal' , 22, 'MP', Null),
							(7, 'Muffy' , 24, 'Indore', Null)

Select Lower(Name) From Employees Where Salary Is Null

--Q7 Write a sql server query to display the Gender,Total no of male and female from the above relation


Create Table StudentDetails 
(
	RegisterNo Int Primary Key,
	Name Varchar(30),
	Age Int,
	Qualification Varchar(20),
	MobileNo Varchar(20),
	Mail_Id Varchar(20),
	Location Varchar(20),
	Gender Char
)

insert into StudentDetails values(1, 'Sai', 22, 'B.E', '9952836777', 'Sai@gmail.com', 'Chennai', 'M'),
							 	 (2, 'Kumar', 20, 'BSC', '7890125648', 'Kumar@gmail.com', 'Madurai', 'M'),
								 (3, 'Selvi' , 22, 'BTech', '8904567342', 'Selvi@gmail.com', 'Selam', 'F'),
								 (4, 'Nisha', 25, 'ME', '7834672310', 'sha@gmail.com', 'Theni', 'F'),
								 (5, 'SaiSaran', 21, 'BA', '7890345678', 'SaiSaran@gmail.com', 'Madurai', 'F'),
								 (6, 'Tom', 23, 'BCA', '890234675', 'Tom@gmail.com', 'Pune', 'M')

Select Gender, Count(Gender) As Total From StudentDetails Group By Gender

--Q8 Retrieve the CourseName and the number of student registered for each course between 2018-01-02 and 2018-02-28 and arrange the result by courseid in descending order

Create Table CourseDetails
(
	C_ID Varchar(10) Primary Key,
	C_Name Varchar(30),
	Start_Date Date,
	End_Date Date,
	Fee Int
)

Insert Into CourseDetails Values('DN003', 'DotNet', '2018-02-01', '2018-02-28', 15000),
								('DV004', 'DataVisualization', '2018-03-01', '2018-04-15', 15000),
								('JA002', 'AdvancedJava', '2018-01-02', '2018-01-20', 10000),
								('JC001', 'CoreJava', '2018-01-02', '2018-01-12', 3000)

Create Table CourseRegistration
(
	RegisterNo Int,
	CID Varchar(10),
	Batch Varchar(5),
	Primary Key(RegisterNo , CID),
	Foreign Key(RegisterNo) References StudentDetails(RegisterNo),
	Foreign Key(CID) References CourseDetails(C_ID)
)

Insert Into CourseRegistration Values(2, 'DN003', 'FN'),
									 (3, 'DV004', 'AN'),
									 (4, 'JA002', 'FN'),
									 (2, 'JA002', 'AN'),
									 (5, 'JC001', 'FN')

Select C_Name , Count(B.RegisterNo) , Start_Date From CourseDetails A
INNER join CourseRegistration B
On A.C_ID = B.CID
Group By C_Name , B.RegisterNo , Start_Date
Having Start_Date Between '2018-01-02' And '2018-02-28'

--Q9 Display the Firstname and LastName of the customer who have placed exactly 2 orders


Create Table Customerr
(
	Customer_ID Int Primary Key,
	First_Name Varchar(20),
	Last_Name Varchar(20)
)

Insert Into Customerr Values(1, 'George', 'Washington'),
							(2, 'John', 'Adams'),
							(3, 'Thomas', 'Jefferson'),
							(4, 'james', 'Madison'),
							(5, 'James', 'Monroe')

Create Table Orderr
(
	Order_ID Int Primary Key,
	Order_Date Date,
	Amount Int,
	Customer_ID Int,
	Foreign Key (Customer_ID) References Customerr(Customer_ID)
)

Insert Into Orderr Values(1, '07/04/1776', 170, 1),
						 (2, '07/04/1776', 100, 1),
						 (3, '05/04/1779', 200, 2),
						 (4, '07/04/1774', 200, 3),
						 (5, '05/04/1777', 135, 4),
						 (6, '05/04/1772', 150, 5)


Select A.Customer_ID , First_Name from Customerr A
Inner Join Orderr B
On A.Customer_ID = B.Customer_ID
Group By A.Customer_ID , First_Name
Having Count(A.Customer_ID) = 2

--Q10 Display all the student name in reverse order and Capitalize all the character in location

Select  Reverse(Name) As StudentsName , Upper(Location) As Location From StudentDetails;

--Q11 Create a view table to display the ProductName,ordered Quantity and OrderNumber from the above relations

Create Table Order1
(
	ID Int Primary Key,
	OrderDate Date,
	OrderNumber Int,
	CustomerID Int,
	TotalAmount Int
)

Create Table Product(
	ID Int Primary Key,
	ProductName Varchar(30),
	SupplierID Int,
	UnitPrice Int,
	Package Int,
	IsDiscontinued Char
)

Create Table OrderItem
(
	ID Int Primary Key,
	OrderID Int,
	ProductID Int,
	UnitPrice Int,
	Quantity Int,
	Foreign Key(OrderID) References order1(ID),
	Foreign Key(ProductID) References Product(ID)
)

--CREATE VIEW Viewtable(ProductName, Order_Quantity, OrderNumber)
--As Select ProductName, Quantity, OrderNumber From Product A, OrderItem B, Order1 C
--As Select Quantity From OrderItem
--As Select OrderNumber From Order1
--drop view Viewtable
--Inner Join OrderItem 
--On C.id = B.OrderID
--Inner Join Product 
--On A.ID = B.ProductID

Create View ViewTable(OrderNumber, ProductName, Ordered_Qunatity)
As select OrderNumber, ProductName, Quantity From Order1 A
Inner Join OrderItem B On A.ID = B.OrderID
Inner Join Product C On C.ID = B.ProductID

Drop Table Product
Drop Table Order1
Drop Table orderitem

Select * From ViewTable

--Q12  Display the Course Name registered by student  Nisha


Select Name , C_Name From CourseRegistration
Inner Join StudentDetails
On CourseRegistration.RegisterNo = StudentDetails.RegisterNo
Inner Join CourseDetails
On CourseDetails.C_ID = CourseRegistration.CID 
Where Name = 'Nisha'
