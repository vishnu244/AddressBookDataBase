create database AddressBookService
use AddressBookService

--------uc2-Create Address Book Table----------

create table AddressBook (
ID int Primary Key Identity (1,1),
FirstName Varchar(100),
LastName Varchar(100),
Address Varchar(100),
City Varchar(100),
State Varchar(100),
Zip int,
PhoneNumber Varchar(12),
Email_ID Varchar(100)
);

----------uc3-Insert new Contacts to Address Book----------------

Insert into AddressBook Values ('Shravanthi','Pabboji','ABC Colony','Old Alwal','Telangana',500010,'9000000001','shravanthi@gmail.com');
Insert into AddressBook Values ('Vishnu','Nali','ABC Colony','Vijayawada','Andhra Pradesh',500011,'9000000002','Vishnu@gmail.com');
Insert into AddressBook Values ('Bhagya','Mallapururam','ABC Colony','Banglore','Karnataka',500012,'9000000003','Bhagya@gmail.com');
Insert into AddressBook Values ('Santosh','Reddy','XYZ Colony','Pune','Maharashtra',500013,'9000000004','Santoo@gmail.com');
Insert into AddressBook Values ('Vihaan','Mallapuram','PQR Colony','Kochi','Kerala',500014,'9000000005','Tippu@gmail.com');
Select * from AddressBook;

---------UC4 - Edit existing contact using name----------

update AddressBook set Address='currency Colony' where FirstName='Shravanthi';
update AddressBook set Address='Kanuru' where FirstName='Vishnu'

---------UC5 - Delete Contact using name-----------
Insert into AddressBook Values ('abc','xyz','ABC Colony','Temple Alwal','Telangana',500010,'9000000005','abc@gmail.com');

Delete From AddressBook where FirstName = 'abc';

--------UC6 - Retrieve person or contact belonging to particular state or city-------------

Select * from AddressBook where City ='Temple Alwal' or State ='Telangana';
Select * from AddressBook where City ='Vijayawada';
Select * from AddressBook where State ='Kerala';


-------UC7 - size of AddressBook using city or state----------

select count(City) from AddressBook;
select count(State) from AddressBook;

-------UC8 - Sort Contacts by name in alphabetical order-----

Select * from AddressBook order by FirstName ASC;
Select * from AddressBook order by FirstName DESC;
Select * from AddressBook where City = 'Old Alwal' order by LastName ASC;
Select * from AddressBook where City = 'Vijayawada' order by LastName ASC;

-------UC9 - Add ContactType------------
Alter table AddressBook add ContactType varchar(100);
update AddressBook set ContactType='Friend' where LastName='Reddy';
update AddressBook set ContactType='Profession' where LastName='Pabboji';
update AddressBook set ContactType='Family' where LastName='Nali';
update AddressBook set ContactType='Profession,' where LastName='Mallapururam';
Select * from AddressBook;

--------UC10-get count by ContactType---------------------
select Count(ContactType) from AddressBook;

-------UC11 - add same person to frnd and family---------

Insert into AddressBook Values ('raju','nali','kanuru','Vijayawada','Andhra Pradesh',500012,'9000000006','raju@gmail.com','Family'),
('Sai','Allu','Mahan Colony','Gannavaram','Andhra',500019,'9000000009','Sai@gmail.com','Friend');
Insert into AddressBook Values ('Sai','Allu','Mahan Colony','Gannavaram','Andhra',500019,'9000000009','Sai@gmail.com','Family');
Select * from AddressBook;

--------------UC12-Creating table using ER Diagram-------------------

Create table Address_Book1(AddressBookId Int Identity(1,1) Primary Key,
						  AddressBookName varchar(100));

Create table PersonDetail1(   PersonId Int Identity(1,1) Primary Key,
							 AddressBookId Int Foreign Key References Address_Book1(AddressBookId),
							 FirstName varchar(50),
							 LastName varchar(50),
							 Address varchar(100),
							 City varchar(50),
							 State varchar(50),
							 Zip int,
							 PhoneNumber bigint,
							 Email_ID varchar(50)    );

CREATE table PersonTypes1(	 PersonTypeId Int Identity(1,1) Primary Key,
							 PersonType varchar(50), );


CREATE table PersonsDetail_Type1(PersonId Int Foreign Key References PersonDetail1(PersonId),
								PersonTypeId Int Foreign Key References PersonTypes1(PersonTypeId)  );


CREATE table Employee_Department1(PersonId Int Foreign Key References PersonDetail1(PersonId),
								EmployeeID Int  ,
								DepartmentID int,);

				
