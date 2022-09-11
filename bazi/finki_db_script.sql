USE [master]
GO
/****** Object:  Database [finki]    Script Date: 11-Sep-22 10:58:33 PM ******/
CREATE DATABASE [finki]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'finki', FILENAME = N'C:\Users\milanco.arsovski\finki.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'finki_log', FILENAME = N'C:\Users\milanco.arsovski\finki_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [finki] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [finki].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [finki] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [finki] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [finki] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [finki] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [finki] SET ARITHABORT OFF 
GO
ALTER DATABASE [finki] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [finki] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [finki] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [finki] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [finki] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [finki] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [finki] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [finki] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [finki] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [finki] SET  DISABLE_BROKER 
GO
ALTER DATABASE [finki] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [finki] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [finki] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [finki] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [finki] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [finki] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [finki] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [finki] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [finki] SET  MULTI_USER 
GO
ALTER DATABASE [finki] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [finki] SET DB_CHAINING OFF 
GO
ALTER DATABASE [finki] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [finki] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [finki] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [finki] SET QUERY_STORE = OFF
GO
USE [finki]
GO
/****** Object:  Table [dbo].[banki]    Script Date: 11-Sep-22 10:58:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[banki](
	[banka_id] [int] IDENTITY(1,1) NOT NULL,
	[b_naziv] [nvarchar](max) NOT NULL,
	[b_adresa] [nvarchar](max) NULL,
	[grad_id] [int] NOT NULL,
 CONSTRAINT [PK_banki] PRIMARY KEY CLUSTERED 
(
	[banka_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ekspozituri]    Script Date: 11-Sep-22 10:58:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ekspozituri](
	[banka_id] [int] NOT NULL,
	[eksp_br] [int] NOT NULL,
	[e_naziv] [nvarchar](max) NOT NULL,
	[e_adresa] [nvarchar](max) NULL,
	[grad_id] [int] NOT NULL,
 CONSTRAINT [PK_ekspozituri] PRIMARY KEY CLUSTERED 
(
	[banka_id] ASC,
	[eksp_br] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[gradovi]    Script Date: 11-Sep-22 10:58:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[gradovi](
	[grad_id] [int] IDENTITY(1,1) NOT NULL,
	[g_naziv] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_gradovi] PRIMARY KEY CLUSTERED 
(
	[grad_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[klienti]    Script Date: 11-Sep-22 10:58:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[klienti](
	[klient_id] [int] IDENTITY(1,1) NOT NULL,
	[k_ime] [nvarchar](50) NOT NULL,
	[k_embg] [char](13) NOT NULL,
	[k_adresa] [nvarchar](max) NOT NULL,
	[status] [nvarchar](max) NOT NULL,
	[grad_id] [int] NOT NULL,
 CONSTRAINT [PK_klienti] PRIMARY KEY CLUSTERED 
(
	[klient_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[odgovorni_lica]    Script Date: 11-Sep-22 10:58:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[odgovorni_lica](
	[smetka_br] [int] NOT NULL,
	[trans_br] [int] NOT NULL,
	[banka_id] [int] NOT NULL,
	[vrab_br] [int] NOT NULL,
 CONSTRAINT [PK_odgovorni_lica] PRIMARY KEY CLUSTERED 
(
	[smetka_br] ASC,
	[trans_br] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ovlasteni_lica]    Script Date: 11-Sep-22 10:58:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ovlasteni_lica](
	[smetka_br] [int] NOT NULL,
	[klient_id] [int] NOT NULL,
 CONSTRAINT [PK_ovlasteni_lica] PRIMARY KEY CLUSTERED 
(
	[smetka_br] ASC,
	[klient_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[raboti_kako]    Script Date: 11-Sep-22 10:58:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[raboti_kako](
	[banka_id] [int] NOT NULL,
	[vrab_br] [int] NOT NULL,
	[rabmesto_id] [int] NOT NULL,
 CONSTRAINT [PK_raboti_kako] PRIMARY KEY CLUSTERED 
(
	[banka_id] ASC,
	[vrab_br] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[rabotni_mesta]    Script Date: 11-Sep-22 10:58:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rabotni_mesta](
	[rabmesto_id] [int] IDENTITY(1,1) NOT NULL,
	[rm_naziv] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_rabotni_mesta] PRIMARY KEY CLUSTERED 
(
	[rabmesto_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[realizatori]    Script Date: 11-Sep-22 10:58:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[realizatori](
	[smetka_br] [int] NOT NULL,
	[trans_br] [int] NOT NULL,
	[klient_id] [int] NOT NULL,
 CONSTRAINT [PK_realizatori] PRIMARY KEY CLUSTERED 
(
	[smetka_br] ASC,
	[trans_br] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[smetki]    Script Date: 11-Sep-22 10:58:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[smetki](
	[smetka_br] [int] IDENTITY(1,1) NOT NULL,
	[tipsmetka_sifra] [int] NOT NULL,
	[poslednasostojba] [decimal](18, 2) NOT NULL,
	[banka_id] [int] NOT NULL,
	[klient_id] [int] NOT NULL,
 CONSTRAINT [PK_smetki] PRIMARY KEY CLUSTERED 
(
	[smetka_br] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tipovi_smetki]    Script Date: 11-Sep-22 10:58:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tipovi_smetki](
	[tipsmetka_sifra] [int] IDENTITY(1,1) NOT NULL,
	[ts_naziv] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_tipovi_smetki] PRIMARY KEY CLUSTERED 
(
	[tipsmetka_sifra] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[transakcii]    Script Date: 11-Sep-22 10:58:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[transakcii](
	[trans_br] [int] IDENTITY(1,1) NOT NULL,
	[smetka_br] [int] NOT NULL,
	[vid] [char](1) NOT NULL,
	[iznos] [decimal](18, 2) NOT NULL,
	[datum] [datetime] NOT NULL,
	[elektronska] [bit] NOT NULL,
 CONSTRAINT [PK_transakcii] PRIMARY KEY CLUSTERED 
(
	[smetka_br] ASC,
	[trans_br] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[vraboteni]    Script Date: 11-Sep-22 10:58:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vraboteni](
	[vrab_br] [int] IDENTITY(1,1) NOT NULL,
	[banka_id] [int] NOT NULL,
	[v_embg] [char](13) NOT NULL,
	[v_ime] [nvarchar](50) NOT NULL,
	[godina_vrab] [int] NULL,
 CONSTRAINT [PK_vraboteni] PRIMARY KEY CLUSTERED 
(
	[banka_id] ASC,
	[vrab_br] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[banki] ON 
GO
INSERT [dbo].[banki] ([banka_id], [b_naziv], [b_adresa], [grad_id]) VALUES (1, N'Stopanska', N's', 2)
GO
INSERT [dbo].[banki] ([banka_id], [b_naziv], [b_adresa], [grad_id]) VALUES (2, N'Uni', N'u', 2)
GO
INSERT [dbo].[banki] ([banka_id], [b_naziv], [b_adresa], [grad_id]) VALUES (3, N'Komercijalna', N'k', 2)
GO
SET IDENTITY_INSERT [dbo].[banki] OFF
GO
INSERT [dbo].[ekspozituri] ([banka_id], [eksp_br], [e_naziv], [e_adresa], [grad_id]) VALUES (1, 1, N'sto-kr', N's', 1)
GO
INSERT [dbo].[ekspozituri] ([banka_id], [eksp_br], [e_naziv], [e_adresa], [grad_id]) VALUES (2, 2, N'uni-kr', N'u', 1)
GO
INSERT [dbo].[ekspozituri] ([banka_id], [eksp_br], [e_naziv], [e_adresa], [grad_id]) VALUES (2, 3, N'uni-sk', N'u', 2)
GO
INSERT [dbo].[ekspozituri] ([banka_id], [eksp_br], [e_naziv], [e_adresa], [grad_id]) VALUES (3, 4, N'kom-pp', N'k', 3)
GO
SET IDENTITY_INSERT [dbo].[gradovi] ON 
GO
INSERT [dbo].[gradovi] ([grad_id], [g_naziv]) VALUES (1, N'Krusevo')
GO
INSERT [dbo].[gradovi] ([grad_id], [g_naziv]) VALUES (2, N'Skopje')
GO
INSERT [dbo].[gradovi] ([grad_id], [g_naziv]) VALUES (3, N'Prilep')
GO
SET IDENTITY_INSERT [dbo].[gradovi] OFF
GO
SET IDENTITY_INSERT [dbo].[klienti] ON 
GO
INSERT [dbo].[klienti] ([klient_id], [k_ime], [k_embg], [k_adresa], [status], [grad_id]) VALUES (2, N'Goran', N'1234567891234', N'g-1', N'1', 1)
GO
INSERT [dbo].[klienti] ([klient_id], [k_ime], [k_embg], [k_adresa], [status], [grad_id]) VALUES (4, N'Andrej', N'1234567891235', N'a', N'1', 2)
GO
INSERT [dbo].[klienti] ([klient_id], [k_ime], [k_embg], [k_adresa], [status], [grad_id]) VALUES (5, N'Misko', N'1234567891236', N'm', N'1', 3)
GO
SET IDENTITY_INSERT [dbo].[klienti] OFF
GO
INSERT [dbo].[odgovorni_lica] ([smetka_br], [trans_br], [banka_id], [vrab_br]) VALUES (1, 4, 1, 5)
GO
INSERT [dbo].[odgovorni_lica] ([smetka_br], [trans_br], [banka_id], [vrab_br]) VALUES (1, 7, 1, 7)
GO
INSERT [dbo].[odgovorni_lica] ([smetka_br], [trans_br], [banka_id], [vrab_br]) VALUES (3, 6, 3, 9)
GO
INSERT [dbo].[odgovorni_lica] ([smetka_br], [trans_br], [banka_id], [vrab_br]) VALUES (3, 10, 2, 8)
GO
INSERT [dbo].[ovlasteni_lica] ([smetka_br], [klient_id]) VALUES (1, 2)
GO
INSERT [dbo].[ovlasteni_lica] ([smetka_br], [klient_id]) VALUES (3, 4)
GO
INSERT [dbo].[ovlasteni_lica] ([smetka_br], [klient_id]) VALUES (9, 5)
GO
INSERT [dbo].[ovlasteni_lica] ([smetka_br], [klient_id]) VALUES (10, 4)
GO
INSERT [dbo].[raboti_kako] ([banka_id], [vrab_br], [rabmesto_id]) VALUES (1, 5, 2)
GO
INSERT [dbo].[raboti_kako] ([banka_id], [vrab_br], [rabmesto_id]) VALUES (1, 7, 1)
GO
INSERT [dbo].[raboti_kako] ([banka_id], [vrab_br], [rabmesto_id]) VALUES (2, 8, 2)
GO
INSERT [dbo].[raboti_kako] ([banka_id], [vrab_br], [rabmesto_id]) VALUES (3, 9, 1)
GO
SET IDENTITY_INSERT [dbo].[rabotni_mesta] ON 
GO
INSERT [dbo].[rabotni_mesta] ([rabmesto_id], [rm_naziv]) VALUES (1, N'Loan Officer')
GO
INSERT [dbo].[rabotni_mesta] ([rabmesto_id], [rm_naziv]) VALUES (2, N'Branch Manager')
GO
SET IDENTITY_INSERT [dbo].[rabotni_mesta] OFF
GO
SET IDENTITY_INSERT [dbo].[smetki] ON 
GO
INSERT [dbo].[smetki] ([smetka_br], [tipsmetka_sifra], [poslednasostojba], [banka_id], [klient_id]) VALUES (1, 1, CAST(10000.00 AS Decimal(18, 2)), 1, 5)
GO
INSERT [dbo].[smetki] ([smetka_br], [tipsmetka_sifra], [poslednasostojba], [banka_id], [klient_id]) VALUES (3, 2, CAST(500.00 AS Decimal(18, 2)), 2, 4)
GO
INSERT [dbo].[smetki] ([smetka_br], [tipsmetka_sifra], [poslednasostojba], [banka_id], [klient_id]) VALUES (9, 3, CAST(30.00 AS Decimal(18, 2)), 3, 2)
GO
INSERT [dbo].[smetki] ([smetka_br], [tipsmetka_sifra], [poslednasostojba], [banka_id], [klient_id]) VALUES (10, 2, CAST(10.00 AS Decimal(18, 2)), 1, 5)
GO
INSERT [dbo].[smetki] ([smetka_br], [tipsmetka_sifra], [poslednasostojba], [banka_id], [klient_id]) VALUES (11, 2, CAST(15.00 AS Decimal(18, 2)), 2, 5)
GO
SET IDENTITY_INSERT [dbo].[smetki] OFF
GO
SET IDENTITY_INSERT [dbo].[tipovi_smetki] ON 
GO
INSERT [dbo].[tipovi_smetki] ([tipsmetka_sifra], [ts_naziv]) VALUES (1, N'devizna')
GO
INSERT [dbo].[tipovi_smetki] ([tipsmetka_sifra], [ts_naziv]) VALUES (2, N'denarska')
GO
INSERT [dbo].[tipovi_smetki] ([tipsmetka_sifra], [ts_naziv]) VALUES (3, N'depozitna')
GO
SET IDENTITY_INSERT [dbo].[tipovi_smetki] OFF
GO
SET IDENTITY_INSERT [dbo].[transakcii] ON 
GO
INSERT [dbo].[transakcii] ([trans_br], [smetka_br], [vid], [iznos], [datum], [elektronska]) VALUES (4, 1, N'd', CAST(10.00 AS Decimal(18, 2)), CAST(N'2022-09-11T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[transakcii] ([trans_br], [smetka_br], [vid], [iznos], [datum], [elektronska]) VALUES (7, 1, N'd', CAST(10.00 AS Decimal(18, 2)), CAST(N'2022-09-11T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[transakcii] ([trans_br], [smetka_br], [vid], [iznos], [datum], [elektronska]) VALUES (9, 1, N'd', CAST(10.00 AS Decimal(18, 2)), CAST(N'2022-07-11T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[transakcii] ([trans_br], [smetka_br], [vid], [iznos], [datum], [elektronska]) VALUES (14, 1, N'k', CAST(40.00 AS Decimal(18, 2)), CAST(N'2022-02-11T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[transakcii] ([trans_br], [smetka_br], [vid], [iznos], [datum], [elektronska]) VALUES (6, 3, N'i', CAST(20.00 AS Decimal(18, 2)), CAST(N'2022-06-11T00:00:00.000' AS DateTime), 0)
GO
INSERT [dbo].[transakcii] ([trans_br], [smetka_br], [vid], [iznos], [datum], [elektronska]) VALUES (8, 3, N'i', CAST(20.00 AS Decimal(18, 2)), CAST(N'2022-03-11T00:00:00.000' AS DateTime), 0)
GO
INSERT [dbo].[transakcii] ([trans_br], [smetka_br], [vid], [iznos], [datum], [elektronska]) VALUES (10, 3, N'i', CAST(20.00 AS Decimal(18, 2)), CAST(N'2022-01-11T00:00:00.000' AS DateTime), 0)
GO
INSERT [dbo].[transakcii] ([trans_br], [smetka_br], [vid], [iznos], [datum], [elektronska]) VALUES (15, 9, N'k', CAST(45.00 AS Decimal(18, 2)), CAST(N'2022-03-13T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[transakcii] ([trans_br], [smetka_br], [vid], [iznos], [datum], [elektronska]) VALUES (11, 10, N'i', CAST(30.00 AS Decimal(18, 2)), CAST(N'2022-01-11T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[transakcii] ([trans_br], [smetka_br], [vid], [iznos], [datum], [elektronska]) VALUES (13, 11, N'i', CAST(35.00 AS Decimal(18, 2)), CAST(N'2022-01-11T00:00:00.000' AS DateTime), 1)
GO
SET IDENTITY_INSERT [dbo].[transakcii] OFF
GO
SET IDENTITY_INSERT [dbo].[vraboteni] ON 
GO
INSERT [dbo].[vraboteni] ([vrab_br], [banka_id], [v_embg], [v_ime], [godina_vrab]) VALUES (5, 1, N'1111111111111', N'Milanco s-bm', 2099)
GO
INSERT [dbo].[vraboteni] ([vrab_br], [banka_id], [v_embg], [v_ime], [godina_vrab]) VALUES (7, 1, N'1111111111112', N'Deni s-lo', 2009)
GO
INSERT [dbo].[vraboteni] ([vrab_br], [banka_id], [v_embg], [v_ime], [godina_vrab]) VALUES (8, 2, N'1111111111113', N'Emi u-bm', 2008)
GO
INSERT [dbo].[vraboteni] ([vrab_br], [banka_id], [v_embg], [v_ime], [godina_vrab]) VALUES (9, 3, N'1111111111114', N'Kate k-lo', 2011)
GO
SET IDENTITY_INSERT [dbo].[vraboteni] OFF
GO
ALTER TABLE [dbo].[banki]  WITH CHECK ADD  CONSTRAINT [FK_banki_gradovi] FOREIGN KEY([grad_id])
REFERENCES [dbo].[gradovi] ([grad_id])
GO
ALTER TABLE [dbo].[banki] CHECK CONSTRAINT [FK_banki_gradovi]
GO
ALTER TABLE [dbo].[ekspozituri]  WITH CHECK ADD  CONSTRAINT [FK_ekspozituri_banki] FOREIGN KEY([banka_id])
REFERENCES [dbo].[banki] ([banka_id])
GO
ALTER TABLE [dbo].[ekspozituri] CHECK CONSTRAINT [FK_ekspozituri_banki]
GO
ALTER TABLE [dbo].[ekspozituri]  WITH CHECK ADD  CONSTRAINT [FK_ekspozituri_gradovi] FOREIGN KEY([banka_id])
REFERENCES [dbo].[gradovi] ([grad_id])
GO
ALTER TABLE [dbo].[ekspozituri] CHECK CONSTRAINT [FK_ekspozituri_gradovi]
GO
ALTER TABLE [dbo].[klienti]  WITH CHECK ADD  CONSTRAINT [FK_klienti_gradovi] FOREIGN KEY([grad_id])
REFERENCES [dbo].[gradovi] ([grad_id])
GO
ALTER TABLE [dbo].[klienti] CHECK CONSTRAINT [FK_klienti_gradovi]
GO
ALTER TABLE [dbo].[odgovorni_lica]  WITH CHECK ADD  CONSTRAINT [FK_odgovorni_lica_banki] FOREIGN KEY([banka_id])
REFERENCES [dbo].[banki] ([banka_id])
GO
ALTER TABLE [dbo].[odgovorni_lica] CHECK CONSTRAINT [FK_odgovorni_lica_banki]
GO
ALTER TABLE [dbo].[odgovorni_lica]  WITH CHECK ADD  CONSTRAINT [FK_odgovorni_lica_transakcii] FOREIGN KEY([smetka_br], [trans_br])
REFERENCES [dbo].[transakcii] ([smetka_br], [trans_br])
GO
ALTER TABLE [dbo].[odgovorni_lica] CHECK CONSTRAINT [FK_odgovorni_lica_transakcii]
GO
ALTER TABLE [dbo].[ovlasteni_lica]  WITH CHECK ADD  CONSTRAINT [FK_ovlasteni_lica_klienti] FOREIGN KEY([klient_id])
REFERENCES [dbo].[klienti] ([klient_id])
GO
ALTER TABLE [dbo].[ovlasteni_lica] CHECK CONSTRAINT [FK_ovlasteni_lica_klienti]
GO
ALTER TABLE [dbo].[ovlasteni_lica]  WITH CHECK ADD  CONSTRAINT [FK_ovlasteni_lica_smetki] FOREIGN KEY([smetka_br])
REFERENCES [dbo].[smetki] ([smetka_br])
GO
ALTER TABLE [dbo].[ovlasteni_lica] CHECK CONSTRAINT [FK_ovlasteni_lica_smetki]
GO
ALTER TABLE [dbo].[raboti_kako]  WITH CHECK ADD  CONSTRAINT [FK_raboti_kako_rabotni_mesta] FOREIGN KEY([rabmesto_id])
REFERENCES [dbo].[rabotni_mesta] ([rabmesto_id])
GO
ALTER TABLE [dbo].[raboti_kako] CHECK CONSTRAINT [FK_raboti_kako_rabotni_mesta]
GO
ALTER TABLE [dbo].[realizatori]  WITH CHECK ADD  CONSTRAINT [FK_realizatori_transakcii] FOREIGN KEY([klient_id])
REFERENCES [dbo].[klienti] ([klient_id])
GO
ALTER TABLE [dbo].[realizatori] CHECK CONSTRAINT [FK_realizatori_transakcii]
GO
ALTER TABLE [dbo].[smetki]  WITH CHECK ADD  CONSTRAINT [FK_smetki_banki] FOREIGN KEY([banka_id])
REFERENCES [dbo].[banki] ([banka_id])
GO
ALTER TABLE [dbo].[smetki] CHECK CONSTRAINT [FK_smetki_banki]
GO
ALTER TABLE [dbo].[smetki]  WITH CHECK ADD  CONSTRAINT [FK_smetki_klienti] FOREIGN KEY([klient_id])
REFERENCES [dbo].[klienti] ([klient_id])
GO
ALTER TABLE [dbo].[smetki] CHECK CONSTRAINT [FK_smetki_klienti]
GO
ALTER TABLE [dbo].[vraboteni]  WITH CHECK ADD  CONSTRAINT [FK_vraboteni_banki] FOREIGN KEY([banka_id])
REFERENCES [dbo].[banki] ([banka_id])
GO
ALTER TABLE [dbo].[vraboteni] CHECK CONSTRAINT [FK_vraboteni_banki]
GO
USE [master]
GO
ALTER DATABASE [finki] SET  READ_WRITE 
GO
