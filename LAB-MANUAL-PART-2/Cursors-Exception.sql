
Create Table PersonLogAgain(
	PersonLogID		int				Primary Key,
	PersonName		varchar(250)	Not Null,
	Operation		varchar(25)		Not Null,
	UpdatedDate		datetime		Not Null
)


--	1. Print message like - Error Occur that is: Divide by zero error encountered.

		Begin Try
			Select 10/0
		End Try
		Begin Catch
			Select 'Error occur that is : ' + ERROR_MESSAGE() as Error;
		End Catch



--	2. Print error message in insert statement using Error_Message () function: Conversion failed when 
--		converting datetime from character string.

		Begin Try
			Declare @date date = '2003-06-31'
			Select Convert(varchar(20), @date)
		End Try
		Begin Catch
			Select ERROR_MESSAGE() as Error
		End Catch



--	3. Create procedure which prints the error message that “The PLogID is already taken. Try another one”.

--		PR_PersonLog_Error 105, Jay

		Create Procedure PR_PersonLog_Error
		@personLogId int,
		@name varchar(50)
		as
		Begin
			Begin Try
				Insert into PersonLogAgain Values(@personLogId, @name, 'Insert', getDate())
			End Try
			Begin Catch
				Print 'The PersonLogID is already taken. Try another one'
			End Catch
		End
--	4. Create procedure that print the sum of two numbers: take both number as integer & handle 		
--		exception with all error functions if any one enters string value in numbers otherwise print result 

		Create Procedure PR_SumOfTwoNumbers
		@x	varchar(10), 
		@y	 int,
		@result  int output
		as
		Begin
			Begin Try
				Set @result = @x + @y;
			End Try
			Begin Catch
				Select ERROR_LINE() as [Error Line],
						ERROR_NUMBER() as [Error Number],
						ERROR_STATE() as [Error State],
						ERROR_SEVERITY() as [Error Severity],
						ERROR_PROCEDURE() as [Error ProcedureName],
						ERROR_MESSAGE() as [Error Message]
			End Catch
		End

		Declare @out	int
		Exec PR_SumOfTwoNumbers 'u', 5, @out output
		Print @out



--	5. Throw custom exception using stored procedure which accepts PLogID as input & that throws 
--		Error like no plogid is available in database.

--		PR_PersonLog_personID 110
	
		Create Procedure PR_PersonLog_personID
		@personLogId	int
		as
		Begin
			If Exists (Select * From PersonLogAgain Where PersonLogID = @personLogId)
				Print 'PersonLogID is Present.'
			Else
				Throw 50005, 'No PersonLogID is Available in Table', 1
		End



--	6. Create cursor with name per_cursor which takes PLogID & PersonName as variable and produce 
--		combine output with PLogID & Person Name.

		Declare @personLogId	int,
				@personName		varchar(50)

		Declare Person_Cursor Cursor
		For Select PersonLogID, PersonName
			From PersonLogAgain

		Open Person_Cursor

		Fetch Next From Person_Cursor into
			@personLogId,
			@personName

		While @@FETCH_STATUS = 0
			Begin
				Print Convert(varchar(10), @personLogId) + ' & ' + @personName
				Fetch Next From Person_Cursor into
					@personLogId,
					@personName
			End

		Close Person_Cursor

		Deallocate Person_Cursor



--	7. Use Table Student (Rno, EnrollmentNo, Name, Branch, University) - Create cursor that updates 
--		enrollment column as combination of branch & Roll No. like SOE22CE0001 and so on. (22 is admission year)

		Create Table Student(
			RollNo			int				Primary Key,
			EnrollmentNo	varchar(50)		Not Null,
			StudentName		varchar(50)		Not Null,
			Branch			varchar(50)		Not Null,
			University		varchar(50)		Not Null
		)


		Declare @rollNo	int, 
				@branch	varchar(25)

		Declare Student_Update_Cursor Cursor
		For Select RollNo, Branch
			From Student

		Open Student_Update_Cursor

		Fetch Next From Student_Update_Cursor into
			@rollNo, @branch

		While @@FETCH_STATUS = 0
			Begin
				Update Student
				Set EnrollmentNo = 'SOE22' + @branch + Convert(varchar(10), @rollNo)
				Where RollNo = @rollNo

				Fetch Next From Student_Update_Cursor into
					@rollNo, @branch
			End

		Close Student_Update_Cursor

		Deallocate Student_Update_Cursor