select *from Address_Book1;
select *from PersonDetail1;
select *from PersonTypes1;
select *from PersonsDetail_Type1;
select *from Employee_Department1;


-------------Inserting values into Address_Book1 table---------------------------------
INSERT INTO Address_Book1(AddressBookName) Values('Home'),('School'),('College'),('Office');

select *from Address_Book1;


------------Insert values in PersonDetail1 table-------------
Insert INTO PersonDetail1 VALUES(1,'Ram','Krishna','Poranki','Gudivada','Andhra Pradesh',520001,1234567890,'Ram@gmail.com'),
								(2,'sai','Gupta','AyyappaNagar','Vijayawada','Karnataka',520002,1234567891,'sai@gmail.com'),
								(3,'Shravanthi','Pabboji','ABC Colony','Alwal','Telangana',520003,1234567892,'Shravanthi@gamil.com'),
								(4,'Vishnu','vardhan','Kanuru','Vijayawada','Andhra Pradeshtra',520007,1234567893,'Vishnu@gmail.com');
select *from PersonDetail1;


---------Inserting values into persontype1 table--------------
INSERT INTO PersonTypes1(PersonType) VALUES('Family'),('SchoolFriend'),('Friend'),('Profession');

select *from PersonTypes1;

-----------Insert values in PersonsDetail_Type1 table-------------
INSERT INTO PersonsDetail_Type1(PersonId,PersonTypeId) VALUES(1,4),(2,3),(3,1),(4,2);
select *from PersonsDetail_Type1;

-----------Insert values in Employee_Department1 table-------------
INSERT INTO Employee_Department1 VALUES(1,123,818),(2,456,19112),(3,789,4512),(4,244,161815)
select *from Employee_Department1;


-----------UC13-Ensuring All retrieve queries from UC6 to UC10 with new table---------
-----------UC6-Retrieve Person belonging to city Or State-------------- -----------
SELECT addressbook.AddressBookId,addressbook.AddressBookName,persondetail.PersonId,persondetail.FirstName,persondetail.LastName,persondetail.Address,persondetail.City,persondetail.State,persondetail.Zip,
persondetail.PhoneNumber,persondetail.Email_ID,persontype.PersonType,persontype.PersonTypeId FROM
Address_Book1 AS addressbook 
INNER JOIN PersonDetail1 AS persondetail ON addressbook.AddressBookId = persondetail.AddressBookId AND (persondetail.City='Vijayawada' OR persondetail.State='Andhra Pradesh')
INNER JOIN PersonsDetail_Type1 as persontypedetail On persontypedetail.PersonId = persondetail.PersonId
INNER JOIN PersonTypes1 AS persontype ON persontype.PersonTypeId = persontypedetail.PersonTypeId;

----------UC7-understand Size of AddressBook by city and state---------
Select Count(*) As Count,State from PersonDetail1 Group By State;
Select Count(*) As Count,City from PersonDetail1 Group By City;

select Count(city) from PersonDetail1
select * from PersonDetail1

----------------UC8-Retrieve entries sorted alphabetically by person name---------------
SELECT addressbook.AddressBookId,addressbook.AddressBookName,persondetail.PersonId,persondetail.FirstName,persondetail.LastName,persondetail.Address,persondetail.City,persondetail.State,persondetail.Zip,
persondetail.PhoneNumber,persondetail.Email_Id,pt.PersonType,pt.PersonTypeId FROM
Address_Book1 AS addressbook 
INNER JOIN PersonDetail1 AS persondetail ON addressbook.AddressBookId = persondetail.AddressBookId 
INNER JOIN PersonsDetail_Type1 as ptm On ptm.PersonId = persondetail.PersonId
INNER JOIN PersonTypes1 AS pt ON pt.PersonTypeId = ptm.PersonTypeId Order By FirstName;

---------------UC_9Retreive Number Of Persons Records Based On Person Types---------------
Select Count(a.PersonTypeId) As PersonCount,b.PersonType From 
PersonsDetail_Type1 As a 
INNER JOIN PersonTypes1 AS b ON b.PersonTypeId = a.PersonTypeId
INNER JOIN PersonDetail1 AS c ON c.PersonId = a.PersonId Group By a.PersonTypeId,b.PersonType;

---------------UC_10_Retreive Number Of Persons Records Based On AddressBook Names----------
Select Count(a.AddressBookId) As AddressBookCount,a.AddressBookName From 
Address_Book1 As a 
INNER JOIN PersonDetail1 AS pd ON pd.AddressBookId = a.AddressBookId Group By a.AddressBookName,pd.AddressBookId;
						
						
						