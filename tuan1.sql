create database FOOD;
use FOOD

create table CUSTOMER(
	maKH varchar(10) primary key,
	hoten Nvarchar(100),
	email varchar(100),
	sdt varchar(10),
	diachi varchar(100)
)

create table PAYMENT(
	maTT varchar(10) primary key,
	tenPTTT Nvarchar(100),
	phiTT float
)

create table ORDERS(
	maDH varchar(10) primary key,
	ngaydat date,
	trangthai Nvarchar(10),
	tongtien Float,
	maKH varchar(10),
	maTT varchar(10),
	CONSTRAINT fk_orders_customer FOREIGN KEY(maKH)
		REFERENCES CUSTOMER(maKH),
	CONSTRAINT fk_orders_payment FOREIGN KEY(maTT)
		REFERENCES PAYMENT(maTT),
)

create table PRODUCT(
	maSP varchar(10) primary key,
	tenSP Nvarchar(255),
	mota Nvarchar(255),
	giaSP float,
	soluongSP int
)

create table ORDER_DETAILS(
	maCTSP varchar(10) primary key,
	soluongmua int,
	gia FLOAT,
	thanhtien FLOAT,
	maDH varchar(10),
	maSP varchar(10),
	CONSTRAINT fk_orderdetails_orders  FOREIGN KEY(maDH)
		REFERENCES ORDERS (maDH),
	CONSTRAINT fk_orderdetails_PRODUCT  FOREIGN KEY(maSP)
		REFERENCES PRODUCT (maSP)
)
Insert into ORDERS(maDH,ngaydat,trangthai,tongtien,maKH,maTT)
values ( 'MD001' , '2021/11/20',N'Chưa xử lý',95000,'KH003','TT001')
Insert into ORDERS(maDH,ngaydat,trangthai,tongtien,maKH,maTT)
values ( 'MD002', '2019/9/11',N'Đã xử lý',63000,'KH001','TT002')
Insert into ORDERS(maDH,ngaydat,trangthai,tongtien,maKH,maTT)
values ( 'MD003', '2020/6/1',N'Đang xử lý',185000,'KH004','TT001')
Insert into ORDERS(maDH,ngaydat,trangthai,tongtien,maKH,maTT)
values ( 'MD004', '2022/5/12',N'Chưa xử lý',105000,'KH002','TT001')
Insert into ORDERS(maDH,ngaydat,trangthai,tongtien,maKH,maTT)
values ( 'MD005','2021/2/2',N'Đã xử lý',28000,'KH003','TT002')
Insert into ORDERS(maDH,ngaydat,trangthai,tongtien,maKH,maTT)
values ( 'MD006','2019/7/26',N'Chưa xử lý',35000,'KH005','TT001')
Insert into ORDERS(maDH,ngaydat,trangthai,tongtien,maKH,maTT)
values ( 'MD007','2018/5/23',N'Đang xử lý',230000,'KH001','TT001')
select * from ORDERS

Insert into CUSTOMER(maKH,hoten,email,sdt,diachi)
values ('KH001',N'Nguyễn Đình Trọng','dinhtrong@gmail.com','039235256','Lien Chieu')
Insert into CUSTOMER(maKH,hoten,email,sdt,diachi)
values ('KH002',N'Trần Văn Huy','huyvan@gmail.com','039235256','Hai Chau')
Insert into CUSTOMER(maKH,hoten,email,sdt,diachi)
values ('KH003',N'Đỗ Thế Thanh','thanhthe@gmail.com','0934523344','Son Tra')
Insert into CUSTOMER(maKH,hoten,email,sdt,diachi)
values ('KH004',N'Nguyễn Tấn Vững','tanvung@gmail.com','0383729674','Lien Chieu')
Insert into CUSTOMER(maKH,hoten,email,sdt,diachi)
values ('KH005',N'Doãn Đức Lý','ducly@gmail.com','090362856','Cam Le')
select * from CUSTOMER

Insert into PRODUCT(maSP,tenSP,mota,giaSP,soluongSP)
values ('SP001','Com','Com suon nuong',30000,10)
Insert into PRODUCT(maSP,tenSP,mota,giaSP,soluongSP)
values ('SP002','My ga','My ga ta',25000,6)
Insert into PRODUCT(maSP,tenSP,mota,giaSP,soluongSP)
values ('SP003','Bun cha ca','Bun cha ca ly son',35000,26)
Insert into PRODUCT(maSP,tenSP,mota,giaSP,soluongSP)
values ('SP004','Chao vit','Chao vit bam',20000,12)
Insert into PRODUCT(maSP,tenSP,mota,giaSP,soluongSP)
values ('SP005','Banh my','Banh my heo quay',15000,5)
select * from PRODUCT

