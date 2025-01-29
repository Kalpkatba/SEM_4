-------------------------------------------Lab-1------------------------------------------------------

	CREATE TABLE Artists ( 
	Artist_id INT PRIMARY KEY, 
	Artist_name NVARCHAR(50) 
	); 

	CREATE TABLE Albums ( 
	Album_id INT PRIMARY KEY, 
	Album_title NVARCHAR(50), 
	Artist_id INT, 
	Release_year INT, 
	FOREIGN KEY (Artist_id) REFERENCES Artists(Artist_id) 
	);

	CREATE TABLE Songs ( 
	Song_id INT PRIMARY KEY, 
	Song_title NVARCHAR(50), 
	Duration DECIMAL(4, 2), 
	Genre NVARCHAR(50), 
	Album_id INT, 
	FOREIGN KEY (Album_id) REFERENCES Albums(Album_id) 
	);

	INSERT INTO Artists (Artist_id, Artist_name) VALUES 
	(1, 'Aparshakti Khurana'), 
	(2, 'Ed Sheeran'), 
	(3, 'Shreya Ghoshal'), 
	(4, 'Arijit Singh'), 
	(5, 'Tanishk Bagchi'); 

	INSERT INTO Albums (Album_id, Album_title, Artist_id, Release_year) VALUES (1007, 'Album7', 1, 2015), 
	(1001, 'Album1', 1, 2019), 
	(1002, 'Album2', 2, 2015), 
	(1003, 'Album3', 3, 2018), 
	(1004, 'Album4', 4, 2020), 
	(1005, 'Album5', 2, 2020), 
	(1006, 'Album6', 1, 2009);

	INSERT INTO Songs (Song_id, Song_title, Duration, Genre, Album_id) VALUES 
	(101, 'Zaroor', 2.55, 'Feel good', 1001), 
	(102, 'Espresso', 4.10, 'Rhythmic', 1002), 
	(103, 'Shayad', 3.20, 'Sad', 1003), 
	(104, 'Roar', 4.05, 'Pop', 1002), 
	(105, 'Everybody Talks', 3.35, 'Rhythmic', 1003), 
	(106, 'Dwapara', 3.54, 'Dance', 1002), 
	(107, 'Sa Re Ga Ma', 4.20, 'Rhythmic', 1004), 
	(108, 'Tauba', 4.05, 'Rhythmic', 1005), 
	(109, 'Perfect', 4.23, 'Pop', 1002), 
	(110, 'Good Luck', 3.55, 'Rhythmic', 1004);

--1. Retrieve a unique genre of songs.
	SELECT DISTINCT Genre 
	FROM Songs
--2. Find top 2 albums released before 2010.
	SELECT TOP 2 Album_title, Release_year
	FROM Albums
	WHERE Release_year < 2010
	ORDER BY Release_year DESC
--3. Insert Data into the Songs Table. (1245, ‘Zaroor’, 2.55, ‘Feel good’, 1005) 
	INSERT INTO Songs (Song_id, Song_title, Duration, Genre, Album_id)
	VALUES (1245, 'Zaroor', 2.55, 'Feel good', 1005)
--4. Change the Genre of the song ‘Zaroor’ to ‘Happy’ 
	UPDATE Songs
	SET Genre = 'Happy'
	WHERE Song_title = 'Zaroor'
--5. Delete an Artist ‘Ed Sheeran’ 
	DELETE FROM Artists
	WHERE Artist_name = 'Ed Sheeran'
--6. Add a New Column for Rating in Songs Table. [Ratings decimal(3,2)] 
	ALTER TABLE Songs
	ADD Rating DECIMAL(3,2)
--7. Retrieve songs whose title starts with 'S'. 
	SELECT *
	FROM Songs
	WHERE Song_title LIKE 'S%'
--8. Retrieve all songs whose title contains 'Everybody'. 
	SELECT *
	FROM Songs
	WHERE Song_title LIKE '%Everybody%'
--9. Display Artist Name in Uppercase. 
	SELECT UPPER(Artist_name) AS Artist_Name_Uppercase
	FROM Artists
--10. Find the Square Root of the Duration of a Song ‘Good Luck’ 
	SELECT SQRT(Duration) AS Duration_SquareRoot
	FROM Songs
	WHERE Song_title = 'Good Luck'
--11. Find Current Date.
	SELECT CAST(GETDATE() AS DATE) AS 'Current_Date'
--12. Find the number of albums for each artist. 
	SELECT Artist_name, COUNT(Album_id) AS Number_of_Albums
	FROM Artists
	JOIN Albums ON Artists.Artist_id = Albums.Artist_id
	GROUP BY Artist_name;

--13. Retrieve the Album_id which has more than 5 songs in it.
	SELECT Album_id
	FROM Songs
	GROUP BY Album_id
	HAVING COUNT(Song_id) > 5;

--14. Retrieve all songs from the album 'Album1'. (using Subquery)
	SELECT *
	FROM Songs
	WHERE Album_id = (SELECT Album_id FROM Albums WHERE Album_title = 'Album1');
--15. Retrieve all albums name from the artist ‘Aparshakti Khurana’ (using Subquery)
	SELECT Album_title 
	FROM albums
	WHERE artist_id = (
		SELECT Artist_id
		FROM artists
		WHERE artist_name = 'Aparshakti Khurana'
	);
