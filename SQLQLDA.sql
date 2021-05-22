use master
drop database QLCH
CREATE DATABASE QLCH
use QLCH
Create TABLE LOAI
(
	MaLoai int identity(1,1),
	LoaiBanh NVARCHAR (100),
	CONSTRAINT PK_Loai PRIMARY KEY(MaLoai)
)
go
Create Table TAG
(
	MaTag int identity(1,1),
	TenTag NVARCHAR (100),
	CONSTRAINT PK_Tag PRIMARY KEY(MaTag)
)
Insert Into TAG(TenTag) values (N'Tuyển dụng')
Insert Into TAG(TenTag) values (N'Đồ mới')
Insert Into TAG(TenTag) values (N'Chất lượng sản phẩm')
Insert Into TAG(TenTag) values (N'Các đồ lưu niệm')
Insert Into TAG(TenTag) values (N'Tin tức')

CREATE TABLE KHACHHANG
(
	MaKH INT IDENTITY(1,1),
	HoTen nVarchar(50) NOT NULL,
	Taikhoan Varchar(50) UNIQUE,
	Matkhau Varchar(50) NOT NULL,
	Email Varchar(100) UNIQUE,
	DiachiKH nVarchar(200),
	DienthoaiKH Varchar(50),	
	Ngaysinh DATETIME
	CONSTRAINT PK_Khachhang PRIMARY KEY(MaKH)
)
Go
Create Table NhaCC
(
	MaNCC INT IDENTITY(1,1),
	TenNCC nVarchar(50) NOT NULL,
	HinhAnh varchar(50),
	Email Varchar(100) UNIQUE,
	DiachiNCC nVarchar(200),
	DienthoaiNCC Varchar(50),
	CONSTRAINT PK_DauBep PRIMARY KEY(MaNCC)
)

CREATE TABLE DONDATHANG
(
	MaDonHang INT IDENTITY(1,1),
	Dathanhtoan bit,
	Tinhtranggiaohang  bit,
	Ngaydat Datetime,
	Ngaygiao Datetime,
	Ghichu nText,	
	MaKH INT,
	CONSTRAINT PK_DonDatHang PRIMARY KEY (MaDonHang),
	CONSTRAINT FK_Khachhang FOREIGN KEY (MaKH) REFERENCES Khachhang (MaKH)
)
go

CREATE TABLE QUA
(
	MaQua INT IDENTITY(1,1),
	TenQua NVARCHAR(100) NOT NULL,
	GiaChuaGiam Decimal(18,0) CHECK (GiaChuaGiam>=0),
	Giaban Decimal(18,0) CHECK (Giaban>=0),
	Mota NVarchar(Max),
	Hinhanh VARCHAR(50),
	Ngaycapnhat DATETIME,
	Soluongton INT,
	MaLoai INT,
	GiamGia varchar(5),
	CONSTRAINT PK_Banh PRIMARY KEY(MaQua),
	CONSTRAINT FK_Loai FOREIGN KEY(MaLoai) REFERENCES LOAI(MaLoai),
	
)

CREATE TABLE CHITIETDONTHANG
(
	MaDonHang INT,
	MaQua INT,
	Soluong Int Check(Soluong>0),
	Dongia Decimal(18,0) Check(Dongia>=0),	
	CONSTRAINT PK_CTDatHang PRIMARY KEY(MaDonHang,MaQua),
	CONSTRAINT FK_DonDatHang FOREIGN KEY(MaDonHang) REFERENCES DONDATHANG(MaDonHang),
	CONSTRAINT FK_Banh FOREIGN KEY(MaQua) REFERENCES Qua(MaQua)

)
CREATE TABLE LIENHE
(
	MaLH INT IDENTITY(1,1),
	HoTen nvarchar(50) NOT NULL,
	Email Varchar(100) UNIQUE,
	DienthoaiKH Varchar(50),
	NoiDung nText,
	CONSTRAINT PK_LienHe PRIMARY KEY(MaLH),
)

CREATE TABLE TinTuc
(
	MaTT INT IDENTITY(1,1),
	HinhAnh1 varchar(50),
	HinhAnh2 varchar(50),
	SoLuotXem int,
	NgayDangTin DATETIME,
	TieuDe nText,
	TomTat nText,
	NoiDung nText,
	MaTag INT,
	TacGia nvarchar(50) NOT NULL,
	CONSTRAINT PK_Blog PRIMARY KEY(MaTT),
	CONSTRAINT FK_tag FOREIGN KEY(MaTag) REFERENCES TAG(MaTag),
)


CREATE TABLE SUBCRIBE
(	
	 MaSub INT IDENTITY(1,1),
	 Email varchar(50) Unique,
	 CONSTRAINT PK_Sub PRIMARY KEY(MaSub),
)
CREATE TABLE ADMIN
(
	MaAd int identity (1,1),
	HoTen nvarchar(50) NOT NULL,
	ViTri nvarchar (50) NOT NULL,
	Email Varchar(100) UNIQUE,
	GioiTinh bit,
	Taikhoan Varchar(50) UNIQUE,
	Matkhau Varchar(50) NOT NULL,
	DienthoaiAd Varchar(50),	
	CONSTRAINT PK_Admin PRIMARY KEY(MaAd)
)
