use master
go
create database Viethub
go
use Viethub
go

create table UserAccount(
	id varchar(4) not null primary key,
	name nvarchar(50),
	username varchar(50),
	pw varchar(20),
	gender bit,
	address varchar(100),
	datebegin smalldatetime
)
insert into UserAccount values
('1001', 'Nguyen Quoc Vinh', 'nqvinh','123',1,'HCM','11/11/2011' ),
('1002', 'Vo Tan Loi', 'vtloi','123',1,'HCM','11/11/2011' ),
('1003', 'Do Quoc Dung', 'dqdung','123',1 ,'HCM','11/11/2011' )
create table Menu( 
	id int not null identity(1,1) primary key,
	name nvarchar(50),
	link nvarchar(max),
	meta nvarchar(50),
	hide bit,
	[order] int,
	datebegin smalldatetime,
);
insert into Menu Values
(N'Home', '/Home','home',0,0,'02/14/2023'),
(N'About', '/Home/About','about',0,2,'02/14/2023'),
(N'Menu', '/VhMenu/Index','menu',0,2,'02/14/2023'),
(N'New', '/VhNew/Index','new',0,2,'02/14/2023'),
(N'Contact', '/Home/Contact','contact',0,3,'02/14/2023')
create table Footer(
	id int not null identity(1,1) primary key,
	name nvarchar(50),
	icon nvarchar(50),
	link nvarchar(max),
	meta nvarchar(50),
	hide bit,
	[order] int,
	datebegin smalldatetime,
);
insert into Footer Values
(N'instagram', 'fa-instagram','https://www.instagram.com/','Foody-instagram',0,0,'02/14/2023'),
(N'facebook', 'fa-dribbble','https://www.facebook.com/','Foody-facebook',0,2,'02/14/2023'),
(N'yotube','fa-twitter', 'https://www.youtube.com/','Foody-youtube',0,3,'02/14/2023')

create table Category(
	id int not null identity(1,1) primary key,
	name nvarchar(50),
	link nvarchar(max),
	description nvarchar(max),
	meta nvarchar(50),
	hide bit,
	[order] int,
	datebegin smalldatetime,
)

