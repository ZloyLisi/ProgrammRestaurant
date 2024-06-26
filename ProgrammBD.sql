USE [master]
GO
/****** Object:  Database [RestaurantBD]    Script Date: 25.04.2024 21:46:50 ******/
CREATE DATABASE [RestaurantBD]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'RestaurantBD', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\RestaurantBD.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'RestaurantBD_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\RestaurantBD_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [RestaurantBD] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [RestaurantBD].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [RestaurantBD] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [RestaurantBD] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [RestaurantBD] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [RestaurantBD] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [RestaurantBD] SET ARITHABORT OFF 
GO
ALTER DATABASE [RestaurantBD] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [RestaurantBD] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [RestaurantBD] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [RestaurantBD] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [RestaurantBD] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [RestaurantBD] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [RestaurantBD] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [RestaurantBD] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [RestaurantBD] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [RestaurantBD] SET  DISABLE_BROKER 
GO
ALTER DATABASE [RestaurantBD] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [RestaurantBD] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [RestaurantBD] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [RestaurantBD] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [RestaurantBD] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [RestaurantBD] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [RestaurantBD] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [RestaurantBD] SET RECOVERY FULL 
GO
ALTER DATABASE [RestaurantBD] SET  MULTI_USER 
GO
ALTER DATABASE [RestaurantBD] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [RestaurantBD] SET DB_CHAINING OFF 
GO
ALTER DATABASE [RestaurantBD] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [RestaurantBD] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [RestaurantBD] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [RestaurantBD] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'RestaurantBD', N'ON'
GO
ALTER DATABASE [RestaurantBD] SET QUERY_STORE = ON
GO
ALTER DATABASE [RestaurantBD] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [RestaurantBD]
GO
/****** Object:  Table [dbo].[CategoryDish]    Script Date: 25.04.2024 21:46:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CategoryDish](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CategoryDishAndDrink]    Script Date: 25.04.2024 21:46:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CategoryDishAndDrink](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_CategoryDishAndDrink] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CategoryDrink]    Script Date: 25.04.2024 21:46:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CategoryDrink](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_CategoryDrink] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DishAndDrink]    Script Date: 25.04.2024 21:46:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DishAndDrink](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Composition] [nvarchar](max) NULL,
	[Foto] [nvarchar](max) NOT NULL,
	[Price] [decimal](18, 0) NOT NULL,
	[IdCategoryDish] [int] NULL,
	[IdCategoryDrink] [int] NULL,
	[IdCategoryDishAndDrink] [int] NULL,
	[IdUser] [int] NULL,
 CONSTRAINT [PK_Dish] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 25.04.2024 21:46:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdDishAndDrink] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 25.04.2024 21:46:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 25.04.2024 21:46:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdRole] [int] NOT NULL,
	[Login] [nvarchar](100) NOT NULL,
	[Password] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[CategoryDish] ON 

INSERT [dbo].[CategoryDish] ([Id], [Name]) VALUES (1, N'Салат')
INSERT [dbo].[CategoryDish] ([Id], [Name]) VALUES (2, N'Десерт')
SET IDENTITY_INSERT [dbo].[CategoryDish] OFF
GO
SET IDENTITY_INSERT [dbo].[CategoryDishAndDrink] ON 

INSERT [dbo].[CategoryDishAndDrink] ([Id], [Name]) VALUES (1, N'Напиток')
INSERT [dbo].[CategoryDishAndDrink] ([Id], [Name]) VALUES (2, N'Блюдо')
SET IDENTITY_INSERT [dbo].[CategoryDishAndDrink] OFF
GO
SET IDENTITY_INSERT [dbo].[CategoryDrink] ON 

INSERT [dbo].[CategoryDrink] ([Id], [Name]) VALUES (1, N'Алкоголь')
INSERT [dbo].[CategoryDrink] ([Id], [Name]) VALUES (2, N'Газировка')
SET IDENTITY_INSERT [dbo].[CategoryDrink] OFF
GO
SET IDENTITY_INSERT [dbo].[DishAndDrink] ON 

INSERT [dbo].[DishAndDrink] ([Id], [Name], [Description], [Composition], [Foto], [Price], [IdCategoryDish], [IdCategoryDrink], [IdCategoryDishAndDrink], [IdUser]) VALUES (4, N'Цезарь', N'Салат Цезарь классический с курицей названный так совсем не в честь римского императора, а по имени шеф-повара Цезаря Кардини, который, по легенде, накормил однажды голливудских актеров салатом из того, что было. Теперь он и на вашем столе!', N'Куриное филе, белый хлеб, перепелиные яйца, листовой салат, помидоры черри, твёрдый сыр, чеснок, лимонный сок, горчица, майонез, соль, перец. ', N'Салат_Цезарь.jpg', CAST(300 AS Decimal(18, 0)), 1, NULL, 2, NULL)
INSERT [dbo].[DishAndDrink] ([Id], [Name], [Description], [Composition], [Foto], [Price], [IdCategoryDish], [IdCategoryDrink], [IdCategoryDishAndDrink], [IdUser]) VALUES (7, N'Мимоза', N'Классический салат Мимоза с рыбными консервами и картошкой - один из самых популярных салатов на протяжении нескольких десятилетий.', N'Рыбные консервы, яйца, картофель, морковь, лук репчатый, майонез', N'Салат_Мимоза.jpg', CAST(400 AS Decimal(18, 0)), 1, NULL, 2, NULL)
INSERT [dbo].[DishAndDrink] ([Id], [Name], [Description], [Composition], [Foto], [Price], [IdCategoryDish], [IdCategoryDrink], [IdCategoryDishAndDrink], [IdUser]) VALUES (10, N'Коул Слоу', N'Главное его отличие от других подобных блюд - это заправка, делающая его очень аппетитным и сочным.', N'Капуста белокочанная, морковь, красный лук, зеленое яблоко, зеленый лук, сметана, майонез, йогурд классический, горчица дижонская, зернистая горчица, яблочный уксус, сахар, перец, соль.', N'Салат_Коул_Слоу.jpg', CAST(400 AS Decimal(18, 0)), 1, NULL, 2, NULL)
INSERT [dbo].[DishAndDrink] ([Id], [Name], [Description], [Composition], [Foto], [Price], [IdCategoryDish], [IdCategoryDrink], [IdCategoryDishAndDrink], [IdUser]) VALUES (12, N'Крабовый', N'Крабовый салат с рисом и кукурузой хорошо знаком и любим многими.', N'Крабовые палочки, кукуруза, яйца, рис, огурец, майонез.', N'Салат_Крабовый.jpg', CAST(300 AS Decimal(18, 0)), 1, NULL, 2, NULL)
INSERT [dbo].[DishAndDrink] ([Id], [Name], [Description], [Composition], [Foto], [Price], [IdCategoryDish], [IdCategoryDrink], [IdCategoryDishAndDrink], [IdUser]) VALUES (13, N'Суши торт', N'Оригинальный и необычный. На вкус его не отличишь от суши и роллов.', N'Японский рис, листья "Нори", творожный сыр, лосось, огурец, авокадо, сок лимона, уксус, сахар, соль.', N'Салат_Суши_торт.jpg', CAST(400 AS Decimal(18, 0)), 1, NULL, 2, NULL)
INSERT [dbo].[DishAndDrink] ([Id], [Name], [Description], [Composition], [Foto], [Price], [IdCategoryDish], [IdCategoryDrink], [IdCategoryDishAndDrink], [IdUser]) VALUES (14, N'Винегрет', N'Вкусный и традиционый салат.', N'Свёкла, морковь, картофель, солённые огурцы, квашенная капуста и горошек.', N'Салат_Винегрет.jpg', CAST(350 AS Decimal(18, 0)), 1, NULL, 2, NULL)
INSERT [dbo].[DishAndDrink] ([Id], [Name], [Description], [Composition], [Foto], [Price], [IdCategoryDish], [IdCategoryDrink], [IdCategoryDishAndDrink], [IdUser]) VALUES (15, N'Оливье', N'Сочетание простых продуктов даёт максимально потрясающий вкус.', N'Картошка, морковь, солённые огурцы, зелённый горошек, варенная колбоса, куринные яйца, укроп, майонез', N'Салат_Оливье.jpg', CAST(300 AS Decimal(18, 0)), 1, NULL, 2, NULL)
INSERT [dbo].[DishAndDrink] ([Id], [Name], [Description], [Composition], [Foto], [Price], [IdCategoryDish], [IdCategoryDrink], [IdCategoryDishAndDrink], [IdUser]) VALUES (16, N'Клубника со сливками', N'Бесподобно выкусный десерт. Ароматная клубка и сладкая клубника всегда поднимет настроение.', N'Клубника, сливки, сахарная пудра.', N'Десерт_Клубника_со_сливками.jpg', CAST(150 AS Decimal(18, 0)), 2, NULL, 2, NULL)
INSERT [dbo].[DishAndDrink] ([Id], [Name], [Description], [Composition], [Foto], [Price], [IdCategoryDish], [IdCategoryDrink], [IdCategoryDishAndDrink], [IdUser]) VALUES (17, N'Клубничый мусс', N'Восхитительно нежное лакомство с игривым летним настроением.', N'Клубника, сливки, сахарная пудра, воа, желатин, мята.', N'Десерт_Клубничный_мусс.jpg', CAST(150 AS Decimal(18, 0)), 2, NULL, 2, NULL)
INSERT [dbo].[DishAndDrink] ([Id], [Name], [Description], [Composition], [Foto], [Price], [IdCategoryDish], [IdCategoryDrink], [IdCategoryDishAndDrink], [IdUser]) VALUES (18, N'Крем десерт', N'Потрясающий, нежный и приятный на вкус, для всей семьи.', N'Желатин, сметана, сахар, ванилин, яичные желтки, молоко, вода.', N'Десерт_Крем_десерт.jpg', CAST(200 AS Decimal(18, 0)), 2, NULL, 2, NULL)
INSERT [dbo].[DishAndDrink] ([Id], [Name], [Description], [Composition], [Foto], [Price], [IdCategoryDish], [IdCategoryDrink], [IdCategoryDishAndDrink], [IdUser]) VALUES (20, N'Пеламуши', N'Пеламуши — известный грузинский десерт, который варится из виноградного сока с добавлением муки.', N'Виноградный сок, кукурузная мука.', N'Десерт_Пеламуши.jpg', CAST(150 AS Decimal(18, 0)), 2, NULL, 2, NULL)
INSERT [dbo].[DishAndDrink] ([Id], [Name], [Description], [Composition], [Foto], [Price], [IdCategoryDish], [IdCategoryDrink], [IdCategoryDishAndDrink], [IdUser]) VALUES (21, N'Семифредо', N'Десерт Семифредо шоколадное мороженое - это представитель классической итальянской кухни.', N'Рикотта, сахарная пудра, сливки, горький шоколад, ванильный сахар.', N'Десерт_Семифредо.jpg', CAST(200 AS Decimal(18, 0)), 2, NULL, 2, NULL)
INSERT [dbo].[DishAndDrink] ([Id], [Name], [Description], [Composition], [Foto], [Price], [IdCategoryDish], [IdCategoryDrink], [IdCategoryDishAndDrink], [IdUser]) VALUES (22, N'Яблоки в карамели', N'Сладкие яблоки в карамели очень вкусный десерт.', N'Яблоки, сахар, вода, пищевой краситель, кондитерская посыпка.', N'Десерт_Яблоки_в_карамели.jpg', CAST(100 AS Decimal(18, 0)), 2, NULL, 2, NULL)
INSERT [dbo].[DishAndDrink] ([Id], [Name], [Description], [Composition], [Foto], [Price], [IdCategoryDish], [IdCategoryDrink], [IdCategoryDishAndDrink], [IdUser]) VALUES (23, N'Красное море', N'Салат Красное море с крабовыми палочками помидорами и перцем - одна из самых ярких холодных закусок.', N'Помидоры, болгарский перец, крабовые палочки, чеснок, твёрдый сыр, майонез.', N'Салат_Красное_море.jpg', CAST(300 AS Decimal(18, 0)), 1, NULL, 2, NULL)
INSERT [dbo].[DishAndDrink] ([Id], [Name], [Description], [Composition], [Foto], [Price], [IdCategoryDish], [IdCategoryDrink], [IdCategoryDishAndDrink], [IdUser]) VALUES (24, N'Корейский', N'Сочный, пряный, пикантный, невероятно аппетитный.', N'Шампиньоны, болгарский перец, лук, морковь, чеснок, петрушка, соевый соус, растительное масло, яблочный уксус, соль, сахар, душистый перец, перец черный молотый, лавровый лист, перец острый стручковый.', N'Салат_Корейский.jpg', CAST(300 AS Decimal(18, 0)), 1, NULL, 2, NULL)
INSERT [dbo].[DishAndDrink] ([Id], [Name], [Description], [Composition], [Foto], [Price], [IdCategoryDish], [IdCategoryDrink], [IdCategoryDishAndDrink], [IdUser]) VALUES (25, N'Желтый одуванчик', N'Солнечный, обалденный и очень вкусный салат.', N'Твёрдый сыр, кукуруза, яйца, майонез.', N'Салат_Жёлтый_одуванчик.jpg', CAST(300 AS Decimal(18, 0)), 1, NULL, 2, NULL)
INSERT [dbo].[DishAndDrink] ([Id], [Name], [Description], [Composition], [Foto], [Price], [IdCategoryDish], [IdCategoryDrink], [IdCategoryDishAndDrink], [IdUser]) VALUES (26, N'Лазата', N'Салат Лаззат с баклажанами станет отличным легким обедом или ужином. Несмотря на одни овощи в составе, он получается сытным, так как баклажаны предварительно обжариваются в крахмале.', N'Баклажаны, помидоры, кукурузный крахмал, растительное масло, кунжут, зелень кинзы, перец чёрный молотый, соль.', N'Салат_Лазата.jpg', CAST(350 AS Decimal(18, 0)), 1, NULL, 2, NULL)
INSERT [dbo].[DishAndDrink] ([Id], [Name], [Description], [Composition], [Foto], [Price], [IdCategoryDish], [IdCategoryDrink], [IdCategoryDishAndDrink], [IdUser]) VALUES (27, N'Тбилиси', N'Классическое грузинское блюдо: вкусное и полезное! Жители Грузии внимательно относятся к своему здоровью и, соответственно, питанию. Поэтому блюда готовятся из натуральных продуктов.', N'Говядина, фасоль красная, болгарский перец, грецкие орехи, чеснок, лук репчатый, зелень кинзы, соль, перец острый стручковый, оливковое масло, винный уксус красный.', N'Салат_Тбилиси.jpg', CAST(300 AS Decimal(18, 0)), 1, NULL, 2, NULL)
INSERT [dbo].[DishAndDrink] ([Id], [Name], [Description], [Composition], [Foto], [Price], [IdCategoryDish], [IdCategoryDrink], [IdCategoryDishAndDrink], [IdUser]) VALUES (28, N'Муравейник', N'Салат Муравейник с курицей и картофельной соломкой не зря так называется, ведь он действительно похож на настоящий муравейник. Благодаря интересному оформлению салат привлечет всеобщее внимание, а его вкус никого не оставит равнодушным.', N'Курица, огурцы, помидоры, твёрдый сыр, картошка, соль, растительное масло, майонез, укроп.', N'Салат_Муравейник.jpg', CAST(300 AS Decimal(18, 0)), 1, NULL, 2, NULL)
INSERT [dbo].[DishAndDrink] ([Id], [Name], [Description], [Composition], [Foto], [Price], [IdCategoryDish], [IdCategoryDrink], [IdCategoryDishAndDrink], [IdUser]) VALUES (30, N'Слоеный', N'Очень вкусный, яркий и сытный салат.', N'Куриное филе, лук, морковь, картошка, шампиньоны, яйца, твёрдый сыр, растительное масло, сметана, сметана, майонез, зелень, соль, специи сухие.', N'Салат_Слоеный.jpg', CAST(350 AS Decimal(18, 0)), 1, NULL, 2, NULL)
INSERT [dbo].[DishAndDrink] ([Id], [Name], [Description], [Composition], [Foto], [Price], [IdCategoryDish], [IdCategoryDrink], [IdCategoryDishAndDrink], [IdUser]) VALUES (31, N'Фунчоза', N'Необычная, пикантная, с идеальным вкусом! Бесподобно.', N'Фунчоза, корейская морковь, огурцы, соль, кунжутное масло, кунжутное масло, кунжут, чеснок, специи сухие. ', N'Салат_Фунчоза.jpg', CAST(400 AS Decimal(18, 0)), 1, NULL, 2, NULL)
INSERT [dbo].[DishAndDrink] ([Id], [Name], [Description], [Composition], [Foto], [Price], [IdCategoryDish], [IdCategoryDrink], [IdCategoryDishAndDrink], [IdUser]) VALUES (32, N'Пирожное эскимо', N'Яркое, оригинальное, необычное, нежное - тает во рту.', N'Желатин, вода, белый шоколад, молоко, сливки, сахарная пудра, тёмный шоколад, растительное масло, сироп.', N'Десерт_Пирожное_эскимо.jpg', CAST(200 AS Decimal(18, 0)), 2, NULL, 2, NULL)
INSERT [dbo].[DishAndDrink] ([Id], [Name], [Description], [Composition], [Foto], [Price], [IdCategoryDish], [IdCategoryDrink], [IdCategoryDishAndDrink], [IdUser]) VALUES (33, N'Творожный пудинг', N'Почти как запеканка в детском саду! Это очень вкусно.', N'Творог, пшеничная мука, сахар, яйца, ванильный сахар, разрыхлитель, соль, сливочное масло.', N'Десерт_Творожный_пудинг.jpg', CAST(250 AS Decimal(18, 0)), 2, NULL, 2, NULL)
INSERT [dbo].[DishAndDrink] ([Id], [Name], [Description], [Composition], [Foto], [Price], [IdCategoryDish], [IdCategoryDrink], [IdCategoryDishAndDrink], [IdUser]) VALUES (34, N'Муссовый десерт', N'Муссовый десерт с вишней - это самый настоящий праздник вкуса.', N'Сливки, замороженная вишня, сахар, шоколад, вода, молоко, желатин, ванилин.', N'Десерт_Муссовый_десерт.jpg', CAST(200 AS Decimal(18, 0)), 2, NULL, 2, NULL)
INSERT [dbo].[DishAndDrink] ([Id], [Name], [Description], [Composition], [Foto], [Price], [IdCategoryDish], [IdCategoryDrink], [IdCategoryDishAndDrink], [IdUser]) VALUES (35, N'Тирамису', N'есерт тирамису с печеньем — рецепт самого известного торта итальянской кухни.', N'Печенье Савоярди, яйца, маскарпоне, сахар, кофе, какао.', N'Десерт_Тирамису.jpg', CAST(250 AS Decimal(18, 0)), 2, NULL, 2, NULL)
INSERT [dbo].[DishAndDrink] ([Id], [Name], [Description], [Composition], [Foto], [Price], [IdCategoryDish], [IdCategoryDrink], [IdCategoryDishAndDrink], [IdUser]) VALUES (36, N'Моти', N'Яркий и оригинальный японский десерт, покоривший весь мир.', N'Рисовая мука, сахар, вода, творожный сыр, ягоды, кукурузный крахмал.', N'Десерт_Моти.jpg', CAST(200 AS Decimal(18, 0)), 2, NULL, 2, NULL)
INSERT [dbo].[DishAndDrink] ([Id], [Name], [Description], [Composition], [Foto], [Price], [IdCategoryDish], [IdCategoryDrink], [IdCategoryDishAndDrink], [IdUser]) VALUES (37, N'Панакота', N'Панакота классическая - это десерт из сливок, который идеально подойдет для любого женского праздника.', N'Сливки жирные, сахар, ванильный сахар, желатин.', N'Десерт_Панакота.jpg', CAST(200 AS Decimal(18, 0)), 2, NULL, 2, NULL)
INSERT [dbo].[DishAndDrink] ([Id], [Name], [Description], [Composition], [Foto], [Price], [IdCategoryDish], [IdCategoryDrink], [IdCategoryDishAndDrink], [IdUser]) VALUES (38, N'Ягодный десерт', N'Да витамины! Вкусно и красиво. Это не может не понравится.', N'Сливки, смородина, ягоды, печенье бисквитное, сахар.', N'Десерт_Ягодный_десерт.jpg', CAST(200 AS Decimal(18, 0)), 2, NULL, 2, NULL)
INSERT [dbo].[DishAndDrink] ([Id], [Name], [Description], [Composition], [Foto], [Price], [IdCategoryDish], [IdCategoryDrink], [IdCategoryDishAndDrink], [IdUser]) VALUES (39, N'Яблочный зефир', N'Нежный и воздушный зефир.', N'Яблоки, сахар, вода, куриные яйца, сахарная пудра.', N'Десерт_Яблочный_зефир.jpg', CAST(200 AS Decimal(18, 0)), 2, NULL, 2, NULL)
INSERT [dbo].[DishAndDrink] ([Id], [Name], [Description], [Composition], [Foto], [Price], [IdCategoryDish], [IdCategoryDrink], [IdCategoryDishAndDrink], [IdUser]) VALUES (40, N'Чак чак с мёдом', N'Известная восточная сладость, оригинально и очень вкусно. ', N'Пшеничная мука, мёд, сахар, яйца, сода, соль, растительное масло, грецкий орехи.', N'Десерт_Чак_чак_с_мёдом.jpg', CAST(250 AS Decimal(18, 0)), 2, NULL, 2, NULL)
INSERT [dbo].[DishAndDrink] ([Id], [Name], [Description], [Composition], [Foto], [Price], [IdCategoryDish], [IdCategoryDrink], [IdCategoryDishAndDrink], [IdUser]) VALUES (41, N'Рычал-Су', NULL, NULL, N'Газировка_Рычал-Су.jpg', CAST(75 AS Decimal(18, 0)), NULL, 2, 1, NULL)
INSERT [dbo].[DishAndDrink] ([Id], [Name], [Description], [Composition], [Foto], [Price], [IdCategoryDish], [IdCategoryDrink], [IdCategoryDishAndDrink], [IdUser]) VALUES (44, N'Аква Минерале', NULL, NULL, N'Газировка_Аква-минерале.jpg', CAST(75 AS Decimal(18, 0)), NULL, 2, 1, NULL)
INSERT [dbo].[DishAndDrink] ([Id], [Name], [Description], [Composition], [Foto], [Price], [IdCategoryDish], [IdCategoryDrink], [IdCategoryDishAndDrink], [IdUser]) VALUES (45, N'Аква Минерале негаз', NULL, NULL, N'Газировка_Аква-минерале-негаз.jpg', CAST(60 AS Decimal(18, 0)), NULL, 2, 1, NULL)
INSERT [dbo].[DishAndDrink] ([Id], [Name], [Description], [Composition], [Foto], [Price], [IdCategoryDish], [IdCategoryDrink], [IdCategoryDishAndDrink], [IdUser]) VALUES (46, N'Классик Кола', NULL, NULL, N'Газировка_Классик-Кола.jpg', CAST(100 AS Decimal(18, 0)), NULL, 2, 1, NULL)
INSERT [dbo].[DishAndDrink] ([Id], [Name], [Description], [Composition], [Foto], [Price], [IdCategoryDish], [IdCategoryDrink], [IdCategoryDishAndDrink], [IdUser]) VALUES (47, N'Добрый апельсин', NULL, NULL, N'Газировка_Добрый-апельсин.jpg', CAST(80 AS Decimal(18, 0)), NULL, 2, 1, NULL)
INSERT [dbo].[DishAndDrink] ([Id], [Name], [Description], [Composition], [Foto], [Price], [IdCategoryDish], [IdCategoryDrink], [IdCategoryDishAndDrink], [IdUser]) VALUES (48, N'Fresh Bar Цитрус Айс', NULL, NULL, N'Газировка_Fresh_Bar_Цитрус_Айс.jpg', CAST(60 AS Decimal(18, 0)), NULL, 2, 1, NULL)
INSERT [dbo].[DishAndDrink] ([Id], [Name], [Description], [Composition], [Foto], [Price], [IdCategoryDish], [IdCategoryDrink], [IdCategoryDishAndDrink], [IdUser]) VALUES (49, N'Fresh Bar Мэджик Скиллс', NULL, NULL, N'Газировка_Fresh_Bar_Мэджик_Скиллс.jpg', CAST(60 AS Decimal(18, 0)), NULL, 2, 1, NULL)
INSERT [dbo].[DishAndDrink] ([Id], [Name], [Description], [Composition], [Foto], [Price], [IdCategoryDish], [IdCategoryDrink], [IdCategoryDishAndDrink], [IdUser]) VALUES (50, N'Любимая Кола', NULL, NULL, N'Газировка_Любимая_Кола.jpg', CAST(110 AS Decimal(18, 0)), NULL, 2, 1, NULL)
INSERT [dbo].[DishAndDrink] ([Id], [Name], [Description], [Composition], [Foto], [Price], [IdCategoryDish], [IdCategoryDrink], [IdCategoryDishAndDrink], [IdUser]) VALUES (51, N'Черноголовка Дюшес ', NULL, NULL, N'Газировка_Черноголовка_Дюшес.jpg', CAST(70 AS Decimal(18, 0)), NULL, 2, 1, NULL)
INSERT [dbo].[DishAndDrink] ([Id], [Name], [Description], [Composition], [Foto], [Price], [IdCategoryDish], [IdCategoryDrink], [IdCategoryDishAndDrink], [IdUser]) VALUES (52, N'Добрый кола ', NULL, NULL, N'Газировка_Добрый_кола.jpg', CAST(90 AS Decimal(18, 0)), NULL, 2, 1, NULL)
INSERT [dbo].[DishAndDrink] ([Id], [Name], [Description], [Composition], [Foto], [Price], [IdCategoryDish], [IdCategoryDrink], [IdCategoryDishAndDrink], [IdUser]) VALUES (53, N'Черноголовка Байкал', NULL, NULL, N'Газировка_Черноголовка_Байкал.jpg', CAST(70 AS Decimal(18, 0)), NULL, 2, 1, NULL)
INSERT [dbo].[DishAndDrink] ([Id], [Name], [Description], [Composition], [Foto], [Price], [IdCategoryDish], [IdCategoryDrink], [IdCategoryDishAndDrink], [IdUser]) VALUES (54, N'Добрый лимон-лайм', NULL, NULL, N'Газировка_Добрый_лимон_лайм.jpg', CAST(100 AS Decimal(18, 0)), NULL, 2, 1, NULL)
INSERT [dbo].[DishAndDrink] ([Id], [Name], [Description], [Composition], [Foto], [Price], [IdCategoryDish], [IdCategoryDrink], [IdCategoryDishAndDrink], [IdUser]) VALUES (55, N'Аква Минерале Лимон негаз', NULL, NULL, N'Газировка_Аква_Минерале_Лимон_негаз.jpg', CAST(80 AS Decimal(18, 0)), NULL, 2, 1, NULL)
INSERT [dbo].[DishAndDrink] ([Id], [Name], [Description], [Composition], [Foto], [Price], [IdCategoryDish], [IdCategoryDrink], [IdCategoryDishAndDrink], [IdUser]) VALUES (56, N'Вино Шато Тамань красное сухое', NULL, NULL, N'Алкоголь_Вино_Шато_Тамань_Каберне_Мерло_красное_сухое.jpg', CAST(300 AS Decimal(18, 0)), NULL, 1, 1, NULL)
INSERT [dbo].[DishAndDrink] ([Id], [Name], [Description], [Composition], [Foto], [Price], [IdCategoryDish], [IdCategoryDrink], [IdCategoryDishAndDrink], [IdUser]) VALUES (57, N'Мартини Бьянко белый сладкий', NULL, NULL, N'Алкоголь_Мартини_Бьянко_белый_сладкий.jpg', CAST(800 AS Decimal(18, 0)), NULL, 1, 1, NULL)
INSERT [dbo].[DishAndDrink] ([Id], [Name], [Description], [Composition], [Foto], [Price], [IdCategoryDish], [IdCategoryDrink], [IdCategoryDishAndDrink], [IdUser]) VALUES (58, N'Вино Фальдео Асти белое сладкое', NULL, NULL, N'Алкоголь_Вино_игристое_Фальдео_Асти_DOCG_белое_сладкое.jpg', CAST(700 AS Decimal(18, 0)), NULL, 1, 1, NULL)
INSERT [dbo].[DishAndDrink] ([Id], [Name], [Description], [Composition], [Foto], [Price], [IdCategoryDish], [IdCategoryDrink], [IdCategoryDishAndDrink], [IdUser]) VALUES (59, N'Водка Талка', NULL, NULL, N'Алкоголь_Водка_Талка.jpg', CAST(300 AS Decimal(18, 0)), NULL, 1, 1, NULL)
INSERT [dbo].[DishAndDrink] ([Id], [Name], [Description], [Composition], [Foto], [Price], [IdCategoryDish], [IdCategoryDrink], [IdCategoryDishAndDrink], [IdUser]) VALUES (60, N'Водка Царский кубок', NULL, NULL, N'Алкоголь_Водка_Царский_кубок.jpg', CAST(500 AS Decimal(18, 0)), NULL, 1, 1, NULL)
INSERT [dbo].[DishAndDrink] ([Id], [Name], [Description], [Composition], [Foto], [Price], [IdCategoryDish], [IdCategoryDrink], [IdCategoryDishAndDrink], [IdUser]) VALUES (61, N'Водка Медведь', NULL, NULL, N'Алкоголь_Водка_Медведь.jpg', CAST(900 AS Decimal(18, 0)), NULL, 1, 1, NULL)
INSERT [dbo].[DishAndDrink] ([Id], [Name], [Description], [Composition], [Foto], [Price], [IdCategoryDish], [IdCategoryDrink], [IdCategoryDishAndDrink], [IdUser]) VALUES (62, N'Коньяк Кизляр', NULL, NULL, N'Алкоголь_Коньяк_Кизляр.jpg', CAST(600 AS Decimal(18, 0)), NULL, 1, 1, NULL)
INSERT [dbo].[DishAndDrink] ([Id], [Name], [Description], [Composition], [Foto], [Price], [IdCategoryDish], [IdCategoryDrink], [IdCategoryDishAndDrink], [IdUser]) VALUES (63, N'Коньяк Армянский 5 звезд', NULL, NULL, N'Алкоголь_Коньяк_Армянский_5_звезд.jpg', CAST(550 AS Decimal(18, 0)), NULL, 1, 1, NULL)
INSERT [dbo].[DishAndDrink] ([Id], [Name], [Description], [Composition], [Foto], [Price], [IdCategoryDish], [IdCategoryDrink], [IdCategoryDishAndDrink], [IdUser]) VALUES (64, N'Коньяк Старейшина Трэвел', NULL, NULL, N'Алкоголь_Коньяк_Старейшина_Трэвел_3_года.jpg', CAST(600 AS Decimal(18, 0)), NULL, 1, 1, NULL)
INSERT [dbo].[DishAndDrink] ([Id], [Name], [Description], [Composition], [Foto], [Price], [IdCategoryDish], [IdCategoryDrink], [IdCategoryDishAndDrink], [IdUser]) VALUES (65, N'Виски Теннесси Джек Дениел`с', NULL, NULL, N'Алкоголь_Виски_Теннесси_Джек_Дениел`с.jpg', CAST(2300 AS Decimal(18, 0)), NULL, 1, 1, NULL)
INSERT [dbo].[DishAndDrink] ([Id], [Name], [Description], [Composition], [Foto], [Price], [IdCategoryDish], [IdCategoryDrink], [IdCategoryDishAndDrink], [IdUser]) VALUES (66, N'Виски Глен Уан', NULL, NULL, N'Алкоголь_Виски_Глен_Уан.jpg', CAST(650 AS Decimal(18, 0)), NULL, 1, 1, NULL)
INSERT [dbo].[DishAndDrink] ([Id], [Name], [Description], [Composition], [Foto], [Price], [IdCategoryDish], [IdCategoryDrink], [IdCategoryDishAndDrink], [IdUser]) VALUES (68, N'4', NULL, NULL, N'C:\скачивания\мем\be2109ef5c92aaa153316f35180b67e2.jpg', CAST(4 AS Decimal(18, 0)), NULL, NULL, NULL, NULL)
INSERT [dbo].[DishAndDrink] ([Id], [Name], [Description], [Composition], [Foto], [Price], [IdCategoryDish], [IdCategoryDrink], [IdCategoryDishAndDrink], [IdUser]) VALUES (69, N'1', N'1', N'1', N'C:\скачивания\мем\dcfd29e5eb1f38188adddfdf9d247c2c.jpg', CAST(0 AS Decimal(18, 0)), NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[DishAndDrink] OFF
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([Id], [IdDishAndDrink], [Quantity]) VALUES (3, 4, 1)
INSERT [dbo].[Order] ([Id], [IdDishAndDrink], [Quantity]) VALUES (4, 4, 2)
INSERT [dbo].[Order] ([Id], [IdDishAndDrink], [Quantity]) VALUES (12, 61, 2)
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([Id], [Name]) VALUES (1, N'Кухня')
INSERT [dbo].[Role] ([Id], [Name]) VALUES (2, N'Бар')
INSERT [dbo].[Role] ([Id], [Name]) VALUES (3, N'Админ')
INSERT [dbo].[Role] ([Id], [Name]) VALUES (4, N'Зал')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([Id], [IdRole], [Login], [Password]) VALUES (1, 1, N'кухня', N'кухня')
INSERT [dbo].[User] ([Id], [IdRole], [Login], [Password]) VALUES (2, 2, N'бар', N'бар')
INSERT [dbo].[User] ([Id], [IdRole], [Login], [Password]) VALUES (3, 3, N'админ', N'админ')
INSERT [dbo].[User] ([Id], [IdRole], [Login], [Password]) VALUES (4, 4, N'зал', N'зал')
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[DishAndDrink]  WITH CHECK ADD  CONSTRAINT [FK_Dish_Category] FOREIGN KEY([IdCategoryDish])
REFERENCES [dbo].[CategoryDish] ([Id])
GO
ALTER TABLE [dbo].[DishAndDrink] CHECK CONSTRAINT [FK_Dish_Category]
GO
ALTER TABLE [dbo].[DishAndDrink]  WITH CHECK ADD  CONSTRAINT [FK_DishAndDrink_CategoryDishAndDrink] FOREIGN KEY([IdCategoryDishAndDrink])
REFERENCES [dbo].[CategoryDishAndDrink] ([Id])
GO
ALTER TABLE [dbo].[DishAndDrink] CHECK CONSTRAINT [FK_DishAndDrink_CategoryDishAndDrink]
GO
ALTER TABLE [dbo].[DishAndDrink]  WITH CHECK ADD  CONSTRAINT [FK_DishAndDrink_CategoryDrink] FOREIGN KEY([IdCategoryDrink])
REFERENCES [dbo].[CategoryDrink] ([Id])
GO
ALTER TABLE [dbo].[DishAndDrink] CHECK CONSTRAINT [FK_DishAndDrink_CategoryDrink]
GO
ALTER TABLE [dbo].[DishAndDrink]  WITH CHECK ADD  CONSTRAINT [FK_DishAndDrink_User] FOREIGN KEY([IdUser])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[DishAndDrink] CHECK CONSTRAINT [FK_DishAndDrink_User]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_DishAndDrink] FOREIGN KEY([IdDishAndDrink])
REFERENCES [dbo].[DishAndDrink] ([Id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_DishAndDrink]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Role] FOREIGN KEY([IdRole])
REFERENCES [dbo].[Role] ([Id])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Role]
GO
USE [master]
GO
ALTER DATABASE [RestaurantBD] SET  READ_WRITE 
GO
