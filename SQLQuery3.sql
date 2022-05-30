CREATE DATABASE Bookshelf

use Bookshelf


CREATE TABLE Books(
 Id int primary key identity,
 [Name] nvarchar(50) constraint CK_Name check(len([Name])<100 and len([Name])>2),
 AuthorId int,
 [PageCount] int constraint CK_Count check([PageCount]>10)
)

CREATE TABLE Authors(
 AutId int primary key identity,
 [Name] nvarchar(50) not null,
 Surname nvarchar(50) not null
)

ALTER TABLE Books
add Authors_Id int foreign key references Authors(AutId)

INSERT INTO Books(Name,PageCount)
values('Harry Potter', 487),
('Fifty Shades of Grey', 500),
('Angels and Demons', 658),
('Twilight', 566),
('Lord of the Rings', 712)


INSERT INTO Authors(Name,Surname)
VALUES ('Joanne', 'Rowling'),
('Erika', 'Mitchell'),
('Dan', 'Brown')


SELECT (A.Name + ' ' + Surname) as Fullname, B.name as Books, B.PageCount as AllPage from Books as B
 join Authors as A
on B.AuthorId = B.Id