USE [master]
GO
/****** Object:  Database [DBManagement]    Script Date: 13-Oct-20 1:14:23 AM ******/
CREATE DATABASE [DBManagement]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DBManagement', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\DBManagement.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'DBManagement_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\DBManagement_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [DBManagement] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DBManagement].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DBManagement] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DBManagement] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DBManagement] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DBManagement] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DBManagement] SET ARITHABORT OFF 
GO
ALTER DATABASE [DBManagement] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DBManagement] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [DBManagement] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DBManagement] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DBManagement] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DBManagement] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DBManagement] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DBManagement] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DBManagement] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DBManagement] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DBManagement] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DBManagement] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DBManagement] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DBManagement] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DBManagement] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DBManagement] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DBManagement] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DBManagement] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DBManagement] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DBManagement] SET  MULTI_USER 
GO
ALTER DATABASE [DBManagement] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DBManagement] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DBManagement] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DBManagement] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [DBManagement]
GO
/****** Object:  Table [dbo].[BRANDTable]    Script Date: 13-Oct-20 1:14:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BRANDTable](
	[BRAND_ID] [int] IDENTITY(1,1) NOT NULL,
	[BRAND_NAME] [nvarchar](50) NULL,
 CONSTRAINT [PK_BRANDTable] PRIMARY KEY CLUSTERED 
(
	[BRAND_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CATEGORYTable]    Script Date: 13-Oct-20 1:14:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CATEGORYTable](
	[CATEGORY_ID] [int] IDENTITY(1,1) NOT NULL,
	[CATEGORY_NAME] [nvarchar](50) NULL,
 CONSTRAINT [PK_CATEGORYTable] PRIMARY KEY CLUSTERED 
(
	[CATEGORY_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PRODUCTTable]    Script Date: 13-Oct-20 1:14:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PRODUCTTable](
	[PRODUCT_ID] [int] IDENTITY(1,1) NOT NULL,
	[PRODUCT_CODE] [varchar](10) NULL,
	[PRODUCT_NAME] [nvarchar](100) NULL,
	[PRODUCT_IMAGE] [nvarchar](max) NULL,
	[PRODUCT_DESCRIPTION] [nvarchar](max) NULL,
	[CATEGORY_ID] [int] NULL,
	[BRAND_ID] [int] NULL,
	[DATECREATE] [datetime] NULL,
 CONSTRAINT [PK_PRODUCTTable] PRIMARY KEY CLUSTERED 
(
	[PRODUCT_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[USERTABLE]    Script Date: 13-Oct-20 1:14:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[USERTABLE](
	[User_Id] [int] NOT NULL,
	[Email] [varchar](255) NULL,
	[Password] [nvarchar](255) NULL,
	[DateLogin] [datetime] NULL,
 CONSTRAINT [PK_USERTABLE] PRIMARY KEY CLUSTERED 
(
	[User_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[BRANDTable] ON 

INSERT [dbo].[BRANDTable] ([BRAND_ID], [BRAND_NAME]) VALUES (1, N'Different')
INSERT [dbo].[BRANDTable] ([BRAND_ID], [BRAND_NAME]) VALUES (2, N'Apple')
INSERT [dbo].[BRANDTable] ([BRAND_ID], [BRAND_NAME]) VALUES (3, N'dell')
INSERT [dbo].[BRANDTable] ([BRAND_ID], [BRAND_NAME]) VALUES (4, N'asus')
INSERT [dbo].[BRANDTable] ([BRAND_ID], [BRAND_NAME]) VALUES (5, N'acer')
INSERT [dbo].[BRANDTable] ([BRAND_ID], [BRAND_NAME]) VALUES (6, N'kington')
INSERT [dbo].[BRANDTable] ([BRAND_ID], [BRAND_NAME]) VALUES (7, N'LG')
INSERT [dbo].[BRANDTable] ([BRAND_ID], [BRAND_NAME]) VALUES (8, N'Samsung')
INSERT [dbo].[BRANDTable] ([BRAND_ID], [BRAND_NAME]) VALUES (9, N'nokia')
SET IDENTITY_INSERT [dbo].[BRANDTable] OFF
SET IDENTITY_INSERT [dbo].[CATEGORYTable] ON 

INSERT [dbo].[CATEGORYTable] ([CATEGORY_ID], [CATEGORY_NAME]) VALUES (1, N'SmartPhone')
INSERT [dbo].[CATEGORYTable] ([CATEGORY_ID], [CATEGORY_NAME]) VALUES (2, N'Laptop')
INSERT [dbo].[CATEGORYTable] ([CATEGORY_ID], [CATEGORY_NAME]) VALUES (3, N'TV')
INSERT [dbo].[CATEGORYTable] ([CATEGORY_ID], [CATEGORY_NAME]) VALUES (4, N'PC')
INSERT [dbo].[CATEGORYTable] ([CATEGORY_ID], [CATEGORY_NAME]) VALUES (5, N'RAM')
INSERT [dbo].[CATEGORYTable] ([CATEGORY_ID], [CATEGORY_NAME]) VALUES (6, N'SSD')
INSERT [dbo].[CATEGORYTable] ([CATEGORY_ID], [CATEGORY_NAME]) VALUES (7, N'HDD')
SET IDENTITY_INSERT [dbo].[CATEGORYTable] OFF
SET IDENTITY_INSERT [dbo].[PRODUCTTable] ON 

INSERT [dbo].[PRODUCTTable] ([PRODUCT_ID], [PRODUCT_CODE], [PRODUCT_NAME], [PRODUCT_IMAGE], [PRODUCT_DESCRIPTION], [CATEGORY_ID], [BRAND_ID], [DATECREATE]) VALUES (1, N'pro_1', N'laptop1', N'acer-aspire-3-a315-54-30fk-i3-7020u-4gb-1tb-win10-18-600x600.jpg', NULL, 2, 2, CAST(0x0000AC48016C8468 AS DateTime))
INSERT [dbo].[PRODUCTTable] ([PRODUCT_ID], [PRODUCT_CODE], [PRODUCT_NAME], [PRODUCT_IMAGE], [PRODUCT_DESCRIPTION], [CATEGORY_ID], [BRAND_ID], [DATECREATE]) VALUES (2, N'pro_02', N'smartphone1', N'vsmart-joy-4-4gb-64gb-234220-094210-400x460.png', N'<h2>Đặc điểm nổi bật của Vsmart Joy 4 (4GB/64GB)</h2>

<p><img src="https://cdn.tgdd.vn/Products/Images/42/228888/Slider/vi-vn-vsmart-joy-4-4gb-64gb-thumbvideo.jpg" /><img src="https://www.thegioididong.com/Content/desktop/images/V4/icon-yt.png" /></p>

<p>Bộ sản phẩm chuẩn: Sạc, Tai nghe, Hộp, C&aacute;p, C&acirc;y lấy sim, S&aacute;ch hướng dẫn, Ốp lưng</p>

<h3><a href="https://www.thegioididong.com/dtdd/vsmart-joy-4-4gb-64gb" target="_blank">Vsmart Joy 4</a>&nbsp;l&agrave; mẫu&nbsp;<a href="https://www.thegioididong.com/dtdd" target="_blank">smartphone</a>&nbsp;gi&aacute; rẻ thừa hưởng nhiều ưu điểm từ đ&agrave;n anh&nbsp;<a href="https://www.thegioididong.com/tim-kiem?key=Vsmart+live+4" target="_blank">Vsmart Live 4</a>&nbsp;đ&atilde; ch&iacute;nh thức được giới thiệu đến người d&ugrave;ng. Những t&iacute;nh năng mới mẻ, cấu h&igrave;nh nổi trội đi k&egrave;m với mức gi&aacute; tốt vẫn l&agrave; điểm mạnh được&nbsp;<a href="https://www.thegioididong.com/dtdd-vsmart" target="_blank">Vsmart</a>&nbsp;duy tr&igrave; tr&ecirc;n mẫu smartphone mới của m&igrave;nh.</h3>

<h3>Thiết kế đẹp vượt ngo&agrave;i mong đợi</h3>

<p>Vsmart Joy 4 l&agrave; một bước tiến lớn về thiết kế so với thế hệ tiền nhiệm Vsmart Joy 3, thiết kế đ&atilde; dần được ho&agrave;n thiện hơn, thậm ch&iacute; c&ograve;n mang nhiều điểm tương đồng với người anh em thuộc ph&acirc;n kh&uacute;c cao hơn l&agrave; Vsmart Live 4.</p>

<p>Tuy được ho&agrave;n thiện từ chất liệu nhựa, nhưng Vsmart Joy 4 vẫn c&oacute; một mặt lưng chuyển m&agrave;u v&ocirc; c&ugrave;ng đẹp mắt v&agrave; tinh tế, bề mặt được phủ nh&aacute;m l&igrave;, gi&uacute;p chống trơn khi cầm v&agrave; kh&ocirc;ng để lại dấu v&acirc;n tay.</p>

<p><a href="https://www.thegioididong.com/images/42/228888/vsmart-joy-4-4gb-64gb-282120-112131.jpg" onclick="return false;"><img alt="Thiết kế đường vân mặt lưng chuyển màu đẹp mắt - Vsmart Joy 4 (4GB/64GB)" src="https://cdn.tgdd.vn/Products/Images/42/228888/vsmart-joy-4-4gb-64gb-282120-112131.jpg" /></a></p>

<p>Ngo&agrave;i ra, m&aacute;y cũng sẽ c&oacute; một cụm camera thiết kế lại theo cụm h&igrave;nh chữ nhật chứa 4 cảm biến được sắp xếp theo chữ L, b&ecirc;n cạnh l&agrave;&nbsp;<a href="https://www.thegioididong.com/dtdd-bao-mat-van-tay" target="_blank">cảm biến v&acirc;n tay</a>&nbsp;c&ugrave;ng logo Vsmart. Cảm biến được đặt ở vị tr&iacute; ph&ugrave; hợp v&agrave; c&oacute; tốc độ nhận diện nhanh ch&oacute;ng ngay khi vừa đặt tay v&agrave;o.</p>

<p><a href="https://www.thegioididong.com/images/42/228888/vsmart-joy-4-4gb-64gb-281120-111146.jpg" onclick="return false;"><img alt="Cảm biến vân tay được đặt ở mặt lưng với tốc độ nhận diện nhanh chóng - Vsmart Joy 4 (4GB/64GB)" src="https://cdn.tgdd.vn/Products/Images/42/228888/vsmart-joy-4-4gb-64gb-281120-111146.jpg" /></a></p>

<h3>M&agrave;n h&igrave;nh &ldquo;nốt ruồi&rdquo; đ&atilde; xuất hiện</h3>

<p>M&agrave;n h&igrave;nh tiếp tục l&agrave; điểm n&acirc;ng cấp s&aacute;ng gi&aacute; của Joy 4 khi m&aacute;y giờ đ&acirc;y đ&atilde; được trang bị m&agrave;n h&igrave;nh đục lỗ thời thượng thay cho m&agrave;n h&igrave;nh giọt nước c&oacute; phần hơi &quot;cũ kỹ&quot; tr&ecirc;n c&aacute;c thế hệ Joy cũ.</p>

<p>Joy 4 l&agrave;&nbsp;<a href="https://www.thegioididong.com/dtdd-man-hinh-tran-vien" target="_blank">điện thoại m&agrave;n h&igrave;nh tr&agrave;n viền</a>&nbsp;Full View k&iacute;ch thước si&ecirc;u lớn 6.53 inch, độ ph&acirc;n giải cũng n&acirc;ng l&ecirc;n Full HD+ gi&uacute;p h&igrave;nh ảnh v&agrave; nội dung hiển thị sắc n&eacute;t tr&ecirc;n một m&agrave;n h&igrave;nh lớn, tấm nền LTPS IPS LCD c&ugrave;ng độ s&aacute;ng cao, dễ d&agrave;ng sử dụng ngo&agrave;i trời với g&oacute;c nh&igrave;n rộng.</p>

<p><a href="https://www.thegioididong.com/images/42/228888/vsmart-joy-4-4gb-64gb-281320-111353.jpg" onclick="return false;"><img alt="Trải nghiệm cực đã trên màn ảnh lớn 6.53 inch - Vsmart Joy 4 (4GB/64GB)" src="https://cdn.tgdd.vn/Products/Images/42/228888/vsmart-joy-4-4gb-64gb-281320-111353.jpg" /></a></p>

<p>Phần r&igrave;a m&agrave;n h&igrave;nh được l&agrave;m cong 2.5D liền khối v&agrave;o phần cạnh viền bao quanh, tăng trải nghiệm tối đa ở c&aacute;c thao t&aacute;c vuốt chạm, cầm nắm.</p>

<p><a href="https://www.thegioididong.com/images/42/228888/vsmart-joy-4-4gb-64gb-282420-112424.jpg" onclick="return false;"><img alt="Khung và cạnh viền được làm cong cho cảm giác cầm nắm tốt  - Vsmart Joy 4 (4GB/64GB)" src="https://cdn.tgdd.vn/Products/Images/42/228888/vsmart-joy-4-4gb-64gb-282420-112424.jpg" /></a></p>

<h3>Cấu h&igrave;nh n&acirc;ng cấp hấp dẫn trong tầm gi&aacute;</h3>

<p>Trang bị vi xử l&yacute; tầm trung Snapdragon 665 8 nh&acirc;n tốc độ l&ecirc;n tới 2.0 GHz kết hợp với 4 GB RAM gi&uacute;p bạn tha hồ chơi những tựa game ưa th&iacute;ch v&agrave; ứng dụng hay sử dụng h&agrave;ng ng&agrave;y với độ mượt m&agrave;, tốc độ tải nhanh ch&oacute;ng c&oacute; thể cảm nhận r&otilde; khi sử dụng.</p>

<p>Bộ nhớ 64 GB l&agrave; qu&aacute; đủ cho nhu cầu lưu trữ ở mức cơ bản với một chiếc smartphone tầm trung. Do chỉ c&oacute; 1 t&ugrave;y chọn bộ nhớ duy nhất, n&ecirc;n nếu 64 GB kh&ocirc;ng đủ, bạn vẫn dễ d&agrave;ng mở rộng th&ecirc;m dung lượng với thẻ nhớ&nbsp;<a href="https://www.thegioididong.com/the-nho-dien-thoai" target="_blank">micro SD</a>&nbsp;tối đa 256 GB.</p>

<p><a href="https://www.thegioididong.com/images/42/228888/vsmart-joy-4-4gb-64gb-281820-111811.jpg" onclick="return false;"><img alt="Bộ nhớ trong 64 GB hỗ trợ thẻ nhớ ngoài tối đa 256 GB - Vsmart Joy 4 (4GB/64GB)" src="https://cdn.tgdd.vn/Products/Images/42/228888/vsmart-joy-4-4gb-64gb-281820-111811.jpg" /></a></p>

<h3>Bộ 4 camera AI thời thượng, chụp ảnh sắc n&eacute;t</h3>

<p>Vsmart Joy 4 cũng n&acirc;ng cấp hệ thống camera sau với 4 cảm biến hỗ trợ đầy đủ c&aacute;c kiểu chụp đang thịnh h&agrave;nh hiện nay.</p>

<p>Bộ 4 camera tr&ecirc;n Vsmart 4 sẽ bao gồm 1 camera ch&iacute;nh 16 MP phụ tr&aacute;ch thu h&igrave;nh ảnh gốc với độ n&eacute;t cao, 1&nbsp;<a href="https://www.thegioididong.com/dtdd-camera-goc-rong" target="_blank">camera g&oacute;c si&ecirc;u rộng</a>&nbsp;8 MP, camera&nbsp;<a href="https://www.thegioididong.com/dtdd-camera-xoa-phong" target="_blank">xo&aacute; ph&ocirc;ng</a>&nbsp;2 MP, đặc biệt&nbsp;<a href="https://www.thegioididong.com/dtdd-camera-macro" target="_blank">camera chụp cận macro</a>&nbsp;giờ cũng được bổ sung tr&ecirc;n Joy 4.</p>

<p><a href="https://www.thegioididong.com/images/42/228888/vsmart-joy-4-4gb-64gb-281620-111652.jpg" onclick="return false;"><img alt="Hệ thống 4 camera chất lượng đa tính năng - Vsmart Joy 4 (4GB/64GB)" src="https://cdn.tgdd.vn/Products/Images/42/228888/vsmart-joy-4-4gb-64gb-281620-111652.jpg" /></a></p>

<p>Với c&ocirc;ng nghệ AI, chụp một tấm ảnh đẹp trở n&ecirc;n dễ d&agrave;ng hơn bao giờ hết, bạn chỉ việc mở ứng dụng camera v&agrave; chụp ảnh, việc c&acirc;n chỉnh th&ocirc;ng số sẽ do AI nhận diện v&agrave; tự động c&acirc;n chỉnh cho ph&ugrave; hợp với m&ocirc;i trường chụp.</p>

<p>C&aacute;c camera phụ sẽ mang đến bạn nhiều kiểu chụp đa dạng. Giờ đ&acirc;y bạn c&oacute; thể chụp phong cảnh với g&oacute;c si&ecirc;u rộng, chụp ch&acirc;n dung xo&aacute; ph&ocirc;ng, hay thậm ch&iacute; l&agrave; chụp cận macro kh&aacute;m ph&aacute; những vật si&ecirc;u nhỏ, tất cả đều c&oacute; thể dễ d&agrave;ng thực hiện với Joy 4.</p>

<p><a href="https://www.thegioididong.com/images/42/228888/vsmart-joy-4-4gb-64gb-281520-111544.jpg" onclick="return false;"><img alt="Camera phụ hỗ trợ nhiều tính năng chụp - Vsmart Joy 4 (4GB/64GB)" src="https://cdn.tgdd.vn/Products/Images/42/228888/vsmart-joy-4-4gb-64gb-281520-111544.jpg" /></a></p>

<h3>Pin 5000 mAh, hệ điều h&agrave;nh VOS mượt m&agrave; th&acirc;n thiện</h3>

<p>Cung cấp năng lượng cho Vsmart Joy 4 l&agrave;&nbsp;vi&ecirc;n pin 5000 mAh, mức pin kh&aacute; lớn đảm bảo cho thiết bị hoạt động xuy&ecirc;n suốt trong 1 ng&agrave;y.</p>

<p>Vsmart Joy gia nhập l&agrave;ng&nbsp;<a href="https://www.thegioididong.com/dtdd-sac-pin-nhanh" target="_blank">điện thoại c&oacute; sạc nhanh</a>&nbsp;bất chấp gi&aacute; rẻ bởi n&oacute; c&oacute; c&ocirc;ng nghệ sạc nhanh 18 W gi&uacute;p việc sạc một vi&ecirc;n pin lớn kh&ocirc;ng tốn nhiều thời gian, sẵn s&agrave;ng cho cuộc sống lu&ocirc;n bận rộn.</p>

<p><a href="https://www.thegioididong.com/images/42/228888/vsmart-joy-4-4gb-64gb-281920-111937.jpg" onclick="return false;"><img alt="Pin khủng 5000 mAh sạc nhanh 18W qua cổng Type-C - Vsmart Joy 4 (4GB/64GB)" src="https://cdn.tgdd.vn/Products/Images/42/228888/vsmart-joy-4-4gb-64gb-281920-111937.jpg" /></a></p>

<p>Joy 4 cũng sẽ c&agrave;i đặt VOS 3.0 hoạt động tr&ecirc;n nền&nbsp;<a href="https://www.thegioididong.com/dtdd?g=android" target="_blank">Android</a>&nbsp;10, VOS được đ&aacute;nh gi&aacute; l&agrave; bộ giao diện người d&ugrave;ng gần với Android gốc, &iacute;t tuỳ biến s&acirc;u, v&igrave; vậy, cũng sẽ gi&uacute;p hiệu năng của Joy 4 được tối ưu, quản l&yacute; phần cứng tốt hơn, tiết kiệm pin hơn.</p>

<p>C&oacute; thể thấy, Vsmart Joy 4 l&agrave; thiết bị sở hữu nhiều sự n&acirc;ng cấp về cấu h&igrave;nh, thiết kế lẫn camera. Với một mức gi&aacute; si&ecirc;u mềm, Vsmart Joy 4 hứa hẹn sẽ l&agrave; &ldquo;&aacute;t chủ b&agrave;i&rdquo; gi&uacute;p Vsmart chiếm lĩnh ph&acirc;n kh&uacute;c tầm trung gi&aacute; rẻ.</p>

<p>&nbsp;</p>

<p>Bài vi&ecirc;́t này có hữu ích cho Bạn kh&ocirc;ng ?</p>

<p><a href="javascript:void(0);" onclick="chooseReview(this)">Hữu ích</a>&nbsp;<a href="javascript:void(0);" onclick="chooseReview(this)">Kh&ocirc;ng Hữu ích</a></p>
', 1, 2, CAST(0x0000AC48016C8468 AS DateTime))
SET IDENTITY_INSERT [dbo].[PRODUCTTable] OFF
INSERT [dbo].[USERTABLE] ([User_Id], [Email], [Password], [DateLogin]) VALUES (1, N'tanthanh141214@gmail.com', N'123', CAST(0x0000AC5000000000 AS DateTime))
ALTER TABLE [dbo].[PRODUCTTable]  WITH CHECK ADD  CONSTRAINT [FK_PRODUCTTable_BRANDTable] FOREIGN KEY([BRAND_ID])
REFERENCES [dbo].[BRANDTable] ([BRAND_ID])
GO
ALTER TABLE [dbo].[PRODUCTTable] CHECK CONSTRAINT [FK_PRODUCTTable_BRANDTable]
GO
ALTER TABLE [dbo].[PRODUCTTable]  WITH CHECK ADD  CONSTRAINT [FK_PRODUCTTable_CATEGORYTable] FOREIGN KEY([CATEGORY_ID])
REFERENCES [dbo].[CATEGORYTable] ([CATEGORY_ID])
GO
ALTER TABLE [dbo].[PRODUCTTable] CHECK CONSTRAINT [FK_PRODUCTTable_CATEGORYTable]
GO
USE [master]
GO
ALTER DATABASE [DBManagement] SET  READ_WRITE 
GO
