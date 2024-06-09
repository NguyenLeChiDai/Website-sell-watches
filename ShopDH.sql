Create Database ShopDongHo

Use ShopDongHo
---Khach hang

CREATE TABLE ThuongHieu (
	thuongHieuId int IDENTITY(1, 1) PRIMARY KEY NOT NULL,
	name nvarchar(255) NOT NULL,
)
INSERT INTO ThuongHieu
VALUES
(N'Rolex'),
(N'Seiko'),
(N'Citizen'),
(N'Casio'),
(N'Orient')

CREATE TABLE [dbo].[DongHo] (
	[maDH]  [int] IDENTITY(1, 1) PRIMARY KEY NOT NULL,
	[tenDH] [nvarchar](255) NOT NULL,
	[giaBan] [float] NULL,
	[soLuong] [int] NULL,
	[moTa] [nvarchar](255) NULL,
	[thuongHieuId] [int] REFERENCES ThuongHieu(thuongHieuId) NOT NULL,
	[hinhAnh] [varchar](255)
)

Insert into DongHo
Values 
(N'Đồng hồ nam Rolex DATEJUST-41 126333-0012', 4560000 , 5, N'Có thiết kế mặt số vàng, dây đeo Jubilee thép vàng, bộ vỏ chất liệu thép 904L', 1, 'https://empireluxury.vn/wp-content/uploads/2022/04/dong-ho-rolex-datejust-41-126333-0012-mat-so-vang-day-deo-jubilee-thep-vang-vang-9.jpg'),
(N'Đồng hồ nam Casio MTP-V001L-1BUDF', 480000 , 3, N'Mẫu Casio MTP-V001L-1BUDF phiên bản dây da đen có vân lịch lãm, thiết kế đơn giản 3 kim trên mặt số size 38mm, nền cọc số học trò kiểu dáng mỏng trẻ trung.', 4, 'https://cdn3.dhht.vn/wp-content/uploads/2023/09/39_MTP-V001L-1BUDF.jpg'),
(N'Đồng hồ nam Casio MTP-1302D-1A1VDF', 1347000 , 3, N'Đồng hồ Casio MTP-1302D-1A1VDF với mặt số tròn lớn nam tính, viền được tạo khía độc đáo.', 4, 'https://cdn3.dhht.vn/wp-content/uploads/2023/09/MTP-1302D-1A1VDF.jpg'),
(N'Đồng hồ nam Casio F-91W-1HDG', 492000 , 3, N'Mẫu Casio F-91W-1HDG phiên bản mặt số vuông điện tử phong cách hoài cổ.', 4, 'https://cdn3.dhht.vn/wp-content/uploads/2023/09/F-91W-1HDG.jpg'),
(N'Đồng hồ nam Rolex DATEJUST 31 278273-0014', 3140000, 10, N'Được trang bị bộ máy Automatic Calibre 2236, dây tóc Syloxi hoạt động ổn định với độ chính xác gấp 10 lần dây tóc truyền thống', 1,'https://empireluxury.vn/wp-content/uploads/2022/06/dong-ho-rolex-datejust-31-278273-0014-mat-so-vang-day-deo-jubilee-thep-vang-vang-1.jpg'),
(N'Đồng hồ nam Rolex DATEJUST 36 126233-0017', 4109999,10, N'Ô cửa sổ hiển thị ngày ở góc 3 giờ được trang bị ống kính Cyclops phóng đại đi cùng cọc số kim cương được bọc vàng đầy bắt mắt', 1,'https://empireluxury.vn/wp-content/uploads/2022/06/dong-ho-rolex-datejust-36-126233-0017-mat-so-vang-day-deo-jubilee-thep-vang-vang-9.jpg'),
(N'Đồng hồ nữ Citizen EM0550-83N Dây Thép', 8170000,1, N'Đồng hồ Citizen mang phong cách cổ điển là một lựa chọn hoàn hảo cho những người yêu thích phong cách thời trang, vừa đẹp mắt lại sang trọng và đẳng cấp', 3,'https://cdn.pnj.io/images/thumbnails/485/485/detailed/114/WCI00000728-EM0550-83N_Desktop_1.jpg'),
(N'Đồng hồ nữ Seiko SYMG42K1 26mm', 571000, 2, N'Seiko SYMG42K1 có đường kính 26mm và độ dày 11mm. Mặt kính được làm bằng Hardlex. Khung vỏ được làm bằng chất liệu thép không gỉ 316L.', 2,'https://s3-ap-southeast-1.amazonaws.com/xshipimage/Seiko/SYMG42K1/SYMG42K1.jpg'),
(N'Đồng hồ nam Casio MTP-1375D-1AVDF', 217700, 20, N'Họa tiết vân khía sắc xảo tạo nển vẻ mạnh mẽ khi bo tròn nền đen mặt số, kim chỉ và vạch chỉ giờ được phủ bạc và phản quang giúp nhìn dễ hơn trông đêm', 4,'https://cdn3.dhht.vn/wp-content/uploads/2023/09/MTP-1375D-1AVDF.jpg'),
(N'Đồng hồ nam Casio EFB-510JBL-7AVDR', 950000, 22, N'Kiểu dáng 6 kim đi kèm tính năng Chronograph tạo nên vẻ nam tính nhưng cũng không kém phần lịch lãm với bộ dây da nâu có vân.', 4, N'https://cdn3.dhht.vn/wp-content/uploads/2023/09/7_EFB-510JBL-7AVDR-1.jpg'),
(N'Đồng hồ nữ Casio SHE-4505SG-7ADR', 7205000, 11, N'Thiết kế dành cho nữ, kim chỉ và vạch số thiết kế thời trang kết hợp với dây đeo kim loại mạ bạc như 1 phụ kiện thời trang cho các bạn nữ.', 4,'https://cdn3.dhht.vn/wp-content/uploads/2023/09/LTP-VT02BL-2AUDF.jpg'),
(N'Đồng hồ nam Orient RA-AC0F08G10B', 896000, 16, N'Phiên bản mạ vàng trên phần kim chỉ cùng nền cọc số, thiết kế trẻ trung với phần dây đeo vàng demi.', 5, 'https://cdn3.dhht.vn/wp-content/uploads/2023/09/RA-AC0F08G10B.jpg'),
(N'Đồng hồ nam Orient Star Semi ', 2840000, 1, N'Được sản xuất giới hạn chỉ có 900 chiếc trên toàn thế giới.', 5,'https://cdn3.dhht.vn/wp-content/uploads/2023/10/RE-AV0120L00B.jpg'),
(N'Đồng hồ nam Seiko SPB167J1 Kính Sapphire', 120000, 3, N'Kiểu dáng đơn giản chức năng 3 kim 1 lịch trên nền mặt số xanh 39mm nổi bật thiết kế hoạ tiết guilloche.', 2, N'https://cdn3.dhht.vn/wp-content/uploads/2023/11/SPB167J1.jpg'),
(N'Đồng hồ nữ Seiko SUR474P1 a1512125', 6850000, 11, N'Mẫu Seiko SUR474P1 thiết kế đơn giản chức năng 3 kim trên nền mặt số kích thước 29mm phù hợp cho các phái đẹp có phần cổ tay nhỏ.', 2,'https://cdn3.dhht.vn/wp-content/uploads/2023/09/SUR474P1.jpg'),
(N'Đồng hồ nữ Seiko SUP454P1 ss10000', 198000,10, N'Mẫu Seiko SUP454P1 máy pin phiên bản Solar (Năng Lượng Ánh Sáng), nổi bật với phần vỏ máy thiết kế mỏng trẻ trung chỉ dày 6mm.', 2,'https://cdn3.dhht.vn/wp-content/uploads/2023/09/SUP454P1.jpg'),
(N'Đồng hồ nữ Seiko Lukia SRWZ10P1', 105000, 5, N'Mẫu Seiko SRWZ10P1 thiết kế 3 núm vặn điều chỉnh các tính năng Chronograph (đo thời gian) tạo nên kiểu dáng 6 kim thời trang độc đáo.', 2,'https://cdn3.dhht.vn/wp-content/uploads/2023/09/SRWZ10P1.jpg'),
(N'Đồng hồ nữ Seiko Conceptual SUP428P1', 102900, 5, N'Mẫu Seiko SUP428P1 phiên bản mặt số vuông được phối tone màu xà cừ cùng với thiết kế sang trọng đính các viên pha lê.', 2,'https://cdn3.dhht.vn/wp-content/uploads/2023/09/SUP428P1.jpg')

