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

Create table Address_Book(AddressBookId Int Identity(1,1) Primary Key,
						  AddressBookName varchar(100));

Create table PersonDetail(   PersonId Int Identity(1,1) Primary Key,
							 AddressBookId Int Foreign Key References Address_Book(AddressBookId),
							 FirstName varchar(50),
							 LastName varchar(50),
							 Address varchar(100),
							 City varchar(50),
							 State varchar(50),
							 Zip int,
							 PhoneNumber bigint,
							 Email_ID varchar(50)    );

CREATE table PersonTypes(	 PersonTypeId Int Identity(1,1) Primary Key,
							 PersonType varchar(50), );


CREATE table PersonsDetail_Type(PersonId Int Foreign Key References PersonDetail(PersonId),
								PersonTypeId Int Foreign Key References PersonTypes(PersonTypeId),
								EmployeeID Int Primary Key );


CREATE table Employee_Department(PersonId Int Foreign Key References PersonDetail(PersonId),
								EmployeeID Int  ,
								DepartmentID int,);

				
select *from Address_Book;
select *from PersonDetail;
select *from PersonTypes;
select *from PersonsDetail_Type;
select *from Employee_Department;





						
						
						