--16. Retrieve all the song titles with its album title. 
	SELECT songs.song_title, albums.album_title
	FROM songs
	JOIN albums ON songs.album_id = albums.album_id;

--17. Find all the songs which are released in 2020.
	SELECT songs.song_title
	FROM songs
	JOIN albums ON songs.album_id = albums.album_id
	WHERE albums.release_year = 2020;
--18. Create a view called ‘Fav_Songs’ from the songs table having songs with song_id 101-105.
	CREATE VIEW FAV_SONGS AS 
	SELECT SONG_ID,SONG_TITLE 
	FROM SONGS 
	WHERE SONG_ID BETWEEN 101 AND 105;
--19. Update a song name to ‘Jannat’ of song having song_id 101 in Fav_Songs view.
	UPDATE FAV_SONGS 
	SET SONG_TITLE='JANNAT' 
	WHERE SONG_ID=101;
--20. Find all artists who have released an album in 2020.
	SELECT ARTISTS.ARTIST_NAME,ALBUMS.RELEASE_YEAR 
	FROM ARTISTS JOIN ALBUMS 
	ON ARTISTS.ARTIST_ID=ALBUMS.ARTIST_ID 
	WHERE RELEASE_YEAR=2020;
--21. Retrieve all songs by Shreya Ghoshal and order them by duration. 
	SELECT ARTISTS.ARTIST_NAME,SONGS.DURATION,ALBUMS.ALBUM_ID
	FROM ARTISTS 
	JOIN ALBUMS ON ARTISTS.ARTIST_ID=ALBUMS.ARTIST_ID
	JOIN SONGS ON ALBUMS.ALBUM_ID=SONGS.ALBUM_ID
	WHERE ARTIST_NAME='SHREYA GHOSHAL'
	ORDER BY DURATION;
--------------------------------------------lab-2-------------------------------------------------
	CREATE TABLE Department ( 
DepartmentID INT PRIMARY KEY, 
DepartmentName VARCHAR(100) NOT NULL UNIQUE 
);

CREATE TABLE Designation ( 
DesignationID INT PRIMARY KEY, 
DesignationName VARCHAR(100) NOT NULL UNIQUE 
);

CREATE TABLE Person ( 
PersonID INT PRIMARY KEY IDENTITY(101,1), 
FirstName VARCHAR(100) NOT NULL, 
LastName VARCHAR(100) NOT NULL, 
Salary DECIMAL(8, 2) NOT NULL, 
JoiningDate DATETIME NOT NULL, 
DepartmentID INT NULL, 
DesignationID INT NULL, 
FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID), 
FOREIGN KEY (DesignationID) REFERENCES Designation(DesignationID) 
);


---------------------Part – A------------------------ 
--1. Department, Designation & Person Table’s INSERT, UPDATE & DELETE Procedures.
--INSERT
	CREATE OR ALTER PROCEDURE PR_DEPARTMENT_INSERT
		@DEPARTMENTID INT,
		@DEPARTMENTNAME VARCHAR(100)
	AS
	BEGIN
			INSERT INTO Department
			(DepartmentID,DepartmentName)
			VALUES
			(@DEPARTMENTID,@DEPARTMENTNAME)
	END
--UPDATE

	CREATE PROCEDURE PR_DEPARTMENT_UPDATE
		@DEPARTMENTID INT,
		@DEPARTMENTNAME VARCHAR(100)
	AS
	BEGIN
			UPDATE Department
			SET DepartmentName = @DEPARTMENTNAME
			WHERE DepartmentID = @DEPARTMENTID
	END
--DELETE
	CREATE PROCEDURE PR_DEPARTMENT_DELETE
		@DEPARTMENTID INT,
		@DEPARTMENTNAME VARCHAR(100)
	AS
	BEGIN
			DELETE FROM Department
			WHERE DepartmentID = @DEPARTMENTID OR DepartmentName = @DEPARTMENTNAME
	END

	EXEC PR_DEPARTMENT_INSERT 1,'ADMIN'
	EXEC PR_DEPARTMENT_INSERT 2,'IT'
	EXEC PR_DEPARTMENT_INSERT 3,'HR'
	EXEC PR_DEPARTMENT_INSERT 4,'ACCOUNT'

	EXEC PR_DEPARTMENT_UPDATE 2,'CSE'

	EXEC PR_DEPARTMENT_DELETE 4,'ACCOUNT'

	SELECT * FROM Department

	CREATE PROCEDURE PR_DESIGNATION_INSERT
		@DESIGNATIONID INT,
		@DESIGNATIONNAME VARCHAR(100)
	AS
	BEGIN
			INSERT INTO Designation
			(DesignationID,DesignationName)
			VALUES
			(@DESIGNATIONID,@DESIGNATIONNAME)
	END
--UPDATE
	CREATE PROCEDURE PR_DESIGNATION_UPDATE
		@DESIGNATIONID INT,
		@DESIGNATIONNAME VARCHAR(100)
	AS
	BEGIN
			UPDATE Designation
			SET DesignationName = @DESIGNATIONNAME
			WHERE DesignationID = @DESIGNATIONID
	END
