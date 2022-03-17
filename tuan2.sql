
-- Trigger cập nhật tổng tiền của đơn hàng(order) sau khi thêm chi tiết đơn hàng
DELIMITER $$

CREATE TRIGGER details_insert
AFTER INSERT
ON order_details FOR EACH ROW
BEGIN
    IF NEW.thanhtien IS NOT NULL THEN
        update orders 
        set tongtien = tongtien+ NEW.thanhtien
        where maDH = NEW.maDH;
    END IF;
END$$

DELIMITER ;

-- Event chèn dữ liệu vào bảng order_details sau 10s
CREATE EVENT myevent
    ON SCHEDULE AT CURRENT_TIMESTAMP + INTERVAL 10 second
    DO
      insert into order_details values ('CTSP013', '1', '30000', '30000', 'MD001', 'SP001'
);

-- Tạo trigger không cho phép xóa thông tin của bảng chi tiết thông tin mà có thành tiền lớn hơn 100000
create trigger Trigger_afterDelete on ORDER_DETAILS
for delete 
as 
begin
Declare @temp  int = 0
select @temp = COUNT(*) from Deleted
where Deleted.thanhtien > 100000
 if (@temp>0)
	Begin
		Print N'Không được xóa đơn hàng có giá trên 100000'
		ROLLBACK TRAN
	End
end
Delete dbo.ORDER_DETAILS where maCTSP = 'CTSP009'

-- Event
CREATE EVENT EVENT_1
    ON SCHEDULE AT CURRENT_TIMESTAMP
    DO
      insert into CUSTOMER values ('KH006', N'Mai Đức Tin', 'ductin@gmail.com', '0394272718', 'Lien Chieu'
);


-- tạo trigger thêm 1 bản ghi trong bảng ORDER ------

CREATE TRIGGER InsertORDERS
on  ORDERS
for INSERT, UPDATE
as 
begin
	--Rollback tran
	Print 'Thanh cong'
end

Insert into ORDERS(maDH,ngaydat,trangthai,tongtien,maKH,maTT)
values ( 'MD008' , '2021/12/20',N'Chưa xử lý',120000,'KH004','TT002')

select * from dbo.ORDERS
go


/*event*/

CREATE EVENT Myevent_Order
    ON SCHEDULE AT CURRENT_TIMESTAMP + INTERVAL 10 second
    DO
      insert into Orders  values ( 'MD008' , '2021/12/20',N'Chưa xử lý',120000,'KH004','TT002')
);

-- tạo trigger thêm 1 bản ghi trong bảng ORDER ------

CREATE TRIGGER InsertORDERS
on  ORDERS
for INSERT, UPDATE
as 
begin
	--Rollback tran
	Print 'Thanh cong'
end

Insert into ORDERS(maDH,ngaydat,trangthai,tongtien,maKH,maTT)
values ( 'MD008' , '2021/12/20',N'Chưa xử lý',120000,'KH004','TT002')

select * from dbo.ORDERS
go

-- tạo trigger INSERT 1 bản ghi trong bảng CUSTOMER ------

CREATE TRIGGER InsertCUSTOMER
on CUSTOMER
for INSERT, UPDATE
as 
begin
	--Rollback tran
	Print 'Thanh cong'
end

insert CUSTOMER
(maKH,hoten,email,sdt,diachi)
values('KH006',N'Lê Thị Trang','123trang@gmail.com','0987876577',N'Liên Chiểu')

select * from CUSTOMER
go

--event--
CREATE EVENT customer1
ON SCHEDULE AT CURRENT_TIMESTAMP
DO
  INSERT INTO CUSTOMER(maKH,hoten,email,sdt,diachi)
  VALUES('KH007',N'Lê Văn C','1234c@gmail.com','1234567123',N'Ninh Bình');
  
  
  -- tạo trigger xóa 1 bản ghi trong bảng order_details thì hiển thị tổng số bản ghi còn lại trong bảng order_details--

create trigger Trigger_1 on ORDER_DETAILS
for delete 
AS 
begin
select count(maCTSP) from ORDER_DETAILS
end
go
delete  from ORDER_DETAILS
where maCTSP = 'CTSP010'


--event--
CREATE EVENT CUS1
ON SCHEDULE AT CURRENT_TIMESTAMP
DO
  INSERT INTO CUSTOMER(maKH,hoten,email,sdt,diachi)
  VALUES('KH006',N'Nguyễn Văn B','nguyenvanb@gmail.com','1234567123',N'Quảng Trị');
  
  
  
  --trigger
CREATE TRIGGER InsertProduct
on dbo.PRODUCT
for INSERT, UPDATE
as 
begin
	--Rollback tran
	Print 'Thanh cong'
end
go

insert dbo.PRODUCT
(giaSP,maSP,mota,soluongSP,tenSP)
values(20000.0,N'SP006',N'Com ga',20,N'Com')

select * from PRODUCT
go
--event

CREATE EVENT test_1
ON SCHEDULE AT CURRENT_TIMESTAMP
DO
  INSERT INTO CUSTOMER(maKH,hoten,email,sdt,diachi)
  VALUES('KH006',N'Phạm Anh','phamanhhoian@gmail.com','12321312',N'Hội An')