Insert into ORDER_DETAILS(maCTSP,soluongmua,gia,thanhtien,maDH,maSP)
values ('CTSP001',3,30000,90000,'MD001','SP001')
Insert into ORDER_DETAILS(maCTSP,soluongmua,gia,thanhtien,maDH,maSP)
values ('CTSP002',1,25000,25000,'MD005','SP002')
Insert into ORDER_DETAILS(maCTSP,soluongmua,gia,thanhtien,maDH,maSP)
values ('CTSP003',2,35000,70000,'MD003','SP003')
Insert into ORDER_DETAILS(maCTSP,soluongmua,gia,thanhtien,maDH,maSP)
values ('CTSP004',5,20000,100000,'MD004','SP004')
Insert into ORDER_DETAILS(maCTSP,soluongmua,gia,thanhtien,maDH,maSP)
values ('CTSP005',4,15000,60000,'MD002','SP005')
Insert into ORDER_DETAILS(maCTSP,soluongmua,gia,thanhtien,maDH,maSP)
values ('CTSP006',1,30000,30000,'MD006','SP001')
Insert into ORDER_DETAILS(maCTSP,soluongmua,gia,thanhtien,maDH,maSP)
values ('CTSP007',3,35000,105000,'MD007','SP003')
Insert into ORDER_DETAILS(maCTSP,soluongmua,gia,thanhtien,maDH,maSP)
values ('CTSP008',1,20000,20000,'MD003','SP004')
Insert into ORDER_DETAILS(maCTSP,soluongmua,gia,thanhtien,maDH,maSP)
values ('CTSP009',6,20000,120000,'MD007','SP004')
Insert into ORDER_DETAILS(maCTSP,soluongmua,gia,thanhtien,maDH,maSP)
values ('CTSP010',3,30000,90000,'MD003','SP001')
select * from ORDER_DETAILS

Insert into PAYMENT(maTT,tenPTTT,phiTT)
values ('TT001',N'Tiền mặt',5000)
Insert into PAYMENT(maTT,tenPTTT,phiTT)
values ('TT002',N'Banking',3000)
select * from PAYMENT
--câu 2 thực hiện truy vấn nâng cao--
---Tìm các đơn hàng có tổng tiền lớn hơn 100000 và có phương thức thanh toán là tiền mặt ----
SELECT OD.*,PM.tenPTTT, PM.phiTT  FROM ORDERS OD 
INNER JOIN PAYMENT PM
ON OD.maTT = PM.maTT
WHERE PM.tenPTTT = N'Tiền mặt' and OD.tongtien > 100000
--- Đưa ra danh sách các khách hàng và các đơn hàng đã xử lý-----
SELECT cs.*,od.* FROM CUSTOMER cs
FULL JOIN ORDERS od
ON cs.maKH= od.maKH
WHERE od.trangthai like N'Đã xử lý'
--câu 3 tạo khung nhìn V_CustomerInfo cung cấp thông tin của khách hàng đã từng mua hàng từ 2019 đến 2020- 
CREATE VIEW V_CustomerInfo
AS
	SELECT k.*
	FROM CUSTOMER k join ORDERS d on k.MaKH = d.MaKH
	WHERE ngaydat BETWEEN '2019/9/11' AND '2020/6/1'
GO
select * from V_CustomerInfo
--Tạo khung nhìn có tên V_VIEW2 để lấy thông tin chi tiết của các đơn hàng đã được đặt vào ngày 2018/5/23.--

CREATE VIEW V_VIEW2
AS
	SELECT c.*, d.ngaydat
	FROM ORDERS d JOIN ORDER_DETAILS c ON d.MaDH = c.MaDH
	WHERE d.ngaydat = '2018/5/23'
GO
select * from V_VIEW2
--câu 4 tạo func đếm tổng sản phẩm --
create FUNCTION func01()
RETURNS int
AS
BEGIN
	DECLARE @tong int
	SELECT @tong = SUM(soluongSP) 
	FROM PRODUCT
	RETURN @tong
END
GO

select dbo.func01() as tongsp
-- tạo func đếm tổng số lượng mua--
CREATE FUNCTION func02()
RETURNS int
AS
BEGIN
	DECLARE @tong int
	SELECT @tong = SUM(soluongmua) 
	FROM ORDER_DETAILS
	RETURN @tong
END
GO
select dbo.func02() as tongsoluongmua

--câu 5 tạo proce--
--Tạo proc  in ra các đơn hàng ( Mã đơn hàng , ngày đặt hàng , trạng thái hoạt động , tổng tiền ) --
create PROC List_HoaDon 
	@maDH varchar(10) 
AS
BEGIN
SELECT maDH ,ngaydat ,trangthai , tongtien FROM ORDERS where @maDH=maDH
END 
GO
EXEC List_HoaDon 'MD001'
GO
-- Tạo proc để cập nhật tình trạng đặt hàng của đơn hàng  --

CREATE PROC Update_Hoadon	
	@maDH varchar(10)  , @trangthai Nvarchar(10)
AS
BEGIN
	UPDATE ORDERS    SET trangthai = @trangthai  
	WHERE maDH = @maDH 
END
GO

Update_Hoadon 'MD001' , N'Đã xử lí' 
go
SELECT * FROM ORDERS