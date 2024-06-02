
Create Table Employee(
	EID int,
	EName varchar(100),
	Gender varchar(10),
	JoiningDate datetime,
	Salary decimal(8,2),
	City varchar(100)
)


-------------- Records ------------------ 

Insert into Employee Values (1, 'Nick', 'Male', '01-Jan-13', 4000, 'London')
Insert into Employee Values (2, 'Julian', 'Female', '01-Oct-14', 3000, 'New York')
Insert into Employee Values (3, 'Roy', 'Male', '01-Jun-16', 3500, 'London')
Insert into Employee Values (4, 'Tom', 'Male', Null, 4500, 'London')
Insert into Employee Values (5, 'Jerry', 'Male', '01-Feb-13', 2800, 'Sydney')
Insert into Employee Values (6, 'Philip', 'Male', '01-Jan-15', 7000, 'New York')
Insert into Employee Values (7, 'Sara', 'Female', '01-Aug-17', 4800, 'Sydney')
Insert into Employee Values (8, 'Emily', 'Female', '01-Jan-15', 5500, 'New York')
Insert into Employee Values (9, 'Michale', 'Male', Null, 6500, 'London')
Insert into Employee Values (10, 'John', 'Male', '01-Jan-15', 8800, 'London')

--------------------------------------------------------------------------------------------



--1. Display all the employees whose name starts with “m” and 4 th character is “h”.
	Select *
	From Employee
	Where EName like 'm__h%'



--2. Find the value of 3 raised to 5. Label the column as output.
	Select Power(3, 5)



--3. Write a query to subtract 20 days from the current date.
	Select getDate() - 20



--4. Write a query to display name of employees whose name starts with “j” and contains “n” in their name.
	Select *
	From Employee
	Where EName like 'j%n%'



--5. Display 2nd to 9th character of the given string “SQL Programming”.
	Select subString('SQL Programming', 2, 8)
	


--6. Display name of the employees whose city name ends with “ney” &contains six characters.
	Select *
	From Employee
	Where City like '%ney' and City like '______'



--7. Write a query to convert value 15 to string.
	Select Cast(15 as varchar(10))
	Select Convert(varchar(20), 15)



--8. Add department column with varchar (20) to Employee table.
	Alter Table Employee
	Add Department varchar(20)

	

--9. Set the value of department to Marketing who belongs to London city.
	Update Employee
	Set Department='Marketing'
	Where City='London'
	


--10. Display all the employees whose name ends with either “n” or “y”.
	Select *
	From Employee
	Where EName like '%[n, y]'



--11. Find smallest integer value that is greater than or equal to 63.1, 63.8 and -63.2.
	Select Ceiling(63.1), Ceiling(63.8), Ceiling(-63.2)



--12. Display all employees whose joining date is not available.
	Select *
	From Employee
	Where JoiningDate is Null



--13. Display name of the employees in capital letters and city in small letters.
	Select Upper(EName) as Name, Lower(City) as City
	From Employee



--14. Change the data type of Ename from varchar (30) to char (30).
	Alter Table Employee
	Alter Column EName char(30)



--15. Display city wise maximum salary.
	Select Distinct City, max(Salary) as Max_Sal
	From Employee
	Group by City



--16. Produce output like <Ename> works at <city> and earns <salary> (In single column).
	Select EName + ' Works at ' + City + ' and Earns '+ Convert(varchar(20), Salary) + '.'
	From Employee



--17. Find total number of employees whose salary is more than 5000.
	Select Count(*)
	From Employee
	Where Salary > 5000



--18. Write a query to display first 4 & last 3 characters of all the employees.
	Select Left(EName, 4),  Right(EName, 2)
	From Employee



--19. List the city having total salaries more than 15000 and employees joined after 1st January, 2014.
	Select Distinct City, Sum(Salary)
	From Employee
	Where JoiningDate > '1-Jan-14'
	Group by City
	Having Sum(Salary) > 15000



--20. Write a query to replace “u” with “oo” in Ename.
	Select Replace(EName, 'u', 'oo') 
	From Employee



--21. Display city with average salaries and total number of employees belongs to each city.
	Select Distinct City, Avg(Salary) as Avg_Sal, Count(*) as Num_of_Emp
	From Employee
	Group by City



--22. Display total salaries paid to female employees.
	Select Sum(Salary) as F_Total_Sal
	From Employee
	Where Gender = 'Female'
	


--23. Display name of the employees and their experience in years.
	Select EName, DateDiff(Year, JoiningDate, getDate()) as Exp_Year
	From Employee


--24. Remove column department from employee table.
	Alter Table Employee
	Drop Column Department
	


--25. Update the value of city from sydney to null.
	Update Employee
	Set City = Null
	Where City = 'Sydney'
	


--26. Retrieve all Employee name, Salary & Joining date.
	Select EName, Salary, JoiningDate
	From Employee



--27. Find out combine length of Ename & Gender.
	Select EName, Gender, Len(EName) as Len_of_Name, Len(Gender) as Len_of_Gender 
	From Employee



--28. Find the difference between highest & lowest salary.
	Select Max(Salary) as Max_Sal, Min(Salary) as Min_Sal
	From Employee



--29. Rename a column from Ename to FirstName.
	Sp_Rename 'Employee.EName', 'FirstName', 'Column'

	

--30. Rename a table from Employee to EmpMaster.
	Sp_Rename 'Employee', 'EmpMaster'