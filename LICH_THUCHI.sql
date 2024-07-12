--CREATE DATABASE LICH_THUCHI
--USE LICH_THUCHI
--drop DATABASE LICH_THUCHI
--thông tin cá nhân
CREATE TABLE USERS
(
	IDUSER CHAR(10),
	PASS NVARCHAR(25),
	--USERNAME VARCHAR(50),
	EMAIL VARCHAR(50),
	
	HOTEN NVARCHAR(50),
	GIOITINH BIT, --NAM: 0 | NỮ: 1
	NGAYSINH DATE,
	PRIMARY KEY(IDUSER)
)
select IDUSER, EMAIL, HOTEN, GIOITINH, NGAYSINH from USERS
insert into USERS values ('sss111',N'sss111','tran@gmail.com',N'Nguyễn Trân',1,'2000-12-17')
--bảng icon và màu sắc
CREATE TABLE BIEUTUONG
(
	MABT INT IDENTITY(1,1),
	TENBT VARCHAR(30),
	PRIMARY KEY(MABT)
)

--CREATE TABLE DANHMUC_MAU
--(
--	TENDM NVARCHAR(30) UNIQUE,
--	MABT INT,
--	THUOCTINH BIT --CHI: 0 | THU: 1
--	PRIMARY KEY(TENDM),
--	constraint FK_DMBT_mau FOREIGN KEY (MABT) REFERENCES BIEUTUONG(MABT),
--)

CREATE TABLE DANHMUC
(
	IDUSER CHAR(10),
	TENDM NVARCHAR(30) UNIQUE,
	MABT INT,
	THUOCTINH BIT --CHI: 0 | THU: 1
	PRIMARY KEY(TENDM),
	constraint FK_DMBT FOREIGN KEY (MABT) REFERENCES BIEUTUONG(MABT),
	CONSTRAINT FK_DMUR FOREIGN KEY (IDUSER) REFERENCES USERS(IDUSER)
)

---THU CHI
CREATE TABLE CHITIEU
(
	IDUSER CHAR(10),
	NGAY DATE DEFAULT(GETDATE()),
	IDCHI BIGINT IDENTITY(1,1),
	--------------------------------
	SOTIEN_CHI float,
	GHICHU NVARCHAR(100),
	TENDM NVARCHAR(30),
	TGNHAP TIME DEFAULT(GETDATE()),
	PRIMARY KEY(IDCHI,NGAY,TENDM),
	CONSTRAINT FK_CHI_UR FOREIGN KEY (IDUSER) REFERENCES USERS(IDUSER),
	CONSTRAINT FK_CHI_DM FOREIGN KEY (TENDM) REFERENCES DANHMUC(TENDM)
)
--insert into CHITIEU(IDUSER, NGAY, SOTIEN_CHI, GHICHU, TENDM) values ('{0}','{1}',{2},N'{3}',N'{4}')
CREATE TABLE THUNHAP
(
	IDUSER CHAR(10),
	NGAY DATE DEFAULT(GETDATE()),
	IDNHAP BIGINT IDENTITY(1,1),
	--------------------------------
	SOTIEN_THU float,
	GHICHU NVARCHAR(100),
	TENDM NVARCHAR(30),
	TGNHAP TIME DEFAULT(GETDATE()),
	PRIMARY KEY(IDNHAP,NGAY,TENDM),
	CONSTRAINT FK_THU_UR FOREIGN KEY (IDUSER) REFERENCES USERS(IDUSER),
	CONSTRAINT FK_THU_DM FOREIGN KEY (TENDM) REFERENCES DANHMUC(TENDM)
)


--------------------------------------------------------------------------------------------------------------------------
INSERT INTO BIEUTUONG VALUES 
('apartment.png'),		('backpack.png'),			('bags-shopping.png'),	('balloon.png'),		('bank.png'),
('barber-shop.png'),	('bath.png'),				('beach.png'),			('beer.png'),			('bike.png'),
('bitcoin-sign.png'),	('book-bookmark.png'),		('book-font.png'),		('bookmark.png'),		('bowling.png'),
('boxing-glove.png'),	('bread.png'),				('briefcase.png'),		('bulb.png'),			('cafe.png'),
('cake.png'),			('camera.png'),				('camera-cctv.png'),	('candy.png'),			('capsules.png'),
('car.png'),			('car-building.png'),		('carrot.png'),			('cart.png'),			('cash-register.png'),
('cat.png'),			('cedi-sign.png'),			('circle-c.png'),		('circle-r.png'),		('circle-xmark.png'),
('clip.png'),			('coin.png'),				('computer.png'),		('credit-card.png'),	('cherry.png'),
('chess.png'),			('child-head.png'),			('dart.png'),			('dice.png'),			('disco.png'),
('doctor.png'),			('dog.png'),				('dollar.png'),			('donunt.png'),			('dribbble.png'),
('envelope-bulk.png'),	('envelope-open-text.png'),	('fire-burner.png'),	('fish.png'),			('gaspump.png'),
('gavel.png'),			('guitar.png'),				('gym.png'),			('gift.png'),			('headphones.png'),
('heart.png'),			('hospital.png'),			('house.png'),			('humburger.png'),		('icecream.png'),
('lolipop.png'),		('money-bill-wave.png'),	('mountains.png'),		('orange.png'),			('palette.png'),
('pants.png'),			('parking-circle.png'),		('party.png'),			('piano-keyboard.png'),	('piggy-bank.png'),
('plane.png'),			('playing-cards.png'),		('phone.png'),			('restaurant.png'),		('ribbon.png'),
('rice.png'),			('rings-wedding.png'),		('router.png'),			('rugby.png'),			('saxophone.png'),
('school-bus.png'),		('ship.png'),				('skirt.png'),			('smoking.png'),		('soccer.png'),
('spa.png'),			('star.png'),				('strawberry.png'),		('sunglasses.png'),		('sushi.png'),
('tennis.png'),			('terrace.png'),			('tooth.png'),			('tv-retro.png'),		('tree.png'),
('umbrella.png'),		('video.png'),				('volleyball.png'),		('wallet.png'),			('washer.png'),
('watch.png'),			('wine.png'),				('world.png')


--INSERT INTO DANHMUC_MAU VALUES
--(N'Lương',104,1),	(N'Thưởng',59,1),	(N'Tạm thu',59,1),
--(N'Ăn uống',21,0),	(N'Đi chơi',97,0),	(N'Thuê bao',78,0),
--(N'Xăng',55,0),		(N'Cá nhân',92,0),	(N'Y tế',25,0)