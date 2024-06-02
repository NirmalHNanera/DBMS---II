-- Create Database with Name: Student_Info
CREATE DATABASE  Student_Info;

-- Use the created database
USE Student_Info;

-- Create Student table
CREATE TABLE  Student (
    StuID INT,
    Name VARCHAR(100),
    EnrollmentNo VARCHAR(12),
    Division VARCHAR(50),
    Sem INT,
    BirthDate DATETIME,
    Email VARCHAR(100),
    ContactNo VARCHAR(50),
    City VARCHAR(50)
);

-- Insert data into the Student table
INSERT INTO Student (StuID, Name, EnrollmentNo, Division, Sem, BirthDate, Email, ContactNo, City)
VALUES
    (101, 'Naimish Patel', '090200107051', 'BCX-3', 3, '1992-12-06', 'naimishp49@gmail.com', '8866205253', 'City1'),
    (102, 'Firoz A. S.', '090200107090', 'BCY-3', 3, '1994-05-03', 'Firoz.me@gmail.com', '8885999922', 'City2'),
    (103, 'Krunal Vyas', '090243107101', 'BCZ-5', 5, '1984-03-01', 'Krunal.vyas@gmail.com', '9990888877', 'City3'),
    (104, 'Vijay Patel', '090200107102', 'BCX-5', 5, '1985-02-15', 'Vijay.patel123@gmail.com', '8787878787', 'City4'),
    (105, 'Vimal Trivedi', '090200107103', 'BCY-3', 3, '1988-01-20', 'Maulik123@gmail.com', '8789564512', 'City5');
Create Table Student(
	StuID			int,
	Name			varchar(100),
	EnrollmentNo	varchar(12),
	Division		varchar(50),
	Sem				int,
	BirthDate		datetime,
	Email			varchar(100),
	ContactNo		varchar(50)
);



------------- Records --------------

Insert into Student Values (101, 'Naimish Patel', '090200107051', 'BCX-3', 3, '1992-12-06', 'naimishpatel49@gmail.com', '8866205253')
Insert into Student Values (102, 'Firoz A. S.', '090200107090', 'BCY-3', 3, '1994-05-03', 'firoz.me@gmail.com', '8885999922')
Insert into Student Values (103, 'Krunal Vyas', '090243107101', 'BCZ-5', 5, '1984-03-01', 'krunal.vyas@gmail.com', '9990888877')
Insert into Student Values (104, 'Vijay Patel', '090200107102', 'BCX-5', 5, '1985-02-15', 'vijay.patel123@gmail.com', '8787878787')
Insert into Student Values (105, 'Vimal Trivedi', '090200107103', 'BCY-3', 3, '1988-01-20', 'maulik123@gmail.com', '8789564512')



--------------------------------------------------------------------------------------------------------------------------

--1. Display Name of Student who belongs to either Semester 3 or 5. (Use IN & OR)
	Select *
	From Student
	Where Sem in (3, 5)
	-----------------
	Select *
	From Student
	Where Sem=3 or Sem=5



--2. Find Student Name & Enrollment No in which Student Id between 103 to 105.
	Select Name, EnrollmentNo
	From Student
	Where StuID between 103 and 105



--3. Find Student Name & Enrollment No with their Email Who belongs to 5th Semester.
	Select Name, EnrollmentNo, Email
	From Student
	Where Sem=5


--4. Display All the Details of first three students.
	Select Top 3 *
	From Student


--5. Display Name & Enrollment no of first 30% Students who’s contact number ends with 7.
	Select Top 30 percent  Name, EnrollmentNo
	From Student
	Where ContactNo like '%7'



--6. Display Unique Semesters.
	Select Distinct Sem
	From Student



--7. Retrieve All the Students who have no Enrollment.
	Select *
	From Student
	Where EnrollmentNo is Null



--8. Find All Students whose Name does not start with ‘V’.
	Select *
	From Student
	Where Name Not like 'V%'



--9. Find All Students in which Email Contains ‘3@G’ & Only Six Characters.
	Select *
	From Student
	Where Email like '%3@g%' and Name like '______'



--10. Find Out All the Students whose First Name Starts with F And third character must be R.
	Select *
	From Student
	Where Name like 'F_R%'



--11. Find All the Student Details whose Contact No contains 877.
	Select *
	From Student
	Where ContactNo like '%877%'



--12. Display Student Name in Which Student belongs to Semester 3 & Contact Number Does Not Contains 8 & 9.
	Select *
	From Student
	Where Sem=3 and ContactNo Not Like '%[8, 9]%'



--13. Find Students who born after date 01-01-1990.
	Select *
	From Student
	Where BirthDate > '1990-01-01'



--14. Update Division to BCX-5 & Semester 5 whose Student Id Is 102.
	Update Student
	Set Division='BCX-5', Sem=5
	Where StuID=102



--15. Change the Student’s Name to Firoz Sherasiya in which Email is Firoz.Me@Gmail.Com & Contact No is 8885999922.
	Update Student
	Set Name='Firoz Sherasiya'
	Where Email='firoz.me@gmail.com' and ContactNo='8885999922'



--16. Add one more Column City Varchar (50) in Student Table.
	Alter Table Student 
	Add City varchar(50)

	

--17. Remove All BCX-3 Division Students.
	Delete From Student
	Where Division='BCX-3'

	

--18. Change Column Name Email to EmailAddress.
	Sp_Rename 'Student.Email', 'EmailAddress', 'Column'




--19. Write an SQL query to clone a new table Student_New from Student table with all data.
	Select * into Student_New 
	From Student



--20. Remove All the Data from Student Table Using Truncate.
	Truncate Table Student
