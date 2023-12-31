USE [master]
GO
/****** Object:  Database [holm]    Script Date: 18.10.2023 16:31:35 ******/
CREATE DATABASE [holm]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'holm', FILENAME = N'D:\SQQQL\MSSQL15.SQLEXPRESS\MSSQL\DATA\holm.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'holm_log', FILENAME = N'D:\SQQQL\MSSQL15.SQLEXPRESS\MSSQL\DATA\holm_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [holm] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [holm].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [holm] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [holm] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [holm] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [holm] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [holm] SET ARITHABORT OFF 
GO
ALTER DATABASE [holm] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [holm] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [holm] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [holm] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [holm] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [holm] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [holm] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [holm] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [holm] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [holm] SET  DISABLE_BROKER 
GO
ALTER DATABASE [holm] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [holm] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [holm] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [holm] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [holm] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [holm] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [holm] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [holm] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [holm] SET  MULTI_USER 
GO
ALTER DATABASE [holm] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [holm] SET DB_CHAINING OFF 
GO
ALTER DATABASE [holm] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [holm] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [holm] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [holm] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [holm] SET QUERY_STORE = OFF
GO
USE [holm]
GO
/****** Object:  Table [dbo].[clients]    Script Date: 18.10.2023 16:31:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[clients](
	[id] [int] NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[serios] [int] NOT NULL,
	[number] [int] NOT NULL,
	[birthday] [date] NOT NULL,
	[adress] [nvarchar](100) NOT NULL,
	[mail] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_clients] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[id_vsego]    Script Date: 18.10.2023 16:31:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[id_vsego](
	[id] [int] NOT NULL,
	[id_orders] [int] NOT NULL,
	[id_usluga] [int] NOT NULL,
 CONSTRAINT [PK_id_vsego] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orders]    Script Date: 18.10.2023 16:31:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orders](
	[id] [int] NOT NULL,
	[date] [date] NOT NULL,
	[time] [time](7) NOT NULL,
	[id_client] [int] NOT NULL,
	[id_status] [int] NOT NULL,
	[date_close] [date] NULL,
	[id_usetime] [int] NOT NULL,
 CONSTRAINT [PK_orders] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[role]    Script Date: 18.10.2023 16:31:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[role](
	[id] [int] NOT NULL,
	[role] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_role] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sotrudniki]    Script Date: 18.10.2023 16:31:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sotrudniki](
	[id] [int] NOT NULL,
	[id_role] [int] NOT NULL,
	[fio] [nvarchar](50) NOT NULL,
	[login] [nvarchar](50) NOT NULL,
	[password] [nvarchar](15) NOT NULL,
	[date_vhod] [date] NOT NULL,
	[id_vhod] [int] NOT NULL,
 CONSTRAINT [PK_sotrudniki] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[status]    Script Date: 18.10.2023 16:31:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[status](
	[id] [int] NOT NULL,
	[status] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_status] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tip_vhoda]    Script Date: 18.10.2023 16:31:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tip_vhoda](
	[id] [int] NOT NULL,
	[vhod] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tip_vhoda] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[use_time]    Script Date: 18.10.2023 16:31:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[use_time](
	[id] [int] NOT NULL,
	[use_time] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_use_time] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[usluga]    Script Date: 18.10.2023 16:31:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usluga](
	[id] [int] NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[code] [nvarchar](25) NOT NULL,
	[prise_hour] [int] NOT NULL,
 CONSTRAINT [PK_usluga] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[clients] ([id], [name], [serios], [number], [birthday], [adress], [mail], [password]) VALUES (45462526, N'Фролов Андрей Иванович', 1180, 176596, CAST(N'2001-07-14' AS Date), N'344288, г. Казань, ул. Чехова, 1, кв. 34', N'gohufreilagrau-3818@yopmail.com', N'cl12345')
INSERT [dbo].[clients] ([id], [name], [serios], [number], [birthday], [adress], [mail], [password]) VALUES (45462527, N'Николаев Даниил Всеволодович', 2280, 223523, CAST(N'2001-02-10' AS Date), N'614164, г. Казань, ул. Степная, 30, кв. 75', N'xawugosune-1385@yopmail.com', N'cl12346')
INSERT [dbo].[clients] ([id], [name], [serios], [number], [birthday], [adress], [mail], [password]) VALUES (45462528, N'Снегирев Макар Иванович', 4560, 354155, CAST(N'1998-05-21' AS Date), N'394242, г. Казань, ул. Коммунистическая, 43, кв. 57', N'satrahuddusei-4458@yopmail.com', N'cl12347')
INSERT [dbo].[clients] ([id], [name], [serios], [number], [birthday], [adress], [mail], [password]) VALUES (45462529, N'Иванов Иван Ильич', 9120, 554296, CAST(N'1998-10-01' AS Date), N'660540, г. Казань, ул. Солнечная, 25, кв. 78', N'boippaxeufrepra-7093@yopmail.com', N'cl12348')
INSERT [dbo].[clients] ([id], [name], [serios], [number], [birthday], [adress], [mail], [password]) VALUES (45462530, N'Филиппова Анна Глебовна', 2367, 558134, CAST(N'1976-05-31' AS Date), N'125837, г. Казань, ул. Шоссейная, 40, кв. 92', N'zapramaxesu-7741@yopmail.com', N'cl12349')
INSERT [dbo].[clients] ([id], [name], [serios], [number], [birthday], [adress], [mail], [password]) VALUES (45462531, N'Иванов Михаил Владимирович', 7101, 669343, CAST(N'1985-11-04' AS Date), N'125703, г. Казань, ул. Партизанская, 49, кв. 84', N'rouzecroummegre-3899@yopmail.com', N'cl12350')
INSERT [dbo].[clients] ([id], [name], [serios], [number], [birthday], [adress], [mail], [password]) VALUES (45462532, N'Власов Дмитрий Александрович', 3455, 719630, CAST(N'1998-08-17' AS Date), N'625283, г. Казань, ул. Победы, 46, кв. 7', N'ziyeuddocrabri-4748@yopmail.com', N'cl12351')
INSERT [dbo].[clients] ([id], [name], [serios], [number], [birthday], [adress], [mail], [password]) VALUES (45462533, N'Серова Екатерина Львовна', 2377, 871623, CAST(N'1984-10-24' AS Date), N'614611, г. Казань, ул. Молодежная, 50, кв. 78', N'ketameissoinnei-1951@yopmail.com', N'cl12352')
INSERT [dbo].[clients] ([id], [name], [serios], [number], [birthday], [adress], [mail], [password]) VALUES (45462534, N'Борисова Ирина Ивановна', 8755, 921148, CAST(N'1976-10-14' AS Date), N'454311, г. Казань, ул. Новая, 19, кв. 78', N'yipraubaponou-5849@yopmail.com', N'cl12353')
INSERT [dbo].[clients] ([id], [name], [serios], [number], [birthday], [adress], [mail], [password]) VALUES (45462535, N'Зайцев Никита Артёмович', 4355, 104594, CAST(N'1999-10-14' AS Date), N'660007, г. Казань, ул. Октябрьская, 19, кв. 42', N'crapedocouca-3572@yopmail.com', N'cl12354')
INSERT [dbo].[clients] ([id], [name], [serios], [number], [birthday], [adress], [mail], [password]) VALUES (45462536, N'Медведев Святослав Евгеньевич', 2791, 114390, CAST(N'1985-07-13' AS Date), N'603036, г. Казань, ул. Садовая, 4, кв. 13', N'ceigoixakaunni-9227@yopmail.com', N'cl12355')
INSERT [dbo].[clients] ([id], [name], [serios], [number], [birthday], [adress], [mail], [password]) VALUES (45462537, N'Коротков Кирилл Алексеевич', 5582, 126286, CAST(N'1976-05-26' AS Date), N'450983, г. Казань, ул. Комсомольская, 26, кв. 60', N'yeimmeiwauzomo-7054@yopmail.com', N'cl12356')
INSERT [dbo].[clients] ([id], [name], [serios], [number], [birthday], [adress], [mail], [password]) VALUES (45462538, N'Калашникова Арина Максимовна', 2978, 133653, CAST(N'1999-08-13' AS Date), N'394782, г. Казань, ул. Чехова, 3, кв. 14', N'poleifenevi-1560@yopmail.com', N'cl12357')
INSERT [dbo].[clients] ([id], [name], [serios], [number], [birthday], [adress], [mail], [password]) VALUES (45462539, N'Минина Таисия Кирилловна', 7512, 141956, CAST(N'1985-10-13' AS Date), N'603002, г. Казань, ул. Дзержинского, 28, кв. 56', N'kauprezofautei-6607@yopmail.com', N'cl12358')
INSERT [dbo].[clients] ([id], [name], [serios], [number], [birthday], [adress], [mail], [password]) VALUES (45462540, N'Наумов Серафим Романович', 5046, 158433, CAST(N'1999-04-15' AS Date), N'450558, г. Казань, ул. Набережная, 30, кв. 71', N'quaffaullelourei-1667@yopmail.com', N'cl12359')
INSERT [dbo].[clients] ([id], [name], [serios], [number], [birthday], [adress], [mail], [password]) VALUES (45462541, N'Воробьева Василиса Евгеньевна', 2460, 169505, CAST(N'1999-01-13' AS Date), N'394060, г. Казань, ул. Фрунзе, 43, кв. 79', N'jsteele@rojas-robinson.net', N'cl12360')
INSERT [dbo].[clients] ([id], [name], [serios], [number], [birthday], [adress], [mail], [password]) VALUES (45462542, N'Калинин Александр Андреевич', 3412, 174593, CAST(N'1999-01-07' AS Date), N'410661, г. Казань, ул. Школьная, 50, кв. 53', N'vhopkins@lewis-mullen.com', N'cl12361')
INSERT [dbo].[clients] ([id], [name], [serios], [number], [birthday], [adress], [mail], [password]) VALUES (45462543, N'Кузнецова Милана Владиславовна', 4950, 183034, CAST(N'1999-01-24' AS Date), N'625590, г. Казань, ул. Коммунистическая, 20, кв. 34', N'nlewis@yahoo.com', N'cl12362')
INSERT [dbo].[clients] ([id], [name], [serios], [number], [birthday], [adress], [mail], [password]) VALUES (45462544, N'Фирсов Егор Романович', 5829, 219464, CAST(N'1993-09-02' AS Date), N'625683, г. Казань, ул. 8 Марта, 20, кв. 21', N'garciadavid@mckinney-mcbride.com', N'cl12363')
INSERT [dbo].[clients] ([id], [name], [serios], [number], [birthday], [adress], [mail], [password]) VALUES (45462545, N'Зимина Агния Александровна', 6443, 208059, CAST(N'1998-09-03' AS Date), N'400562, г. Казань, ул. Зеленая, 32, кв. 67', N'cbradley@castro.com', N'cl12364')
INSERT [dbo].[clients] ([id], [name], [serios], [number], [birthday], [adress], [mail], [password]) VALUES (45462546, N'Титов Андрей Глебович', 7079, 213265, CAST(N'1985-10-23' AS Date), N'614510, г. Казань, ул. Маяковского, 47, кв. 72', N'cuevascatherine@carlson.biz', N'cl12365')
INSERT [dbo].[clients] ([id], [name], [serios], [number], [birthday], [adress], [mail], [password]) VALUES (45462547, N'Орлов Николай Егорович', 8207, 522702, CAST(N'1985-07-27' AS Date), N'410542, г. Казань, ул. Светлая, 46, кв. 82', N'thomasmoore@wilson-singh.net', N'cl12366')
INSERT [dbo].[clients] ([id], [name], [serios], [number], [birthday], [adress], [mail], [password]) VALUES (45462548, N'Кузнецова Аиша Михайловна', 9307, 232158, CAST(N'1998-10-04' AS Date), N'620839, г. Казань, ул. Цветочная, 8, кв. 100', N'jessica84@hotmail.com', N'cl12367')
INSERT [dbo].[clients] ([id], [name], [serios], [number], [birthday], [adress], [mail], [password]) VALUES (45462549, N'Куликов Никита Георгиевич', 1357, 242839, CAST(N'1999-04-23' AS Date), N'443890, г. Казань, ул. Коммунистическая, 1, кв. 10', N'jessicapark@hotmail.com', N'cl12368')
INSERT [dbo].[clients] ([id], [name], [serios], [number], [birthday], [adress], [mail], [password]) VALUES (45462550, N'Карпова София Егоровна', 1167, 256636, CAST(N'1993-10-01' AS Date), N'603379, г. Казань, ул. Спортивная, 46, кв. 95', N'ginaritter@schneider-buchanan.com', N'cl12369')
INSERT [dbo].[clients] ([id], [name], [serios], [number], [birthday], [adress], [mail], [password]) VALUES (45462551, N'Смирнова Дарья Макаровна', 1768, 266986, CAST(N'1976-03-22' AS Date), N'603721, г. Казань, ул. Гоголя, 41, кв. 57', N'stephen99@yahoo.com', N'cl12370')
INSERT [dbo].[clients] ([id], [name], [serios], [number], [birthday], [adress], [mail], [password]) VALUES (45462552, N'Абрамова Александра Мироновна', 1710, 427875, CAST(N'1999-03-26' AS Date), N'410172, г. Казань, ул. Северная, 13, кв. 86', N'lopezlisa@hotmail.com', N'cl12371')
INSERT [dbo].[clients] ([id], [name], [serios], [number], [birthday], [adress], [mail], [password]) VALUES (45462553, N'Наумов Руслан Михайлович', 1806, 289145, CAST(N'1999-10-11' AS Date), N'420151, г. Казань, ул. Вишневая, 32, кв. 81', N'lori17@hotmail.com', N'cl12372')
INSERT [dbo].[clients] ([id], [name], [serios], [number], [birthday], [adress], [mail], [password]) VALUES (45462554, N'Бочаров Никита Матвеевич', 1587, 291249, CAST(N'1997-06-29' AS Date), N'125061, г. Казань, ул. Подгорная, 8, кв. 74', N'campbellkevin@gardner.com', N'cl12373')
INSERT [dbo].[clients] ([id], [name], [serios], [number], [birthday], [adress], [mail], [password]) VALUES (45462555, N'Соловьев Давид Ильич', 1647, 306372, CAST(N'1984-03-06' AS Date), N'630370, г. Казань, ул. Шоссейная, 24, кв. 81', N'morganhoward@clark.com', N'cl12374')
INSERT [dbo].[clients] ([id], [name], [serios], [number], [birthday], [adress], [mail], [password]) VALUES (45462556, N'Васильева Валерия Дмитриевна', 1742, 316556, CAST(N'1999-09-30' AS Date), N'614753, г. Казань, ул. Полевая, 35, кв. 39', N'carsontamara@gmail.com', N'cl12375')
INSERT [dbo].[clients] ([id], [name], [serios], [number], [birthday], [adress], [mail], [password]) VALUES (45462557, N'Макарова Василиса Андреевна', 1474, 326347, CAST(N'1999-04-08' AS Date), N'426030, г. Казань, ул. Маяковского, 44, кв. 93', N'kevinpatel@gmail.com', N'cl12376')
INSERT [dbo].[clients] ([id], [name], [serios], [number], [birthday], [adress], [mail], [password]) VALUES (45462558, N'Алексеев Матвей Викторович', 1452, 339539, CAST(N'1998-08-02' AS Date), N'450375, г. Казань, ул. Клубная, 44, кв. 80', N'sethbishop@yahoo.com', N'cl12377')
INSERT [dbo].[clients] ([id], [name], [serios], [number], [birthday], [adress], [mail], [password]) VALUES (45462559, N'Никитина Полина Александровна', 2077, 443480, CAST(N'1976-09-19' AS Date), N'625560, г. Казань, ул. Некрасова, 12, кв. 66', N'drollins@schultz-soto.net', N'cl12378')
INSERT [dbo].[clients] ([id], [name], [serios], [number], [birthday], [adress], [mail], [password]) VALUES (45462560, N'Окулова Олеся Алексеевна', 2147, 357518, CAST(N'1999-04-03' AS Date), N'630201, г. Казань, ул. Комсомольская, 17, кв. 25', N'pblack@copeland-winters.org', N'cl12379')
INSERT [dbo].[clients] ([id], [name], [serios], [number], [birthday], [adress], [mail], [password]) VALUES (45462561, N'Захарова Полина Яновна', 2687, 363884, CAST(N'1976-04-21' AS Date), N'190949, г. Казань, ул. Мичурина, 26, кв. 93', N'johnathon.oberbrunner@yahoo.com', N'cl12380')
INSERT [dbo].[clients] ([id], [name], [serios], [number], [birthday], [adress], [mail], [password]) VALUES (45462562, N'Зайцев Владимир Давидович', 2376, 443711, CAST(N'1998-01-26' AS Date), N'350501, г. Казань, ул. Парковая, 2, кв. 7', N'bradly29@gmail.com', N'cl12381')
INSERT [dbo].[clients] ([id], [name], [serios], [number], [birthday], [adress], [mail], [password]) VALUES (45462563, N'Иванов Виталий Даниилович', 2568, 386237, CAST(N'1976-08-11' AS Date), N'450048, г. Казань, ул. Коммунистическая, 21, кв. 3', N'stark.cristina@hilpert.biz', N'cl12382')
INSERT [dbo].[clients] ([id], [name], [serios], [number], [birthday], [adress], [mail], [password]) VALUES (45462564, N'Захаров Матвей Романович', 2556, 439376, CAST(N'1993-07-12' AS Date), N'644921, г. Казань, ул. Школьная, 46, кв. 37', N'bruen.eleanore@yahoo.com', N'cl12383')
INSERT [dbo].[clients] ([id], [name], [serios], [number], [birthday], [adress], [mail], [password]) VALUES (45462565, N'Иванов Степан Степанович', 2737, 407501, CAST(N'1998-09-19' AS Date), N'614228, г. Казань, ул. Дорожная, 36, кв. 54', N'percival.halvorson@yahoo.com', N'cl12384')
INSERT [dbo].[clients] ([id], [name], [serios], [number], [birthday], [adress], [mail], [password]) VALUES (45462566, N'Ткачева Милана Тимуровна', 2581, 441645, CAST(N'1998-05-24' AS Date), N'350940, г. Казань, ул. Первомайская, 23, кв. 2', N'javonte71@kuhlman.biz', N'cl12385')
INSERT [dbo].[clients] ([id], [name], [serios], [number], [birthday], [adress], [mail], [password]) VALUES (45462567, N'Семенов Даниил Иванович', 2675, 427933, CAST(N'1976-01-04' AS Date), N'344990, г. Казань, ул. Красноармейская, 19, кв. 92', N'vconnelly@kautzer.com', N'cl12386')
INSERT [dbo].[clients] ([id], [name], [serios], [number], [birthday], [adress], [mail], [password]) VALUES (45462568, N'Виноградов Вячеслав Дмитриевич', 2967, 434531, CAST(N'1976-07-12' AS Date), N'410248, г. Казань, ул. Чкалова, 11, кв. 75', N'anabelle07@schultz.info', N'cl12387')
INSERT [dbo].[clients] ([id], [name], [serios], [number], [birthday], [adress], [mail], [password]) VALUES (45462569, N'Соболева Николь Фёдоровна', 3070, 449655, CAST(N'1976-05-02' AS Date), N'400839, г. Казань, ул. 8 Марта, 46, кв. 44', N'nitzsche.katlynn@yahoo.com', N'cl12388')
INSERT [dbo].[clients] ([id], [name], [serios], [number], [birthday], [adress], [mail], [password]) VALUES (45462570, N'Тихонова Анна Львовна', 3108, 451174, CAST(N'1985-03-23' AS Date), N'450539, г. Казань, ул. Заводская, 3, кв. 81', N'corine16@von.com', N'cl12389')
INSERT [dbo].[clients] ([id], [name], [serios], [number], [birthday], [adress], [mail], [password]) VALUES (45462571, N'Кузнецова Ульяна Савельевна', 3250, 464705, CAST(N'1999-06-03' AS Date), N'614591, г. Казань, ул. Цветочная, 20, кв. 40', N'otha.wisozk@lubowitz.org', N'cl12390')
INSERT [dbo].[clients] ([id], [name], [serios], [number], [birthday], [adress], [mail], [password]) VALUES (45462572, N'Смирнова Анна Германовна', 3392, 471644, CAST(N'1997-07-18' AS Date), N'400260, г. Казань, ул. Больничная, 30, кв. 53', N'may.kirlin@hotmail.com', N'cl12391')
INSERT [dbo].[clients] ([id], [name], [serios], [number], [birthday], [adress], [mail], [password]) VALUES (45462573, N'Черепанова Анна Давидовна', 3497, 487819, CAST(N'1985-11-06' AS Date), N'660924, г. Казань, ул. Молодежная, 32, кв. 59', N'bryana.kautzer@yahoo.com', N'cl12392')
INSERT [dbo].[clients] ([id], [name], [serios], [number], [birthday], [adress], [mail], [password]) VALUES (45462574, N'Григорьев Максим Кириллович', 3560, 491260, CAST(N'1999-05-26' AS Date), N'644133, г. Казань, ул. Гагарина, 28, кв. 69', N'deborah.christiansen@quigley.biz', N'cl12393')
INSERT [dbo].[clients] ([id], [name], [serios], [number], [birthday], [adress], [mail], [password]) VALUES (45462575, N'Голубев Даниэль Александрович', 3620, 506034, CAST(N'1999-06-14' AS Date), N'450698, г. Казань, ул. Вокзальная, 14, кв. 37', N'connelly.makayla@yahoo.com', N'cl12394')
INSERT [dbo].[clients] ([id], [name], [serios], [number], [birthday], [adress], [mail], [password]) VALUES (45462576, N'Миронов Юрий Денисович', 3774, 511438, CAST(N'1985-01-26' AS Date), N'620653, г. Казань, ул. Западная, 15, кв. 25', N'tatum.collins@fay.org', N'cl12395')
INSERT [dbo].[clients] ([id], [name], [serios], [number], [birthday], [adress], [mail], [password]) VALUES (45462577, N'Терехов Михаил Андреевич', 3862, 521377, CAST(N'1976-07-06' AS Date), N'644321, г. Казань, ул. Клубная, 32, кв. 10', N'itzel73@anderson.com', N'cl12396')
INSERT [dbo].[clients] ([id], [name], [serios], [number], [birthday], [adress], [mail], [password]) VALUES (45462578, N'Орлова Алиса Михайловна', 3084, 535966, CAST(N'1997-02-24' AS Date), N'603653, г. Казань, ул. Молодежная, 2, кв. 45', N'arjun39@hotmail.com', N'cl12397')
INSERT [dbo].[clients] ([id], [name], [serios], [number], [birthday], [adress], [mail], [password]) VALUES (45462579, N'Кулаков Константин Даниилович', 4021, 541528, CAST(N'1993-06-20' AS Date), N'410181, г. Казань, ул. Механизаторов, 16, кв. 74', N'ohara.rebeka@yahoo.com', N'cl12398')
INSERT [dbo].[clients] ([id], [name], [serios], [number], [birthday], [adress], [mail], [password]) VALUES (45462580, N'Кудрявцев Максим Романович', 4109, 554053, CAST(N'1998-05-10' AS Date), N'394207, г. Казань, ул. Свердлова, 31, кв. 28', N'danika58@rath.com', N'cl12399')
INSERT [dbo].[clients] ([id], [name], [serios], [number], [birthday], [adress], [mail], [password]) VALUES (45462581, N'Соболева Кира Фёдоровна', 4537, 564868, CAST(N'1998-03-14' AS Date), N'420633, г. Казань, ул. Матросова, 18, кв. 41', N'janae.bogan@gmail.com', N'cl12400')
INSERT [dbo].[clients] ([id], [name], [serios], [number], [birthday], [adress], [mail], [password]) VALUES (45462582, N'Коновалов Арсений Максимович', 4914, 572471, CAST(N'1985-02-18' AS Date), N'445720, г. Казань, ул. Матросова, 50, кв. 67', N'vern91@yahoo.com', N'cl12401')
INSERT [dbo].[clients] ([id], [name], [serios], [number], [birthday], [adress], [mail], [password]) VALUES (45462583, N'Гусев Михаил Дмитриевич', 4445, 581302, CAST(N'1999-11-23' AS Date), N'400646, г. Казань, ул. Октябрьская, 47, кв. 65', N'mariana.leannon@larkin.net', N'cl12402')
INSERT [dbo].[clients] ([id], [name], [serios], [number], [birthday], [adress], [mail], [password]) VALUES (45462584, N'Суханова Варвара Матвеевна', 4743, 598180, CAST(N'1993-09-13' AS Date), N'644410, г. Казань, ул. Красная, 17, кв. 69', N'vmoore@gmail.com', N'cl12403')
INSERT [dbo].[clients] ([id], [name], [serios], [number], [birthday], [adress], [mail], [password]) VALUES (45462585, N'Орлова Ясмина Васильевна', 4741, 601821, CAST(N'1984-06-24' AS Date), N'400750, г. Казань, ул. Школьная, 36, кв. 71', N'damon.mcclure@mills.com', N'cl12404')
INSERT [dbo].[clients] ([id], [name], [serios], [number], [birthday], [adress], [mail], [password]) VALUES (45462586, N'Васильева Ксения Константиновна', 4783, 612567, CAST(N'1999-08-01' AS Date), N'660590, г. Казань, ул. Дачная, 37, кв. 70', N'grady.reilly@block.com', N'cl12405')
INSERT [dbo].[clients] ([id], [name], [serios], [number], [birthday], [adress], [mail], [password]) VALUES (45462587, N'Борисова Тамара Данииловна', 4658, 621200, CAST(N'1993-05-29' AS Date), N'426083, г. Казань, ул. Механизаторов, 41, кв. 26', N'boyd.koss@yahoo.com', N'cl12406')
INSERT [dbo].[clients] ([id], [name], [serios], [number], [birthday], [adress], [mail], [password]) VALUES (45462588, N'Дмитриев Мирон Ильич', 4908, 634613, CAST(N'1985-04-13' AS Date), N'410569, г. Казань, ул. Парковая, 36, кв. 17', N'obartell@franecki.info', N'cl12407')
INSERT [dbo].[clients] ([id], [name], [serios], [number], [birthday], [adress], [mail], [password]) VALUES (45462589, N'Лебедева Анна Александровна', 5092, 642468, CAST(N'1985-03-30' AS Date), N'443375, г. Казань, ул. Дзержинского, 50, кв. 95', N'reina75@ferry.net', N'cl12408')
INSERT [dbo].[clients] ([id], [name], [serios], [number], [birthday], [adress], [mail], [password]) VALUES (45462590, N'Пономарев Артём Маркович', 5155, 465274, CAST(N'1984-06-02' AS Date), N'614316, г. Казань, ул. Первомайская, 48, кв. 31', N'karson28@hotmail.com', N'cl12409')
INSERT [dbo].[clients] ([id], [name], [serios], [number], [birthday], [adress], [mail], [password]) VALUES (45462591, N'Борисова Елена Михайловна', 5086, 666893, CAST(N'1976-05-23' AS Date), N'445685, г. Казань, ул. Зеленая, 7, кв. 47', N'damaris61@okon.com', N'cl12410')
INSERT [dbo].[clients] ([id], [name], [serios], [number], [birthday], [adress], [mail], [password]) VALUES (45462592, N'Моисеев Камиль Максимович', 5333, 675375, CAST(N'1999-06-17' AS Date), N'614505, г. Казань, ул. Нагорная, 37, кв. 31', N'carroll.jerod@hotmail.com', N'cl12411')
INSERT [dbo].[clients] ([id], [name], [serios], [number], [birthday], [adress], [mail], [password]) VALUES (45462593, N'Герасимова Дарья Константиновна', 5493, 684572, CAST(N'1984-10-13' AS Date), N'426629, г. Казань, ул. Весенняя, 32, кв. 46', N'ron.treutel@quitzon.com', N'cl12412')
INSERT [dbo].[clients] ([id], [name], [serios], [number], [birthday], [adress], [mail], [password]) VALUES (45462594, N'Михайлова Мария Марковна', 5150, 696226, CAST(N'1976-12-02' AS Date), N'603743, г. Казань, ул. Матросова, 19, кв. 20', N'olen79@yahoo.com', N'cl12413')
INSERT [dbo].[clients] ([id], [name], [serios], [number], [birthday], [adress], [mail], [password]) VALUES (45462595, N'Коршунов Кирилл Максимович', 1308, 703305, CAST(N'1985-05-22' AS Date), N'450750, г. Казань, ул. Клубная, 23, кв. 90', N'pacocha.robbie@yahoo.com', N'cl12414')
GO
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (1, 1, 34)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (2, 1, 31)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (3, 1, 353)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (4, 1, 336)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (5, 2, 98)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (6, 2, 45)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (7, 2, 89)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (8, 2, 99)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (9, 2, 123)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (10, 3, 92)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (11, 3, 45)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (12, 3, 57)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (13, 3, 88)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (14, 4, 92)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (15, 4, 45)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (16, 4, 57)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (17, 4, 88)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (18, 4, 44)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (19, 5, 98)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (20, 5, 45)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (21, 5, 89)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (22, 5, 353)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (23, 5, 336)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (24, 5, 34)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (25, 6, 34)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (26, 6, 31)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (27, 6, 353)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (28, 6, 337)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (29, 7, 98)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (30, 7, 45)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (31, 7, 89)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (32, 7, 99)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (33, 7, 124)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (34, 8, 92)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (35, 8, 45)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (36, 8, 57)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (37, 8, 89)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (38, 9, 92)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (39, 9, 45)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (40, 9, 57)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (41, 9, 88)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (42, 9, 45)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (43, 10, 98)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (44, 10, 45)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (45, 10, 89)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (46, 10, 353)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (47, 10, 336)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (48, 10, 35)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (49, 11, 34)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (50, 11, 31)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (51, 11, 353)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (52, 11, 338)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (53, 12, 98)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (54, 12, 45)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (55, 12, 89)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (56, 12, 99)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (57, 12, 125)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (58, 13, 92)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (59, 13, 45)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (60, 13, 57)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (61, 13, 90)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (62, 14, 92)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (63, 14, 45)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (64, 14, 57)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (65, 14, 88)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (66, 14, 46)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (67, 15, 98)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (68, 15, 45)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (69, 15, 89)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (70, 15, 353)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (71, 15, 336)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (72, 15, 36)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (73, 16, 34)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (74, 16, 31)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (75, 16, 353)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (76, 16, 339)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (77, 17, 98)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (78, 17, 45)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (79, 17, 89)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (80, 17, 99)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (81, 17, 126)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (82, 18, 92)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (83, 18, 45)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (84, 18, 57)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (85, 18, 91)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (86, 19, 92)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (87, 19, 45)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (88, 19, 57)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (89, 19, 88)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (90, 19, 47)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (91, 20, 98)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (92, 20, 45)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (93, 20, 89)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (94, 20, 353)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (95, 20, 336)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (96, 20, 37)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (97, 21, 34)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (98, 21, 31)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (99, 21, 353)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (100, 21, 340)
GO
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (101, 22, 98)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (102, 22, 45)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (103, 22, 89)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (104, 22, 99)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (105, 22, 127)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (106, 23, 92)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (107, 23, 45)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (108, 23, 57)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (109, 23, 92)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (110, 24, 92)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (111, 24, 45)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (112, 24, 57)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (113, 24, 88)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (114, 24, 48)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (115, 25, 98)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (116, 25, 45)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (117, 25, 89)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (118, 25, 353)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (119, 25, 336)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (120, 25, 38)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (121, 26, 34)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (122, 26, 31)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (123, 26, 353)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (124, 26, 341)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (125, 27, 98)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (126, 27, 45)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (127, 27, 89)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (128, 27, 99)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (129, 27, 128)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (130, 28, 92)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (131, 28, 45)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (132, 28, 57)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (133, 28, 93)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (134, 29, 92)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (135, 29, 45)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (136, 29, 57)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (137, 29, 88)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (138, 29, 49)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (139, 30, 98)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (140, 30, 45)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (141, 30, 89)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (142, 30, 353)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (143, 30, 336)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (144, 30, 39)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (145, 31, 34)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (146, 31, 31)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (147, 31, 353)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (148, 31, 342)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (149, 32, 98)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (150, 32, 45)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (151, 32, 89)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (152, 32, 99)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (153, 32, 129)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (154, 33, 92)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (155, 33, 45)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (156, 33, 57)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (157, 33, 94)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (158, 34, 92)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (159, 34, 45)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (160, 34, 57)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (161, 34, 88)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (162, 34, 50)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (163, 35, 98)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (164, 35, 45)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (165, 35, 89)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (166, 35, 353)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (167, 35, 336)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (168, 35, 40)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (169, 36, 34)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (170, 36, 31)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (171, 36, 353)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (172, 36, 343)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (173, 37, 98)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (174, 37, 45)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (175, 37, 89)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (176, 37, 99)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (177, 37, 130)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (178, 38, 92)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (179, 38, 45)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (180, 38, 57)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (181, 38, 95)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (182, 39, 92)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (183, 39, 45)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (184, 39, 57)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (185, 39, 88)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (186, 39, 51)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (187, 40, 98)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (188, 40, 45)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (189, 40, 89)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (190, 40, 353)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (191, 40, 336)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (192, 40, 41)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (193, 41, 34)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (194, 41, 31)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (195, 41, 353)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (196, 41, 344)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (197, 42, 98)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (198, 42, 45)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (199, 42, 89)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (200, 42, 99)
GO
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (201, 42, 131)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (202, 43, 92)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (203, 43, 45)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (204, 43, 57)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (205, 43, 96)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (206, 44, 92)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (207, 44, 45)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (208, 44, 57)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (209, 44, 88)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (210, 44, 52)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (211, 45, 98)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (212, 45, 45)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (213, 45, 89)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (214, 45, 353)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (215, 45, 336)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (216, 45, 42)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (217, 46, 34)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (218, 46, 31)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (219, 46, 353)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (220, 46, 345)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (221, 47, 98)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (222, 47, 45)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (223, 47, 89)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (224, 47, 99)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (225, 47, 132)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (226, 48, 92)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (227, 48, 45)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (228, 48, 57)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (229, 48, 97)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (230, 49, 92)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (231, 49, 45)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (232, 49, 57)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (233, 49, 88)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (234, 49, 53)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (235, 50, 98)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (236, 50, 45)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (237, 50, 89)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (238, 50, 353)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (239, 50, 336)
INSERT [dbo].[id_vsego] ([id], [id_orders], [id_usluga]) VALUES (240, 50, 43)
GO
INSERT [dbo].[orders] ([id], [date], [time], [id_client], [id_status], [date_close], [id_usetime]) VALUES (1, CAST(N'2022-03-12' AS Date), CAST(N'09:10:00' AS Time), 45462526, 1, NULL, 1)
INSERT [dbo].[orders] ([id], [date], [time], [id_client], [id_status], [date_close], [id_usetime]) VALUES (2, CAST(N'2022-03-13' AS Date), CAST(N'10:10:00' AS Time), 45462527, 2, NULL, 2)
INSERT [dbo].[orders] ([id], [date], [time], [id_client], [id_status], [date_close], [id_usetime]) VALUES (3, CAST(N'2022-03-14' AS Date), CAST(N'11:10:00' AS Time), 45462528, 2, NULL, 3)
INSERT [dbo].[orders] ([id], [date], [time], [id_client], [id_status], [date_close], [id_usetime]) VALUES (4, CAST(N'2022-03-15' AS Date), CAST(N'12:10:00' AS Time), 45462529, 1, NULL, 4)
INSERT [dbo].[orders] ([id], [date], [time], [id_client], [id_status], [date_close], [id_usetime]) VALUES (5, CAST(N'2022-03-16' AS Date), CAST(N'13:10:00' AS Time), 45462530, 3, CAST(N'2022-04-16' AS Date), 5)
INSERT [dbo].[orders] ([id], [date], [time], [id_client], [id_status], [date_close], [id_usetime]) VALUES (6, CAST(N'2022-03-17' AS Date), CAST(N'14:10:00' AS Time), 45462531, 1, NULL, 6)
INSERT [dbo].[orders] ([id], [date], [time], [id_client], [id_status], [date_close], [id_usetime]) VALUES (7, CAST(N'2022-03-18' AS Date), CAST(N'15:10:00' AS Time), 45462532, 1, NULL, 7)
INSERT [dbo].[orders] ([id], [date], [time], [id_client], [id_status], [date_close], [id_usetime]) VALUES (8, CAST(N'2022-03-19' AS Date), CAST(N'16:10:00' AS Time), 45462533, 2, NULL, 8)
INSERT [dbo].[orders] ([id], [date], [time], [id_client], [id_status], [date_close], [id_usetime]) VALUES (9, CAST(N'2022-03-20' AS Date), CAST(N'10:00:00' AS Time), 45462534, 2, NULL, 9)
INSERT [dbo].[orders] ([id], [date], [time], [id_client], [id_status], [date_close], [id_usetime]) VALUES (10, CAST(N'2022-03-21' AS Date), CAST(N'11:00:00' AS Time), 45462535, 1, NULL, 1)
INSERT [dbo].[orders] ([id], [date], [time], [id_client], [id_status], [date_close], [id_usetime]) VALUES (11, CAST(N'2022-03-22' AS Date), CAST(N'12:00:00' AS Time), 45462536, 3, CAST(N'2022-03-22' AS Date), 2)
INSERT [dbo].[orders] ([id], [date], [time], [id_client], [id_status], [date_close], [id_usetime]) VALUES (12, CAST(N'2022-03-23' AS Date), CAST(N'13:00:00' AS Time), 45462537, 2, NULL, 3)
INSERT [dbo].[orders] ([id], [date], [time], [id_client], [id_status], [date_close], [id_usetime]) VALUES (13, CAST(N'2022-03-24' AS Date), CAST(N'14:00:00' AS Time), 45462538, 2, NULL, 4)
INSERT [dbo].[orders] ([id], [date], [time], [id_client], [id_status], [date_close], [id_usetime]) VALUES (14, CAST(N'2022-03-25' AS Date), CAST(N'15:00:00' AS Time), 45462539, 2, NULL, 5)
INSERT [dbo].[orders] ([id], [date], [time], [id_client], [id_status], [date_close], [id_usetime]) VALUES (15, CAST(N'2022-03-26' AS Date), CAST(N'16:00:00' AS Time), 45462540, 3, CAST(N'2022-04-26' AS Date), 6)
INSERT [dbo].[orders] ([id], [date], [time], [id_client], [id_status], [date_close], [id_usetime]) VALUES (16, CAST(N'2022-03-27' AS Date), CAST(N'17:00:00' AS Time), 45462541, 1, NULL, 7)
INSERT [dbo].[orders] ([id], [date], [time], [id_client], [id_status], [date_close], [id_usetime]) VALUES (17, CAST(N'2022-03-28' AS Date), CAST(N'18:00:00' AS Time), 45462542, 2, NULL, 8)
INSERT [dbo].[orders] ([id], [date], [time], [id_client], [id_status], [date_close], [id_usetime]) VALUES (18, CAST(N'2022-03-29' AS Date), CAST(N'19:00:00' AS Time), 45462543, 2, NULL, 9)
INSERT [dbo].[orders] ([id], [date], [time], [id_client], [id_status], [date_close], [id_usetime]) VALUES (19, CAST(N'2022-03-30' AS Date), CAST(N'12:30:00' AS Time), 45462544, 1, NULL, 1)
INSERT [dbo].[orders] ([id], [date], [time], [id_client], [id_status], [date_close], [id_usetime]) VALUES (20, CAST(N'2022-03-31' AS Date), CAST(N'13:30:00' AS Time), 45462545, 1, NULL, 2)
INSERT [dbo].[orders] ([id], [date], [time], [id_client], [id_status], [date_close], [id_usetime]) VALUES (21, CAST(N'2022-04-01' AS Date), CAST(N'14:30:00' AS Time), 45462546, 3, CAST(N'2022-04-01' AS Date), 3)
INSERT [dbo].[orders] ([id], [date], [time], [id_client], [id_status], [date_close], [id_usetime]) VALUES (22, CAST(N'2022-04-02' AS Date), CAST(N'15:30:00' AS Time), 45462547, 1, NULL, 4)
INSERT [dbo].[orders] ([id], [date], [time], [id_client], [id_status], [date_close], [id_usetime]) VALUES (23, CAST(N'2022-04-03' AS Date), CAST(N'16:30:00' AS Time), 45462548, 1, NULL, 5)
INSERT [dbo].[orders] ([id], [date], [time], [id_client], [id_status], [date_close], [id_usetime]) VALUES (24, CAST(N'2022-04-04' AS Date), CAST(N'17:30:00' AS Time), 45462549, 2, NULL, 6)
INSERT [dbo].[orders] ([id], [date], [time], [id_client], [id_status], [date_close], [id_usetime]) VALUES (25, CAST(N'2022-04-05' AS Date), CAST(N'18:30:00' AS Time), 45462550, 2, NULL, 7)
INSERT [dbo].[orders] ([id], [date], [time], [id_client], [id_status], [date_close], [id_usetime]) VALUES (26, CAST(N'2022-04-06' AS Date), CAST(N'15:30:00' AS Time), 45462551, 2, NULL, 8)
INSERT [dbo].[orders] ([id], [date], [time], [id_client], [id_status], [date_close], [id_usetime]) VALUES (27, CAST(N'2022-04-07' AS Date), CAST(N'16:30:00' AS Time), 45462552, 2, NULL, 9)
INSERT [dbo].[orders] ([id], [date], [time], [id_client], [id_status], [date_close], [id_usetime]) VALUES (28, CAST(N'2022-04-08' AS Date), CAST(N'17:30:00' AS Time), 45462553, 3, CAST(N'2022-04-08' AS Date), 1)
INSERT [dbo].[orders] ([id], [date], [time], [id_client], [id_status], [date_close], [id_usetime]) VALUES (29, CAST(N'2022-04-09' AS Date), CAST(N'18:30:00' AS Time), 45462554, 1, NULL, 2)
INSERT [dbo].[orders] ([id], [date], [time], [id_client], [id_status], [date_close], [id_usetime]) VALUES (30, CAST(N'2022-04-10' AS Date), CAST(N'19:30:00' AS Time), 45462555, 2, NULL, 3)
INSERT [dbo].[orders] ([id], [date], [time], [id_client], [id_status], [date_close], [id_usetime]) VALUES (31, CAST(N'2022-04-11' AS Date), CAST(N'10:30:00' AS Time), 45462556, 2, NULL, 4)
INSERT [dbo].[orders] ([id], [date], [time], [id_client], [id_status], [date_close], [id_usetime]) VALUES (32, CAST(N'2022-04-12' AS Date), CAST(N'11:30:00' AS Time), 45462557, 1, NULL, 5)
INSERT [dbo].[orders] ([id], [date], [time], [id_client], [id_status], [date_close], [id_usetime]) VALUES (33, CAST(N'2022-04-13' AS Date), CAST(N'12:30:00' AS Time), 45462558, 1, NULL, 6)
INSERT [dbo].[orders] ([id], [date], [time], [id_client], [id_status], [date_close], [id_usetime]) VALUES (34, CAST(N'2022-04-14' AS Date), CAST(N'13:30:00' AS Time), 45462559, 1, NULL, 7)
INSERT [dbo].[orders] ([id], [date], [time], [id_client], [id_status], [date_close], [id_usetime]) VALUES (35, CAST(N'2022-04-15' AS Date), CAST(N'14:30:00' AS Time), 45462560, 2, NULL, 8)
INSERT [dbo].[orders] ([id], [date], [time], [id_client], [id_status], [date_close], [id_usetime]) VALUES (36, CAST(N'2022-04-02' AS Date), CAST(N'15:30:00' AS Time), 45462561, 2, NULL, 9)
INSERT [dbo].[orders] ([id], [date], [time], [id_client], [id_status], [date_close], [id_usetime]) VALUES (37, CAST(N'2022-04-03' AS Date), CAST(N'16:30:00' AS Time), 45462562, 2, NULL, 1)
INSERT [dbo].[orders] ([id], [date], [time], [id_client], [id_status], [date_close], [id_usetime]) VALUES (38, CAST(N'2022-04-04' AS Date), CAST(N'17:30:00' AS Time), 45462563, 3, CAST(N'2022-04-04' AS Date), 2)
INSERT [dbo].[orders] ([id], [date], [time], [id_client], [id_status], [date_close], [id_usetime]) VALUES (39, CAST(N'2022-04-05' AS Date), CAST(N'10:15:00' AS Time), 45462564, 2, NULL, 3)
INSERT [dbo].[orders] ([id], [date], [time], [id_client], [id_status], [date_close], [id_usetime]) VALUES (40, CAST(N'2022-04-06' AS Date), CAST(N'11:15:00' AS Time), 45462565, 1, NULL, 4)
INSERT [dbo].[orders] ([id], [date], [time], [id_client], [id_status], [date_close], [id_usetime]) VALUES (41, CAST(N'2022-04-07' AS Date), CAST(N'12:15:00' AS Time), 45462566, 3, CAST(N'2022-04-07' AS Date), 5)
INSERT [dbo].[orders] ([id], [date], [time], [id_client], [id_status], [date_close], [id_usetime]) VALUES (42, CAST(N'2022-04-08' AS Date), CAST(N'13:15:00' AS Time), 45462567, 2, NULL, 6)
INSERT [dbo].[orders] ([id], [date], [time], [id_client], [id_status], [date_close], [id_usetime]) VALUES (43, CAST(N'2022-04-09' AS Date), CAST(N'14:15:00' AS Time), 45462568, 2, NULL, 7)
INSERT [dbo].[orders] ([id], [date], [time], [id_client], [id_status], [date_close], [id_usetime]) VALUES (44, CAST(N'2022-04-01' AS Date), CAST(N'15:15:00' AS Time), 45462569, 2, NULL, 8)
INSERT [dbo].[orders] ([id], [date], [time], [id_client], [id_status], [date_close], [id_usetime]) VALUES (45, CAST(N'2022-04-02' AS Date), CAST(N'16:15:00' AS Time), 45462570, 2, NULL, 9)
INSERT [dbo].[orders] ([id], [date], [time], [id_client], [id_status], [date_close], [id_usetime]) VALUES (46, CAST(N'2022-04-03' AS Date), CAST(N'10:45:00' AS Time), 45462571, 2, NULL, 6)
INSERT [dbo].[orders] ([id], [date], [time], [id_client], [id_status], [date_close], [id_usetime]) VALUES (47, CAST(N'2022-04-04' AS Date), CAST(N'11:45:00' AS Time), 45462572, 3, CAST(N'2022-04-04' AS Date), 5)
INSERT [dbo].[orders] ([id], [date], [time], [id_client], [id_status], [date_close], [id_usetime]) VALUES (48, CAST(N'2022-04-05' AS Date), CAST(N'12:45:00' AS Time), 45462573, 1, NULL, 6)
INSERT [dbo].[orders] ([id], [date], [time], [id_client], [id_status], [date_close], [id_usetime]) VALUES (49, CAST(N'2022-04-06' AS Date), CAST(N'13:45:00' AS Time), 45462574, 1, NULL, 7)
INSERT [dbo].[orders] ([id], [date], [time], [id_client], [id_status], [date_close], [id_usetime]) VALUES (50, CAST(N'2022-04-07' AS Date), CAST(N'14:45:00' AS Time), 45462575, 1, NULL, 8)
GO
INSERT [dbo].[role] ([id], [role]) VALUES (1, N'Администратор')
INSERT [dbo].[role] ([id], [role]) VALUES (2, N'Инсайд')
INSERT [dbo].[role] ([id], [role]) VALUES (3, N'Продавец')
GO
INSERT [dbo].[sotrudniki] ([id], [id_role], [fio], [login], [password], [date_vhod], [id_vhod]) VALUES (101, 3, N'Иванов Иван Иванович', N'Ivanov@namecomp.ru', N'2L6KZG', CAST(N'2022-05-15' AS Date), 1)
INSERT [dbo].[sotrudniki] ([id], [id_role], [fio], [login], [password], [date_vhod], [id_vhod]) VALUES (102, 3, N'Петров Петр Петрович', N'petrov@namecomp.ru', N'uzWC67', CAST(N'2022-05-15' AS Date), 1)
INSERT [dbo].[sotrudniki] ([id], [id_role], [fio], [login], [password], [date_vhod], [id_vhod]) VALUES (103, 1, N'Федоров Федор Федорович', N'fedorov@namecomp.ru', N'8ntwUp', CAST(N'2022-05-15' AS Date), 1)
INSERT [dbo].[sotrudniki] ([id], [id_role], [fio], [login], [password], [date_vhod], [id_vhod]) VALUES (104, 2, N'Миронов Вениамин Куприянович', N'mironov@namecomp.ru', N'YOyhfR', CAST(N'2022-05-15' AS Date), 1)
INSERT [dbo].[sotrudniki] ([id], [id_role], [fio], [login], [password], [date_vhod], [id_vhod]) VALUES (105, 2, N'Ширяев Ермолай Вениаминович', N'shiryev@namecomp.ru', N'RSbvHv', CAST(N'2022-05-15' AS Date), 2)
INSERT [dbo].[sotrudniki] ([id], [id_role], [fio], [login], [password], [date_vhod], [id_vhod]) VALUES (106, 2, N'Игнатов Кассиан Васильевич', N'ignatov@namecomp.ru', N'rwVDh9', CAST(N'2022-05-15' AS Date), 1)
INSERT [dbo].[sotrudniki] ([id], [id_role], [fio], [login], [password], [date_vhod], [id_vhod]) VALUES (107, 3, N'Хохлов Владимир Мэлсович', N'hohlov@namecomp.ru', N'LdNyos', CAST(N'2022-05-15' AS Date), 1)
INSERT [dbo].[sotrudniki] ([id], [id_role], [fio], [login], [password], [date_vhod], [id_vhod]) VALUES (108, 3, N'Стрелков Мстислав Георгьевич', N'strelkov@namecomp.ru', N'gynQMT', CAST(N'2022-05-15' AS Date), 2)
INSERT [dbo].[sotrudniki] ([id], [id_role], [fio], [login], [password], [date_vhod], [id_vhod]) VALUES (109, 3, N'Беляева Лилия Наумовна', N'belyeva@@namecomp.ru', N'AtnDjr', CAST(N'2022-05-15' AS Date), 1)
INSERT [dbo].[sotrudniki] ([id], [id_role], [fio], [login], [password], [date_vhod], [id_vhod]) VALUES (110, 3, N'Смирнова Ульяна Гордеевна', N'smirnova@@namecomp.ru', N'JlFRCZ', CAST(N'2022-05-15' AS Date), 1)
GO
INSERT [dbo].[status] ([id], [status]) VALUES (1, N'Новая')
INSERT [dbo].[status] ([id], [status]) VALUES (2, N'В прокате')
INSERT [dbo].[status] ([id], [status]) VALUES (3, N'Закрыта')
GO
INSERT [dbo].[tip_vhoda] ([id], [vhod]) VALUES (1, N'Успешно')
INSERT [dbo].[tip_vhoda] ([id], [vhod]) VALUES (2, N'Не успешно')
GO
INSERT [dbo].[use_time] ([id], [use_time]) VALUES (1, N'120 минут')
INSERT [dbo].[use_time] ([id], [use_time]) VALUES (2, N'600 минут')
INSERT [dbo].[use_time] ([id], [use_time]) VALUES (3, N'2 часа')
INSERT [dbo].[use_time] ([id], [use_time]) VALUES (4, N'10 часов')
INSERT [dbo].[use_time] ([id], [use_time]) VALUES (5, N'320 минут')
INSERT [dbo].[use_time] ([id], [use_time]) VALUES (6, N'480 минут')
INSERT [dbo].[use_time] ([id], [use_time]) VALUES (7, N'4 часа')
INSERT [dbo].[use_time] ([id], [use_time]) VALUES (8, N'6 часов')
INSERT [dbo].[use_time] ([id], [use_time]) VALUES (9, N'12 часов')
GO
INSERT [dbo].[usluga] ([id], [name], [code], [prise_hour]) VALUES (31, N'Прокат сноуборда', N'JUR8R', 1200)
INSERT [dbo].[usluga] ([id], [name], [code], [prise_hour]) VALUES (34, N'Прокат обуви для сноуборда', N'JKFBJ09', 400)
INSERT [dbo].[usluga] ([id], [name], [code], [prise_hour]) VALUES (44, N'Прокат коньков', N'DHBGFY563', 900)
INSERT [dbo].[usluga] ([id], [name], [code], [prise_hour]) VALUES (45, N'Прокат защитных подушек для сноубордистов', N'JFH7382', 300)
INSERT [dbo].[usluga] ([id], [name], [code], [prise_hour]) VALUES (57, N'Подъем на 1 уровень', N'JHVSJF6', 300)
INSERT [dbo].[usluga] ([id], [name], [code], [prise_hour]) VALUES (88, N'Подъем на 2  уровень', N'DJHGBS982', 700)
INSERT [dbo].[usluga] ([id], [name], [code], [prise_hour]) VALUES (89, N'Прокат очков для лыжников', N'OIJNB12', 150)
INSERT [dbo].[usluga] ([id], [name], [code], [prise_hour]) VALUES (92, N'Прокат санок', N'HJBUJE21J', 300)
INSERT [dbo].[usluga] ([id], [name], [code], [prise_hour]) VALUES (98, N'Прокат шлема', N'63748HF', 300)
INSERT [dbo].[usluga] ([id], [name], [code], [prise_hour]) VALUES (99, N'Прокат вартушки', N'BSFBHV63', 100)
INSERT [dbo].[usluga] ([id], [name], [code], [prise_hour]) VALUES (123, N'Подъем на 3 уровень', N'638VVNQ3', 1200)
INSERT [dbo].[usluga] ([id], [name], [code], [prise_hour]) VALUES (336, N'Прокат лыж', N'8HFJHG443', 800)
INSERT [dbo].[usluga] ([id], [name], [code], [prise_hour]) VALUES (353, N'Прокат лыжных палок', N'87FDJKHJ', 100)
GO
ALTER TABLE [dbo].[id_vsego]  WITH CHECK ADD  CONSTRAINT [FK_id_vsego_orders] FOREIGN KEY([id_orders])
REFERENCES [dbo].[orders] ([id])
GO
ALTER TABLE [dbo].[id_vsego] CHECK CONSTRAINT [FK_id_vsego_orders]
GO
ALTER TABLE [dbo].[id_vsego]  WITH NOCHECK ADD  CONSTRAINT [FK_id_vsego_usluga] FOREIGN KEY([id_usluga])
REFERENCES [dbo].[usluga] ([id])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[id_vsego] NOCHECK CONSTRAINT [FK_id_vsego_usluga]
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD  CONSTRAINT [FK_orders_clients] FOREIGN KEY([id_client])
REFERENCES [dbo].[clients] ([id])
GO
ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [FK_orders_clients]
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD  CONSTRAINT [FK_orders_status] FOREIGN KEY([id_status])
REFERENCES [dbo].[status] ([id])
GO
ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [FK_orders_status]
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD  CONSTRAINT [FK_orders_use_time] FOREIGN KEY([id_usetime])
REFERENCES [dbo].[use_time] ([id])
GO
ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [FK_orders_use_time]
GO
ALTER TABLE [dbo].[sotrudniki]  WITH CHECK ADD  CONSTRAINT [FK_sotrudniki_role] FOREIGN KEY([id_role])
REFERENCES [dbo].[role] ([id])
GO
ALTER TABLE [dbo].[sotrudniki] CHECK CONSTRAINT [FK_sotrudniki_role]
GO
ALTER TABLE [dbo].[sotrudniki]  WITH CHECK ADD  CONSTRAINT [FK_sotrudniki_tip_vhoda] FOREIGN KEY([id_vhod])
REFERENCES [dbo].[tip_vhoda] ([id])
GO
ALTER TABLE [dbo].[sotrudniki] CHECK CONSTRAINT [FK_sotrudniki_tip_vhoda]
GO
USE [master]
GO
ALTER DATABASE [holm] SET  READ_WRITE 
GO
