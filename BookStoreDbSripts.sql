USE [master]
GO
/****** Object:  Database [BookStoreDb]    Script Date: 22.05.2023 20:00:28 ******/
CREATE DATABASE [BookStoreDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BookStoreDb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\BookStoreDb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BookStoreDb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\BookStoreDb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [BookStoreDb] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BookStoreDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BookStoreDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BookStoreDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BookStoreDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BookStoreDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BookStoreDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [BookStoreDb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BookStoreDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BookStoreDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BookStoreDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BookStoreDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BookStoreDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BookStoreDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BookStoreDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BookStoreDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BookStoreDb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BookStoreDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BookStoreDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BookStoreDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BookStoreDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BookStoreDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BookStoreDb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BookStoreDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BookStoreDb] SET RECOVERY FULL 
GO
ALTER DATABASE [BookStoreDb] SET  MULTI_USER 
GO
ALTER DATABASE [BookStoreDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BookStoreDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BookStoreDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BookStoreDb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BookStoreDb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BookStoreDb] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'BookStoreDb', N'ON'
GO
ALTER DATABASE [BookStoreDb] SET QUERY_STORE = ON
GO
ALTER DATABASE [BookStoreDb] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [BookStoreDb]
GO
/****** Object:  Table [dbo].[CartItems]    Script Date: 22.05.2023 20:00:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CartItems](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Count] [int] NOT NULL,
 CONSTRAINT [PK_CartItems] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 22.05.2023 20:00:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](max) NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Address] [nvarchar](max) NULL,
	[OrderDate] [datetime2](7) NOT NULL,
	[Total] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 22.05.2023 20:00:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](max) NULL,
	[Author] [nvarchar](max) NULL,
	[Image] [nvarchar](max) NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[Genre] [nvarchar](max) NULL,
	[Rating] [int] NOT NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[CartItems] ON 
GO
INSERT [dbo].[CartItems] ([Id], [OrderId], [ProductId], [Count]) VALUES (1, 1, 11, 2)
GO
INSERT [dbo].[CartItems] ([Id], [OrderId], [ProductId], [Count]) VALUES (2, 2, 1, 2)
GO
INSERT [dbo].[CartItems] ([Id], [OrderId], [ProductId], [Count]) VALUES (3, 2, 8, 2)
GO
INSERT [dbo].[CartItems] ([Id], [OrderId], [ProductId], [Count]) VALUES (4, 3, 7, 1)
GO
INSERT [dbo].[CartItems] ([Id], [OrderId], [ProductId], [Count]) VALUES (5, 3, 20, 1)
GO
INSERT [dbo].[CartItems] ([Id], [OrderId], [ProductId], [Count]) VALUES (6, 3, 2, 1)
GO
SET IDENTITY_INSERT [dbo].[CartItems] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 
GO
INSERT [dbo].[Orders] ([Id], [Email], [Name], [Address], [OrderDate], [Total]) VALUES (1, N'm.1@mail.com', N'test_1', N'Somewhere 1', CAST(N'2022-04-11T19:53:09.6008235' AS DateTime2), CAST(798.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Orders] ([Id], [Email], [Name], [Address], [OrderDate], [Total]) VALUES (2, N'm.2@mail.com', N'test_2', N'Somewhere 2', CAST(N'2022-04-11T19:54:03.9315196' AS DateTime2), CAST(2250.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Orders] ([Id], [Email], [Name], [Address], [OrderDate], [Total]) VALUES (3, N'm.3@mail.com', N'test_3', N'Somewhere 3', CAST(N'2022-04-11T19:55:54.2104799' AS DateTime2), CAST(1229.00 AS Decimal(18, 2)))
GO
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 
GO
INSERT [dbo].[Products] ([Id], [Title], [Author], [Image], [Price], [Genre], [Rating], [Description]) VALUES (1, N'Ïðîèñõîæäåíèå', N'Äýí Áðàóí', N'https://cv9.litres.ru/pub/c/elektronnaya-kniga/cover_330/27624091-den-braun-proishozhdenie.jpg', CAST(710.00 AS Decimal(18, 2)), N'Äåòåêòèâ', 3, N'Ðîáåðò Ëýíãäîí ïðèáûâàåò â ìóçåé Ãóããåíõàéìà â Áèëüáàî ïî ïðèãëàøåíèþ äðóãà è áûâøåãî ñòóäåíòà Ýäìîíäà Êèðøà. Ìèëëèàðäåð è êîìïüþòåðíûé ãóðó, îí èçâåñòåí ñâîèìè óäèâèòåëüíûìè îòêðûòèÿìè è ïðåäñêàçàíèÿìè. È ýòèì âå÷åðîì Êèðø ñîáèðàåòñÿ «ïåðåâåðíóòü âñå ñîâðåìåííûå íàó÷íûå ïðåäñòàâëåíèÿ î ìèðå», äàâ îòâåò íà äâà ãëàâíûõ âîïðîñà, âîëíóþùèõ ÷åëîâå÷åñòâî íà ïðîòÿæåíèè âñåé èñòîðèè:Îòêóäà ìû? ×òî íàñ æäåò?')
GO
INSERT [dbo].[Products] ([Id], [Title], [Author], [Image], [Price], [Genre], [Rating], [Description]) VALUES (2, N'×óäîâèùå Êàðíîõåëüìà', N'Ìàðèíà Ñóðæåâñêàÿ', N'https://cv9.litres.ru/pub/c/elektronnaya-kniga/cover_330/48827396-marina-surzhevskaya-22364624-chudovische-karnohelma.jpg', CAST(399.00 AS Decimal(18, 2)), N'Ôýíòåçè', 5, N'Òûñÿ÷åëåòèå íàçàä Âåëèêèé Òóìàí ðàçäåëèë íàø ìèð íà öèâèëèçîâàííóþ Êîíôåäåðàöèþ è äèêèå ôüîðäû. Â çàãàäî÷íûå çåìëè òåïåðü ìîæíî ïîïàñòü ëèøü îäíèì ñïîñîáîì – ñòàòü íåâåñòîé äëÿ èëüõà-âàðâàðà. È ÿ, Ýííè Âèëñîí, ñ óäîâîëüñòâèåì âîñïîëüçîâàëàñü ýòîé âîçìîæíîñòüþ! Âåäü âñå, ÷åãî ÿ õîòåëà – ýòî îáðåñòè ñ÷àñòüå ñ äîáðûì è ñèëüíûì ìóæåì, ïåêàðåì èç äàëåêîãî Âàðèñôîëüäà. Âîò òîëüêî ìå÷òàì íå ñóæäåíî ñáûòüñÿ, âåäü ìåíÿ óêðàëè ñ ñîáñòâåííîãî îáðó÷åíèÿ! Òàê ÿ óçíàëà ñòðàøíóþ òàéíó ôüîðäîâ è îêàçàëàñü â ïóãàþùåì Êàðíîõåëüìå, ãäå îáèòàåò ÷óäîâèùå… Êíèãà òðåòüÿ èç öèêëà ''Ìèð çà Âåëèêèì Òóìàíîì''')
GO
INSERT [dbo].[Products] ([Id], [Title], [Author], [Image], [Price], [Genre], [Rating], [Description]) VALUES (3, N'Îíëàéí-âëèÿíèå', N'Áàñ Âþòåðñ, Æîðèñ Ãðîýí', N'https://cv0.litres.ru/pub/c/elektronnaya-kniga/cover_330/65551802-bas-vuters-onlayn-vliyanie-kak-upravlyat-povedeniem-ludey-chtoby-oni-sover.jpg', CAST(499.00 AS Decimal(18, 2)), N'Ëè÷íàÿ ýôôåêòèâíîñòü', 5, N'Êàê ïðåâðàòèòü ïîñåòèòåëåé ñàéòà â ïîêóïàòåëåé, à ñëó÷àéíûõ èíòåðíåò-ñåðôåðîâ â çàðåãèñòðèðîâàííûõ ïîëüçîâàòåëåé? Ãðàìîòíîå ïðèìåíåíèå ïîâåäåí÷åñêîé ïñèõîëîãèè çíà÷èòåëüíî ïîâûøàåò ðåçóëüòàòèâíîñòü ñàéòà, ïðèëîæåíèÿ èëè îíëàéí-êàìïàíèè. Ïñèõîëîã è âåá-äèçàéíåð Æîðèñ Ãðîýí è ãóðó óáåæäåíèÿ Áàñ Âþòåðñ ïîäðîáíî îáúÿñíÿþò, êàêèå ïðèåìû ðàáîòàþò, à êàêèå íåò è ïî÷åìó. Êíèãà ñîäåðæèò êîíêðåòíûå è ëåãêî ïðèìåíèìûå ðåêîìåíäàöèè, êîòîðûå îñíîâàíû íà ñîðîêàëåòíåì ïðàêòè÷åñêîì îïûòå ðàáîòû ñ îíëàéí-àóäèòîðèåé è çíàíèÿõ íàèáîëåå èçâåñòíûõ ñîâðåìåííûõ ó÷åíûõ-áèõåâèîðèñòîâ, òàêèõ êàê Ôîãã, ×àëäèíè è Êàíåìàí. Ýòî ñàìîå ïîëíîå ïðàêòè÷åñêîå ðóêîâîäñòâî ïî ïðîåêòèðîâàíèþ ïóòè îíëàéí-êëèåíòîâ ê ïîñòàâëåííîé âàìè öåëè, ïîäêðåïëåííîå ìíîæåñòâîì ðåàëüíûõ ïðèìåðîâ è èëëþñòðàöèé òîãî, ÷òî íóæíî äåëàòü è ÷åãî äåëàòü íå ñëåäóåò.')
GO
INSERT [dbo].[Products] ([Id], [Title], [Author], [Image], [Price], [Genre], [Rating], [Description]) VALUES (4, N'Ïîäñîçíàíèå ìîæåò âñ¸!', N'Äæîí Êåõî', N'https://cv4.litres.ru/pub/c/audiokniga/cover_330/19571848-dzhon-keho-podsoznanie-mozhet-vse-19571848.jpg', CAST(399.00 AS Decimal(18, 2)), N'Ëè÷íàÿ ýôôåêòèâíîñòü', 5, N'Èñïîëüçîâàíèå îãðîìíûõ ðåçåðâîâ, ñêðûòûõ â ïîäñîçíàíèè êàæäîãî ÷åëîâåêà, ïîçâîëÿåò ðåøàòü ñàìûå ñëîæíûå ïîâñåäíåâíûå ïðîáëåìû, êîãäà ëîãèêà îêàçûâàåòñÿ áåññèëüíîé. Ðàçðàáîòàííàÿ àâòîðîì ýòîé êíèãè ïðîãðàììà ïîìîæåò âàì àêòèâèçèðîâàòü áåçãðàíè÷íûå ðåñóðñû ñîáñòâåííîãî ãîëîâíîãî ìîçãà, ÷òîáû èçìåíèòü ñâîþ æèçíü ê ëó÷øåìó ðàç è íàâñåãäà. Äëÿ øèðîêîãî êðóãà ÷èòàòåëåé.')
GO
INSERT [dbo].[Products] ([Id], [Title], [Author], [Image], [Price], [Genre], [Rating], [Description]) VALUES (5, N'Ïèùåáëîê', N'Àëåêñåé Èâàíîâ', N'https://cv4.litres.ru/pub/c/elektronnaya-kniga/cover_330/39435346-aleksey-ivanov-pischeblok.jpg', CAST(469.00 AS Decimal(18, 2)), N'Ñîâðåìåííàÿ ïðîçà', 4, N'«Æàðêîå ëåòî 1980 ãîäà. Ñòîëèöó ñîòðÿñàåò Îëèìïèàäà, à â íåáîëüøîì ïèîíåðñêîì ëàãåðå íà áåðåãó Âîëãè âñ¸ òèõî è ñïîêîéíî. Ïèîíåðû ìàðøèðóþò íà ëèíåéêàõ, èãðàþò â ôóòáîë è ïî íî÷àì ðàññêàçûâàþò ñòðàøíûå èñòîðèè; ìîëîäûå âîæàòûå âëþáëÿþòñÿ äðóã â äðóãà; ðå÷íîé òðàìâàé÷èê ïðèâîçèò áèäîíû ñ ìîëîêîì, è ó ïèùåáëîêà âåðòÿòñÿ äåðåâåíñêèå ñîáàêè. Íî æèçíü ïèîíåðëàãåðÿ, íà ïåðâûé âçãëÿä áåçìÿòåæíàÿ, èìååò ñâîþ òàéíóþ è ò¸ìíóþ ñòîðîíó. Ñðåäè ïèîíåðîâ ïðÿ÷óòñÿ âàìïèðû. Èõ âîëÿ è îïðåäåëÿåò òî, ÷òî ïðîèñõîäèò ó âñåõ íà âèäó.')
GO
INSERT [dbo].[Products] ([Id], [Title], [Author], [Image], [Price], [Genre], [Rating], [Description]) VALUES (6, N'Ïðîñòî Ìàñà', N'Áîðèñ Àêóíèí', N'https://cv9.litres.ru/pub/c/elektronnaya-kniga/cover_330/63028197-fredrik-bakman-trevozhnye-ludi.jpg', CAST(549.00 AS Decimal(18, 2)), N'Äåòåêòèâ', 5, N'Ïîõîæå, Ýðàñòà Ôàíäîðèíà, ëåãåíäàðíîãî ñûùèêà, áîëüøå íåò â æèâûõ. Ýòî çíà÷èò ëèøü îäíî – Ìàñàõèðî Ñèáàòà äîëæåí âåðíóòüñÿ íà ðîäèíó. Æäàëà ëè åãî ßïîíèÿ? Ñëîæíî ñêàçàòü. Ñëèøêîì ñèëüíî èçìåíèëàñü Ñòðàíà Âîñõîäÿùåãî Ñîëíöà. È âñå æå îñòàëàñü ñîáîé, êàê ïðèíöèï âàáè-ñàáè è «ñëèâîâûå» äîæäè â êîíöå ìàÿ. Êàê áû òî íè áûëî, Ìàñà âåðíóëñÿ äîìîé. Îí îñòàâèë â äàëåêîé Åâðîïå âäîâó è ñûíà ïîãèáøåãî ãîñïîäèíà è ïðèåõàë â ßïîíèþ, ÷òîáû îòêðûòü ñîáñòâåííîå ñûñêíîå àãåíòñòâî, íåñìîòðÿ íà ïî÷òåííûé âîçðàñò.')
GO
INSERT [dbo].[Products] ([Id], [Title], [Author], [Image], [Price], [Genre], [Rating], [Description]) VALUES (7, N'Ìåòðî 2033', N'Äìèòðèé Ãëóõîâñêèé', N'https://cv9.litres.ru/pub/c/elektronnaya-kniga/cover_330/128391-dmitriy-gluhovskiy-metro-2033.jpg', CAST(415.00 AS Decimal(18, 2)), N'Ôàíòàñòèêà', 5, N'Äâàäöàòü ëåò ñïóñòÿ Òðåòüåé ìèðîâîé âîéíû ïîñëåäíèå âûæèâøèå ëþäè ïðÿ÷óòñÿ íà ñòàíöèÿõ è â òóííåëÿõ ìîñêîâñêîãî ìåòðî, ñàìîãî áîëüøîãî íà Çåìëå ïðîòèâîàòîìíîãî áîìáîóáåæèùà. Ïîâåðõíîñòü ïëàíåòû çàðàæåíà è íåïðèãîäíà äëÿ îáèòàíèÿ, è ñòàíöèè ìåòðî ñòàíîâÿòñÿ ïîñëåäíèì ïðèñòàíèùåì äëÿ ÷åëîâåêà. Îíè ïðåâðàùàþòñÿ â íåçàâèñèìûå ãîðîäà-ãîñóäàðñòâà, êîòîðûå ñîïåðíè÷àþò è âîþþò äðóã ñ äðóãîì. Îíè íå ãîòîâû ïðèìèðèòüñÿ äàæå ïåðåä ëèöîì íîâîé ñòðàøíîé îïàñíîñòè, êîòîðàÿ óãðîæàåò âñåì ëþäÿì îêîí÷àòåëüíûì èñòðåáëåíèåì. Àðòåì, äâàäöàòèëåòíèé ïàðåíü ñî ñòàíöèè ÂÄÍÕ, äîëæåí ïðîéòè ÷åðåç âñå ìåòðî, ÷òîáû ñïàñòè ñâîé åäèíñòâåííûé äîì – è âñå ÷åëîâå÷åñòâî.')
GO
INSERT [dbo].[Products] ([Id], [Title], [Author], [Image], [Price], [Genre], [Rating], [Description]) VALUES (8, N'Ïðåäåë', N'Ñåðãåé Ëóêüÿíåíêî', N'https://cv1.litres.ru/pub/c/elektronnaya-kniga/cover_330/65061217-sergey-lukyanenko-predel.jpg', CAST(415.00 AS Decimal(18, 2)), N'Ôàíòàñòèêà', 5, N'Ãëóáîêèé êîñìîñ ïðèîòêðûë äëÿ ÷åëîâå÷åñòâà çàâåñó ñâîèõ òàéí, à âìåñòå ñ òåì ïîäòâåðäèë äàâíþþ äîãàäêó – êîíå÷íî, âî Âñåëåííîé åñòü è äðóãèå ðàçóìíûå ñîçäàíèÿ. Ïðîñòî íà ðàçíûõ ïëàíåòàõ ýâîëþöèÿ âûáèðàëà ðàçëè÷íûõ ñóùåñòâ, ÷òîáû îçàðèòü èõ òåìíûå äóøè íåïðîøåííîé èñêðîé ñîçíàíèÿ. Âìåñòå ñ ýòèì ïîòðÿñàþùèì îòêðûòèåì ëþäè ñäåëàëè åùå îäíî, óæàñàþùåå. Êàêàÿ-òî íåâåäîìàÿ ñèëà ïðîâîöèðóåò óíè÷òîæåíèå ðàçâèòûõ öèâèëèçàöèé. Ïðè÷èíû âñåãäà ðàçíûå – îò äèêèõ ýêñïåðèìåíòîâ äî êðîâîïðîëèòíûõ âîéí. Ðåçóëüòàò îäèí – ãèáåëü ìèëëèîíîâ íåâèííûõ. ×òîáû ðàçîáðàòüñÿ â ïðîèñõîäÿùåì, â îòäàëåííóþ ïëàíåòíóþ ñèñòåìó îòïðàâëÿåòñÿ èññëåäîâàòåëüñêèé êîðàáëü «Òâåí». Óïðàâëÿåò êîðâåòîì èñêèí Ìàðê, íà áîðòó – êîìàíäà, ñîáðàííàÿ èç ðàçíûõ ïðåäñòàâèòåëåé ðàçóìíûõ ðàñ. Äåëåãàòû îò ðàçíûõ êîñìè÷åñêèõ öèâèëèçàöèé îáúåäèíèëè óñèëèÿ, ÷òîáû ñïàñòè îò ðàçðóøåíèÿ åùå îäíó ïëàíåòó.')
GO
INSERT [dbo].[Products] ([Id], [Title], [Author], [Image], [Price], [Genre], [Rating], [Description]) VALUES (9, N'Èñ÷åçíóâøàÿ', N'Ãèëëèàí Ôëèíí', N'https://cv0.litres.ru/pub/c/elektronnaya-kniga/cover_330/6028900-gillian-flinn-ischeznuvshaya.jpg', CAST(249.00 AS Decimal(18, 2)), N'Äåòåêòèâ', 4, N'Âñå áûëî ãîòîâî äëÿ ïðàçäíîâàíèÿ ïÿòèëåòíåãî þáèëåÿ ñóïðóæåñêîé æèçíè, êîãäà âäðóã íåîáúÿñíèìî ïðîïàë îäèí èç âèíîâíèêîâ òîðæåñòâà. Îñòàëèñü ñëåäû áîðüáû â äîìå, êðîâü, êîòîðóþ ÿâíî ïûòàëèñü ñòåðåòü, – è öåïî÷êà «êëþ÷åé» â èãðå ïîä íàçâàíèåì «îõîòà çà ñîêðîâèùàìè»; êðàñèâàÿ, óìíàÿ è íåâåðîÿòíî èçîáðåòàòåëüíàÿ æåíà åæåãîäíî óñòðàèâàëà åå äëÿ ñâîåãî îáîæàåìîãî ìóæà. È ïîõîæå, ÷òî ýòè «êëþ÷è» – ðàçìåùåííûå åþ òóò è òàì ñòðàííûå çàïèñêè è íå ìåíåå ñòðàííûå áåçäåëóøêè – äàþò åäèíñòâåííûé øàíñ ïðîëèòü ñâåò íà ñóäüáó èñ÷åçíóâøåé. Âîò òîëüêî íå ïðèäåòñÿ ëè «îõîòíèêó» â ïðîöåññå ïîèñêà ðàñêðûòü ìèðó è ïàðó-òðîéêó ñîáñòâåííûõ ìàëîñèìïàòè÷íûõ òàéí?')
GO
INSERT [dbo].[Products] ([Id], [Title], [Author], [Image], [Price], [Genre], [Rating], [Description]) VALUES (10, N'Öåíà âîïðîñà. Òîì 1', N'Àëåêñàíäðà Ìàðèíèíà', N'https://cv6.litres.ru/pub/c/elektronnaya-kniga/cover_330/22638660-aleksandra-marinina-cena-voprosa-tom-1.jpg', CAST(664.00 AS Decimal(18, 2)), N'Äåòåêòèâ', 4, N'Ïðîãðàììà ïðîòèâ Cèñòåìû. Ñèñòåìû âñåñèëüíîé è íàñêâîçü êîððóìïèðîâàííîé, íà âñå èìåþùåé öåíó è ïðè ýòîì íè÷åãî íåñïîñîáíîé öåíèòü ïî-íàñòîÿùåìó. Âîçìîæíî ëè òàêîå? Ãåíåðàë ÌÂÄ Øàðêîâ òâåðäî âåðèë, ÷òî óïðàâëÿåìàÿ èì Ïðîãðàììà – ïîñëåäíèé øàíñ íàâåñòè ïîðÿäîê â ïðàâîîõðàíèòåëüíûõ îðãàíàõ. Òàê áûëî äî òåõ ïîð, ïîêà íå èñ÷åç îäèí èç åå ó÷àñòíèêîâ, îäåðæèìûé ðàäèêàëüíûìè èäåÿìè. À çàòåì íà÷àëèñü ýòè ñòðàííûå «ïàðíûå» óáèéñòâà… È ñòàëî ïîíÿòíî, ÷òî åñëè ñåãîäíÿ íå îñòàíîâèòü óáèéöó-ôàíàòèêà, òî çàâòðà Ïðîãðàììå ïðèäåò êîíåö. Íî êàêóþ öåíó ãîòîâ çàïëàòèòü ãåíåðàë Øàðêîâ çà äåëî âñåé ñâîåé æèçíè? È ÷åãî ýòî áóäåò ñòîèòü ïîëêîâíèêó Áîëüøàêîâó è êàïèòàíó Äçþáå, óæå ïîäêëþ÷èâøèìñÿ ê ðàññëåäîâàíèþ?')
GO
INSERT [dbo].[Products] ([Id], [Title], [Author], [Image], [Price], [Genre], [Rating], [Description]) VALUES (11, N'Àòëàíò ðàñïðàâèë ïëå÷è', N'Àéí Ðýíä', N'https://cv7.litres.ru/pub/c/elektronnaya-kniga/cover_330/4236675-ayn-rend-atlant-raspravil-plechi.jpg', CAST(399.00 AS Decimal(18, 2)), N'Ñîâðåìåííàÿ ïðîçà', 2, N'Ê âëàñòè â ÑØÀ ïðèõîäÿò ñîöèàëèñòû è ïðàâèòåëüñòâî áåðåò êóðñ íà «ðàâíûå âîçìîæíîñòè», ñ÷èòàÿ ñïðàâåäëèâûì çà ñ÷åò òàëàíòëèâûõ è ñîñòîÿòåëüíûõ ñäåëàòü áîãàòûìè íèê÷åìíûõ è áåñòàëàííûõ. Ãîíåíèÿ íà áèçíåñ ïðèâîäÿò ê ðàçðóøåíèþ ýêîíîìèêè, ê òîìó æå îäèí çà äðóãèì ïðè çàãàäî÷íûõ îáñòîÿòåëüñòâàõ íà÷èíàþò èñ÷åçàòü òàëàíòëèâûå ëþäè è ëó÷øèå ïðåäïðèíèìàòåëè. Ãëàâíûå ãåðîè ðîìàíà ñòàëüíîé êîðîëü Õýíê Ðèàðäåí è âèöå-ïðåçèäåíò æåëåçíîäîðîæíîé êîìïàíèè Äàãíè Òàããåðò òùåòíî ïûòàþòñÿ ïðîòèâîñòîÿòü òðàãè÷åñêèì ñîáûòèÿì. Âìåñòî âñåîáùåãî ïðîöâåòàíèÿ îáùåñòâî ïîãðóæàåòñÿ â àïàòèþ è õàîñ.')
GO
INSERT [dbo].[Products] ([Id], [Title], [Author], [Image], [Price], [Genre], [Rating], [Description]) VALUES (12, N'Âòîðàÿ æèçíü Óâå', N'Ôðåäðèê Áàêìàí', N'https://cv8.litres.ru/pub/c/elektronnaya-kniga/cover_330/20690188-fredrik-bakman-vtoraya-zhizn-uve.jpg', CAST(335.00 AS Decimal(18, 2)), N'Ñîâðåìåííàÿ ïðîçà', 4, N'Íà ïåðâûé âçãëÿä Óâå – ñàìûé óãðþìûé ÷åëîâåê íà ñâåòå. Îí, êàê è ìíîãèå èç íàñ, ïîëàãàåò, ÷òî åãî îêðóæàþò ïðåèìóùåñòâåííî èäèîòû – ñîñåäè, êîòîðûå íåïðàâèëüíî ïàðêóþò ñâîè ìàøèíû; ïðîäàâöû â ìàãàçèíå, ãîâîðÿùèå íà ïòè÷üåì ÿçûêå; áþðîêðàòû, ïîðòÿùèå æèçíü íîðìàëüíûì ëþäÿì… Íî ó óãðþìîãî âîð÷ëèâîãî ïåäàíòà – áîëüøîå äîáðîå ñåðäöå. È êîãäà ìîëîäàÿ ñåìüÿ íîâûõ ñîñåäåé ñëó÷àéíî ïîâðåæäàåò åãî ïî÷òîâûé ÿùèê, ýòî ñòàíîâèòñÿ íà÷àëîì íåâåðîÿòíî òðîãàòåëüíîé èñòîðèè îá óòðà÷åííîé ëþáâè, íåîæèäàííîé äðóæáå, áåçäîìíûõ êîòàõ è äðåâíåì èñêóññòâå ñäàâàòü íàçàä íà àâòîìîáèëå ñ ïðèöåïîì. Èñòîðèè î òîì, êàê ñèëüíî æèçíü îäíîãî ÷åëîâåêà ìîæåò ïîâëèÿòü íà æèçíè ìíîãèõ äðóãèõ.')
GO
INSERT [dbo].[Products] ([Id], [Title], [Author], [Image], [Price], [Genre], [Rating], [Description]) VALUES (13, N'Âåäüìàê', N'Àíäæåé Ñàïêîâñêèé', N'https://cv6.litres.ru/pub/c/elektronnaya-kniga/cover_330/6375365-andzhey-sapkovskiy-vedmak.jpg', CAST(424.00 AS Decimal(18, 2)), N'Ôýíòåçè', 4, N'Ïåðåä ÷èòàòåëåì áóêâàëüíî îæèâàåò íåîáû÷íûé, ïðåêðàñíûé è æåñòîêèé ìèð ëèòåðàòóðíîé ëåãåíäà, â êîòîðîì îáèòàþò ýëüôû è ãíîìû, îáîðîòíè, âàìïèðû è «íèçóøêè»-õîááèòû, äðàêîíû è ìîíñòðû, – íî ïðåæäå âñåãî ëþäè. Î÷åíü áëèçêèå íàì, ïîíÿòíûå è ÷åëîâå÷íûå ëþäè – òàêèå êàê ìàñòåð ìå÷à âåäüìàê Ãåðàëüò, åãî äðóã, áåñïóòíûé ìåíåñòðåëü Ëþòèê, åãî âîçëþáëåííàÿ, ïðåêðàñíàÿ ÷àðîäåéêà Éåííèôýð, è ïðèåìíàÿ äî÷ü – áåçðàññóäíî îòâàæíàÿ þíàÿ Öèðè…')
GO
INSERT [dbo].[Products] ([Id], [Title], [Author], [Image], [Price], [Genre], [Rating], [Description]) VALUES (14, N'Äåâóøêà âî ëüäó', N'Ðîáåðò Áðûíäçà', N'https://cv3.litres.ru/pub/c/elektronnaya-kniga/cover_330/27351732-robert-bryndza-12646976-devushka-vo-ldu.jpg', CAST(209.00 AS Decimal(18, 2)), N'Äåòåêòèâ', 4, N'Â îçåðå îäíîãî èç ïàðêîâ Ëîíäîíà, ïîä ñëîåì ëüäà, íàéäåíî òåëî æåíùèíû. Ó æåðòâû, ìîëîäîé ñâåòñêîé ëüâèöû, áûëà, êàçàëîñü, èäåàëüíàÿ æèçíü. Çà ðàññëåäîâàíèå áåðåòñÿ äåòåêòèâ Ýðèêà Ôîñòåð. Îíà îáíàðóæèâàåò, ÷òî óáèéñòâî ñâÿçàíî ñ ïîõîæèìè ïðåñòóïëåíèÿìè, ãäå æåðòâàìè îêàçûâàëèñü ìîëîäûå äåâóøêè, êîòîðûå áûëè çàäóøåíû è îñòàâëåíû â âîäå.Ïîêà Ýðèêà ïûòàåòñÿ ðàçîáðàòüñÿ â ýòîì ñòðàííîì äåëå, ê íåé âñå áëèæå è áëèæå ïîäáèðàåòñÿ áåçæàëîñòíûé óáèéöà. Äëÿ íå¸ ñòàëî íàñòîÿùèì èñïûòàíèåì íåäàâíÿÿ ãèáåëü ìóæà. Òåïåðü ïðèä¸òñÿ ñðàæàòüñÿ íå òîëüêî ñî ñâîèìè äåìîíàìè, íî è ñ ïðåñòóïíèêîì, áîëåå îïàñíûì, ÷åì âñå, ñ êåì îíà ñòàëêèâàëàñü ðàíüøå. Ñóìååò ëè îíà îñòàíîâèòü åãî, ïðåæäå ÷åì îí íàíåñåò íîâûé óäàð?')
GO
INSERT [dbo].[Products] ([Id], [Title], [Author], [Image], [Price], [Genre], [Rating], [Description]) VALUES (15, N'7 íàâûêîâ âûñîêîýôôåêòèâíûõ ëþäåé', N'Ñòèâåí Êîâè', N'https://cv8.litres.ru/pub/c/elektronnaya-kniga/cover_330/4239285--.jpg', CAST(415.00 AS Decimal(18, 2)), N'Ëè÷íàÿ ýôôåêòèâíîñòü', 5, N'Âî-ïåðâûõ, ýòà êíèãà èçëàãàåò ñèñòåìíûé ïîäõîä ê îïðåäåëåíèþ æèçíåííûõ öåëåé, ïðèîðèòåòîâ ÷åëîâåêà. Ýòè öåëè ó âñåõ ðàçíûå, íî êíèãà ïîìîãàåò ïîíÿòü ñåáÿ è ÷åòêî ñôîðìóëèðîâàòü æèçíåííûå öåëè. Âî-âòîðûõ, êíèãà ïîêàçûâàåò, êàê äîñòèãàòü ýòèõ öåëåé. È â-òðåòüèõ, êíèãà ïîêàçûâàåò, êàê êàæäûé ÷åëîâåê ìîæåò ñòàòü ëó÷øå. Ïðè÷åì ðå÷ü èäåò íå îá èçìåíåíèè èìèäæà, à î íàñòîÿùèõ èçìåíåíèÿõ, ñàìîñîâåðøåíñòâîâàíèè. Êíèãà íå äàåò ïðîñòûõ ðåøåíèé è íå îáåùàåò ìãíîâåííûõ ÷óäåñ. Ëþáûå ïîçèòèâíûå èçìåíåíèÿ òðåáóþò âðåìåíè, ðàáîòû è óïîðñòâà. Íî äëÿ ëþäåé, ñòðåìÿùèõñÿ ìàêñèìàëüíî ðåàëèçîâàòü ïîòåíöèàë, çàëîæåííûé â íèõ ïðèðîäîé, ýòà êíèãà – äîðîæíàÿ êàðòà.')
GO
INSERT [dbo].[Products] ([Id], [Title], [Author], [Image], [Price], [Genre], [Rating], [Description]) VALUES (16, N'iPhuck 10', N'Âèêòîð Ïåëåâèí', N'https://cv0.litres.ru/pub/c/elektronnaya-kniga/cover_330/25564903-viktor-pelevin-iphuck-10.jpg', CAST(349.00 AS Decimal(18, 2)), N'Ñîâðåìåííàÿ ïðîçà', 4, N'Ïîðôèðèé Ïåòðîâè÷ – ëèòåðàòóðíî-ïîëèöåéñêèé àëãîðèòì. Îí ðàññëåäóåò ïðåñòóïëåíèÿ è îäíîâðåìåííî ïèøåò îá ýòîì äåòåêòèâíûå ðîìàíû, çàðàáàòûâàÿ ñðåäñòâà äëÿ Ïîëèöåéñêîãî Óïðàâëåíèÿ.Ìàðóõà ×î – èñêóññòâîâåä ñ áîëüøèìè äåíüãàìè è áàáà ñ ÿéöàìè ïî îôèöèàëüíîìó ãåíäåðó. Åå ñïåöèàëüíîñòü – òàê íàçûâàåìûé «ãèïñ», èñêóññòâî ïåðâîé ÷åòâåðòè XXI âåêà. Åé íóæåí ïîìîùíèê äëÿ àíàëèçà ðûíêà. Èì ñòàíîâèòñÿ âçÿòûé â àðåíäó Ïîðôèðèé.«iPhuck 10» – ñàìûé äîðîãîé ëþáîâíûé ãàäæåò íà ðûíêå è îäíîâðåìåííî ñàìûé çíàìåíèòûé èç 244 äåòåêòèâîâ Ïîðôèðèÿ Ïåòðîâè÷à. Ýòî íàñòîÿùèé øåäåâð àëãîðèòìè÷åñêîé ïîëèöåéñêîé ïðîçû êîíöà âåêà – ýíöèêëîïåäè÷åñêèé ðîìàí î áóäóùåì ëþáâè, èñêóññòâà è âñåãî îñòàëüíîãî.')
GO
INSERT [dbo].[Products] ([Id], [Title], [Author], [Image], [Price], [Genre], [Rating], [Description]) VALUES (17, N'Î÷àðîâàòåëüíûé êèøå÷íèê', N'Äæóëèÿ Ýíäåðñ', N'https://cv7.litres.ru/pub/c/elektronnaya-kniga/cover_extra/72060786-dzhuliya-enders-ocharovatelnyy-kishechnik-kak-samyy-moguschestvennyy-organ.gif', CAST(415.00 AS Decimal(18, 2)), N'Ìåäèöèíà è çäîðîâüå', 5, N'Ìíîãèå ñòåñíÿþòñÿ ãîâîðèòü î êèøå÷íèêå âñëóõ. Ìîæåò áûòü, èìåííî ïîýòîìó ìû òàê ìàëî çíàåì î ñàìîì ìîãóùåñòâåííîì îðãàíå, êîòîðûé óïðàâëÿåò íàøèì îðãàíèçìîì? Êîãî-òî, âîçìîæíî, øîêèðóåò ñòîëü îòêðîâåííîå îáðàùåíèå èññëåäîâàòåëÿ ê «çàïðåòíûì» òåìàì; êîìó-òî, ìîæåò áûòü, ïîêàæóòñÿ ñëèøêîì ýêñòðåìàëüíûìè îïûòû íà ìûøàõ è íà ïàöèåíòàõ-äîáðîâîëüöàõ, îïèñàííûå â êíèãå. Êòî-òî óñîìíèòñÿ âî âñåìîãóùåñòâå êðîøå÷íûõ îðãàíèçìîâ, êîíòðîëèðóþùèõ íàøó æèçíü. À êîìó-òî ïðåäïîëîæåíèå, ÷òî ó êèøå÷íèêà åñòü ñâîè ñîáñòâåííûå «ìîçã» è «íåðâíàÿ ñèñòåìà», âîîáùå ïîêàæåòñÿ àáñóðäíûì è àíòèíàó÷íûì.')
GO
INSERT [dbo].[Products] ([Id], [Title], [Author], [Image], [Price], [Genre], [Rating], [Description]) VALUES (18, N'Çóëåéõà îòêðûâàåò ãëàçà', N'Ãóçåëü ßõèíà', N'https://cv8.litres.ru/pub/c/elektronnaya-kniga/cover_330/9527389-guzel-yahina-zuleyha-otkryvaet-glaza-9527389.jpg', CAST(349.00 AS Decimal(18, 2)), N'Ñîâðåìåííàÿ ïðîçà', 5, N'Ðîìàí «Çóëåéõà îòêðûâàåò ãëàçà» íà÷èíàåòñÿ çèìîé 1930 ãîäà â ãëóõîé òàòàðñêîé äåðåâíå. Êðåñòüÿíêó Çóëåéõó âìåñòå ñ ñîòíÿìè äðóãèõ ïåðåñåëåíöåâ îòïðàâëÿþò â âàãîíå-òåïëóøêå ïî èçâå÷íîìó êàòîðæíîìó ìàðøðóòó â Ñèáèðü.Äðåìó÷èå êðåñòüÿíå è ëåíèíãðàäñêèå èíòåëëèãåíòû, äåêëàññèðîâàííûé ýëåìåíò è óãîëîâíèêè, ìóñóëüìàíå è õðèñòèàíå, ÿçû÷íèêè è àòåèñòû, ðóññêèå, òàòàðû, íåìöû, ÷óâàøè – âñå âñòðåòÿòñÿ íà áåðåãàõ Àíãàðû, åæåäíåâíî îòñòàèâàÿ ó òàéãè è áåçæàëîñòíîãî ãîñóäàðñòâà ñâîå ïðàâî íà æèçíü.')
GO
INSERT [dbo].[Products] ([Id], [Title], [Author], [Image], [Price], [Genre], [Rating], [Description]) VALUES (19, N'Äåâóøêà â òóìàíå', N'Äîíàòî Êàððèçè', N'https://cv2.litres.ru/pub/c/elektronnaya-kniga/cover_330/27066425-donato-karrizi-devushka-v-tumane.jpg', CAST(249.00 AS Decimal(18, 2)), N'Äåòåêòèâ', 4, N'Çàòåðÿííûé â Àëüïàõ ñîííûé ãîðîäîê, ðîæäåñòâåíñêèé âå÷åð, òóìàí. Îò äîìà, ãäå ñèÿþò îãíè åëêè è ëåæàò ïîäàðêè, äî ïðàçäíè÷íî óêðàøåííîé ìåñòíîé öåðêâè âñåãî òðèñòà ìåòðîâ, íî â öåðêâè þíàÿ Àííà Ëó òàê è íå ïîÿâèëàñü… Âåçäåñóùèå æóðíàëèñòû, ôîòîðåïîðòåðû è òåëåâèçèîíùèêè îñàæäàþò ãîðîäîê. Êàæäûé èç íèõ æàæäåò ïåðâûì ñîîáùèòü ñåíñàöèîííûå íîâîñòè î õîäå ðàññëåäîâàíèÿ.')
GO
INSERT [dbo].[Products] ([Id], [Title], [Author], [Image], [Price], [Genre], [Rating], [Description]) VALUES (20, N'1984', N'Äæîðäæ Îðóýëë', N'https://cv5.litres.ru/pub/c/elektronnaya-kniga/cover_330/50397852--.jpg', CAST(415.00 AS Decimal(18, 2)), N'Ôàíòàñòèêà', 5, N'Ñâîåîáðàçíûé àíòèïîä âòîðîé âåëèêîé àíòèóòîïèè XX âåêà – «Î äèâíûé íîâûé ìèð» Îëäîñà Õàêñëè. ×òî, â ñóùíîñòè, ñòðàøíåå: äîâåäåííîå äî àáñóðäà «îáùåñòâî ïîòðåáëåíèÿ» – èëè äîâåäåííîå äî àáñîëþòà «îáùåñòâî èäåè»? Ïî Îðóýëëó, íåò è íå ìîæåò áûòü íè÷åãî óæàñíåå òîòàëüíîé íåñâîáîäû…')
GO
INSERT [dbo].[Products] ([Id], [Title], [Author], [Image], [Price], [Genre], [Rating], [Description]) VALUES (21, N'Áåçóïðå÷íàÿ ðåïóòàöèÿ. Òîì 1', N'Àëåêñàíäðà Ìàðèíèíà', N'https://cv6.litres.ru/pub/c/elektronnaya-kniga/cover_330/57306965-aleksandra-marinina-bezuprechnaya-reputaciya-tom-1.jpg', CAST(379.00 AS Decimal(18, 2)), N'Äåòåêòèâ', 5, N'Òàêîãî ñòðàííîãî äåëà â ïðàêòèêå Àíàñòàñèè Êàìåíñêîé íå áûëî äàâíî. Íåèçâåñòíîìó ïèñàòåëþ Àíäðåþ Êèñëîâó êðóïíî ïîâåçëî. Ïî åãî åäèíñòâåííîìó ðîìàíó, èçäàííîìó çà ñâîé ñ÷åò, õîòÿò ñíÿòü ñåðèàë è ïðåäëàãàþò ñîëèäíûé ãîíîðàð. Ðàçóìååòñÿ, òîò ñ ðàäîñòüþ ñîãëàøàåòñÿ. À ïîòîì âíåçàïíî îáúÿâëÿåò, ÷òî íå ïîäïèøåò äîãîâîð íè íà êàêèõ óñëîâèÿõ. Íà êîíó áîëüøèå äåíüãè, è ê âûÿñíåíèþ ïðè÷èí ñòîëü çàãàäî÷íîãî îòêàçà ïðèâëåêàþò ñîòðóäíèêà ÷àñòíîãî äåòåêòèâíîãî àãåíòñòâà – Íàñòþ Êàìåíñêóþ. Íî âñêîðå òà ñòàíîâèòñÿ ãëàâíûì ïîäîçðåâàåìûì â äåëå îá óáèéñòâå. Êîíå÷íî, íó à êòî æå åùå! Âåäü ýòî îíà, Íàñòÿ, ãðÿçíî äîìîãàëàñü ïîòåðïåâøåãî, óãðîæàëà åìó… Îí ñàì ðàññêàçûâàë îá ýòîì ïåðåä ñìåðòüþ, äà è äðóãèå ñâèäåòåëè èìåþòñÿ…')
GO
INSERT [dbo].[Products] ([Id], [Title], [Author], [Image], [Price], [Genre], [Rating], [Description]) VALUES (22, N'iPhuck 10', N'Âèêòîð Ïåëåâèí', N'https://cv0.litres.ru/pub/c/elektronnaya-kniga/cover_330/25564903-viktor-pelevin-iphuck-10.jpg', CAST(349.00 AS Decimal(18, 2)), N'Ñîâðåìåííàÿ ïðîçà', 4, N'Ïîðôèðèé Ïåòðîâè÷ – ëèòåðàòóðíî-ïîëèöåéñêèé àëãîðèòì. Îí ðàññëåäóåò ïðåñòóïëåíèÿ è îäíîâðåìåííî ïèøåò îá ýòîì äåòåêòèâíûå ðîìàíû, çàðàáàòûâàÿ ñðåäñòâà äëÿ Ïîëèöåéñêîãî Óïðàâëåíèÿ.Ìàðóõà ×î – èñêóññòâîâåä ñ áîëüøèìè äåíüãàìè è áàáà ñ ÿéöàìè ïî îôèöèàëüíîìó ãåíäåðó. Åå ñïåöèàëüíîñòü – òàê íàçûâàåìûé «ãèïñ», èñêóññòâî ïåðâîé ÷åòâåðòè XXI âåêà. Åé íóæåí ïîìîùíèê äëÿ àíàëèçà ðûíêà. Èì ñòàíîâèòñÿ âçÿòûé â àðåíäó Ïîðôèðèé.«iPhuck 10» – ñàìûé äîðîãîé ëþáîâíûé ãàäæåò íà ðûíêå è îäíîâðåìåííî ñàìûé çíàìåíèòûé èç 244 äåòåêòèâîâ Ïîðôèðèÿ Ïåòðîâè÷à. Ýòî íàñòîÿùèé øåäåâð àëãîðèòìè÷åñêîé ïîëèöåéñêîé ïðîçû êîíöà âåêà – ýíöèêëîïåäè÷åñêèé ðîìàí î áóäóùåì ëþáâè, èñêóññòâà è âñåãî îñòàëüíîãî.')
GO
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
/****** Object:  Index [IX_CartItems_OrderId]    Script Date: 22.05.2023 20:00:28 ******/
CREATE NONCLUSTERED INDEX [IX_CartItems_OrderId] ON [dbo].[CartItems]
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_CartItems_ProductId]    Script Date: 22.05.2023 20:00:28 ******/
CREATE NONCLUSTERED INDEX [IX_CartItems_ProductId] ON [dbo].[CartItems]
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CartItems]  WITH CHECK ADD  CONSTRAINT [FK_CartItems_Orders_OrderId] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CartItems] CHECK CONSTRAINT [FK_CartItems_Orders_OrderId]
GO
ALTER TABLE [dbo].[CartItems]  WITH CHECK ADD  CONSTRAINT [FK_CartItems_Products_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CartItems] CHECK CONSTRAINT [FK_CartItems_Products_ProductId]
GO
USE [master]
GO
ALTER DATABASE [BookStoreDb] SET  READ_WRITE 
GO