insert into Category values
(N'Khai vị', 'https://www.google.com/','Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', 'mon-khai-vi',0,0,'02/22/2023' ),
(N'Món Lẩu', 'https://www.google.com/','Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',  'mon-lau',0,2,'02/22/2023'  ),
(N'Món chiên', 'https://www.google.com/','Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',  'mon-chien',0,3,'02/22/2023'  ),
(N'Món nướng','https://www.google.com/','Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',  'mon-nuong',0,4,'02/22/2023'  ),
(N'Món tráng miệng','https://www.google.com/','Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',  'mon-trang-mieng',0,5,'02/22/2023')
create table Dish(
	id int not null identity(1,1) primary key,
	name nvarchar(50),
	price float,
	img nvarchar(50),
	description ntext,
	meta nvarchar(50),
	hide bit,
	[order] int,
	datebegin smalldatetime,
	categoryid int foreign key references Category(id)
)
insert into Dish values
(N'Lẩu cá chua cay',29, N'products-img-01.jpg',
N'Lẩu cá lóc chua cay siêu ngon ăn là ghiền, húp nước lẩu nóng sùn sụt, ăn nhẹ miếng bún là bá chay <br>
Lẩu cá lóc chua cay siêu ngon ăn là ghiền, húp nước lẩu nóng sùn sụt, ăn nhẹ miếng bún là bá chay <br>
Lẩu cá lóc chua cay siêu ngon ăn là ghiền, húp nước lẩu nóng sùn sụt, ăn nhẹ miếng bún là bá chay <br>
Lẩu cá lóc chua cay siêu ngon ăn là ghiền, húp nước lẩu nóng sùn sụt, ăn nhẹ miếng bún là bá chay <br>',
'lau-ca-chua-cay',0,0,'02/22/2023',1),
(N'Kem dừa',199, N'product-img-02.jpg',
N'Lẩu cá lóc chua cay siêu ngon ăn là ghiền, húp nước lẩu nóng sùn sụt, ăn nhẹ miếng bún là bá chay
Lẩu cá lóc chua cay siêu ngon ăn là ghiền, húp nước lẩu nóng sùn sụt, ăn nhẹ miếng bún là bá chay <br>
Lẩu cá lóc chua cay siêu ngon ăn là ghiền, húp nước lẩu nóng sùn sụt, ăn nhẹ miếng bún là bá chay <br>
Lẩu cá lóc chua cay siêu ngon ăn là ghiền, húp nước lẩu nóng sùn sụt, ăn nhẹ miếng bún là bá chay <br>
Lẩu cá lóc chua cay siêu ngon ăn là ghiền, húp nước lẩu nóng sùn sụt, ăn nhẹ miếng bún là bá chay <br>',
'kem-dua',0,2,'02/22/2023',1),
(N'Ếch xào',9999, N'product-img-03.jpg',
N'Lẩu cá lóc chua cay siêu ngon ăn là ghiền, húp nước lẩu nóng sùn sụt, ăn nhẹ miếng bún là bá chay
Lẩu cá lóc chua cay siêu ngon ăn là ghiền, húp nước lẩu nóng sùn sụt, ăn nhẹ miếng bún là bá chay <br>
Lẩu cá lóc chua cay siêu ngon ăn là ghiền, húp nước lẩu nóng sùn sụt, ăn nhẹ miếng bún là bá chay <br>
Lẩu cá lóc chua cay siêu ngon ăn là ghiền, húp nước lẩu nóng sùn sụt, ăn nhẹ miếng bún là bá chay <br>
Lẩu cá lóc chua cay siêu ngon ăn là ghiền, húp nước lẩu nóng sùn sụt, ăn nhẹ miếng bún là bá chay <br>',
'ech-xao',0,3,'02/22/2023',1),
(N'Ức gà luộc',2199, N'product-img-04.jpg',
N'Lẩu cá lóc chua cay siêu ngon ăn là ghiền, húp nước lẩu nóng sùn sụt, ăn nhẹ miếng bún là bá chay',
'uc-ga-luoc',0,4,'02/22/2023',1),
(N'Thịt kho trứng',2299, N'product-img-05.jpg',
N'Lẩu cá lóc chua cay siêu ngon ăn là ghiền, húp nước lẩu nóng sùn sụt, ăn nhẹ miếng bún là bá chay <br>
Lẩu cá lóc chua cay siêu ngon ăn là ghiền, húp nước lẩu nóng sùn sụt, ăn nhẹ miếng bún là bá chay <br>
Lẩu cá lóc chua cay siêu ngon ăn là ghiền, húp nước lẩu nóng sùn sụt, ăn nhẹ miếng bún là bá chay <br>
Lẩu cá lóc chua cay siêu ngon ăn là ghiền, húp nước lẩu nóng sùn sụt, ăn nhẹ miếng bún là bá chay <br>
Lẩu cá lóc chua cay siêu ngon ăn là ghiền, húp nước lẩu nóng sùn sụt, ăn nhẹ miếng bún là bá chay <br>
Lẩu cá lóc chua cay siêu ngon ăn là ghiền, húp nước lẩu nóng sùn sụt, ăn nhẹ miếng bún là bá chay <br>
',
'thit-kho-trung',0,5,'02/22/2023',2),
(N'Gà quay',2919, N'product-img-06.jpg',
N'Lẩu cá lóc chua cay siêu ngon ăn là ghiền, húp nước lẩu nóng sùn sụt, ăn nhẹ miếng bún là bá chay
Lẩu cá lóc chua cay siêu ngon ăn là ghiền, húp nước lẩu nóng sùn sụt, ăn nhẹ miếng bún là bá chay <br>
Lẩu cá lóc chua cay siêu ngon ăn là ghiền, húp nước lẩu nóng sùn sụt, ăn nhẹ miếng bún là bá chay <br>
Lẩu cá lóc chua cay siêu ngon ăn là ghiền, húp nước lẩu nóng sùn sụt, ăn nhẹ miếng bún là bá chay <br>
Lẩu cá lóc chua cay siêu ngon ăn là ghiền, húp nước lẩu nóng sùn sụt, ăn nhẹ miếng bún là bá chay <br>
',
'ga-quay',0,6,'02/22/2023',2),
(N'Gà xào xả',99, N'product-img-07.jpg',
N'Lẩu cá lóc chua cay siêu ngon ăn là ghiền, húp nước lẩu nóng sùn sụt, ăn nhẹ miếng bún là bá chay
Lẩu cá lóc chua cay siêu ngon ăn là ghiền, húp nước lẩu nóng sùn sụt, ăn nhẹ miếng bún là bá chay <br>
Lẩu cá lóc chua cay siêu ngon ăn là ghiền, húp nước lẩu nóng sùn sụt, ăn nhẹ miếng bún là bá chay <br>
Lẩu cá lóc chua cay siêu ngon ăn là ghiền, húp nước lẩu nóng sùn sụt, ăn nhẹ miếng bún là bá chay <br>
Lẩu cá lóc chua cay siêu ngon ăn là ghiền, húp nước lẩu nóng sùn sụt, ăn nhẹ miếng bún là bá chay <br>
Lẩu cá lóc chua cay siêu ngon ăn là ghiền, húp nước lẩu nóng sùn sụt, ăn nhẹ miếng bún là bá chay <br>
',
'ga-xao-xa',0,7,'02/22/2023',3),
(N'Cơm chiên',239, N'product-img-08.jpg',
N'Lẩu cá lóc chua cay siêu ngon ăn là ghiền, húp nước lẩu nóng sùn sụt, ăn nhẹ miếng bún là bá chay
Lẩu cá lóc chua cay siêu ngon ăn là ghiền, húp nước lẩu nóng sùn sụt, ăn nhẹ miếng bún là bá chay <br>
Lẩu cá lóc chua cay siêu ngon ăn là ghiền, húp nước lẩu nóng sùn sụt, ăn nhẹ miếng bún là bá chay <br>
Lẩu cá lóc chua cay siêu ngon ăn là ghiền, húp nước lẩu nóng sùn sụt, ăn nhẹ miếng bún là bá chay <br>
Lẩu cá lóc chua cay siêu ngon ăn là ghiền, húp nước lẩu nóng sùn sụt, ăn nhẹ miếng bún là bá chay <br>
Lẩu cá lóc chua cay siêu ngon ăn là ghiền, húp nước lẩu nóng sùn sụt, ăn nhẹ miếng bún là bá chay <br>
',
'com-chien',0,8,'02/22/2023',3),
(N'Nem nướng',249, N'product-img-09.jpg',
N'Lẩu cá lóc chua cay siêu ngon ăn là ghiền, húp nước lẩu nóng sùn sụt, ăn nhẹ miếng bún là bá chay
Lẩu cá lóc chua cay siêu ngon ăn là ghiền, húp nước lẩu nóng sùn sụt, ăn nhẹ miếng bún là bá chay <br>
Lẩu cá lóc chua cay siêu ngon ăn là ghiền, húp nước lẩu nóng sùn sụt, ăn nhẹ miếng bún là bá chay <br>
Lẩu cá lóc chua cay siêu ngon ăn là ghiền, húp nước lẩu nóng sùn sụt, ăn nhẹ miếng bún là bá chay <br>
Lẩu cá lóc chua cay siêu ngon ăn là ghiền, húp nước lẩu nóng sùn sụt, ăn nhẹ miếng bún là bá chay <br>
Lẩu cá lóc chua cay siêu ngon ăn là ghiền, húp nước lẩu nóng sùn sụt, ăn nhẹ miếng bún là bá chay <br>
',
'nem-nuong',0,8,'02/22/2023',3),
(N'Đậu que xào',269, N'product-img-11.jpg',
N'Lẩu cá lóc chua cay siêu ngon ăn là ghiền, húp nước lẩu nóng sùn sụt, ăn nhẹ miếng bún là bá chay
Lẩu cá lóc chua cay siêu ngon ăn là ghiền, húp nước lẩu nóng sùn sụt, ăn nhẹ miếng bún là bá chay <br>
Lẩu cá lóc chua cay siêu ngon ăn là ghiền, húp nước lẩu nóng sùn sụt, ăn nhẹ miếng bún là bá chay <br>
Lẩu cá lóc chua cay siêu ngon ăn là ghiền, húp nước lẩu nóng sùn sụt, ăn nhẹ miếng bún là bá chay <br>
Lẩu cá lóc chua cay siêu ngon ăn là ghiền, húp nước lẩu nóng sùn sụt, ăn nhẹ miếng bún là bá chay <br>
Lẩu cá lóc chua cay siêu ngon ăn là ghiền, húp nước lẩu nóng sùn sụt, ăn nhẹ miếng bún là bá chay <br>
',
'dau-que-xao',0,8,'02/22/2023',4),
(N'Lẩu mắm',299, N'product-img-12.jpg',
N'Lẩu cá lóc chua cay siêu ngon ăn là ghiền, húp nước lẩu nóng sùn sụt, ăn nhẹ miếng bún là bá chay <br>
Lẩu cá lóc chua cay siêu ngon ăn là ghiền, húp nước lẩu nóng sùn sụt, ăn nhẹ miếng bún là bá chay <br>
Lẩu cá lóc chua cay siêu ngon ăn là ghiền, húp nước lẩu nóng sùn sụt, ăn nhẹ miếng bún là bá chay <br>
Lẩu cá lóc chua cay siêu ngon ăn là ghiền, húp nước lẩu nóng sùn sụt, ăn nhẹ miếng bún là bá chay <br>
Lẩu cá lóc chua cay siêu ngon ăn là ghiền, húp nước lẩu nóng sùn sụt, ăn nhẹ miếng bún là bá chay <br>
Lẩu cá lóc chua cay siêu ngon ăn là ghiền, húp nước lẩu nóng sùn sụt, ăn nhẹ miếng bún là bá chay',
'lau-ca-chua-cay',0,8,'02/22/2023',4),
(N'Chè thái',299, N'product-img-13.jpg',
N'Lẩu cá lóc chua cay siêu ngon ăn là ghiền, húp nước lẩu nóng sùn sụt, ăn nhẹ miếng bún là bá chay <br>
Lẩu cá lóc chua cay siêu ngon ăn là ghiền, húp nước lẩu nóng sùn sụt, ăn nhẹ miếng bún là bá chay <br>
Lẩu cá lóc chua cay siêu ngon ăn là ghiền, húp nước lẩu nóng sùn sụt, ăn nhẹ miếng bún là bá chay <br>
Lẩu cá lóc chua cay siêu ngon ăn là ghiền, húp nước lẩu nóng sùn sụt, ăn nhẹ miếng bún là bá chay <br>
Lẩu cá lóc chua cay siêu ngon ăn là ghiền, húp nước lẩu nóng sùn sụt, ăn nhẹ miếng bún là bá chay',
'che-thai',0,8,'02/22/2023',4),
(N'Lẩu dê',299, N'product-img-13.jpg',
N'Lẩu cá lóc chua cay siêu ngon ăn là ghiền, húp nước lẩu nóng sùn sụt, ăn nhẹ miếng bún là bá chay <br>
Lẩu cá lóc chua cay siêu ngon ăn là ghiền, húp nước lẩu nóng sùn sụt, ăn nhẹ miếng bún là bá chay <br>
Lẩu cá lóc chua cay siêu ngon ăn là ghiền, húp nước lẩu nóng sùn sụt, ăn nhẹ miếng bún là bá chay <br>
Lẩu cá lóc chua cay siêu ngon ăn là ghiền, húp nước lẩu nóng sùn sụt, ăn nhẹ miếng bún là bá chay <br>
Lẩu cá lóc chua cay siêu ngon ăn là ghiền, húp nước lẩu nóng sùn sụt, ăn nhẹ miếng bún là bá chay <br>
Lẩu cá lóc chua cay siêu ngon ăn là ghiền, húp nước lẩu nóng sùn sụt, ăn nhẹ miếng bún là bá chay <br>
Lẩu cá lóc chua cay siêu ngon ăn là ghiền, húp nước lẩu nóng sùn sụt, ăn nhẹ miếng bún là bá chay',
'lau-de',0,8,'02/22/2023',4)
--LOGO
create table Logo(
	id int not null identity(1,1) primary key,
	name nvarchar(50),
	Description ntext,
	icon nvarchar(50),
	link nvarchar(max),
	meta nvarchar(50),
	hide bit,
	[order] int,
	datebegin smalldatetime,
)
insert into Logo values
('Viethub', 'Eat, drink and live free!','logo.png','/Home','viethub-restaurant',0,0,'02/22/2023')
--BANNER
create table Banner(
	id int not null identity(1,1) primary key,
	name nvarchar(50),
	Description ntext,
	icon nvarchar(50),
	link nvarchar(max),
	meta nvarchar(50),
	hide bit,
	[order] int,
	datebegin smalldatetime,
)
insert into Banner values
('Viethub', 'Eat, drink and live free!','hero-bg.jpg','/Home','viethub-restaurant',0,0,'02/22/2023'),
('Good service', 'From a to z','hero-bg-2.jpg','/Home','viethub-restaurant',0,2,'02/22/2023'),
('Delicious meal', 'Wonderful tranditional specialist','hero-bg-3.jpg','/Home/Menus','viethub-restaurant',0,3,'02/22/2023')

