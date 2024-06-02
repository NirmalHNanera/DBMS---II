
Create Table Person
(
	PersonID		int				Primary Key Identity (101, 1),
	PersonName		varchar(100)	Not Null,
	DepartmentID	int				Foreign Key References Department(DepartmentID),
	Salary			decimal(8, 2)	Not Null,
	JoiningDate		datetime		Not Null,
	City			varchar(100)	Not Null
)

Create Table Department
(
	DepartmentId	int				Primary Key Identity (1, 1),
	DepartmentName	varchar(100)	Not Null	Unique,
	DepartmentCode	varchar(50)		Not Null	Unique,
	Location		varchar(50)		Not Null
)


------- Records --------

Insert into Department Values ('Admin', 'Adm', 'A-Block')
Insert into Department Values ('Computer', 'CE', 'C-Block')
Insert into Department Values ('Civil', 'CI', 'G-Block')
Insert into Department Values ('Electrical', 'EE', 'E-Block')
Insert into Department Values ('Mechanical', 'ME', 'B-Block')


Insert into Person Values ('Rahul Tripathi', 2, 56000, '2000-01-01', 'Rajkot')
Insert into Person Values ('Hardik Pandya', 3, 18000, '2001-09-25', 'Ahmedabad')
Insert into Person Values ('Bhavin Kanani', 4, 25000, '2000-05-14', 'Baroda')
Insert into Person Values ('Bhoomi Vaishnav', 1, 39000, '2005-02-08', 'Rajkot')
Insert into Person Values ('Rohit Topiya', 2, 17000, '2001-07-23', 'Jamnagar')
Insert into Person Values ('Priya Menpara', Null, 9000, '2000-10-18', 'Ahmedabad')
Insert into Person Values ('Neha Sharma', 2, 34000, '2002-12-25', 'Rajkot')
Insert into Person Values ('Nayan Goswami', 3, 25000, '2001-07-01', 'Rajkot')
Insert into Person Values ('Mehul Bhundiya', 4, 13500, '2005-09-01', 'Baroda')
Insert into Person Values ('Mohit Maru', 5, 14000, '2000-05-25', 'Jamnagar')

-------------------------------------------------------------------------------------------------------

--1. Find all persons with their department name & code.
	Select Person.PersonName, Department.DepartmentName, Department.DepartmentCode
	From Person
	Inner Join Department
	on Person.DepartmentID = Department.DepartmentId



--2. Give department wise maximum & minimum salary with department name.
	Select Distinct Department.DepartmentName, Max(Salary) as Max_Sal, Min(Salary) as Min_Sal
	From Person
	Inner Join Department
	on Person.DepartmentId = Department.DepartmentID
	Group by Department.DepartmentName



--3. Find all departments whose total salary is exceeding 100000.
	Select Distinct Department.DepartmentName, Sum(Salary) as Total_Sal
	From Person
	Inner Join Department
	on Person.DepartmentId = Department.DepartmentID
	Group by Department.DepartmentName
	Having Sum(Salary) > 100000



--4. Retrieve person name, salary & department name who belongs to Jamnagar city.
	Select Person.PersonName, Person.Salary, Department.DepartmentName
	From Person
	Inner Join Department
	on Person.DepartmentID = Department.DepartmentId
	Where Person.City = 'Jamnagar'



--5. Find all persons who does not belongs to any department.
	Select *
	From Person 
	Where DepartmentID is Null



--6. Find department wise person counts.
	Select Distinct Department.DepartmentName, Count(*) as Num_of_Person
	From Person
	Inner Join Department
	on Person.DepartmentID = Department.DepartmentId
	Group by Department.DepartmentName



--7. Find average salary of person who belongs to Ahmedabad city.
	Select City, Avg(Salary) as Avg_Sal
	From Person
	Where City = 'Ahmedabad'
	Group by City



--8. Produce Output Like: <PersonName> earns <Salary> from department <DepartmentName> monthly.(In single column)
	Select Person.PersonName + ' earns ' + Convert(varchar(25), Person.Salary) + ' from Department ' + Department.DepartmentName + ' Monthly.'
	From Person
	Inner Join Department
	on Person.DepartmentID = Department.DepartmentId



--9. List all departments who have no persons.
	Select Department.DepartmentName
	From Person
	Inner Join Department
	on Person.DepartmentID = Department.DepartmentId
	Where Person.DepartmentId is Null



--10. Find city & department wise total, average & maximum salaries.
	Select Person.City, Department.DepartmentName, Sum(Salary) as Total_Sal, Avg(Salary) as Avg_Sal, Max(Salary) as Max_Sal
	From Person
	Inner Join Department
	on Person.DepartmentID = Department.DepartmentId
	Group by Person.City, Department.DepartmentName



--11. Display Unique city names.
	Select Distinct City
	From Person



--12. List out department names in which more than two persons.
	Select Department.DepartmentName, Count(*)
	From Person
	Inner Join Department
	on Person.DepartmentID = Department.DepartmentId
	Group by Department.DepartmentName
	Having Count(*) > 2



--13. Combine person name’s first three characters with city name’s last three characters in single column.\
	Select Left(PersonName, 3) + Right(City, 3) as Combine_Name
	From Person
	 


--14. Give 10% increment in Computer department employee’s salary.
	 Update Person 
	 Set Salary = (Salary + Salary * 0.1)



--15. Display all the person name’s who’s joining dates difference with current date is more than 365 days.
	Select PersonName, dateDiff(day, JoiningDate, getDate()) as Days
	From Person
	Where dateDiff(day, JoiningDate, getDate()) > 365
	