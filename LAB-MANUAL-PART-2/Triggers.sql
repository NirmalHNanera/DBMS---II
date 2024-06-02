Create Table Person(
	PersonID		int			Primary Key,
	PersonName		varchar(50)		Not Null,
	Salary			decimal(8,2)		Not Null,
	JoiningDate		datetime		Not Null,
	City			varchar(50)		Not Null,
	Age			int ,
	BirthDate		datetime		Not Null
)


Create Table PersonLog(
	PersonLogID		int			Primary Key Identity(2101, 1),
	PersonID		int			Not Null,
	PersonName		varchar(250)		Not Null,
	Operation		varchar(50)		Not Null,
	UpdatedDate		datetime		Not Null
)


--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

-- 1. Create INSERT, UPDATE & DELETE Stored Procedures for Person table.
		
--		PR_Person_Insert 102, 'Uttam', 175000, '2004-05-08', 'Rajkot', 18, '2004-01-05'
		Create Procedure PR_Person_Insert
		@personId		int, 
		@personName		varchar(50),
		@salary			decimal(8,2),
		@joiningDate		datetime,
		@city			varchar(50),
		@age			int,
		@birthDate		datetime

		as
		Begin
			Insert into Person
			Values(
				@personId,	
				@personName,	
				@salary,		
				@joiningDate,
				@city,		
				@age,	
				@birthDate	
			)
		End

-------------------------------------------------

--		PR_Person_Update 105, 'Kishan', 20000, '2015-07-09', 'Baroda', 50, '2003-06-30'
		Create Procedure PR_Person_Update
		@personId		int, 
		@personName		varchar(50),
		@salary			decimal(8,2),
		@joiningDate		datetime,
		@city			varchar(50),
		@age			int,
		@birthDate		datetime

		as
		Begin
			Update Person
			Set 
				PersonName	=	@personName,
				Salary		=	@salary	,
				JoiningDate 	=	@joiningDate,
				City		=	@city,
				Age		=	@age,
				BirthDate	=	@birthDate	
			Where
				PersonID	=	@personId
		End

-------------------------------------------------

--		PR_Person_Delete 101
		Create Procedure PR_Person_Delete
		@personId	int
		as
		Begin
			Delete From Person 
			Where PersonID = @personId
		End

	

-- 2. Create a trigger that fires on INSERT, UPDATE and DELETE operation on the Person table. For that, 
--    create a new table PersonLog to log (enter) all operations performed on the Person table.

		Create Trigger TR_Person_Insert
		on Person
		For Insert
		as
		Begin
			Declare @personId	int, @personName	varchar(70)
			Select @personId = inserted.PersonID,
				   @personName = inserted.PersonName
			From Inserted

			Insert into PersonLog Values(@personId, @personName, 'Insert', getDate())
		End

-------------------------------------------------
	
		Create Trigger TR_Person_Update
		on Person
		For Update
		as
		Begin
			Declare @personId	int, @personName	varchar(70)
			Select @personId = inserted.PersonID,
				   @personName = inserted.PersonName
			From Inserted

			Insert into PersonLog Values(@personId, @personName, 'Update', getDate())
		End

-------------------------------------------------

		Create Trigger TR_Person_Delete
		on Person
		For Delete
		as
		Begin
			Declare @personId	int, @personName	varchar(70)
			Select @personId = deleted.PersonID,
				   @personName = deleted.PersonName
			From Deleted

			Insert into PersonLog Values(@personId, @personName, 'Delete', getDate())
		End
		

		insert into Person values(106, 'karan', 45632, '1991-02-04', 'Jamanagar', 19, '2004-07-16')
		insert into Person Values(107, 'Devanshu', 65432, '1996-09-04', 'Bharuch', 18, '2004-04-06')
		insert into Person values(105, 'Divyank', 45632, '2002-12-23', 'Junagadh', 19, '1999-11-09')
		update Person set Salary = 30000 where PersonID = 102
		delete from personlog where personlogid  = 2109
		select * from Person
		



-- 3. Create an INSTEAD OF trigger that fires on INSERT, UPDATE and DELETE operation on the Person
--    table. For that, log all operation performed on the Person table into PersonLog.

		Create Trigger TR_Person_InsertAgain
		on Person
		Instead of Insert
		as
		Begin
			Declare @personId	int, @personName	varchar(70)
			Select @personId = inserted.PersonID,
				   @personName = inserted.PersonName
			From Inserted

			Insert into PersonLog Values(@personId, @personName, 'Instead of Insert', getDate())
		End

-------------------------------------------------
	
		Create Trigger TR_Person_UpdateAgain
		on Person
		Instead of Update
		as
		Begin
			Declare @personId	int, @personName	varchar(70)
			Select @personId = inserted.PersonID,
				   @personName = inserted.PersonName
			From Inserted

			Insert into PersonLog Values(@personId, @personName, 'Instead of Update', getDate())
		End

-------------------------------------------------

		Create Trigger TR_Person_DeleteAgain
		on Person
		Instead of Delete
		as
		Begin
			Declare @personId	int, @personName	varchar(70)
			Select @personId = deleted.PersonID,
				   @personName = deleted.PersonName
			From Deleted

			Insert into PersonLog Values(@personId, @personName, 'Instead of Delete', getDate())
		End



		
-- 4. Create DELETE trigger on PersonLog table, when we delete any record of PersonLog table it prints 
--    ‘Record deleted successfully from PersonLog’.

		Create Trigger TR_PersonLog_Delete
		on PersonLog
		After Delete
		as
		Begin
			Print 'Record Deleted Successfully from PersonLog.'
		End 



		
-- 5. Create INSERT trigger on person table, which calculates the age and update that age in Person 
--    table.

		Create Trigger TR_Person_CalculateAge
		on Person
		After Insert
		as
		Begin
			Declare @birthDate date, @personId int
			Select @personId = inserted.PersonID,
					@birthDate = inserted.BirthDate
			From Inserted

			Update Person
			Set 
				Age = DateDiff(year, '2004-01-05', getDate())
			Where
				PersonID = @personId
		End