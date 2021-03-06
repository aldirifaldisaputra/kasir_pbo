USE [master]
GO
/****** Object:  Database [kasir_pbo]    Script Date: 5/28/2022 11:04:32 AM ******/
CREATE DATABASE [kasir_pbo]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'kasir_pbo', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\kasir_pbo.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'kasir_pbo_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\kasir_pbo_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [kasir_pbo] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [kasir_pbo].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [kasir_pbo] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [kasir_pbo] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [kasir_pbo] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [kasir_pbo] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [kasir_pbo] SET ARITHABORT OFF 
GO
ALTER DATABASE [kasir_pbo] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [kasir_pbo] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [kasir_pbo] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [kasir_pbo] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [kasir_pbo] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [kasir_pbo] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [kasir_pbo] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [kasir_pbo] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [kasir_pbo] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [kasir_pbo] SET  DISABLE_BROKER 
GO
ALTER DATABASE [kasir_pbo] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [kasir_pbo] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [kasir_pbo] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [kasir_pbo] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [kasir_pbo] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [kasir_pbo] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [kasir_pbo] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [kasir_pbo] SET RECOVERY FULL 
GO
ALTER DATABASE [kasir_pbo] SET  MULTI_USER 
GO
ALTER DATABASE [kasir_pbo] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [kasir_pbo] SET DB_CHAINING OFF 
GO
ALTER DATABASE [kasir_pbo] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [kasir_pbo] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [kasir_pbo] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [kasir_pbo] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'kasir_pbo', N'ON'
GO
ALTER DATABASE [kasir_pbo] SET QUERY_STORE = OFF
GO
USE [kasir_pbo]
GO
/****** Object:  Table [dbo].[barang]    Script Date: 5/28/2022 11:04:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[barang](
	[kodebarang] [varchar](50) NOT NULL,
	[namabarang] [varchar](250) NULL,
	[hargajual] [numeric](18, 0) NULL,
	[jumlahbarang] [numeric](18, 0) NULL,
	[satuanbarang] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[detail]    Script Date: 5/28/2022 11:04:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[detail](
	[nojual] [varchar](50) NOT NULL,
	[kodebarang] [varchar](50) NOT NULL,
	[namabarang] [varchar](250) NOT NULL,
	[hargajual] [numeric](18, 0) NOT NULL,
	[jumlahjual] [numeric](18, 0) NOT NULL,
	[subtotal] [numeric](18, 0) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[jual]    Script Date: 5/28/2022 11:04:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[jual](
	[nojual] [varchar](50) NOT NULL,
	[tgljual] [date] NOT NULL,
	[jamjual] [varchar](50) NULL,
	[itemjual] [numeric](18, 0) NOT NULL,
	[total] [numeric](18, 0) NOT NULL,
	[dibayar] [numeric](18, 0) NOT NULL,
	[kembali] [numeric](18, 0) NOT NULL,
	[kodepelanggan] [varchar](50) NOT NULL,
	[kodekasir] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[kasir]    Script Date: 5/28/2022 11:04:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[kasir](
	[kodekasir] [varchar](50) NOT NULL,
	[namakasir] [varchar](250) NULL,
	[password] [varchar](50) NULL,
	[level] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pelanggan]    Script Date: 5/28/2022 11:04:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pelanggan](
	[kodepelanggan] [varchar](50) NOT NULL,
	[namapelanggan] [varchar](50) NOT NULL,
	[alamatpelanggan] [varchar](950) NULL,
	[telppelanggan] [varchar](50) NULL,
 CONSTRAINT [PK_tbl_pelanggan] PRIMARY KEY CLUSTERED 
(
	[kodepelanggan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[ADMIN]    Script Date: 5/28/2022 11:04:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ADMIN]
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
select * from kasir where level = 'ADMIN'
END
GO
/****** Object:  StoredProcedure [dbo].[AIBarang]    Script Date: 5/28/2022 11:04:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[AIBarang]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select * from barang where kodebarang in (select max(kodebarang) from barang) order by kodebarang desc
END
GO
/****** Object:  StoredProcedure [dbo].[AIJual]    Script Date: 5/28/2022 11:04:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[AIJual]
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select nojual from jual where nojual in (select max(nojual) from jual) order by nojual desc
END
GO
/****** Object:  StoredProcedure [dbo].[AIKasir]    Script Date: 5/28/2022 11:04:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[AIKasir]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select kodekasir from kasir where kodekasir in (select max(kodekasir) from kasir) order by kodekasir desc
END
GO
/****** Object:  StoredProcedure [dbo].[AIPelanggan]    Script Date: 5/28/2022 11:04:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[AIPelanggan]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select * from pelanggan where kodepelanggan in (select max(kodepelanggan) from pelanggan) order by kodepelanggan desc
END
GO
/****** Object:  StoredProcedure [dbo].[CariNotaBerdasarkanTanggal]    Script Date: 5/28/2022 11:04:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CariNotaBerdasarkanTanggal]
	-- Add the parameters for the stored procedure here
	@tgljual date
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select * from jual where tgljual = '2022-03-09'
END
GO
/****** Object:  StoredProcedure [dbo].[CountSatuanBarang]    Script Date: 5/28/2022 11:04:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CountSatuanBarang]
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
select satuanbarang, count(satuanbarang) as count
from barang
group by satuanbarang
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteBarang]    Script Date: 5/28/2022 11:04:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[DeleteBarang]
	-- Add the parameters for the stored procedure here
	@kodebarang varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	delete from barang
	where kodebarang = @kodebarang
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteKasir]    Script Date: 5/28/2022 11:04:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[DeleteKasir]
	-- Add the parameters for the stored procedure here

	@kodekasir varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	delete from kasir
	where kodekasir = @kodekasir
END
GO
/****** Object:  StoredProcedure [dbo].[DeletePelanggan]    Script Date: 5/28/2022 11:04:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[DeletePelanggan]
	-- Add the parameters for the stored procedure here
	@kodepelanggan varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	delete from pelanggan
	where kodepelanggan = @kodepelanggan
END
GO
/****** Object:  StoredProcedure [dbo].[GetDetailByBulan]    Script Date: 5/28/2022 11:04:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetDetailByBulan]
	-- Add the parameters for the stored procedure here
		@month varchar(50),
	@year varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select detail.nojual, jual.tgljual,detail.kodebarang,detail.namabarang,detail.hargajual, detail.jumlahjual, detail.subtotal from detail
inner join jual on jual.nojual = detail.nojual
	where MONTH(tgljual) = @month and YEAR(tgljual) = @year
END
GO
/****** Object:  StoredProcedure [dbo].[GetDetailByNojual]    Script Date: 5/28/2022 11:04:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetDetailByNojual]
	-- Add the parameters for the stored procedure here
	@nojual varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
		select detail.nojual, jual.tgljual,detail.kodebarang,detail.namabarang,detail.hargajual, detail.jumlahjual, detail.subtotal from detail
inner join jual on jual.nojual = detail.nojual
where detail.nojual = @nojual
END
GO
/****** Object:  StoredProcedure [dbo].[GetDetailByRentanWaktu]    Script Date: 5/28/2022 11:04:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetDetailByRentanWaktu]
	-- Add the parameters for the stored procedure here
	@tgl1 varchar(50),
	@tgl2 varchar(50)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
		select detail.nojual, jual.tgljual,detail.kodebarang,detail.namabarang,detail.hargajual, detail.jumlahjual, detail.subtotal from detail
inner join jual on jual.nojual = detail.nojual where jual.tgljual between  @tgl1 and @tgl2
END
GO
/****** Object:  StoredProcedure [dbo].[GetDetailByYear]    Script Date: 5/28/2022 11:04:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetDetailByYear]
	-- Add the parameters for the stored procedure here
@year varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select detail.nojual, jual.tgljual,detail.kodebarang,detail.namabarang,detail.hargajual, detail.jumlahjual, detail.subtotal from detail
inner join jual on jual.nojual = detail.nojual
where year(tgljual) = @year
END
GO
/****** Object:  StoredProcedure [dbo].[GetKasirByKode]    Script Date: 5/28/2022 11:04:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetKasirByKode]
	-- Add the parameters for the stored procedure here
	@kodekasir varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select * from tbl_kasir
	where kodekasir = @kodekasir
END
GO
/****** Object:  StoredProcedure [dbo].[GetNoJualByBulan]    Script Date: 5/28/2022 11:04:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetNoJualByBulan]
	-- Add the parameters for the stored procedure here
		@month varchar(50),
	@year varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from jual
	where MONTH(tgljual) = @month and YEAR(tgljual) = @year
END
GO
/****** Object:  StoredProcedure [dbo].[GetNoJualByTahun]    Script Date: 5/28/2022 11:04:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetNoJualByTahun]
	-- Add the parameters for the stored procedure here
	@year varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from jual
	where YEAR(tgljual) = @year
END
GO
/****** Object:  StoredProcedure [dbo].[GetNoJualRentanWaktu]    Script Date: 5/28/2022 11:04:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetNoJualRentanWaktu]
	-- Add the parameters for the stored procedure here
	@tgl1 varchar(50),
	@tgl2 varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select * from jual where tgljual between  @tgl1 and @tgl2
END
GO
/****** Object:  StoredProcedure [dbo].[TESTING]    Script Date: 5/28/2022 11:04:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[TESTING]
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
select level, count(level) as count
from kasir
group by level
END
GO
/****** Object:  StoredProcedure [dbo].[USERS]    Script Date: 5/28/2022 11:04:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[USERS]
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
select * from kasir where level = 'user'
END
GO
USE [master]
GO
ALTER DATABASE [kasir_pbo] SET  READ_WRITE 
GO
