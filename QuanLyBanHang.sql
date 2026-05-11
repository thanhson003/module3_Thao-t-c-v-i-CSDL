create database `QuanLyBanHang`;
use QuanLyBanHang;
create table Customer(
cID int not null auto_increment primary key,
cName varchar(30) not null,
cAge int not null
);

create table Order1(
oID int not null auto_increment primary key,
cID int not null,
oDate datetime,
oTotalPrice float ,
foreign key(cID) references Customer(cID) 
);

create table Product(
pID int not null auto_increment primary key,
pName varchar(30) not null,
pPrice float not null
);

create table OrderDetail(
oID int not null ,
pID int not null ,
primary key(oID,pID),
odQTY  int not null,
foreign key(oID) references Order1(oID),
foreign key(pID) references Product(pID)
);

-- 3. Thao tác với CSDL
-- bài tập  

insert into Customer(cName,cAge)
values  ('Minh Quan', 10),
		('Ngoc Oanh', 20),
        ('Hong Ha', 50);
        
insert into Order1(cID,oDate,oTotalPrice)
values  (1,'2006-3-21',null),
		(2,'2006-3-23',null),
        (1,'2006-3-16',null);
        
insert into Product(pName,pPrice)
values  ('May Giat',3),
		('Tu lanh',5),
        ('Dieu hoa',7),
        ('Quat',1),
        ('Bep dien',2);
        
insert into OrderDetail(oID,pID,odQTY)
values  (1,1,3),
		(1,3,7),
        (1,4,2),
        (2,1,1),
        (3,1,8),
        (2,5,4),
        (2,3,3);

select oID,oDate,oTotalPrice from Order1;

select C.cName as Customer_Name, P.pName as Product_Name
from Customer C inner join Order1 O on C.cID = O.cID
				inner join OrderDetail Od on O.oID = Od.oID
                inner join Product P on Od.pID = P.pID;

select C.cName as Customer_Name , O.oID as Order_ID
from Customer C left join Order1 O on C.cID = O.cID
where O.oID is null;

select Od.oID, O.oDate, sum(odQTY * pPrice) as Total_Amount
from OrderDetail Od inner join Order1 O on Od.oID = O.oID
					inner join Product P on Od.pID = P.pID
where Od.oID group by oID;