--DELETE
	CREATE PROCEDURE PR_DESIGNATION_DELETE
		@DESIGNATIONID INT,
		@DESIGNATIONNAME VARCHAR(100)
	AS
	BEGIN
			DELETE FROM Designation
			WHERE DESIGNATIONID = @DESIGNATIONID OR DESIGNATIONNAME = @DESIGNATIONNAME
	END

	EXEC PR_DEPARTMENT_INSERT 11,'Jobber'
	EXEC PR_DESIGNATION_INSERT 12,'Welder'
	EXEC PR_DESIGNATION_INSERT 13,'Clerk'
	EXEC PR_DESIGNATION_INSERT 14,'Manager'
	EXEC PR_DESIGNATION_INSERT 15,'CEO'

	CREATE OR ALTER PROCEDURE PR_PERSON_INSERT
		@FIRSTNAME VARCHAR(100),
		@LASTNAME VARCHAR(100),
		@SALARY DECIMAL(8,2),
		@JOININGDATE DATETIME,
		@DEPARTMENTID INT,
		@DESIGNATIONID INT
	AS
	BEGIN
			INSERT INTO Person
			(FirstName,LastName,Salary,JoiningDate,DepartmentID,DesignationID)
			VALUES
			(@FIRSTNAME,@LASTNAME,@SALARY,@JOININGDATE,@DEPARTMENTID,@DESIGNATIONID)
	END
--UPDATE
	CREATE PROCEDURE PR_PERSON_UPDATE
		@FIRSTNAME VARCHAR(100),
		@LASTNAME VARCHAR(100),
		@SALARY DECIMAL(8,2),
		@JOININGDATE DATETIME,
		@DEPARTMENTID INT,
		@DESIGNATIONID INT
	AS
	BEGIN
			UPDATE Person
			SET FirstName = @FIRSTNAME
			WHERE DepartmentID = @DEPARTMENTID
	END
--DELETE
	CREATE PROCEDURE PR_PERSON_DELETE
		@FIRSTNAME VARCHAR(100),
		@LASTNAME VARCHAR(100),
		@SALARY DECIMAL(8,2),
		@JOININGDATE DATETIME,
		@DEPARTMENTID INT,
		@DESIGNATIONID INT
	AS
	BEGIN
			DELETE FROM Person
			WHERE FirstName = @FIRSTNAME
	END

	EXEC PR_PERSON_INSERT 'Rahul','Anshu',56000,'1990-01-01',1,12 
	EXEC PR_PERSON_INSERT 'Hardik','Hinsu',18000,'1990-09-25',2,11 
	EXEC PR_PERSON_INSERT 'Bhavin','Kamani',25000,'1991-05-14',NULL,11 
	EXEC PR_PERSON_INSERT 'Bhoomi','Patel',39000,'2014-02-20',1,13 
	EXEC PR_PERSON_INSERT 'Rohit','Rajgor',17000,'1990-07-23',2,15 
	EXEC PR_PERSON_INSERT 'Priya','Mehta',25000,'1990-10-18',2,NULL
	EXEC PR_PERSON_INSERT 'Neha','Trivedi',18000,'2014-02-20',3,15

--2. Department, Designation & Person Table’s SELECT BY PRIMARYKEY
	CREATE PROCEDURE PR_DEPARTMENT_SELBYPRIKEY
		@DEPARTMENTID INT
	AS
	BEGIN
			SELECT * FROM Department
			WHERE DepartmentID = @DEPARTMENTID
	END

	CREATE PROCEDURE PR_DESIGNATION_SELBYPRIKEY
		@DESIGNATIONID INT
	AS
	BEGIN
			SELECT * FROM Designation
			WHERE DesignationID = @DESIGNATIONID
	END
		CREATE PROCEDURE PR_PERSON_SELBYPRIKEY
		@PERSONID  INT
	AS
	BEGIN
			SELECT * FROM Person
			WHERE PersonID = @PERSONID
	END
--3. Department, Designation & Person Table’s (If foreign key is available then do write join and take columns on select list).
	CREATE PROCEDURE PR_JOIN
	AS
	BEGIN
			SELECT * FROM Person P
			JOIN
			Department DEPT
			ON P.DepartmentID = DEPT.DepartmentID
			JOIN
			Designation DESI
			ON P.DesignationID = DESI.DesignationID
	END
	EXEC PR_JOIN
--4. Create a Procedure that shows details of the first 3 persons.
	CREATE PROCEDURE PR_TOP3
	AS
	BEGIN
			SELECT TOP 3 * FROM Person P
			JOIN
			Department DEPT
			ON P.DepartmentID = DEPT.DepartmentID
	END
	EXEC PR_TOP3
