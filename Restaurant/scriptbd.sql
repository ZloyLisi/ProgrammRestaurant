USE [master]
GO
/****** Object:  Database [RestaurantBD]    Script Date: 22.04.2024 6:35:43 ******/
CREATE DATABASE [RestaurantBD]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'RestaurantD', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\RestaurantD.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'RestaurantD_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\RestaurantD_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
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
/****** Object:  Table [dbo].[CategoryDish]    Script Date: 22.04.2024 6:35:43 ******/
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
/****** Object:  Table [dbo].[CategoryDishAndDrink]    Script Date: 22.04.2024 6:35:44 ******/
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
/****** Object:  Table [dbo].[CategoryDrink]    Script Date: 22.04.2024 6:35:44 ******/
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
/****** Object:  Table [dbo].[DishAndDrink]    Script Date: 22.04.2024 6:35:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DishAndDrink](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[Composition] [nvarchar](max) NULL,
	[Foto] [nvarchar](max) NOT NULL,
	[Price] [float] NOT NULL,
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
/****** Object:  Table [dbo].[Order]    Script Date: 22.04.2024 6:35:44 ******/
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
/****** Object:  Table [dbo].[Role]    Script Date: 22.04.2024 6:35:44 ******/
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
/****** Object:  Table [dbo].[User]    Script Date: 22.04.2024 6:35:44 ******/
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
INSERT [dbo].[CategoryDish] ([Id], [Name]) VALUES (2, N'Десерты')
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
INSERT [dbo].[CategoryDrink] ([Id], [Name]) VALUES (3, N'Коктель')
SET IDENTITY_INSERT [dbo].[CategoryDrink] OFF
GO
SET IDENTITY_INSERT [dbo].[DishAndDrink] ON 

INSERT [dbo].[DishAndDrink] ([Id], [Name], [Description], [Composition], [Foto], [Price], [IdCategoryDish], [IdCategoryDrink], [IdCategoryDishAndDrink], [IdUser]) VALUES (4, N'Цезарь', N'Салат Цезарь классический с курицей названный так совсем не в честь римского императора, а по имени шеф-повара Цезаря Кардини, который, по легенде, накормил однажды голливудских актеров салатом из того, что было. Теперь он и на вашем столе!', N'Куриное филе, белый хлеб, перепелиные яйца, листовой салат, помидоры черри, твёрдый сыр, чеснок, лимонный сок, горчица, майонез, соль, перец. ', N'D:\Violetta_PP\Violetta\Салат_Цезарь.jpg', 300, 1, NULL, 2, NULL)
INSERT [dbo].[DishAndDrink] ([Id], [Name], [Description], [Composition], [Foto], [Price], [IdCategoryDish], [IdCategoryDrink], [IdCategoryDishAndDrink], [IdUser]) VALUES (7, N'Мимоза', N'Классический салат Мимоза с рыбными консервами и картошкой - один из самых популярных салатов на протяжении нескольких десятилетий.', N'Рыбные консервы, яйца, картофель, морковь, лук репчатый, майонез', N'D:\Violetta_PP\Violetta\Салат_Мимоза.jpg', 400, 1, NULL, 2, NULL)
INSERT [dbo].[DishAndDrink] ([Id], [Name], [Description], [Composition], [Foto], [Price], [IdCategoryDish], [IdCategoryDrink], [IdCategoryDishAndDrink], [IdUser]) VALUES (10, N'Коул Слоу', N'Главное его отличие от других подобных блюд - это заправка, делающая его очень аппетитным и сочным.', N'Капуста белокочанная, морковь, красный лук, зеленое яблоко, зеленый лук, сметана, майонез, йогурд классический, горчица дижонская, зернистая горчица, яблочный уксус, сахар, перец, соль.', N'D:\Violetta_PP\Violetta\Салат_Коул_Слоу.jpg', 400, 1, NULL, 2, NULL)
SET IDENTITY_INSERT [dbo].[DishAndDrink] OFF
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