create table New(
	id int not null identity(1,1) primary key,
	name nvarchar(50),
	Description ntext,
	Detail ntext,
	img nvarchar(50),
	link nvarchar(max),
	meta nvarchar(50),
	hide bit,
	[order] int,
	datebegin smalldatetime,
)
insert into New values
('You will vainly look for fruit on it in autumn.',
'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatibus laborum autem, dolores inventore, beatae nam.',
'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatibus laborum autem, dolores inventore, beatae nam.<br>
Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatibus laborum autem, dolores inventore, beatae nam.<br>
Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatibus laborum autem, dolores inventore, beatae nam.<br>
Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatibus laborum autem, dolores inventore, beatae nam.<br>
Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatibus laborum autem, dolores inventore, beatae nam.<br>
Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatibus laborum autem, dolores inventore, beatae nam.<br>
Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatibus laborum autem, dolores inventore, beatae nam.<br>
Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatibus laborum autem, dolores inventore, beatae nam.<br>',
'news-bg-1.jpg','/Home','you-will-vainly-look-for-fruit-on-it-in-autumn',0,0,'02/22/2023'),
('A mans worth has its season, like tomato.', 
'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatibus laborum autem, dolores inventore, beatae nam.',
'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatibus laborum autem, dolores inventore, beatae nam.<br>
Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatibus laborum autem, dolores inventore, beatae nam.<br>
Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatibus laborum autem, dolores inventore, beatae nam.<br>
Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatibus laborum autem, dolores inventore, beatae nam.<br>
Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatibus laborum autem, dolores inventore, beatae nam.<br>
Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatibus laborum autem, dolores inventore, beatae nam.<br>
Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatibus laborum autem, dolores inventore, beatae nam.<br>
Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatibus laborum autem, dolores inventore, beatae nam.<br>.',
'news-bg-2.jpg','/Home','a-mans-worth-has-its-season-like-tomato',0,2,'02/22/2023'),
('Good thoughts bear good fresh juicy fruit.',
'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatibus laborum autem, dolores inventore, beatae nam.',
'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatibus laborum autem, dolores inventore, beatae nam.<br>
Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatibus laborum autem, dolores inventore, beatae nam.<br>
Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatibus laborum autem, dolores inventore, beatae nam.<br>
Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatibus laborum autem, dolores inventore, beatae nam.<br>
Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatibus laborum autem, dolores inventore, beatae nam.<br>
Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatibus laborum autem, dolores inventore, beatae nam.<br>
Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatibus laborum autem, dolores inventore, beatae nam.<br>
Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatibus laborum autem, dolores inventore, beatae nam.<br>.',
'news-bg-3.jpg','/Home/Menus','good-thoughts-bear-good-fresh-juicy-fruit',0,3,'02/22/2023'),
('You will vainly look for fruit on it in autumn.',
'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatibus laborum autem, dolores inventore, beatae nam.',
'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatibus laborum autem, dolores inventore, beatae nam.<br>
Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatibus laborum autem, dolores inventore, beatae nam.<br>
Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatibus laborum autem, dolores inventore, beatae nam.<br>
Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatibus laborum autem, dolores inventore, beatae nam.<br>
Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatibus laborum autem, dolores inventore, beatae nam.<br>
Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatibus laborum autem, dolores inventore, beatae nam.<br>
Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatibus laborum autem, dolores inventore, beatae nam.<br>
Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatibus laborum autem, dolores inventore, beatae nam.<br>',
'news-bg-4.jpg','/Home','you-will-vainly-look-for-fruit-on-it-in-autumn',0,0,'02/22/2023'),
('Fall in love with the fresh orange',
'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatibus laborum autem, dolores inventore, beatae nam.',
'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatibus laborum autem, dolores inventore, beatae nam.<br>
Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatibus laborum autem, dolores inventore, beatae nam.<br>
Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatibus laborum autem, dolores inventore, beatae nam.<br>
Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatibus laborum autem, dolores inventore, beatae nam.<br>
Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatibus laborum autem, dolores inventore, beatae nam.<br>
Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatibus laborum autem, dolores inventore, beatae nam.<br>
Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatibus laborum autem, dolores inventore, beatae nam.<br>
Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatibus laborum autem, dolores inventore, beatae nam.<br>',
'news-bg-5.jpg','/Home','why-the-berries-always-look-delecious',0,2,'02/22/2023'),
('Why the berries always look delecious',
'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatibus laborum autem, dolores inventore, beatae nam.',
'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatibus laborum autem, dolores inventore, beatae nam.<br>
Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatibus laborum autem, dolores inventore, beatae nam.<br>
Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatibus laborum autem, dolores inventore, beatae nam.<br>
Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatibus laborum autem, dolores inventore, beatae nam.<br>
Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatibus laborum autem, dolores inventore, beatae nam.<br>
Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatibus laborum autem, dolores inventore, beatae nam.<br>
Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatibus laborum autem, dolores inventore, beatae nam.<br>
Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatibus laborum autem, dolores inventore, beatae nam.<br>',
'news-bg-6.jpg','/Home/Menus','why-the-berries-always-look-delecious',0,3,'02/22/2023')
Create table Team(
	id int not null identity(1,1) primary key,
	name nvarchar(50),
	[Role] nvarchar(100),
	Bio ntext,
	img nvarchar(50),
	meta nvarchar(50),
	hide bit,
	[order] int,
	datebegin smalldatetime,
)
INSERT INTO Team (name, [Role], Bio, img, meta, hide, [order], datebegin) 
VALUES ('John Smith', 'Chef', 'Chef John Smith is a renowned chef with over 20 years of experience in the culinary industry. He specializes in Italian cuisine and has won multiple awards for his cooking.', 'john-smith.jpg', 'john-smith', 0, 1, '2020-01-01')
INSERT INTO Team (name, [Role], Bio, img, meta, hide, [order], datebegin) 
VALUES ('Sarah Lee', 'Commis', 'Chef Sarah Lee is a rising star in the culinary world. She is known for her unique fusion of Korean and Mexican cuisine, and has gained a following for her creative and flavorful dishes.', 'sarah-lee.jpg', 'sarah-lee', 0, 2, '2021-03-15')
INSERT INTO Team (name, [Role], Bio, img, meta, hide, [order], datebegin) 
VALUES ('Michael Nguyen', 'Commis', 'Chef Michael Nguyen is a master of French cuisine. He has trained under some of the top chefs in France and has brought his expertise to restaurants around the world.', 'michael-nguyen.jpg', 'michael-nguyen', 1, 3, '2019-06-10')
INSERT INTO Team (name, [Role], Bio, img, meta, hide, [order], datebegin)
VALUES ('Emily Jones', 'Sous Chef', 'Chef Emily Jones has over 15 years of experience in the culinary industry. She is an expert in Mediterranean cuisine and has worked in some of the top restaurants in Europe.', 'emily-jones.jpg', 'emily-jones', 0, 4, '2022-02-20')
INSERT INTO Team (name, [Role], Bio, img, meta, hide, [order], datebegin)
VALUES ('David Kim', 'Pastry Chef', 'Chef David Kim is a pastry chef extraordinaire. He is known for his creative and visually stunning desserts that are as delicious as they are beautiful.', 'david-kim.jpg', 'david-kim', 0, 5, '2022-05-01')
INSERT INTO Team (name, [Role], Bio, img, meta, hide, [order], datebegin)
VALUES ('Jasmine Chen', 'Line Cook', 'Chef Jasmine Chen is a skilled line cook with experience in both Asian and American cuisine. She is a hard worker and a team player, and is always striving to improve her skills in the kitchen.', 'jasmine-chen.jpg', 'jasmine-chen', 1, 6, '2021-11-10')