-------------------------------------LAB-3--------------------------------------------------
CREATE TABLE Departments ( 
DepartmentID INT PRIMARY KEY, 
DepartmentName VARCHAR(100) NOT NULL UNIQUE, 
ManagerID INT NOT NULL, 
Location VARCHAR(100) NOT NULL 
); 
CREATE TABLE Employee ( 
EmployeeID INT PRIMARY KEY, 
FirstName VARCHAR(100) NOT NULL, 
LastName VARCHAR(100) NOT NULL, 
DoB DATETIME NOT NULL, 
Gender VARCHAR(50) NOT NULL, 
HireDate DATETIME NOT NULL, 
DepartmentID INT NOT NULL, 
Salary DECIMAL(10, 2) NOT NULL, 
FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID) 
); -- Create Projects Table 
CREATE TABLE Projects ( 
ProjectID INT PRIMARY KEY, 
ProjectName VARCHAR(100) NOT NULL, 
StartDate DATETIME NOT NULL, 
EndDate DATETIME NOT NULL, 
DepartmentID INT NOT NULL, 
FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID) 
); 
INSERT INTO Departments (DepartmentID, DepartmentName, ManagerID, Location) 
VALUES  
(1, 'IT', 101, 'New York'), 
(2, 'HR', 102, 'San Francisco'), 
(3, 'Finance', 103, 'Los Angeles'), 
(4, 'Admin', 104, 'Chicago'), 
(5, 'Marketing', 105, 'Miami'); 
INSERT INTO Employee (EmployeeID, FirstName, LastName, DoB, Gender, HireDate, DepartmentID, 
Salary) 
VALUES  
(101, 'John', 'Doe', '1985-04-12', 'Male', '2010-06-15', 1, 75000.00), 
(102, 'Jane', 'Smith', '1990-08-24', 'Female', '2015-03-10', 2, 60000.00), 
(103, 'Robert', 'Brown', '1982-12-05', 'Male', '2008-09-25', 3, 82000.00), 
(104, 'Emily', 'Davis', '1988-11-11', 'Female', '2012-07-18', 4, 58000.00), 
(105, 'Michael', 'Wilson', '1992-02-02', 'Male', '2018-11-30', 5, 67000.00); 
SELECT * FROM EMPLOYEE
INSERT INTO Projects (ProjectID, ProjectName, StartDate, EndDate, DepartmentID) 
VALUES  
(201, 'Project Alpha', '2*022-01-01', '2022-12-31', 1), 
(202, 'Project Beta', '2023-03-15', '2024-03-14', 2), 
(203, 'Project Gamma', '2021-06-01', '2022-05-31', 3), 
(204, 'Project Delta', '2020-10-10', '2021-10-09', 4), 
(205, 'Project Epsilon', '2024-04-01', '2025-03-31', 5); 
--Part – A 
--1. Create Stored Procedure for Employee table As User enters either First Name or Last Name and based 
--on this you must give EmployeeID, DOB, Gender & Hiredate.
	CREATE OR ALTER PROCEDURE PR_EMPDETAILS
		@FNAME VARCHAR(50),
		@LNAME VARCHAR(50)
	AS
	BEGIN
		SELECT EMPLOYEEID,DOB,HIREDATE,GENDER FROM Employee
		WHERE FIRSTNAME = @FNAME OR LASTNAME = @LNAME
	END
--2. Create a Procedure that will accept Department Name and based on that gives employees list who 
--belongs to that department.
	CREATE OR ALTER PROCEDURE PR_DEPTNAME
		@DEPTNAME VARCHAR(50)
	AS
	BEGIN
		SELECT * FROM Employee e
		JOIN 
		Departments d
		on e.departmentid = d.departmentid
		where d.departmentname = @DEPTNAME
	END
--3.  Create a Procedure that accepts Project Name & Department Name and based on that you must give 
--all the project related details.
	CREATE OR ALTER PROCEDURE PR_PROJECTDETAIL
		@PRJNAME VARCHAR(50),
		@DEPTNAME VARCHAR(50)
	AS
	BEGIN
		SELECT * FROM PROJECT P
		JOIN 
		Departments D
		ON P.departmentid = d.departmentid
		WHERE P.POJECTNAME = @PRJNAME AND D.DEPARTMENTNAME = @DEPTNAME
	END
--4. Create a procedure that will accepts any integer and if salary is between provided integer, then those 
--employee list comes in output. 
	CREATE OR ALTER PROCEDURE PR_SALARY
		@MIN_SAL INT,
		@MAX_SAL INT
	AS
	BEGIN
		SELECT * 
		FROM EMPLOYEE
		WHERE SALARY BETWEEN @MIN_SAL AND @MAX_SAL;
	END

	EXEC PR_SALARY 60000,80000
--5. Create a Procedure that will accepts a date and gives all the employees who all are hired on that date.
	CREATE OR ALTER PROCEDURE PR_DATE
		@DATE DATE
	AS
	BEGIN
		SELECT * 
		FROM EMPLOYEE
		WHERE HireDate = @DATE
	END

	EXEC PR_DATE '2010-06-15'
--Part – B 
--6. Create a Procedure that accepts Gender’s first letter only and based on that employee details will be served. 
	CREATE OR ALTER PROCEDURE PR_GENDER
		@GENDER VARCHAR(1)
	AS
	BEGIN
		SELECT * 
		FROM EMPLOYEE
		WHERE GENDER LIKE @GENDER+'%'
	END

	EXEC PR_GENDER 'F'
--7. Create a Procedure that accepts First Name or Department Name as input and based on that employee data will come. 
	CREATE OR ALTER PROCEDURE PR_FIRSTDEPTNAME
		@DEPTNAME VARCHAR(20),
		@FNAME VARCHAR(20)
	AS
	BEGIN
		SELECT * 
		FROM EMPLOYEE E
		JOIN DEPARTMENTS D
		ON E.DEPARTMENTID = D.DEPARTMENTID
		WHERE D.DepartmentName = @DEPTNAME OR E.FirstName = @FNAME
	END

	EXEC PR_FIRSTDEPTNAME NULL, 'JOHN'
