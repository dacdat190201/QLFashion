drop database QL_QUANAO
create database QL_QUANAO
go
use QL_QUANAO
go
create table NHACUNGCAP
(
	MACC nchar(10) not null, --CHINH
	TENCC nchar(30)
)
create table LOAIQUANAO
(
	MALOAI INT  IDENTITY(1,1) not null, --CHINH
	TENLOAI nvarchar(60)
)
Create table SANPHAM
(
	MASP INT  IDENTITY(1,1), --CHINH
	TENSP nvarchar(100),
	SIZE nchar(10),
	XUATXU nvarchar(30),
	GIOITINH nvarchar (5),
	GIABAN float,
	HINH nchar(100),
	MALOAI int not null --NGOAI
)

create table NHAPHANG
(
	MANHAP nchar(10) not null, --CHINH
	MACC nchar(10) not null, --NGOAI
	MALOAI int not null, --NGOAI
	TINHTRANG nchar(50),
	TIENDAUTU money,
	NGAYNHAP date
)
create table CTSANPHAMNHAP
(
	MANHAP nchar(10) not null,--NGOAI
	MASANPHAM int not null,--CHINH,NGOAI
	TENSANPHAM nvarchar(30),
	DONVITINH nvarchar(10),
	SLNHAP int,
	GIANHAP money
)
create table KHACHHANG
(
	MAKH nchar(10) not null,--CHINH
	TENKH nvarchar(30),
	NGSINH Date,
	DIACHI nvarchar(30),
	DTHOAI nchar(12),
	TAIKHOAN nchar(50),
	MATKHAU nchar(50)
)

create table NHANVIEN
(
	MANV nchar(10) not null,--CHINH
	TENNV nvarchar(30),
	NGSINH Date,
	DIACHI nvarchar(30),
	DTHOAI nchar(12),
	LUONG money,
	TAIKHOAN nchar(50),
	MATKHAU nchar(50)
)
create table HOADON
(
	MAHD int IDENTITY(1,1) not null,--CHINH
	NGAYHD Date,
	MAKH nchar(10) not null,--NGOAI
    NGAYGIAO date,
	NgayThanhToan DATE--NGOAI
)
create table CTHOADON
(
     MAHD int,
	 MaSP int,
	 SoLuong int,
	 constraint fk_mahd_masp primary key(MAHD,MaSP),
)


alter table NHACUNGCAP
add constraint PK_MACC primary key (MACC)

alter table LOAIQUANAO
add constraint PK_MALQA primary key (MALOAI)

alter table NHAPHANG
add constraint PK_MANHAP primary key (MANHAP)

alter table CTSANPHAMNHAP
add constraint PK_MASANPHAM primary key (MASANPHAM)

alter table SANPHAM 
add constraint PK_MASP primary key (MASP)


alter table KHACHHANG 
add constraint PK_MAKH primary key (MAKH)

alter table NHANVIEN 
add constraint PK_MANV primary key (MANV)

alter table HOADON
add constraint PK_MAHD primary key (MAHD)


-----------KHÓA NGOẠI------------

alter table SANPHAM 
add constraint FK_MA foreign key (MALOAI) references LOAIQUANAO (MALOAI)
alter table NHAPHANG
add constraint FK_MAL foreign key (MALOAI) references LOAIQUANAO (MALOAI)
alter table NHAPHANG
add constraint FK_MACC foreign key (MACC) references NHACUNGCAP (MACC)
alter table CTSANPHAMNHAP
add constraint FK_CTMANHAP foreign key (MANHAP) references NHAPHANG(MANHAP)
alter table HOADON 
add constraint FK_MAKH foreign key (MAKH) references KHACHHANG (MAKH)

alter table CTHOADON
add constraint FK_mahd_1masp foreign key(MAHD) references HOADON(MAHD)
alter table CTHOADON
add constraint FK_mahdmasp foreign key(MaSP) references SANPHAM(MASP)                      
insert LOAIQUANAO (TENLOAI)
values (N'Thế Giới Quần'),
	   (N'Thế Giới Áo'),
	   (N'Thế Giới Váy'),
	    (N'Thế Giới Giày'),
		 (N'Thế Giới Mũ'),
       (N'Phụ kiện')



