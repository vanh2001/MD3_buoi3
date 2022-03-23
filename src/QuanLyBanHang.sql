create database QuanLyBanHang;

use QuanLyBanHang;

create table Customer(
    cID int,
    name nvarchar(25),
    cAge tinyint,
    primary key (cID)
);

create table cOrder(
    oID int,
    cID int,
    oDate datetime,
    oTotalPrice int,
    primary key (oID),
    foreign key (cID) references Customer(cID)
);

create table Product(
    pID int,
    pName nvarchar(25),
    pPrice int,
    primary key (pID)
);

create table oderDetail(
    oID int,
    pID int,
    odQTY int,
    primary key (oID, pID),
    foreign key (oID) references cOrder(oID),
    foreign key (pID) references Product(pID)
);

insert into Customer (cID, name, cAge) VALUES (1,'Minh Quan', 10);
insert into Customer (cID, name, cAge) VALUES (2,'Ngoc Oanh', 20);
insert into Customer (cID, name, cAge) VALUES (3,'Hong Ha', 50);
select * from Customer;

insert into cOrder (oID, cID, oDate, oTotalPrice) values (1,1,'2006-03-21',null);
insert into cOrder (oID, cID, oDate, oTotalPrice) values (2,2,'2006-03-23',null);
insert into cOrder (oID, cID, oDate, oTotalPrice) values (3,1,'2006-03-16',null);
select * from cOrder;

insert into Product (pID, pName, pPrice) VALUES (1, 'May Giat', 3);
insert into Product (pID, pName, pPrice) VALUES (2, 'Tu Lanh', 5);
insert into Product (pID, pName, pPrice) VALUES (3, 'Dieu Hoa', 7);
insert into Product (pID, pName, pPrice) VALUES (4, 'Quat', 1);
insert into Product (pID, pName, pPrice) VALUES (5, 'Bep Dien', 2);
select * from Product;

insert into oderDetail (oID, pID, odQTY) VALUES (1,1,3);
insert into oderDetail (oID, pID, odQTY) VALUES (1,3,7);
insert into oderDetail (oID, pID, odQTY) VALUES (1,4,2);
insert into oderDetail (oID, pID, odQTY) VALUES (2,1,1);
insert into oderDetail (oID, pID, odQTY) VALUES (3,1,8);
insert into oderDetail (oID, pID, odQTY) VALUES (2,5,4);
insert into oderDetail (oID, pID, odQTY) VALUES (2,3,3);
select * from oderDetail;

select *
from cOrder
join oderDetail on cOrder.oID = oderDetail.oID
join Product on oderDetail.pID = Product.pID;

select oderDetail.oID as MAHOADON, pName as TENSANPHAM, oDate as NGAYMUA, odQTY as SOLUONG, pPrice as DONGIA,  sum(odQTY * Product.pPrice) as TONGTIEN
from cOrder
join oderDetail on cOrder.oID = oderDetail.oID
join Product on oderDetail.pID = Product.pID
group by cOrder.oID;