--8. Create a procedure that will accepts location, if user enters a location any characters, then he/she will get all the departments with all data.
	CREATE OR ALTER PROCEDURE PR_LOCATION
		@LOCATION VARCHAR(20)
	AS
	BEGIN
		SELECT *
		FROM Departments
		WHERE Location LIKE '%'+@LOCATION+'%' 
	END

	EXEC PR_LOCATION 'A'
-------------------------------------------LAB-4---------------------------------------------
--Part – A
--1. Write a function to print "hello world".
	CREATE OR ALTER FUNCTION FUN_PRINT()
	RETURNS VARCHAR(20)
	AS
	BEGIN 
			RETURN 'HELLO WORLD'
	END

	SELECT dbo.FUN_PRINT()
--2. Write a function which returns addition of two numbers.
	CREATE OR ALTER FUNCTION FUN_ADD_TWO_NUM
	(
		@N1 INT,
		@N2 INT
	)
	RETURNS INT
	AS
	BEGIN 
			RETURN @N1+@N2
	END
	SELECT dbo.FUN_ADD_TWO_NUM(10,20)
--3. Write a function to check whether the given number is ODD or EVEN.
	CREATE OR ALTER FUNCTION FUN_CHECK_ODD_EVEN
	(
		@NUM INT
	)
	RETURNS VARCHAR(20)
	AS
	BEGIN 
			IF(@NUM%2=0)
				RETURN 'EVEN'
			ELSE
				RETURN 'ODD'
			RETURN ''
	END
	SELECT dbo.FUN_CHECK_ODD_EVEN(12)
--4. Write a function which returns a table with details of a person whose first name starts with B.
	CREATE OR ALTER FUNCTION FUN_FIRSTNAME_()
	RETURNS TABLE
	AS
			RETURN (SELECT * FROM PERSON
					WHERE FirstName LIKE 'B%')

	SELECT * FROM FUN_FIRSTNAME_()

--5. Write a function which returns a table with unique first names from the person table.
	CREATE OR ALTER FUNCTION FUN_FIRSTNAME_UNIQUE()
	RETURNS TABLE
	AS
		RETURN (SELECT DISTINCT FirstName FROM PERSON)

	SELECT * FROM FUN_FIRSTNAME_UNIQUE()
--6. Write a function to print number from 1 to N. (Using while loop)
	CREATE OR ALTER FUNCTION FN_1TON
	(
		@NUM INT
	)
	RETURNS VARCHAR(MAX)
	AS
	BEGIN 
			DECLARE @I INT =1
			DECLARE @RESULT VARCHAR(MAX) = ''
			WHILE (@I<=@NUM)
			BEGIN
				SET @RESULT = @RESULT+CAST(@I AS varchar)+ ' '
				SET @I = @I+1
			END
			RETURN @RESULT
	END
	SELECT dbo.FN_1TON(10)
--7. Write a function to find the factorial of a given integer.
	CREATE OR ALTER FUNCTION FN_FACT
	(
		@NUM INT
	)
	RETURNS INT
	AS
	BEGIN
		DECLARE @I INT = 1
		DECLARE @FACT INT = 1
		WHILE @I<=@NUM
		BEGIN
			SET @FACT = @FACT*@I
			SET @I = @I + 1
		END
		RETURN @FACT
	END
	SELECT dbo.FN_FACT(5)
--Part – B
--8. Write a function to compare two integers and return the comparison result. (Using Case statement)
	CREATE OR ALTER FUNCTION FN_COMPARE
	(
		@N1 INT,
		@N2 INT
	)
	RETURNS VARCHAR(MAX)
	AS
	BEGIN
		DECLARE @ANS VARCHAR(30) = ''
		SET @ANS = CASE
			WHEN @N1 > @N2 THEN CAST(@N1 AS VARCHAR) +' IS GREATER THAN '+CAST(@N2 AS VARCHAR) 
			WHEN @N1 < @N2 THEN CAST(@N2 AS VARCHAR)  +' IS GREATER THAN '+CAST(@N1 AS VARCHAR) 
		ELSE 'INVALID'
		END
		RETURN  @ANS
	END
	SELECT dbo.FN_COMPARE(8,2)
--9. Write a function to print the sum of even numbers between 1 to 20.
	CREATE OR ALTER FUNCTION FN_SUM_EVEN()
	RETURNS INT
	AS
	BEGIN
		DECLARE @SUM INT = 0
		DECLARE @J INT = 1
		WHILE (@J<=20)
		BEGIN
		IF(@J%2=0)
			SET @SUM = @SUM + @J
			SET @J = @J+1
		END
		RETURN @SUM
	END	
	SELECT dbo.FN_SUM_EVEN()
--10. Write a function that checks if a given string is a palindrome
	CREATE OR ALTER FUNCTION FN_COMPARE
	(
		@N1 INT,
		@N2 INT
	)
	RETURNS VARCHAR(MAX)
	AS
	BEGIN
		DECLARE @ANS VARCHAR(30) = ''
		SET @ANS = CASE
			WHEN @N1 > @N2 THEN CAST(@N1 AS VARCHAR) +' IS GREATER THAN '+CAST(@N2 AS VARCHAR) 
			WHEN @N1 < @N2 THEN CAST(@N2 AS VARCHAR)  +' IS GREATER THAN '+CAST(@N1 AS VARCHAR) 
		ELSE 'INVALID'
		END
		RETURN  @ANS
	END