Create table otherInfo(
	id int not null identity(1,1) primary key,
	name nvarchar(50),
	description ntext, 
	meta nvarchar(50),
	hide bit,
	[order] int,
	datebegin smalldatetime,
)
insert into otherInfo values
('About us', 'Ut enim ad minim veniam perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae.', 'about-us', 0,1,'12/12/2022'),
('Get in touch', '34/8, East Hukupara, Gifirtok, Sadan. support@fruitkha.com, +00 111 222 3333', 'about-us', 0,1,'12/12/2022'),
('Address','34/8, East Hukupara<br> Gifirtok, Sadan.<br>Country Name','address',0,2,'12/12/2022'),
('Hours','MON - FRIDAY: 8 to 9 PM<br>SAT - SUN: 10 to 8 PM','address',0,2,'12/12/2022'),
('Contact','Phone: +00 111 222 3333<br>Email: support@fruitkha.com','address',0,2,'12/12/2022'),
('Location', '<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d26432.42324808999!2d-118.34398767954286!3d34.09378509738966!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x80c2bf07045279bf%3A0xf67a9a6797bdfae4!2sHollywood%2C%20Los%20Angeles%2C%20CA%2C%20USA!5e0!3m2!1sen!2sbd!4v1576846473265!5m2!1sen!2sbd" width="600" height="450" frameborder="0" style="border:0;" allowfullscreen="" class="embed-responsive-item"></iframe>','location',0,3,'12/12/2022')
-- Tạo bảng Chi tiết giỏ hàng (CartDetail)
-- Tạo bảng Chi tiết giỏ hàng (CartDetail)
CREATE TABLE CartDetail (
	userid varchar(4) NOT NULL,
	ProductID INT NOT NULL,
	Quantity INT NOT NULL,
	Price int NOT NULL,
	CONSTRAINT FK_CartDetail_Cart FOREIGN KEY (userid) REFERENCES UserAccount(id),
	CONSTRAINT FK_CartDetail_Product FOREIGN KEY (ProductID) REFERENCES Dish(id)
);
INSERT INTO CartDetail VALUES ('1001', 1, 2, 20.00)
INSERT INTO CartDetail VALUES ('1001', 2, 1, 12.50)
INSERT INTO CartDetail VALUES ('1001', 3, 3, 15.00)
INSERT INTO CartDetail VALUES ('1002', 4, 2, 10.00)
INSERT INTO CartDetail VALUES ('1003', 1, 1, 20.00)

CREATE TABLE Voucher(
	id int not null identity(1,1) primary key,
	name nvarchar(100),
	voucherpass varchar(10),
	value int,
	hide bit,
	datebegin smalldatetime,
)
insert into Voucher values
('voucher thang 1', 'thang01',20,0,'01/01/2023'),
('voucher thang 2', 'thang02',20,0,'02/01/2023'),
('voucher thang 3', 'thang03',20,0,'03/01/2023'),
('voucher thang 4', 'thang04',20,0,'04/01/2023')