SELECT * FROM DongHo
WHERE tenDH LIKE N'%nam%';

SELECT * FROM ThuongHieu
Select * from DongHo
drop table DongHo
drop table TatCaDongHo
drop table ThuongHieu
drop table Account
drop table GioHang
DELETE FROM [DongHo]




--AcCount

CREATE TABLE [dbo].[Account](
	[uID] [int] IDENTITY(1,1),
	[user] [varchar](255) NULL,
	[pass] [varchar](255) NULL,
	[isAdmin] [int] NULL,
	

	Constraint [PK_Account] primary key (uID)
)

select * from [Account] 
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([uID], [user], [pass], [isAdmin]) VALUES (1, N'Adam', N'123456', 1)
INSERT [dbo].[Account] ([uID], [user], [pass], [isAdmin]) VALUES (2, N'Anjolie', N'SNZ6HE', 0)
INSERT [dbo].[Account] ([uID], [user], [pass], [isAdmin]) VALUES (3, N'Ferris', N'RXH3XJ', 0)
SET IDENTITY_INSERT [dbo].[Account] OFF

drop table Account

CREATE TABLE GioHang (
    id INT IDENTITY(1, 1),  
	tenDH Nvarchar(50) not Null,
    soLuong INT ,
   Constraint [PK_GioHang] primary key (id)
);
drop table GioHang
select *from GioHang
Insert into GioHang
Values 
(  N'Đồng hồ Gucci nam GG0397S-006', 1 )






	