--Part – C
--11. Write a function to check whether a given number is prime or not.
--12. Write a function which accepts two parameters start date & end date, and returns a difference in days.
--13. Write a function which accepts two parameters year & month in integer and returns total days each year.
--14. Write a function which accepts departmentID as a parameter & returns a detail of the persons.
--15. Write a function that returns a table with details of all persons who joined after 1-1-1991.

---------------------------------------Lab-6----------------------------------------------------------
CREATE TABLE Products ( 
Product_id INT PRIMARY KEY, 
Product_Name VARCHAR(250) NOT NULL, 
Price DECIMAL(10, 2) NOT NULL 
);
INSERT INTO Products (Product_id, Product_Name, Price) VALUES 
(1, 'Smartphone', 35000), 
(2, 'Laptop', 65000), 
(3, 'Headphones', 5500), 
(4, 'Television', 85000), 
(5, 'Gaming Console', 32000); 
--1. Create a cursor Product_Cursor to fetch all the rows from a products table.
	DECLARE @Product_id INT,@Product_Name VARCHAR(250),@Price DECIMAL(10, 2);

	DECLARE Product_Cursor CURSOR

	FOR SELECT Product_id,Product_Name,Price FROM Products;
	OPEN Product_Cursor;
	FETCH NEXT FROM Product_Cursor INTO @Product_id,@Product_Name,@Price;
	WHILE @@FETCH_STATUS = 0
	BEGIN 
		PRINT CAST(@Product_id AS VARCHAR)+'-'+@Product_Name+'-'+CAST(@Price AS VARCHAR);
		FETCH NEXT FROM Product_Cursor INTO @Product_id,@Product_Name,@Price;
	END
	CLOSE Product_Cursor;
	DEALLOCATE Product_Cursor;
--2. Create a cursor Product_Cursor_Fetch to fetch the records in form of ProductID_ProductName.(Example: 1_Smartphone)
	DECLARE @Product_id1 INT,@Product_Name1 VARCHAR(250)

	DECLARE Product_Cursor_Fetch CURSOR
	FOR SELECT Product_id,Product_Name FROM Products;
	OPEN Product_Cursor_Fetch;
	FETCH NEXT FROM Product_Cursor_Fetch INTO @Product_id1,@Product_Name1;
	WHILE @@FETCH_STATUS = 0
	BEGIN 
		PRINT CAST(@Product_id1 AS VARCHAR)+'_'+@Product_Name1;
		FETCH NEXT FROM Product_Cursor_Fetch INTO @Product_id1,@Product_Name1;
	END
	CLOSE Product_Cursor_Fetch;
	DEALLOCATE Product_Cursor_Fetch;
--3. Create a Cursor to Find and Display Products Above Price 30,000. 
	DECLARE @Product_id2 INT,@Product_Name2 VARCHAR(250),@Price2 DECIMAL(10, 2);

	DECLARE Product_Cursor1 CURSOR
	FOR SELECT Product_id,Product_Name,Price FROM Products;
	OPEN Product_Cursor1;
	FETCH NEXT FROM Product_Cursor1 INTO @Product_id2,@Product_Name2,@Price2;
	WHILE @@FETCH_STATUS = 0
	BEGIN 
		IF @Price2>30000
		BEGIN
		PRINT CAST(@Product_id2 AS VARCHAR)+'-'+@Product_Name2+'-'+CAST(@Price2 AS VARCHAR);
		END
		FETCH NEXT FROM Product_Cursor1 INTO @Product_id2,@Product_Name2,@Price2;
	END
	CLOSE Product_Cursor1;
	DEALLOCATE Product_Cursor1;
--4. Create a cursor Product_CursorDelete that deletes all the data from the Products table.
	DECLARE @PID INT;

	DECLARE Product_DELETE CURSOR
	FOR SELECT Product_id FROM Products;
	OPEN Product_DELETE;
	FETCH NEXT FROM Product_DELETE INTO @PID;
	WHILE @@FETCH_STATUS = 0
	BEGIN
		DELETE FROM Products
		FETCH NEXT FROM Product_DELETE INTO @PID;
	END
	CLOSE Product_DELETE;
	DEALLOCATE Product_DELETE;
-----------------------------------------------PART-B------------------------------------------
--5. Create a cursor Product_CursorUpdate that retrieves all the data from the products table and increases the price by 10%. 
	DECLARE @P_ID INT,@P_Name VARCHAR(250),@Price_ DECIMAL(10, 2);

	DECLARE Product_CursoR_INC CURSOR
	FOR SELECT Product_id,Product_Name,Price FROM Products;
	OPEN Product_CursoR_INC;
	FETCH NEXT FROM Product_CursoR_INC INTO @P_ID,@P_Name,@Price_;
	WHILE @@FETCH_STATUS = 0
	BEGIN
		SET @Price_ = @Price_+ @Price_*0.1;
		PRINT CAST(@P_ID AS VARCHAR)+'-'+@P_Name+'-'+CAST(@Price_ AS VARCHAR);
		FETCH NEXT FROM Product_CursoR_INC INTO @P_ID,@P_Name,@Price_;
	END
	CLOSE Product_CursoR_INC;
	DEALLOCATE Product_CursoR_INC;
