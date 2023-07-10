use master
go
drop database ViethubV3
go
create database ViethubV3
go
use ViethubV3
go
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
(N'Menu', '/Home/Menu','menu',0,2,'02/14/2023'),
(N'New', '/Home/New','new',0,2,'02/14/2023'),
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
(N'instagram', 'fa fa-instagram','https://www.instagram.com/','Foody-instagram',0,0,'02/14/2023'),
(N'facebook', 'fa fa-dribbble','https://www.facebook.com/','Foody-facebook',0,2,'02/14/2023'),
(N'yotube','fa fa-twitter', 'https://www.youtube.com/','Foody-youtube',0,3,'02/14/2023')

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
(N'Lẩu cá chua cay',29, N'products-img-01.jpg',N'<br>
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
'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatibus laborum autem, dolores inventore, beatae nam.<br>
Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatibus laborum autem, dolores inventore, beatae nam.<br>
Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatibus laborum autem, dolores inventore, beatae nam.<br>
Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatibus laborum autem, dolores inventore, beatae nam.<br>
Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatibus laborum autem, dolores inventore, beatae nam.<br>
Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatibus laborum autem, dolores inventore, beatae nam.<br>
Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatibus laborum autem, dolores inventore, beatae nam.<br>
Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatibus laborum autem, dolores inventore, beatae nam.<br>',
'news-bg-1.jpg','/Home','viethub-restaurant',0,0,'02/22/2023'),
('A mans worth has its season, like tomato.', 
'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatibus laborum autem, dolores inventore, beatae nam.<br>
Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatibus laborum autem, dolores inventore, beatae nam.<br>
Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatibus laborum autem, dolores inventore, beatae nam.<br>
Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatibus laborum autem, dolores inventore, beatae nam.<br>
Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatibus laborum autem, dolores inventore, beatae nam.<br>
Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatibus laborum autem, dolores inventore, beatae nam.<br>
Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatibus laborum autem, dolores inventore, beatae nam.<br>
Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatibus laborum autem, dolores inventore, beatae nam.<br>.',
'news-bg-2.jpg','/Home','viethub-restaurant',0,2,'02/22/2023'),
('Good thoughts bear good fresh juicy fruit.',
'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatibus laborum autem, dolores inventore, beatae nam.<br>
Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatibus laborum autem, dolores inventore, beatae nam.<br>
Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatibus laborum autem, dolores inventore, beatae nam.<br>
Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatibus laborum autem, dolores inventore, beatae nam.<br>
Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatibus laborum autem, dolores inventore, beatae nam.<br>
Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatibus laborum autem, dolores inventore, beatae nam.<br>
Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatibus laborum autem, dolores inventore, beatae nam.<br>
Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatibus laborum autem, dolores inventore, beatae nam.<br>.',
'news-bg-3.jpg','/Home/Menus','viethub-restaurant',0,3,'02/22/2023'),
('You will vainly look for fruit on it in autumn.', 
'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatibus laborum autem, dolores inventore, beatae nam.<br>
Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatibus laborum autem, dolores inventore, beatae nam.<br>
Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatibus laborum autem, dolores inventore, beatae nam.<br>
Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatibus laborum autem, dolores inventore, beatae nam.<br>
Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatibus laborum autem, dolores inventore, beatae nam.<br>
Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatibus laborum autem, dolores inventore, beatae nam.<br>
Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatibus laborum autem, dolores inventore, beatae nam.<br>
Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatibus laborum autem, dolores inventore, beatae nam.<br>',
'news-bg-4.jpg','/Home','viethub-restaurant',0,0,'02/22/2023'),
('Fall in love with the fresh orange', 
'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatibus laborum autem, dolores inventore, beatae nam.<br>
Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatibus laborum autem, dolores inventore, beatae nam.<br>
Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatibus laborum autem, dolores inventore, beatae nam.<br>
Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatibus laborum autem, dolores inventore, beatae nam.<br>
Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatibus laborum autem, dolores inventore, beatae nam.<br>
Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatibus laborum autem, dolores inventore, beatae nam.<br>
Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatibus laborum autem, dolores inventore, beatae nam.<br>
Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatibus laborum autem, dolores inventore, beatae nam.<br>',
'news-bg-5.jpg','/Home','viethub-restaurant',0,2,'02/22/2023'),
('Why the berries always look delecious', 
'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatibus laborum autem, dolores inventore, beatae nam.<br>
Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatibus laborum autem, dolores inventore, beatae nam.<br>
Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatibus laborum autem, dolores inventore, beatae nam.<br>
Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatibus laborum autem, dolores inventore, beatae nam.<br>
Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatibus laborum autem, dolores inventore, beatae nam.<br>
Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatibus laborum autem, dolores inventore, beatae nam.<br>
Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatibus laborum autem, dolores inventore, beatae nam.<br>
Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatibus laborum autem, dolores inventore, beatae nam.<br>',
'news-bg-6.jpg','/Home/Menus','viethub-restaurant',0,3,'02/22/2023')