SELECT * FROM HOADON
insert SANPHAM (TENSP, SIZE, XUATXU, GIOITINH, GIABAN,HINH, MALOAI)--//QUAN
values (N'Quần short kaki', 'Free Size', N'Việt Nam', N'NAM', 400000,'quan_short__kaki_nam_dep_7.jpg', 1),
(N'Quần Baggy kaki', 'Free Size', N'Trung Quốc', N'NỮ', 550000,'quanBaggy.jfif', 1),
(N'Quần Baggy jean', 'Free Size', N'MỸ', N'NỮ', 155000,'Quanbaggy.jpg', 1),
(N'Quần jean', 'Free Size', N'Việt Nam', N'NAM', 550000,'Quanjean.jpg', 1),
(N'Quần jean rách rưới', 'Free Size', N'Việt Nam', N'NAM', 590000,'Quanjeanrach.jpg', 1),
(N'Quần jogger kaki nam', 'Free Size', N'HÀN', N'NAM', 550000,'quanjoggerkakinam.jpg', 1),
(N'Quần kaki', 'Free Size', N'Việt Nam', N'NAM', 550000,'QuanKaki.jpg', 1),
(N'Quần short thể thao', 'Free Size', N'MỸ', N'NAM', 455000,'quanshort.jfif', 1),
(N'Quần Tây', 'Free Size', N'Hàn', N'NAM', 1500000,'Quantay.jpg', 1),
(N'Quần dài thể thao ', 'Free Size', N'Việt Nam', N'NAM', 10000000,'Quanthethao.jpg', 1)
insert SANPHAM (TENSP, SIZE, XUATXU, GIOITINH, GIABAN,HINH, MALOAI)--//AO
values (N'Áo Ba Lỗ', 'S', N'Việt Nam', N'NAM', 40000,'aobalo.jpg', 2),
(N'Áo Croptop', 'L', N'Trung Quốc', N'NỮ', 55000,'aocroptop.jpg', 2),
(N'Áo Hoodie tai mèo', 'Free Size', N'Trung Quốc', N'NỮ', 250000,'aohoodietaimeo.png', 2),
(N'Áo Khoác Bomber', 'Free Size', N'Việt Nam', N'NAM', 100000,'aokhoacbomber.jpg', 2),
(N'Áo Khoác Dù', 'XL', N'Việt Nam', N'NAM', 120000,'aokhoacdu.jpg', 2),
(N'Áo len nữ', 'L', N'HÀN', N'NỮ', 800000,'aolennu.jpg', 2),
(N'Áo sơ mi', 'XL', N'Việt Nam', N'NAM', 250000,'aosomi.jpg', 2),
(N'Áo Sweater', 'Free Size', N'MỸ', N'NỮ', 455000,'aosweater.jpg', 2),
(N'Áo tay lỡ', 'Free Size', N'Hàn', N'NAM', 2500000,'aotaylo.jpg', 2),
(N'Áo thun nam ', 'L', N'Việt Nam', N'NAM', 200000,'aothunnam.jpg', 2)
insert SANPHAM (TENSP, SIZE, XUATXU, GIOITINH, GIABAN,HINH, MALOAI)--//GIAY
values (N'Giày convert', 'S', N'Việt Nam', N'NAM', 40000000,'giayconvert.jfif', 4),
(N'Giày sport time', 'L', N'Trung Quốc', N'NỮ', 55000,'giay2.jfif', 4),
(N'Giày frezz', 'Free Size', N'Trung Quốc', N'Nam', 250000,'giay3.jfif', 4),
(N'Giay Convert cổ cao', 'Free Size', N'Việt Nam', N'NAM', 120000,'giay4.jfif', 4),
(N'Giay thể thao', 'XL', N'Việt Nam', N'NAM', 1120000,'giay5.jfif', 4),
(N'Giày crop', 'L', N'HÀN', N'NỮ', 880000,'giay6.jfif', 4),
(N'Giày mỹ', 'XL', N'Mỹ Tho', N'NAM', 250000,'giay7.jfif', 4),
(N'Giày adias', 'Free Size', N'MỸ', N'NỮ', 455000,'giay8.jfif', 4),
(N'Giày baleciaga', 'Free Size', N'Hàn', N'NAM', 12500000,'giay9.jfif', 4),
(N'Giay Tổ Ong', 'L', N'Việt Nam', N'NAM', 999999999,'giay10.jfif', 4)
insert SANPHAM (TENSP, SIZE, XUATXU, GIOITINH, GIABAN,HINH, MALOAI)--Phu KIEN
values (N'Thắc lưng trơn', 'Free Size', N'THAILAN', N'NAM', 315000,'ThacLungTron.png', 6),
(N'Thắc lưng da họa tiết', 'Free Size', N'MỸ', N'NAM', 550000,'ThacLung1.png', 6),
(N'Thắc lưng cao cấp', 'Free Size', N'MỸ', N'NAM', 1550000,'ThacLung2.png', 6),
(N'Túi đeo chéo', 'Free Size', N'MỸ', N'NAM', 550000,'TuiDeoCheo1.png', 6),
(N'Túi đeo chéo, có thêu', 'Free Size', N'MỸ', N'NAM', 590000,'TuiDeoCheo2.png', 6),
(N'Túi TOTE vải DENIM', 'Free Size', N'HÀN', N'NAM', 550000,'TuiDeoCheo3.png', 6),
(N'Túi Bao Tử', 'Free Size', N'MỸ', N'NAM', 550000,'TuiDeoCheo4.png', 6),
(N'Ví da lịch lãm', 'Free Size', N'MỸ', N'NAM', 455000,'ViDa1.png', 6),
(N'Ví da phong cách', 'Free Size', N'Hàn', N'NAM', 1500000,'ViDa2.png', 6),
(N'Ví Da đẳng cấp ', 'Free Size', N'MỸ', N'NAM', 10000000,'ViDa3.png', 6),
(N'Vớ dài phối màu', 'Free Size', N'MỸ', N'NAM', 350000,'Vo1.png', 6),
(N'Vớ dài kẻ sọc', 'Free Size', N'MỸ', N'NAM', 350000,'Vo2.png', 6),
(N'Vớ cotton ngắn trơn', 'Free Size', N'MỸ', N'NAM', 250000,'Vo3.png', 6),
(N'Vớ dài phối cotton', 'Free Size', N'MỸ', N'NAM', 550000,'Vo4.png', 6)
set dateformat dmy
insert KHACHHANG (MAKH, TENKH, NGSINH, DIACHI, DTHOAI,TAIKHOAN, MATKHAU)
values ('KH001', N'Nguyễn Duy Mạnh', '30-03-2001', N'Tân phú', '0996562411','duymanh', 'duymanh')
INSERT HOADON VALUES ( CAST(0xC3410B00 AS Date),'KH001', CAST(0xC5410B00 AS Date), NULL)
INSERT HOADON VALUES ( CAST(0xC3410B00 AS Date),'KH001', CAST(0xC5410B00 AS Date), CAST(0xC4410B00 AS Date))
INSERT HOADON VALUES ( CAST(0xC3410B00 AS Date),'KH001', CAST(0xDF410B00 AS Date), NULL)
INSERT HOADON VALUES ( CAST(0xC3410B00 AS Date), 'KH001', CAST(0xC3410B00 AS Date), CAST(0xC4410B00 AS Date))
select * from SANPHAM;
INSERT CTHOADON VALUES (3, 1, 1)
INSERT CTHOADON VALUES (3, 6, 2)
INSERT CTHOADON VALUES (3, 8, 1)
INSERT CTHOADON VALUES (4, 2, 1)
INSERT CTHOADON VALUES (4, 3, 3)
INSERT CTHOADON VALUES (4, 4, 2)
INSERT CTHOADON VALUES (4, 7, 4)
insert NHANVIEN (MANV, TENNV, NGSINH, DIACHI, DTHOAI,TAIKHOAN, MATKHAU)
values ('NV001', N'Nguyễn Cuong Cho', '23-03-2001', N'Go Vap', '0992827323','cuong', '1')
select  * from HOADON
select  * from CTHOADON
insert KHACHHANG (MAKH, TENKH, NGSINH, DIACHI, DTHOAI,TAIKHOAN, MATKHAU)
values ('KH002', N'Nguyễn Duy Mạnh', '30-03-2001', N'Tân phú', '0996562411','dacdat', '1')