--6. Create a Cursor to Rounds the price of each product to the nearest whole number. 
	DECLARE @P__ID INT,@P__NAME VARCHAR(250),@Price__ DECIMAL(10, 2);

	DECLARE Product_Cursor_ROUND CURSOR
	FOR SELECT Product_id,Product_Name,Price FROM Products;
	OPEN Product_Cursor_ROUND;
	FETCH NEXT FROM Product_Cursor_ROUND INTO @P__ID,@P__NAME,@Price__;
	WHILE @@FETCH_STATUS = 0
	BEGIN 
		UPDATE Products
		SET @Price__ = ROUND(@Price__,0) WHERE Product_id = @P__ID

		FETCH NEXT FROM Product_Cursor_ROUND INTO @P__ID,@P__NAME,@Price__;
	END
	CLOSE Product_Cursor_ROUND;
	DEALLOCATE Product_Cursor_ROUND;
-----------------------------------------------PART-C-------------------------------------------
--7. Create a cursor to insert details of Products into the NewProducts table if the product is “Laptop” (Note: Create NewProducts table first with same fields as Products table)
	CREATE TABLE NPRODUCT ( 
Product_id INT PRIMARY KEY, 
Product_Name VARCHAR(250) NOT NULL, 
Price DECIMAL(10, 2) NOT NULL 
);
	DECLARE @P__ID_ INT,@P__NAME_ VARCHAR(250),@_Price__ DECIMAL(10, 2);

	DECLARE NProduct_Cursor CURSOR
	FOR SELECT Product_id,Product_Name,Price FROM Products;
	OPEN NProduct_Cursor;
	FETCH NEXT FROM NProduct_Cursor INTO @P__ID_,@P__NAME_,@_Price__;
	WHILE @@FETCH_STATUS = 0
	BEGIN 
		IF @P__NAME_ = 'LAPTOP'
		BEGIN
		INSERT INTO NPRODUCT VALUES(@P__ID_,@P__NAME_,@_Price__)
		PRINT CAST(@P__ID_ AS VARCHAR)+'-'+@P__NAME_+'-'+CAST(@_Price__ AS VARCHAR);
		END
		FETCH NEXT FROM NProduct_Cursor INTO @P__ID_,@P__NAME_,@_Price__;
	END
	CLOSE NProduct_Cursor;
	DEALLOCATE NProduct_Cursor;
--8. Create a Cursor to Archive High-Price Products in a New Table (ArchivedProducts), Moves products with a price above 50000 to an archive table, removing them from the original Products table. 
	DECLARE @P_ID_ INT,@P_NAME_ VARCHAR(250),@_Price_ DECIMAL(10, 2);

	DECLARE Product_Cursor_ROUND CURSOR
	FOR SELECT Product_id,Product_Name,Price FROM Products;
	OPEN Product_Cursor_ROUND;
	FETCH NEXT FROM Product_Cursor_ROUND INTO @P__ID,@P__NAME,@_Price_;
	WHILE @@FETCH_STATUS = 0
	BEGIN 
		UPDATE Products
		SET @Price__ = ROUND(@Price__,0) WHERE Product_id = @P__ID

		FETCH NEXT FROM Product_Cursor_ROUND INTO @P__ID,@P__NAME,@Price__;
	END
	CLOSE Product_Cursor_ROUND;
	DEALLOCATE Product_Cursor_ROUND;

--------------------------------------------Lab-5----------------------------------------------------------
	CREATE TABLE PersonInfo ( 
	PersonID INT PRIMARY KEY, 
	PersonName VARCHAR(100) NOT NULL, 
	Salary DECIMAL(8,2) NOT NULL, 
	JoiningDate DATETIME NULL, 
	City VARCHAR(100) NOT NULL, 
	Age INT NULL, 
	BirthDate DATETIME NOT NULL 
	);

	CREATE TABLE PersonLog ( 
	PLogID INT PRIMARY KEY IDENTITY(1,1), 
	PersonID INT NOT NULL, 
	PersonName VARCHAR(250) NOT NULL, 
	Operation VARCHAR(50) NOT NULL, 
	UpdateDate DATETIME NOT NULL,  
	); 
	SELECT * FROM PERSONLOG
	SELECT * FROM PersonInfo
	--	Part – A 
	--1. Create a trigger that fires on INSERT, UPDATE and DELETE operation on the PersonInfo table to display 
	--a message “Record is Affected.”  
	CREATE TRIGGER TR_PRINT_MESSAGE
	ON PERSONINFO
	AFTER INSERT,UPDATE,DELETE
	AS 
	BEGIN
		PRINT('Record is Affected.')
	END

	INSERT INTO PERSONINFO VALUES(101,'ABC',10000,'2005-12-23','RAJKOT',29,'1976-10-12')
	DROP TRIGGER TR_PRINT_MESSAGE
	--2. Create a trigger that fires on INSERT, UPDATE and DELETE operation on the PersonInfo table. For that, 
	CREATE TRIGGER TR_INSERT
	ON PERSONINFO
	AFTER INSERT
	AS 
	BEGIN
		DECLARE @PERSONID INT
		DECLARE @PERSONNAME VARCHAR(50)
		SELECT @PERSONID = PERSONID FROM inserted
		SELECT @PERSONNAME = PERSONNAME FROM inserted
		INSERT INTO PERSONLOG
		VALUES
		(@PERSONID,@PERSONNAME,'INSERT',GETDATE())
	END

	INSERT INTO PERSONINFO VALUES(102,'XYZ',20000,'2006-12-23','GONDAL',29,'1977-10-12')
	DROP TRIGGER TR_INSERT

	CREATE TRIGGER TR_UPDATE
	ON PERSONINFO
	AFTER UPDATE
	AS 
	BEGIN
		DECLARE @PERSONID INT
		DECLARE @PERSONNAME VARCHAR(50)
		SELECT @PERSONID = PERSONID FROM inserted
		SELECT @PERSONNAME = PERSONNAME FROM inserted
		INSERT INTO PERSONLOG
		VALUES
		(@PERSONID,@PERSONNAME,'UPDATE',GETDATE())
	END
	INSERT INTO PERSONINFO VALUES(102,'DU',20000,'2006-12-23','GONDAL',29,'1977-10-12')
	DROP TRIGGER TR_UPDATE

	CREATE TRIGGER TR_DELETE
	ON PERSONINFO
	AFTER DELETE
	AS 
	BEGIN
		DECLARE @PERSONID INT
		DECLARE @PERSONNAME VARCHAR(50)
		SELECT @PERSONID = PERSONID FROM deleted
		SELECT @PERSONNAME = PERSONNAME FROM deleted
		INSERT INTO PERSONLOG
		VALUES
		(@PERSONID,@PERSONNAME,'DELETE',GETDATE())
	END
	DROP TRIGGER TR_DELETE
	--3. Create an INSTEAD OF trigger that fires on INSERT, UPDATE and DELETE operation on the PersonInfo 
	--table. For that, log all operations performed on the person table into PersonLog. \
	CREATE TRIGGER TR_INSERT_INSTEADOF
	ON PERSONINFO
	INSTEAD OF INSERT
	AS 
	BEGIN
		DECLARE @PERSONID INT
		DECLARE @PERSONNAME VARCHAR(50)
		SELECT @PERSONID = PERSONID FROM inserted
		SELECT @PERSONNAME = PERSONNAME FROM inserted

		INSERT INTO PERSONLOG
		VALUES
		(@PERSONID,@PERSONNAME,'INSERT',GETDATE())
	END

	INSERT INTO PERSONINFO VALUES(107,'ERSF',20000,'2006-12-23','GONDAL',29,'1977-10-12')
	DROP TRIGGER TR_INSERT_INSTEADOF

	CREATE TRIGGER TR_UPDATE_INSTEADOF
	ON PERSONINFO
	INSTEAD OF UPDATE
	AS 
	BEGIN
		DECLARE @PERSONID INT
		DECLARE @PERSONNAME VARCHAR(50)
		SELECT @PERSONID = PERSONID FROM inserted
		SELECT @PERSONNAME = PERSONNAME FROM inserted
		INSERT INTO PERSONLOG
		VALUES
		(@PERSONID,@PERSONNAME,'UPDATE',GETDATE())
	END
	INSERT INTO PERSONINFO VALUES(105,'SEF',20000,'2006-12-23','GONDAL',29,'1977-10-12')
	DROP TRIGGER TR_UPDATE_INSTEADOF

	CREATE TRIGGER TR_DELETE_INSTEADOF
	ON PERSONINFO
	INSTEAD OF DELETE
	AS 
	BEGIN
		DECLARE @PERSONID INT
		DECLARE @PERSONNAME VARCHAR(50)
		SELECT @PERSONID = PERSONID FROM deleted
		SELECT @PERSONNAME = PERSONNAME FROM deleted
		INSERT INTO PERSONLOG
		VALUES
		(@PERSONID,@PERSONNAME,'DELETE',GETDATE())

	END
	DELETE FROM PERSONINFO WHERE PERSONID = 102
	DROP TRIGGER TR_DELETE_INSTEADOF

	--4. Create a trigger that fires on INSERT operation on the PersonInfo table to convert person name into 
	--uppercase whenever the record is inserted. 
	CREATE TRIGGER TR_CONVERT_UPPERCASE
	ON PERSONINFO
	AFTER INSERT
	AS 
	BEGIN
		DECLARE @PERSONID INT
		DECLARE @PERSONNAME VARCHAR(50)

		SELECT @PERSONID = PERSONID FROM inserted
		SELECT @PERSONNAME = PERSONNAME FROM inserted

		UPDATE PERSONINFO
		SET PERSONNAME = UPPER(@PERSONNAME)
		WHERE PERSONID = @PERSONID
	END	
	DROP TRIGGER TR_CONVERT_UPPERCASE

	--5. Create trigger that prevent duplicate entries of person name on PersonInfo table.
	CREATE TRIGGER TR_PREVENT_DUPLICATE
	ON PERSONINFO
	AFTER INSERT
	AS 
	BEGIN
		
	END	
	DROP TRIGGER TR_CONVERT_UPPERCASE
	
	--6. Create trigger that prevent Age below 18 years. 
	CREATE TRIGGER TR_AGE_BELOW_18
	ON PERSONINFO
	AFTER INSERT
	AS 
	BEGIN
		INSERT INTO PERSONINFO(
	END	
	DROP TRIGGER TR_CONVERT_UPPERCASE
