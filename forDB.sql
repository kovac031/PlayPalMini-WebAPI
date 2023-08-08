USE [master]
GO
/****** Object:  Database [PlayPalMini]    Script Date: 08/08/2023 10:14:36 ******/
CREATE DATABASE [PlayPalMini]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PlayPalMini', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\PlayPalMini.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PlayPalMini_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\PlayPalMini_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [PlayPalMini] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PlayPalMini].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PlayPalMini] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PlayPalMini] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PlayPalMini] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PlayPalMini] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PlayPalMini] SET ARITHABORT OFF 
GO
ALTER DATABASE [PlayPalMini] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PlayPalMini] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PlayPalMini] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PlayPalMini] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PlayPalMini] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PlayPalMini] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PlayPalMini] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PlayPalMini] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PlayPalMini] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PlayPalMini] SET  ENABLE_BROKER 
GO
ALTER DATABASE [PlayPalMini] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PlayPalMini] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PlayPalMini] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PlayPalMini] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PlayPalMini] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PlayPalMini] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PlayPalMini] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PlayPalMini] SET RECOVERY FULL 
GO
ALTER DATABASE [PlayPalMini] SET  MULTI_USER 
GO
ALTER DATABASE [PlayPalMini] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PlayPalMini] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PlayPalMini] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PlayPalMini] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PlayPalMini] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PlayPalMini] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'PlayPalMini', N'ON'
GO
ALTER DATABASE [PlayPalMini] SET QUERY_STORE = ON
GO
ALTER DATABASE [PlayPalMini] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [PlayPalMini]
GO
/****** Object:  Table [dbo].[BoardGame]    Script Date: 08/08/2023 10:14:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BoardGame](
	[Id] [uniqueidentifier] NOT NULL,
	[Title] [varchar](255) NOT NULL,
	[Description] [text] NULL,
	[CreatedBy] [varchar](255) NULL,
	[UpdatedBy] [varchar](255) NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RegisteredUser]    Script Date: 08/08/2023 10:14:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RegisteredUser](
	[Id] [uniqueidentifier] NOT NULL,
	[Username] [varchar](255) NOT NULL,
	[Pass] [varchar](255) NOT NULL,
	[UserRole] [varchar](255) NULL,
	[CreatedBy] [varchar](255) NULL,
	[UpdatedBy] [varchar](255) NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Review]    Script Date: 08/08/2023 10:14:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Review](
	[Id] [uniqueidentifier] NOT NULL,
	[Title] [text] NOT NULL,
	[Comment] [text] NULL,
	[Rating] [int] NOT NULL,
	[BoardGameId] [uniqueidentifier] NOT NULL,
	[CreatedBy] [varchar](255) NULL,
	[UpdatedBy] [varchar](255) NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[RegisteredUserId] [uniqueidentifier] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[BoardGame] ([Id], [Title], [Description], [CreatedBy], [UpdatedBy], [DateCreated], [DateUpdated]) VALUES (N'3b57dec8-e374-41b6-8b10-0964199df9f7', N'Time Travelers', N'Travel through different eras and shape history in this game of intrigue and temporal manipulation.', N'SYSADMIN', N'n/a', CAST(N'2023-08-02T14:01:01.543' AS DateTime), CAST(N'2023-08-02T14:01:01.543' AS DateTime))
GO
INSERT [dbo].[BoardGame] ([Id], [Title], [Description], [CreatedBy], [UpdatedBy], [DateCreated], [DateUpdated]) VALUES (N'6042bcd9-9938-40ed-a102-0d9a98313310', N'Catan', N'Players take on the roles of settlers, each attempting to build and develop holdings while trading and acquiring resources. 
Players gain victory points as their settlements grow; the first to reach a set number of victory points.', N'SYSADMIN', N'n/a', CAST(N'2023-07-06T14:28:14.137' AS DateTime), CAST(N'2023-07-06T14:28:14.137' AS DateTime))
GO
INSERT [dbo].[BoardGame] ([Id], [Title], [Description], [CreatedBy], [UpdatedBy], [DateCreated], [DateUpdated]) VALUES (N'321cbee4-c718-4855-b9a5-1afccb1afbcf', N'Zombie Apocalypse', N'The dead have risen! Survive the zombie apocalypse with your wits, weapons, and teamwork.', N'SYSADMIN', N'n/a', CAST(N'2023-08-02T14:01:01.543' AS DateTime), CAST(N'2023-08-02T14:01:01.543' AS DateTime))
GO
INSERT [dbo].[BoardGame] ([Id], [Title], [Description], [CreatedBy], [UpdatedBy], [DateCreated], [DateUpdated]) VALUES (N'621fac3f-fb10-4475-ac33-1b1b6435eac8', N'Pirate''s Plunder', N'Set sail on the high seas as a pirate captain. Seek treasure, battle enemies, and avoid the navy.', N'SYSADMIN', N'n/a', CAST(N'2023-08-02T14:01:01.540' AS DateTime), CAST(N'2023-08-02T14:01:01.540' AS DateTime))
GO
INSERT [dbo].[BoardGame] ([Id], [Title], [Description], [CreatedBy], [UpdatedBy], [DateCreated], [DateUpdated]) VALUES (N'9d7dad30-c0ea-44b2-811c-1e27a1072419', N'Uno', N'The objective of the game is to be the first player to get rid of all their cards by playing cards with matching colors or numbers.', N'SYSADMIN', N'n/a', CAST(N'2023-07-06T14:28:14.137' AS DateTime), CAST(N'2023-07-06T14:28:14.137' AS DateTime))
GO
INSERT [dbo].[BoardGame] ([Id], [Title], [Description], [CreatedBy], [UpdatedBy], [DateCreated], [DateUpdated]) VALUES (N'f28fa03c-4d75-4b80-a2e1-3616acf77566', N'Mystery Mansion', N'Investigate haunting mysteries in a cursed mansion. Use wit and bravery to uncover the truth.', N'SYSADMIN', N'n/a', CAST(N'2023-08-02T14:01:01.540' AS DateTime), CAST(N'2023-08-02T14:01:01.540' AS DateTime))
GO
INSERT [dbo].[BoardGame] ([Id], [Title], [Description], [CreatedBy], [UpdatedBy], [DateCreated], [DateUpdated]) VALUES (N'444e71d7-3cde-4f1b-a088-3ca963e25e00', N'Risk', N'Risk is a popular strategy board game that is played on a world map divided into territories. 
The objective of the game is to conquer the world by occupying all territories on the board or eliminating all other players.', N'SYSADMIN', N'n/a', CAST(N'2023-07-06T14:28:14.137' AS DateTime), CAST(N'2023-07-06T14:28:14.137' AS DateTime))
GO
INSERT [dbo].[BoardGame] ([Id], [Title], [Description], [CreatedBy], [UpdatedBy], [DateCreated], [DateUpdated]) VALUES (N'e28c31f8-42ef-495f-bbbc-41ea117b25ff', N'Robot Rebellion', N'The robots have revolted! Work together to quash the rebellion or join the robots in their uprising.', N'SYSADMIN', N'n/a', CAST(N'2023-08-02T14:01:01.540' AS DateTime), CAST(N'2023-08-02T14:01:01.540' AS DateTime))
GO
INSERT [dbo].[BoardGame] ([Id], [Title], [Description], [CreatedBy], [UpdatedBy], [DateCreated], [DateUpdated]) VALUES (N'687b4366-be2b-40c7-a484-51a8701119aa', N'Enchanted Forest', N'Navigate a magical forest filled with fantastical creatures and spells. A family-friendly fairy tale journey.', N'SYSADMIN', N'n/a', CAST(N'2023-08-02T14:01:01.540' AS DateTime), CAST(N'2023-08-02T14:01:01.540' AS DateTime))
GO
INSERT [dbo].[BoardGame] ([Id], [Title], [Description], [CreatedBy], [UpdatedBy], [DateCreated], [DateUpdated]) VALUES (N'fcafd866-48db-4d9b-a104-62ccb211a6ac', N'Dobble', N'Dobble is a game in which players have to find symbols in common between two cards.', N'SYSADMIN', N'n/a', CAST(N'2023-07-06T14:28:14.137' AS DateTime), CAST(N'2023-07-06T14:28:14.137' AS DateTime))
GO
INSERT [dbo].[BoardGame] ([Id], [Title], [Description], [CreatedBy], [UpdatedBy], [DateCreated], [DateUpdated]) VALUES (N'd45435d7-ca16-47c1-82f9-69a2dcf99c39', N'Fairy Tale Showdown', N'Battle as iconic fairy tale characters in this whimsical card game of strategy and surprise.', N'SYSADMIN', N'n/a', CAST(N'2023-08-02T14:01:01.543' AS DateTime), CAST(N'2023-08-02T14:01:01.543' AS DateTime))
GO
INSERT [dbo].[BoardGame] ([Id], [Title], [Description], [CreatedBy], [UpdatedBy], [DateCreated], [DateUpdated]) VALUES (N'9e1b951c-eebd-4eb3-8119-6fe1c90ecc8a', N'Dixit', N'Using a deck of cards illustrated with dreamlike images, players select cards that match a title suggested by the designated storyteller player, 
and attempt to guess which card the storyteller selected.', N'SYSADMIN', N'n/a', CAST(N'2023-07-06T14:28:14.137' AS DateTime), CAST(N'2023-07-06T14:28:14.137' AS DateTime))
GO
INSERT [dbo].[BoardGame] ([Id], [Title], [Description], [CreatedBy], [UpdatedBy], [DateCreated], [DateUpdated]) VALUES (N'ac13abe5-c2d3-4de6-854c-7bbe50b2bb6e', N'Scrabble', N'Players use letter tiles to create words on a game board. The objective of the game is to score as many points as possible 
by forming words with high-scoring letters and placing them on the game board in a crossword-style pattern.', N'SYSADMIN', N'n/a', CAST(N'2023-07-06T14:28:14.137' AS DateTime), CAST(N'2023-07-06T14:28:14.137' AS DateTime))
GO
INSERT [dbo].[BoardGame] ([Id], [Title], [Description], [CreatedBy], [UpdatedBy], [DateCreated], [DateUpdated]) VALUES (N'897f8b53-0136-4162-8bae-8509a0c160fc', N'Lorem Ipsum', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin sed porttitor odio. Donec pharetra mollis urna sed consequat. Integer in fringilla tellus, at rhoncus magna. Sed interdum rutrum nibh, ut viverra dolor tristique nec. Morbi risus nibh, blandit quis urna non, pellentesque vestibulum dolor. Donec dictum tristique bibendum. Sed vulputate, est a ultrices fringilla, urna nisl fermentum lectus, ac sagittis lorem enim nec dolor. Nulla a pulvinar eros. Phasellus ac lacus pulvinar quam tempor scelerisque consectetur quis risus. Nullam nulla ante, scelerisque scelerisque elit nec, pellentesque tristique nibh. Curabitur viverra orci ut arcu feugiat, et commodo metus pharetra. Vivamus ornare laoreet ligula ac aliquam. Sed nec elementum purus, rutrum pulvinar dolor. Nullam condimentum ultricies urna in malesuada. In volutpat fringilla tristique. ', N'SYSADMIN', N'n/a', CAST(N'2023-08-02T12:35:10.103' AS DateTime), CAST(N'2023-08-02T12:35:10.103' AS DateTime))
GO
INSERT [dbo].[BoardGame] ([Id], [Title], [Description], [CreatedBy], [UpdatedBy], [DateCreated], [DateUpdated]) VALUES (N'd2a5a66e-93e2-4c3d-ae33-8b0f8de59e07', N'Codenames', N'The objective of the game is to correctly identify all of your team''s secret agents before the other team does.', N'SYSADMIN', N'n/a', CAST(N'2023-07-06T14:28:14.137' AS DateTime), CAST(N'2023-07-06T14:28:14.137' AS DateTime))
GO
INSERT [dbo].[BoardGame] ([Id], [Title], [Description], [CreatedBy], [UpdatedBy], [DateCreated], [DateUpdated]) VALUES (N'2e6dc62d-8c91-48b7-a7e5-959b286b41ff', N'Pandemic', N'Pandemic is a cooperative board game where players work together as a team to stop the spread of deadly diseases across the world. 
The objective of the game is to discover cures for four different diseases before they become a global pandemic and wipe out humanity.', N'SYSADMIN', N'n/a', CAST(N'2023-07-06T14:28:14.137' AS DateTime), CAST(N'2023-07-06T14:28:14.137' AS DateTime))
GO
INSERT [dbo].[BoardGame] ([Id], [Title], [Description], [CreatedBy], [UpdatedBy], [DateCreated], [DateUpdated]) VALUES (N'47a39d63-1a4e-4e06-8daf-98077f59c2aa', N'Vampire''s Curse', N'Survive the night in a town cursed by vampires. Find the hidden vampires or join their ranks.', N'SYSADMIN', N'n/a', CAST(N'2023-08-02T14:01:01.543' AS DateTime), CAST(N'2023-08-02T14:01:01.543' AS DateTime))
GO
INSERT [dbo].[BoardGame] ([Id], [Title], [Description], [CreatedBy], [UpdatedBy], [DateCreated], [DateUpdated]) VALUES (N'81749d28-a4dc-4d70-aeac-9a62c9b5dca5', N'Space Station Survival', N'Stranded on a space station with limited resources. Work together to survive or sabotage others for your gain.', N'SYSADMIN', N'n/a', CAST(N'2023-08-02T14:01:01.543' AS DateTime), CAST(N'2023-08-02T14:01:01.543' AS DateTime))
GO
INSERT [dbo].[BoardGame] ([Id], [Title], [Description], [CreatedBy], [UpdatedBy], [DateCreated], [DateUpdated]) VALUES (N'8af096b7-82ca-4ac3-93d2-a04a2469df95', N'Ubongo', N'In Ubongo, players compete to solve individual puzzles as quickly as they can to get first crack at the gems on hand for the taking.', N'SYSADMIN', N'n/a', CAST(N'2023-07-06T14:28:14.137' AS DateTime), CAST(N'2023-07-06T14:28:14.137' AS DateTime))
GO
INSERT [dbo].[BoardGame] ([Id], [Title], [Description], [CreatedBy], [UpdatedBy], [DateCreated], [DateUpdated]) VALUES (N'551bcaf7-03a6-4999-b160-a6716835a553', N'Dino Park Adventure', N'Create and manage your own dinosaur park. Keep the dinosaurs happy and the visitors safe!', N'SYSADMIN', N'n/a', CAST(N'2023-08-02T14:01:01.540' AS DateTime), CAST(N'2023-08-02T14:01:01.540' AS DateTime))
GO
INSERT [dbo].[BoardGame] ([Id], [Title], [Description], [CreatedBy], [UpdatedBy], [DateCreated], [DateUpdated]) VALUES (N'd680422b-2a42-4b28-87f5-ca1f70070729', N'Galactic Explorers', N'Explore the galaxies and claim uncharted planets. A thrilling space adventure for those who dare to venture beyond.', N'SYSADMIN', N'n/a', CAST(N'2023-08-02T14:01:01.537' AS DateTime), CAST(N'2023-08-02T14:01:01.537' AS DateTime))
GO
INSERT [dbo].[BoardGame] ([Id], [Title], [Description], [CreatedBy], [UpdatedBy], [DateCreated], [DateUpdated]) VALUES (N'3f8bffa5-6f29-4398-8c3f-d59f1c4f7747', N'Kingdom Conquest', N'Build, expand, and defend your kingdom in this strategic game of medieval warfare and diplomacy.', N'SYSADMIN', N'n/a', CAST(N'2023-08-02T14:01:01.540' AS DateTime), CAST(N'2023-08-02T14:01:01.540' AS DateTime))
GO
INSERT [dbo].[BoardGame] ([Id], [Title], [Description], [CreatedBy], [UpdatedBy], [DateCreated], [DateUpdated]) VALUES (N'3620dfd2-8b15-4a9a-9f89-ea6fbc393ba4', N'Ocean''s Depths', N'Dive into the ocean’s depths to discover hidden treasures and mystical creatures. A game of exploration and risk.', N'SYSADMIN', N'n/a', CAST(N'2023-08-02T14:01:01.540' AS DateTime), CAST(N'2023-08-02T14:01:01.540' AS DateTime))
GO
INSERT [dbo].[BoardGame] ([Id], [Title], [Description], [CreatedBy], [UpdatedBy], [DateCreated], [DateUpdated]) VALUES (N'f19d19c6-792a-42d9-beea-ec977c058745', N'Wild West Adventure', N'Become a cowboy or an outlaw in the Wild West. Who will rule the desert lands?', N'SYSADMIN', N'n/a', CAST(N'2023-08-02T14:01:01.540' AS DateTime), CAST(N'2023-08-02T14:01:01.540' AS DateTime))
GO
INSERT [dbo].[BoardGame] ([Id], [Title], [Description], [CreatedBy], [UpdatedBy], [DateCreated], [DateUpdated]) VALUES (N'2d7ddd20-0ad1-4d69-88b8-f5a98569adc5', N'Cyberpunk City', N'In a dystopian future, hackers and corporations clash in a game of influence, technology, and power.', N'SYSADMIN', N'n/a', CAST(N'2023-08-02T14:01:01.543' AS DateTime), CAST(N'2023-08-02T14:01:01.543' AS DateTime))
GO
INSERT [dbo].[RegisteredUser] ([Id], [Username], [Pass], [UserRole], [CreatedBy], [UpdatedBy], [DateCreated], [DateUpdated]) VALUES (N'82252790-01cc-4b80-bc37-22fd404f1de2', N'kovac031', N'kovac', N'User', N'SYSADMIN', N'kovac032', CAST(N'2023-07-06T14:28:18.483' AS DateTime), CAST(N'2023-08-02T12:07:02.810' AS DateTime))
GO
INSERT [dbo].[RegisteredUser] ([Id], [Username], [Pass], [UserRole], [CreatedBy], [UpdatedBy], [DateCreated], [DateUpdated]) VALUES (N'1a17a621-92e2-4e29-bbac-3ce171ecd7ee', N'HarryBuilder', N'H@rryBld', N'User', N'n/a', N'n/a', CAST(N'2023-08-02T14:00:53.190' AS DateTime), CAST(N'2023-08-02T14:00:53.190' AS DateTime))
GO
INSERT [dbo].[RegisteredUser] ([Id], [Username], [Pass], [UserRole], [CreatedBy], [UpdatedBy], [DateCreated], [DateUpdated]) VALUES (N'9e96120e-a635-4f05-8c18-42d6166f2624', N'SYSADMIN', N'1234', N'Administrator', N'SYSADMIN', N'SYSADMIN', CAST(N'2023-07-06T14:28:18.483' AS DateTime), CAST(N'2023-08-01T13:55:30.887' AS DateTime))
GO
INSERT [dbo].[RegisteredUser] ([Id], [Username], [Pass], [UserRole], [CreatedBy], [UpdatedBy], [DateCreated], [DateUpdated]) VALUES (N'b7b94a79-26a4-4c4b-934d-437f9d85378c', N'BobDylan', N'B0b$Song', N'User', N'n/a', N'n/a', CAST(N'2023-08-02T14:00:53.190' AS DateTime), CAST(N'2023-08-02T14:00:53.190' AS DateTime))
GO
INSERT [dbo].[RegisteredUser] ([Id], [Username], [Pass], [UserRole], [CreatedBy], [UpdatedBy], [DateCreated], [DateUpdated]) VALUES (N'0ae0f5ff-d5e2-4f65-947e-49c0c046d44d', N'Dummy42', N'dummy', N'User', N'n/a', N'n/a', CAST(N'2023-08-02T12:32:25.743' AS DateTime), CAST(N'2023-08-02T12:32:25.743' AS DateTime))
GO
INSERT [dbo].[RegisteredUser] ([Id], [Username], [Pass], [UserRole], [CreatedBy], [UpdatedBy], [DateCreated], [DateUpdated]) VALUES (N'2c621cd3-8d8b-44e2-8601-52a3526d3028', N'AliceW', N'Al!c3Pass', N'User', N'n/a', N'n/a', CAST(N'2023-08-02T14:00:53.190' AS DateTime), CAST(N'2023-08-02T14:00:53.190' AS DateTime))
GO
INSERT [dbo].[RegisteredUser] ([Id], [Username], [Pass], [UserRole], [CreatedBy], [UpdatedBy], [DateCreated], [DateUpdated]) VALUES (N'f6f0bdda-bf62-44a8-ac70-706eb59bafad', N'FrankCook', N'Fr@nkChef!', N'User', N'n/a', N'n/a', CAST(N'2023-08-02T14:00:53.190' AS DateTime), CAST(N'2023-08-02T14:00:53.190' AS DateTime))
GO
INSERT [dbo].[RegisteredUser] ([Id], [Username], [Pass], [UserRole], [CreatedBy], [UpdatedBy], [DateCreated], [DateUpdated]) VALUES (N'71269e52-04d8-4cbf-b403-8ebaabb23b99', N'GraceHacker', N'Gr@c3C0de', N'User', N'n/a', N'n/a', CAST(N'2023-08-02T14:00:53.190' AS DateTime), CAST(N'2023-08-02T14:00:53.190' AS DateTime))
GO
INSERT [dbo].[RegisteredUser] ([Id], [Username], [Pass], [UserRole], [CreatedBy], [UpdatedBy], [DateCreated], [DateUpdated]) VALUES (N'9c77825d-c08f-4974-8d16-a2e5256d3920', N'IvyGardener', N'1vyGr33n', N'User', N'n/a', N'n/a', CAST(N'2023-08-02T14:00:53.190' AS DateTime), CAST(N'2023-08-02T14:00:53.190' AS DateTime))
GO
INSERT [dbo].[RegisteredUser] ([Id], [Username], [Pass], [UserRole], [CreatedBy], [UpdatedBy], [DateCreated], [DateUpdated]) VALUES (N'21b78c5b-f1b0-4c16-be55-be311f5b58d7', N'CathyTech', N'C@thy1234', N'User', N'n/a', N'n/a', CAST(N'2023-08-02T14:00:53.190' AS DateTime), CAST(N'2023-08-02T14:00:53.190' AS DateTime))
GO
INSERT [dbo].[RegisteredUser] ([Id], [Username], [Pass], [UserRole], [CreatedBy], [UpdatedBy], [DateCreated], [DateUpdated]) VALUES (N'e96808e8-42ca-45d5-aa95-cb09c293c59c', N'EvaArt', N'Ev@A#rtist', N'User', N'n/a', N'n/a', CAST(N'2023-08-02T14:00:53.190' AS DateTime), CAST(N'2023-08-02T14:00:53.190' AS DateTime))
GO
INSERT [dbo].[RegisteredUser] ([Id], [Username], [Pass], [UserRole], [CreatedBy], [UpdatedBy], [DateCreated], [DateUpdated]) VALUES (N'959de864-9588-4512-a3dc-e61e95fe5377', N'Dave_Gamer', N'Dav3G@m3', N'User', N'n/a', N'n/a', CAST(N'2023-08-02T14:00:53.190' AS DateTime), CAST(N'2023-08-02T14:00:53.190' AS DateTime))
GO
INSERT [dbo].[Review] ([Id], [Title], [Comment], [Rating], [BoardGameId], [CreatedBy], [UpdatedBy], [DateCreated], [DateUpdated], [RegisteredUserId]) VALUES (N'4522063b-c1ad-4e74-a67f-020b55d609a6', N'I like it a lot', N'A wild ride that''s full of adventure. Much like exploring an untamed wilderness, thrilling but can be overwhelming.', 4, N'f19d19c6-792a-42d9-beea-ec977c058745', N'IvyGardener', N'n/a', CAST(N'2023-08-03T10:52:19.723' AS DateTime), CAST(N'2023-08-03T10:52:19.723' AS DateTime), N'9c77825d-c08f-4974-8d16-a2e5256d3920')
GO
INSERT [dbo].[Review] ([Id], [Title], [Comment], [Rating], [BoardGameId], [CreatedBy], [UpdatedBy], [DateCreated], [DateUpdated], [RegisteredUserId]) VALUES (N'abcd5d2b-29db-4399-a044-029ee54d7e3a', N'Loved it!', N'Saddle up for an exciting journey in the Wild West. A well-crafted game with great replay value.', 4, N'f19d19c6-792a-42d9-beea-ec977c058745', N'Dummy42', N'n/a', CAST(N'2023-08-03T10:52:19.630' AS DateTime), CAST(N'2023-08-03T10:52:19.630' AS DateTime), N'0ae0f5ff-d5e2-4f65-947e-49c0c046d44d')
GO
INSERT [dbo].[Review] ([Id], [Title], [Comment], [Rating], [BoardGameId], [CreatedBy], [UpdatedBy], [DateCreated], [DateUpdated], [RegisteredUserId]) VALUES (N'2901f2a5-2be3-4c71-afa0-041429e255ef', N'Well worth it', N'The ultimate word game that challenges your vocabulary. A classic that never gets old.', 5, N'ac13abe5-c2d3-4de6-854c-7bbe50b2bb6e', N'CathyTech', N'n/a', CAST(N'2023-08-03T10:52:19.703' AS DateTime), CAST(N'2023-08-03T10:52:19.703' AS DateTime), N'21b78c5b-f1b0-4c16-be55-be311f5b58d7')
GO
INSERT [dbo].[Review] ([Id], [Title], [Comment], [Rating], [BoardGameId], [CreatedBy], [UpdatedBy], [DateCreated], [DateUpdated], [RegisteredUserId]) VALUES (N'77ec2a3c-852e-47a8-8e27-0611d25141e3', N'It was interesting', N'Sail the high seas in this swashbuckling adventure. A treasure of fun for the whole family.', 4, N'621fac3f-fb10-4475-ac33-1b1b6435eac8', N'CathyTech', N'n/a', CAST(N'2023-08-03T10:52:19.677' AS DateTime), CAST(N'2023-08-03T10:52:19.677' AS DateTime), N'21b78c5b-f1b0-4c16-be55-be311f5b58d7')
GO
INSERT [dbo].[Review] ([Id], [Title], [Comment], [Rating], [BoardGameId], [CreatedBy], [UpdatedBy], [DateCreated], [DateUpdated], [RegisteredUserId]) VALUES (N'b67e89b2-162f-4cb8-9230-07419f3946e4', N'Love it', N'A unique game with a sci-fi twist. Engaging but requires a lot of setup.', 4, N'e28c31f8-42ef-495f-bbbc-41ea117b25ff', N'BobDylan', N'n/a', CAST(N'2023-08-03T10:52:19.700' AS DateTime), CAST(N'2023-08-03T10:52:19.700' AS DateTime), N'b7b94a79-26a4-4c4b-934d-437f9d85378c')
GO
INSERT [dbo].[Review] ([Id], [Title], [Comment], [Rating], [BoardGameId], [CreatedBy], [UpdatedBy], [DateCreated], [DateUpdated], [RegisteredUserId]) VALUES (N'c82505fa-19f8-49f0-b450-0880e99c2113', N'Not too great', N'A deep-sea adventure that feels shallow in gameplay. Interesting concept but needs improvement.', 2, N'3620dfd2-8b15-4a9a-9f89-ea6fbc393ba4', N'Dave_Gamer', N'n/a', CAST(N'2023-08-03T10:52:19.707' AS DateTime), CAST(N'2023-08-03T10:52:19.707' AS DateTime), N'959de864-9588-4512-a3dc-e61e95fe5377')
GO
INSERT [dbo].[Review] ([Id], [Title], [Comment], [Rating], [BoardGameId], [CreatedBy], [UpdatedBy], [DateCreated], [DateUpdated], [RegisteredUserId]) VALUES (N'efa0a06d-d092-42f4-aef2-08bfc916bfdb', N'Excellent fun!!!', N'A creative and artistic game. A tasty blend of imagination and strategy.', 5, N'9e1b951c-eebd-4eb3-8119-6fe1c90ecc8a', N'FrankCook', N'n/a', CAST(N'2023-08-03T10:52:19.687' AS DateTime), CAST(N'2023-08-03T10:52:19.687' AS DateTime), N'f6f0bdda-bf62-44a8-ac70-706eb59bafad')
GO
INSERT [dbo].[Review] ([Id], [Title], [Comment], [Rating], [BoardGameId], [CreatedBy], [UpdatedBy], [DateCreated], [DateUpdated], [RegisteredUserId]) VALUES (N'917353e1-07a3-4099-90a8-0aefea72293a', N'Scary!', N'A haunting game that truly captures the vampire theme. A bit complex but highly rewarding.', 4, N'47a39d63-1a4e-4e06-8daf-98077f59c2aa', N'Dave_Gamer', N'n/a', CAST(N'2023-08-03T10:52:19.637' AS DateTime), CAST(N'2023-08-03T10:52:19.637' AS DateTime), N'959de864-9588-4512-a3dc-e61e95fe5377')
GO
INSERT [dbo].[Review] ([Id], [Title], [Comment], [Rating], [BoardGameId], [CreatedBy], [UpdatedBy], [DateCreated], [DateUpdated], [RegisteredUserId]) VALUES (N'82e83ede-4fb2-409e-8b83-0d855fc2a096', N'Love it of course', N'A classic card game that never gets old. The simplicity of the design is its strongest point.', 4, N'9d7dad30-c0ea-44b2-811c-1e27a1072419', N'HarryBuilder', N'n/a', CAST(N'2023-08-03T10:52:19.713' AS DateTime), CAST(N'2023-08-03T10:52:19.713' AS DateTime), N'1a17a621-92e2-4e29-bbac-3ce171ecd7ee')
GO
INSERT [dbo].[Review] ([Id], [Title], [Comment], [Rating], [BoardGameId], [CreatedBy], [UpdatedBy], [DateCreated], [DateUpdated], [RegisteredUserId]) VALUES (N'46e50e7f-9d0b-4368-a447-0f2cc36add72', N'Interesting', N'A whimsical game that takes you into the world of fairy tales. Delightful but may lack challenge for some.', 3, N'd45435d7-ca16-47c1-82f9-69a2dcf99c39', N'CathyTech', N'n/a', CAST(N'2023-08-03T10:52:19.667' AS DateTime), CAST(N'2023-08-03T10:52:19.667' AS DateTime), N'21b78c5b-f1b0-4c16-be55-be311f5b58d7')
GO
INSERT [dbo].[Review] ([Id], [Title], [Comment], [Rating], [BoardGameId], [CreatedBy], [UpdatedBy], [DateCreated], [DateUpdated], [RegisteredUserId]) VALUES (N'b6e9e81d-c847-43f8-aca0-0fd6dda6ccee', N'Not bad', N'A unique theme and interesting mechanics, but somewhat lacking in replay value.', 3, N'e28c31f8-42ef-495f-bbbc-41ea117b25ff', N'AliceW', N'n/a', CAST(N'2023-08-03T10:52:19.720' AS DateTime), CAST(N'2023-08-03T10:52:19.720' AS DateTime), N'2c621cd3-8d8b-44e2-8601-52a3526d3028')
GO
INSERT [dbo].[Review] ([Id], [Title], [Comment], [Rating], [BoardGameId], [CreatedBy], [UpdatedBy], [DateCreated], [DateUpdated], [RegisteredUserId]) VALUES (N'bbdc7664-6459-467d-8408-13937cd11627', N'Ipsum Lorem', N'Vestibulum ligula urna, pharetra ac dapibus sed, posuere id tortor. Ut placerat lectus erat, sit amet feugiat massa ornare non. Etiam lorem tortor, dapibus at maximus vitae, lobortis in dui. Aliquam at mauris nec velit egestas dapibus ut blandit ipsum. Nunc ut lorem turpis. Etiam suscipit sem sit amet tempus luctus. Sed sit amet ullamcorper mauris, sagittis imperdiet orci. Vivamus viverra tempor risus ut pellentesque. Integer at erat lectus. Morbi vehicula lacinia leo. Donec vestibulum sollicitudin tellus, et luctus nisl bibendum non. ', 5, N'897f8b53-0136-4162-8bae-8509a0c160fc', N'SYSADMIN', N'n/a', CAST(N'2023-08-03T10:52:19.670' AS DateTime), CAST(N'2023-08-03T10:52:19.670' AS DateTime), N'9e96120e-a635-4f05-8c18-42d6166f2624')
GO
INSERT [dbo].[Review] ([Id], [Title], [Comment], [Rating], [BoardGameId], [CreatedBy], [UpdatedBy], [DateCreated], [DateUpdated], [RegisteredUserId]) VALUES (N'4dc7be8a-c0b0-4e22-90ad-1703f3fced56', N'Excellent for game night', N'A puzzling adventure that stirs the mind. Easy to learn but offers a real challenge. Deliciously complex!', 4, N'8af096b7-82ca-4ac3-93d2-a04a2469df95', N'FrankCook', N'n/a', CAST(N'2023-08-03T10:52:19.663' AS DateTime), CAST(N'2023-08-03T10:52:19.663' AS DateTime), N'f6f0bdda-bf62-44a8-ac70-706eb59bafad')
GO
INSERT [dbo].[Review] ([Id], [Title], [Comment], [Rating], [BoardGameId], [CreatedBy], [UpdatedBy], [DateCreated], [DateUpdated], [RegisteredUserId]) VALUES (N'02f714fa-b8bf-4363-a513-170e4b2edf8f', N'Test', N'testestest', 1, N'897f8b53-0136-4162-8bae-8509a0c160fc', N'kovac031', N'n/a', CAST(N'2023-08-03T10:52:19.627' AS DateTime), CAST(N'2023-08-03T10:52:19.627' AS DateTime), N'82252790-01cc-4b80-bc37-22fd404f1de2')
GO
INSERT [dbo].[Review] ([Id], [Title], [Comment], [Rating], [BoardGameId], [CreatedBy], [UpdatedBy], [DateCreated], [DateUpdated], [RegisteredUserId]) VALUES (N'38549f98-ef27-4909-b43e-180f58c93d6e', N'Not too fun', N'A classic card game that''s a bit bland for my taste. Good for a quick play but lacks spice.', 2, N'9d7dad30-c0ea-44b2-811c-1e27a1072419', N'FrankCook', N'n/a', CAST(N'2023-08-03T10:52:19.660' AS DateTime), CAST(N'2023-08-03T10:52:19.660' AS DateTime), N'f6f0bdda-bf62-44a8-ac70-706eb59bafad')
GO
INSERT [dbo].[Review] ([Id], [Title], [Comment], [Rating], [BoardGameId], [CreatedBy], [UpdatedBy], [DateCreated], [DateUpdated], [RegisteredUserId]) VALUES (N'249ffb4b-4a83-4389-932b-181ddbfbdc40', N'Good', N'An underwater exploration game that could use more depth in its design. The concept is intriguing, but execution lacks polish.', 3, N'3620dfd2-8b15-4a9a-9f89-ea6fbc393ba4', N'HarryBuilder', N'n/a', CAST(N'2023-08-03T10:52:19.637' AS DateTime), CAST(N'2023-08-03T10:52:19.637' AS DateTime), N'1a17a621-92e2-4e29-bbac-3ce171ecd7ee')
GO
INSERT [dbo].[Review] ([Id], [Title], [Comment], [Rating], [BoardGameId], [CreatedBy], [UpdatedBy], [DateCreated], [DateUpdated], [RegisteredUserId]) VALUES (N'e5a43edc-2d33-491e-95e9-19400bf8a0e0', N'Excellent game', N'An action-packed Wild West ride. Engaging, flavorful, and full of surprises. Yeehaw!', 5, N'f19d19c6-792a-42d9-beea-ec977c058745', N'FrankCook', N'n/a', CAST(N'2023-08-03T10:52:19.657' AS DateTime), CAST(N'2023-08-03T10:52:19.657' AS DateTime), N'f6f0bdda-bf62-44a8-ac70-706eb59bafad')
GO
INSERT [dbo].[Review] ([Id], [Title], [Comment], [Rating], [BoardGameId], [CreatedBy], [UpdatedBy], [DateCreated], [DateUpdated], [RegisteredUserId]) VALUES (N'1f28d0de-516c-49cb-b6fc-1993a1b32b04', N'Boring overall', N'A haunting experience that lacks life. It''s like a garden that needs more nurturing to truly thrive.', 2, N'47a39d63-1a4e-4e06-8daf-98077f59c2aa', N'IvyGardener', N'n/a', CAST(N'2023-08-03T10:52:19.690' AS DateTime), CAST(N'2023-08-03T10:52:19.690' AS DateTime), N'9c77825d-c08f-4974-8d16-a2e5256d3920')
GO
INSERT [dbo].[Review] ([Id], [Title], [Comment], [Rating], [BoardGameId], [CreatedBy], [UpdatedBy], [DateCreated], [DateUpdated], [RegisteredUserId]) VALUES (N'b3419120-ef78-4fda-aa3e-1b0684afe875', N'Pirates lol', N'A treasure hunting adventure that lacks real treasure. Boring and unimaginative, not worth the time.', 1, N'621fac3f-fb10-4475-ac33-1b1b6435eac8', N'GraceHacker', N'n/a', CAST(N'2023-08-03T10:52:19.723' AS DateTime), CAST(N'2023-08-03T10:52:19.723' AS DateTime), N'71269e52-04d8-4cbf-b403-8ebaabb23b99')
GO
INSERT [dbo].[Review] ([Id], [Title], [Comment], [Rating], [BoardGameId], [CreatedBy], [UpdatedBy], [DateCreated], [DateUpdated], [RegisteredUserId]) VALUES (N'2b64e5ea-4dd6-4434-a22e-1b3c22f7fd08', N'Fun fun fun!', N'A royal feast of strategy and competition. Rich in detail and endlessly entertaining.', 5, N'3f8bffa5-6f29-4398-8c3f-d59f1c4f7747', N'FrankCook', N'n/a', CAST(N'2023-08-03T10:52:19.683' AS DateTime), CAST(N'2023-08-03T10:52:19.683' AS DateTime), N'f6f0bdda-bf62-44a8-ac70-706eb59bafad')
GO
INSERT [dbo].[Review] ([Id], [Title], [Comment], [Rating], [BoardGameId], [CreatedBy], [UpdatedBy], [DateCreated], [DateUpdated], [RegisteredUserId]) VALUES (N'881b8bea-1150-40ea-bfa4-1bb5d5412e67', N'Eh, so so', N'The thematic elements are well-constructed, but the overall game lacks a cohesive structure. It feels disjointed.', 2, N'47a39d63-1a4e-4e06-8daf-98077f59c2aa', N'HarryBuilder', N'n/a', CAST(N'2023-08-03T10:52:19.630' AS DateTime), CAST(N'2023-08-03T10:52:19.630' AS DateTime), N'1a17a621-92e2-4e29-bbac-3ce171ecd7ee')
GO
INSERT [dbo].[Review] ([Id], [Title], [Comment], [Rating], [BoardGameId], [CreatedBy], [UpdatedBy], [DateCreated], [DateUpdated], [RegisteredUserId]) VALUES (N'f0c2e010-1498-4301-acf2-1bec78211abd', N'Love ittttttt', N'A beautifully designed game that encourages creativity and storytelling. A joy to play with friends and family.', 5, N'9e1b951c-eebd-4eb3-8119-6fe1c90ecc8a', N'Dummy42', N'n/a', CAST(N'2023-08-03T10:52:19.623' AS DateTime), CAST(N'2023-08-03T10:52:19.623' AS DateTime), N'0ae0f5ff-d5e2-4f65-947e-49c0c046d44d')
GO
INSERT [dbo].[Review] ([Id], [Title], [Comment], [Rating], [BoardGameId], [CreatedBy], [UpdatedBy], [DateCreated], [DateUpdated], [RegisteredUserId]) VALUES (N'83c0d0d2-cf21-4011-ae11-1c99f56401b8', N'Idk', N'An engaging Wild West theme but falls short in execution. A bit disappointing.', 2, N'f19d19c6-792a-42d9-beea-ec977c058745', N'EvaArt', N'n/a', CAST(N'2023-08-03T10:52:19.667' AS DateTime), CAST(N'2023-08-03T10:52:19.667' AS DateTime), N'e96808e8-42ca-45d5-aa95-cb09c293c59c')
GO
INSERT [dbo].[Review] ([Id], [Title], [Comment], [Rating], [BoardGameId], [CreatedBy], [UpdatedBy], [DateCreated], [DateUpdated], [RegisteredUserId]) VALUES (N'716a96b4-b2ff-4437-8c3e-1d1b9a300aea', N'Really enjoyed it', N'An intense survival game that will keep you on the edge of your seat. Perfect for fans of thrillers.', 5, N'321cbee4-c718-4855-b9a5-1afccb1afbcf', N'AliceW', N'n/a', CAST(N'2023-08-03T10:52:19.683' AS DateTime), CAST(N'2023-08-03T10:52:19.683' AS DateTime), N'2c621cd3-8d8b-44e2-8601-52a3526d3028')
GO
INSERT [dbo].[Review] ([Id], [Title], [Comment], [Rating], [BoardGameId], [CreatedBy], [UpdatedBy], [DateCreated], [DateUpdated], [RegisteredUserId]) VALUES (N'1be0b4b1-ad72-43aa-b7b1-1d4d0f83ea47', N'Love me some sci fi', N'Embark on an adventure through the cosmos. Exciting but the rules can be complex for newcomers.', 3, N'd680422b-2a42-4b28-87f5-ca1f70070729', N'Dummy42', N'n/a', CAST(N'2023-08-03T10:52:19.620' AS DateTime), CAST(N'2023-08-03T10:52:19.620' AS DateTime), N'0ae0f5ff-d5e2-4f65-947e-49c0c046d44d')
GO
INSERT [dbo].[Review] ([Id], [Title], [Comment], [Rating], [BoardGameId], [CreatedBy], [UpdatedBy], [DateCreated], [DateUpdated], [RegisteredUserId]) VALUES (N'ccbf2159-4823-4fc1-8042-1f856b44958e', N'Love this type of game', N'A global domination game that challenges your strategic skills. Innovative and clever, a true challenge!', 4, N'444e71d7-3cde-4f1b-a088-3ca963e25e00', N'GraceHacker', N'n/a', CAST(N'2023-08-03T10:52:19.620' AS DateTime), CAST(N'2023-08-03T10:52:19.620' AS DateTime), N'71269e52-04d8-4cbf-b403-8ebaabb23b99')
GO
INSERT [dbo].[Review] ([Id], [Title], [Comment], [Rating], [BoardGameId], [CreatedBy], [UpdatedBy], [DateCreated], [DateUpdated], [RegisteredUserId]) VALUES (N'0e74473a-ede3-4687-bdc7-1fffeb60c9ac', N'Not very well made', N'A family-friendly dinosaur game that''s tasty for younger players but lacks meat for adults.', 2, N'551bcaf7-03a6-4999-b160-a6716835a553', N'FrankCook', N'n/a', CAST(N'2023-08-03T10:52:19.630' AS DateTime), CAST(N'2023-08-03T10:52:19.630' AS DateTime), N'f6f0bdda-bf62-44a8-ac70-706eb59bafad')
GO
INSERT [dbo].[Review] ([Id], [Title], [Comment], [Rating], [BoardGameId], [CreatedBy], [UpdatedBy], [DateCreated], [DateUpdated], [RegisteredUserId]) VALUES (N'b67b03a8-1491-4f40-a6f5-2187c99a63e5', N'Love me sam vamps', N'A haunting game with a rich theme. Complex rules may deter some players.', 3, N'47a39d63-1a4e-4e06-8daf-98077f59c2aa', N'CathyTech', N'n/a', CAST(N'2023-08-03T10:52:19.703' AS DateTime), CAST(N'2023-08-03T10:52:19.703' AS DateTime), N'21b78c5b-f1b0-4c16-be55-be311f5b58d7')
GO
INSERT [dbo].[Review] ([Id], [Title], [Comment], [Rating], [BoardGameId], [CreatedBy], [UpdatedBy], [DateCreated], [DateUpdated], [RegisteredUserId]) VALUES (N'bfedbf61-4db5-4cb2-bbfb-245df6e6b80c', N'Excellent fun!', N'A game of deduction and association that will have you second-guessing every clue.', 5, N'd2a5a66e-93e2-4c3d-ae33-8b0f8de59e07', N'Dummy42', N'n/a', CAST(N'2023-08-03T10:52:19.677' AS DateTime), CAST(N'2023-08-03T10:52:19.677' AS DateTime), N'0ae0f5ff-d5e2-4f65-947e-49c0c046d44d')
GO
INSERT [dbo].[Review] ([Id], [Title], [Comment], [Rating], [BoardGameId], [CreatedBy], [UpdatedBy], [DateCreated], [DateUpdated], [RegisteredUserId]) VALUES (N'd9c6645d-668e-42c9-aa8d-29f2d50190a7', N'Zooombieees', N'A thrilling survival game with an exciting zombie theme. Could use a bit more balance.', 3, N'321cbee4-c718-4855-b9a5-1afccb1afbcf', N'EvaArt', N'n/a', CAST(N'2023-08-03T10:52:19.657' AS DateTime), CAST(N'2023-08-03T10:52:19.657' AS DateTime), N'e96808e8-42ca-45d5-aa95-cb09c293c59c')
GO
INSERT [dbo].[Review] ([Id], [Title], [Comment], [Rating], [BoardGameId], [CreatedBy], [UpdatedBy], [DateCreated], [DateUpdated], [RegisteredUserId]) VALUES (N'be5fa895-b62f-4057-b49f-2d5fa74ad05b', N'Dark theme', N'A gothic and atmospheric game that creates an immersive experience, but some might find it too dark.', 3, N'47a39d63-1a4e-4e06-8daf-98077f59c2aa', N'AliceW', N'n/a', CAST(N'2023-08-03T10:52:19.620' AS DateTime), CAST(N'2023-08-03T10:52:19.620' AS DateTime), N'2c621cd3-8d8b-44e2-8601-52a3526d3028')
GO
INSERT [dbo].[Review] ([Id], [Title], [Comment], [Rating], [BoardGameId], [CreatedBy], [UpdatedBy], [DateCreated], [DateUpdated], [RegisteredUserId]) VALUES (N'2e453169-bc05-40b3-8cf4-2e51f42f6c15', N'Fun!', N'A quick and fun matching game that tests your reflexes. Great for all ages!', 4, N'fcafd866-48db-4d9b-a104-62ccb211a6ac', N'BobDylan', N'n/a', CAST(N'2023-08-03T10:52:19.700' AS DateTime), CAST(N'2023-08-03T10:52:19.700' AS DateTime), N'b7b94a79-26a4-4c4b-934d-437f9d85378c')
GO
INSERT [dbo].[Review] ([Id], [Title], [Comment], [Rating], [BoardGameId], [CreatedBy], [UpdatedBy], [DateCreated], [DateUpdated], [RegisteredUserId]) VALUES (N'a32027ba-c199-4730-a7d7-2f27495380f6', N'So cool', N'A creative take on time-traveling. Some mechanics feel gimmicky, but overall a good play.', 3, N'3b57dec8-e374-41b6-8b10-0964199df9f7', N'Dave_Gamer', N'n/a', CAST(N'2023-08-03T10:52:19.700' AS DateTime), CAST(N'2023-08-03T10:52:19.700' AS DateTime), N'959de864-9588-4512-a3dc-e61e95fe5377')
GO
INSERT [dbo].[Review] ([Id], [Title], [Comment], [Rating], [BoardGameId], [CreatedBy], [UpdatedBy], [DateCreated], [DateUpdated], [RegisteredUserId]) VALUES (N'4a40e19a-ddc8-4f70-b8b1-31494a718888', N'It was ok', N'A delightful game for fairy tale lovers. Lacks complexity but makes up for it with charm.', 3, N'd45435d7-ca16-47c1-82f9-69a2dcf99c39', N'Dave_Gamer', N'n/a', CAST(N'2023-08-03T10:52:19.627' AS DateTime), CAST(N'2023-08-03T10:52:19.627' AS DateTime), N'959de864-9588-4512-a3dc-e61e95fe5377')
GO
INSERT [dbo].[Review] ([Id], [Title], [Comment], [Rating], [BoardGameId], [CreatedBy], [UpdatedBy], [DateCreated], [DateUpdated], [RegisteredUserId]) VALUES (N'cb9cd0e2-0325-433c-a97e-31f7a899d434', N'Dinosaurs!', N'A thrilling journey through a park filled with dinosaurs. The theme is exciting, but the game mechanics might be too simple for seasoned players.', 3, N'551bcaf7-03a6-4999-b160-a6716835a553', N'Dummy42', N'n/a', CAST(N'2023-08-03T10:52:19.670' AS DateTime), CAST(N'2023-08-03T10:52:19.670' AS DateTime), N'0ae0f5ff-d5e2-4f65-947e-49c0c046d44d')
GO
INSERT [dbo].[Review] ([Id], [Title], [Comment], [Rating], [BoardGameId], [CreatedBy], [UpdatedBy], [DateCreated], [DateUpdated], [RegisteredUserId]) VALUES (N'506b5aee-e718-4690-a38b-3329051d1851', N'Enjoy it', N'An artful blend of strategy and cunning. A visually captivating game that''s fun and engaging.', 5, N'6042bcd9-9938-40ed-a102-0d9a98313310', N'EvaArt', N'n/a', CAST(N'2023-08-03T10:52:19.660' AS DateTime), CAST(N'2023-08-03T10:52:19.660' AS DateTime), N'e96808e8-42ca-45d5-aa95-cb09c293c59c')
GO
INSERT [dbo].[Review] ([Id], [Title], [Comment], [Rating], [BoardGameId], [CreatedBy], [UpdatedBy], [DateCreated], [DateUpdated], [RegisteredUserId]) VALUES (N'd54d94b8-692d-4ea0-855d-3351bfbf6ec5', N'Aweeeeeesome game', N'A dark and thrilling game that sinks its teeth into you. Immersive and flavorful.', 5, N'47a39d63-1a4e-4e06-8daf-98077f59c2aa', N'FrankCook', N'n/a', CAST(N'2023-08-03T10:52:19.633' AS DateTime), CAST(N'2023-08-03T10:52:19.633' AS DateTime), N'f6f0bdda-bf62-44a8-ac70-706eb59bafad')
GO
INSERT [dbo].[Review] ([Id], [Title], [Comment], [Rating], [BoardGameId], [CreatedBy], [UpdatedBy], [DateCreated], [DateUpdated], [RegisteredUserId]) VALUES (N'de35631b-344f-4323-afdf-33535341a13c', N'Love it', N'A masterpiece of strategy and resource management. A must-play for anyone serious about board games.', 5, N'6042bcd9-9938-40ed-a102-0d9a98313310', N'Dave_Gamer', N'n/a', CAST(N'2023-08-03T10:52:19.657' AS DateTime), CAST(N'2023-08-03T10:52:19.657' AS DateTime), N'959de864-9588-4512-a3dc-e61e95fe5377')
GO
INSERT [dbo].[Review] ([Id], [Title], [Comment], [Rating], [BoardGameId], [CreatedBy], [UpdatedBy], [DateCreated], [DateUpdated], [RegisteredUserId]) VALUES (N'a6e66be0-d834-47f8-a389-3628151c085e', N'It''s a ... TREASURE of a game :D', N'A plundering good time but with a barren design. Needs more cultivation to truly thrive.', 3, N'621fac3f-fb10-4475-ac33-1b1b6435eac8', N'IvyGardener', N'n/a', CAST(N'2023-08-03T10:52:19.697' AS DateTime), CAST(N'2023-08-03T10:52:19.697' AS DateTime), N'9c77825d-c08f-4974-8d16-a2e5256d3920')
GO
INSERT [dbo].[Review] ([Id], [Title], [Comment], [Rating], [BoardGameId], [CreatedBy], [UpdatedBy], [DateCreated], [DateUpdated], [RegisteredUserId]) VALUES (N'8db316d7-8468-4f28-bb16-36e5395eef37', N'Won''t play much I think', N'Explore the deep sea and discover its secrets. A refreshing theme but the gameplay lacks depth.', 2, N'3620dfd2-8b15-4a9a-9f89-ea6fbc393ba4', N'Dummy42', N'n/a', CAST(N'2023-08-03T10:52:19.623' AS DateTime), CAST(N'2023-08-03T10:52:19.623' AS DateTime), N'0ae0f5ff-d5e2-4f65-947e-49c0c046d44d')
GO
INSERT [dbo].[Review] ([Id], [Title], [Comment], [Rating], [BoardGameId], [CreatedBy], [UpdatedBy], [DateCreated], [DateUpdated], [RegisteredUserId]) VALUES (N'1fc39b26-7a2d-4b82-ae63-372e3287c325', N'Ok', N'A classic word game that can be both fun and frustrating. Bring your best vocabulary!', 3, N'ac13abe5-c2d3-4de6-854c-7bbe50b2bb6e', N'Dummy42', N'n/a', CAST(N'2023-08-03T10:52:19.630' AS DateTime), CAST(N'2023-08-03T10:52:19.630' AS DateTime), N'0ae0f5ff-d5e2-4f65-947e-49c0c046d44d')
GO
INSERT [dbo].[Review] ([Id], [Title], [Comment], [Rating], [BoardGameId], [CreatedBy], [UpdatedBy], [DateCreated], [DateUpdated], [RegisteredUserId]) VALUES (N'42125ce3-9e9d-4b84-ad02-398834c6b3a0', N'Excellent', N'A timeless strategy game that fosters negotiation and planning. A must-have for board game enthusiasts.', 5, N'6042bcd9-9938-40ed-a102-0d9a98313310', N'BobDylan', N'n/a', CAST(N'2023-08-03T10:52:19.627' AS DateTime), CAST(N'2023-08-03T10:52:19.627' AS DateTime), N'b7b94a79-26a4-4c4b-934d-437f9d85378c')
GO
INSERT [dbo].[Review] ([Id], [Title], [Comment], [Rating], [BoardGameId], [CreatedBy], [UpdatedBy], [DateCreated], [DateUpdated], [RegisteredUserId]) VALUES (N'17858622-1141-489f-8575-39d06f2c72fc', N'Ok I guess', N'A puzzling game that''s fun but can become repetitive. Good for a casual game night.', 3, N'8af096b7-82ca-4ac3-93d2-a04a2469df95', N'Dave_Gamer', N'n/a', CAST(N'2023-08-03T10:52:19.637' AS DateTime), CAST(N'2023-08-03T10:52:19.637' AS DateTime), N'959de864-9588-4512-a3dc-e61e95fe5377')
GO
INSERT [dbo].[Review] ([Id], [Title], [Comment], [Rating], [BoardGameId], [CreatedBy], [UpdatedBy], [DateCreated], [DateUpdated], [RegisteredUserId]) VALUES (N'c051145a-dba5-4a29-9a0e-3b9373baa026', N'Amazing game!', N'A magical and enchanting experience that transports you to another world. Simply beautiful!', 5, N'687b4366-be2b-40c7-a484-51a8701119aa', N'AliceW', N'n/a', CAST(N'2023-08-03T10:52:19.680' AS DateTime), CAST(N'2023-08-03T10:52:19.680' AS DateTime), N'2c621cd3-8d8b-44e2-8601-52a3526d3028')
GO
INSERT [dbo].[Review] ([Id], [Title], [Comment], [Rating], [BoardGameId], [CreatedBy], [UpdatedBy], [DateCreated], [DateUpdated], [RegisteredUserId]) VALUES (N'6ce94df5-0a64-49c7-ac79-3c8ddcc76163', N'Great!', N'A resource management game that has stood the test of time. Brilliantly designed but can be slow-paced.', 4, N'6042bcd9-9938-40ed-a102-0d9a98313310', N'GraceHacker', N'n/a', CAST(N'2023-08-03T10:52:19.653' AS DateTime), CAST(N'2023-08-03T10:52:19.653' AS DateTime), N'71269e52-04d8-4cbf-b403-8ebaabb23b99')
GO
INSERT [dbo].[Review] ([Id], [Title], [Comment], [Rating], [BoardGameId], [CreatedBy], [UpdatedBy], [DateCreated], [DateUpdated], [RegisteredUserId]) VALUES (N'41db27d6-5531-46ef-b213-3f5866df7c6b', N'Never gets old!', N'Scrabble is a classic game that never gets old. It''s a great way to challenge your vocabulary and strategy skills   while having fun with friends and family. The game board and tiles are well-made, and the game is easy to learn but hard to master. I highly recommend it!', 5, N'ac13abe5-c2d3-4de6-854c-7bbe50b2bb6e', N'SYSADMIN', N'n/a', CAST(N'2023-08-03T10:52:19.720' AS DateTime), CAST(N'2023-08-03T10:52:19.720' AS DateTime), N'9e96120e-a635-4f05-8c18-42d6166f2624')
GO
INSERT [dbo].[Review] ([Id], [Title], [Comment], [Rating], [BoardGameId], [CreatedBy], [UpdatedBy], [DateCreated], [DateUpdated], [RegisteredUserId]) VALUES (N'425516ff-e1df-4b73-a9dc-3fb9d6c8e1ea', N'Ok', N'A whimsical journey through a magical forest. Sweet and light, but could use more complexity.', 3, N'687b4366-be2b-40c7-a484-51a8701119aa', N'FrankCook', N'n/a', CAST(N'2023-08-03T10:52:19.713' AS DateTime), CAST(N'2023-08-03T10:52:19.713' AS DateTime), N'f6f0bdda-bf62-44a8-ac70-706eb59bafad')
GO
INSERT [dbo].[Review] ([Id], [Title], [Comment], [Rating], [BoardGameId], [CreatedBy], [UpdatedBy], [DateCreated], [DateUpdated], [RegisteredUserId]) VALUES (N'3be55bf8-6da6-4112-a87d-413f9c2d4169', N'Not bad', N'A magical journey through an enchanted forest. Charming but could use more complexity.', 3, N'687b4366-be2b-40c7-a484-51a8701119aa', N'CathyTech', N'n/a', CAST(N'2023-08-03T10:52:19.637' AS DateTime), CAST(N'2023-08-03T10:52:19.637' AS DateTime), N'21b78c5b-f1b0-4c16-be55-be311f5b58d7')
GO
INSERT [dbo].[Review] ([Id], [Title], [Comment], [Rating], [BoardGameId], [CreatedBy], [UpdatedBy], [DateCreated], [DateUpdated], [RegisteredUserId]) VALUES (N'e98283cd-aaac-4211-8ff6-44ce5c77a504', N'Fun of curse', N'A simple and fast-paced game that''s great for quick fun but lacks the structural complexity I look for.', 3, N'fcafd866-48db-4d9b-a104-62ccb211a6ac', N'HarryBuilder', N'n/a', CAST(N'2023-08-03T10:52:19.723' AS DateTime), CAST(N'2023-08-03T10:52:19.723' AS DateTime), N'1a17a621-92e2-4e29-bbac-3ce171ecd7ee')
GO
INSERT [dbo].[Review] ([Id], [Title], [Comment], [Rating], [BoardGameId], [CreatedBy], [UpdatedBy], [DateCreated], [DateUpdated], [RegisteredUserId]) VALUES (N'3d1c2e24-ad4f-4ac7-b649-4514b61b8d64', N'Loveeeee', N'A thrilling Western experience with detailed design and immersive gameplay. Truly a standout!', 5, N'f19d19c6-792a-42d9-beea-ec977c058745', N'HarryBuilder', N'n/a', CAST(N'2023-08-03T10:52:19.630' AS DateTime), CAST(N'2023-08-03T10:52:19.630' AS DateTime), N'1a17a621-92e2-4e29-bbac-3ce171ecd7ee')
GO
INSERT [dbo].[Review] ([Id], [Title], [Comment], [Rating], [BoardGameId], [CreatedBy], [UpdatedBy], [DateCreated], [DateUpdated], [RegisteredUserId]) VALUES (N'6d138576-9531-4479-a65e-456e28d0a56a', N'It was interesting', N'A futuristic game with a stunning visual design. Gameplay could be more engaging.', 3, N'2d7ddd20-0ad1-4d69-88b8-f5a98569adc5', N'EvaArt', N'n/a', CAST(N'2023-08-03T10:52:19.717' AS DateTime), CAST(N'2023-08-03T10:52:19.717' AS DateTime), N'e96808e8-42ca-45d5-aa95-cb09c293c59c')
GO
INSERT [dbo].[Review] ([Id], [Title], [Comment], [Rating], [BoardGameId], [CreatedBy], [UpdatedBy], [DateCreated], [DateUpdated], [RegisteredUserId]) VALUES (N'ca532443-656a-40cb-99ae-46dc74ae53fd', N'Eh', N'A futuristic robot game that''s a bit robotic in design. Interesting but needs more soul.', 2, N'e28c31f8-42ef-495f-bbbc-41ea117b25ff', N'FrankCook', N'n/a', CAST(N'2023-08-03T10:52:19.720' AS DateTime), CAST(N'2023-08-03T10:52:19.720' AS DateTime), N'f6f0bdda-bf62-44a8-ac70-706eb59bafad')
GO
INSERT [dbo].[Review] ([Id], [Title], [Comment], [Rating], [BoardGameId], [CreatedBy], [UpdatedBy], [DateCreated], [DateUpdated], [RegisteredUserId]) VALUES (N'f536da79-14ac-4e7b-872f-4a6619a13241', N'I really liked it', N'A true classic, but not for the faint of heart. Prepare for a long and challenging battle.', 4, N'444e71d7-3cde-4f1b-a088-3ca963e25e00', N'AliceW', N'n/a', CAST(N'2023-08-03T10:52:19.720' AS DateTime), CAST(N'2023-08-03T10:52:19.720' AS DateTime), N'2c621cd3-8d8b-44e2-8601-52a3526d3028')
GO
INSERT [dbo].[Review] ([Id], [Title], [Comment], [Rating], [BoardGameId], [CreatedBy], [UpdatedBy], [DateCreated], [DateUpdated], [RegisteredUserId]) VALUES (N'b34ca538-6880-49a0-a683-4d3ef09dc5ab', N'Great fun!', N'A fast-paced matching game that''s always a hit. Suitable for all ages.', 5, N'fcafd866-48db-4d9b-a104-62ccb211a6ac', N'CathyTech', N'n/a', CAST(N'2023-08-03T10:52:19.673' AS DateTime), CAST(N'2023-08-03T10:52:19.673' AS DateTime), N'21b78c5b-f1b0-4c16-be55-be311f5b58d7')
GO
INSERT [dbo].[Review] ([Id], [Title], [Comment], [Rating], [BoardGameId], [CreatedBy], [UpdatedBy], [DateCreated], [DateUpdated], [RegisteredUserId]) VALUES (N'0c5abcea-3934-4186-b543-4d73e61360c1', N'Fun game', N'A thrilling cooperative game that teaches teamwork. Some might find it too difficult, but the challenge is part of the fun.', 4, N'2e6dc62d-8c91-48b7-a7e5-959b286b41ff', N'Dave_Gamer', N'n/a', CAST(N'2023-08-03T10:52:19.680' AS DateTime), CAST(N'2023-08-03T10:52:19.680' AS DateTime), N'959de864-9588-4512-a3dc-e61e95fe5377')
GO
INSERT [dbo].[Review] ([Id], [Title], [Comment], [Rating], [BoardGameId], [CreatedBy], [UpdatedBy], [DateCreated], [DateUpdated], [RegisteredUserId]) VALUES (N'8c700734-4c1d-46b4-abe3-50ff0e9ab106', N'Yeeeeeeee', N'I absolutely love Uno! It''s a classic card game that never gets old. The game is easy to learn but has endless possibilities for strategy and   fun. The different cards add a level of excitement to the game, and the game is perfect for both casual and competitive play.   The packaging and cards are also well-made and durable, which ensures the game can be enjoyed for years to come.   I highly recommend Uno to anyone looking for a fun and engaging card game that can be enjoyed by people of all ages.', 5, N'9d7dad30-c0ea-44b2-811c-1e27a1072419', N'SYSADMIN', N'n/a', CAST(N'2023-08-03T10:52:19.633' AS DateTime), CAST(N'2023-08-03T10:52:19.633' AS DateTime), N'9e96120e-a635-4f05-8c18-42d6166f2624')
GO
INSERT [dbo].[Review] ([Id], [Title], [Comment], [Rating], [BoardGameId], [CreatedBy], [UpdatedBy], [DateCreated], [DateUpdated], [RegisteredUserId]) VALUES (N'ddeaca84-2929-41cb-ae95-513fb749777e', N'IDK', N'A puzzling game with a unique approach. It''s engaging but can become repetitive over time.', 2, N'8af096b7-82ca-4ac3-93d2-a04a2469df95', N'Dummy42', N'n/a', CAST(N'2023-08-03T10:52:19.663' AS DateTime), CAST(N'2023-08-03T10:52:19.663' AS DateTime), N'0ae0f5ff-d5e2-4f65-947e-49c0c046d44d')
GO
INSERT [dbo].[Review] ([Id], [Title], [Comment], [Rating], [BoardGameId], [CreatedBy], [UpdatedBy], [DateCreated], [DateUpdated], [RegisteredUserId]) VALUES (N'f257f533-c247-474a-81e7-51b1c3500190', N'Interesting!', N'An engaging cooperative game with real tension. A bit too challenging for some, but an excellent choice for strategy lovers.', 4, N'2e6dc62d-8c91-48b7-a7e5-959b286b41ff', N'BobDylan', N'n/a', CAST(N'2023-08-03T10:52:19.627' AS DateTime), CAST(N'2023-08-03T10:52:19.627' AS DateTime), N'b7b94a79-26a4-4c4b-934d-437f9d85378c')
GO
INSERT [dbo].[Review] ([Id], [Title], [Comment], [Rating], [BoardGameId], [CreatedBy], [UpdatedBy], [DateCreated], [DateUpdated], [RegisteredUserId]) VALUES (N'9e95a0a7-0538-4f00-ba14-52498b94674b', N'Tested and true', N'A well-constructed game that explores the cosmos. Engaging gameplay and thoughtful design.', 4, N'd680422b-2a42-4b28-87f5-ca1f70070729', N'HarryBuilder', N'n/a', CAST(N'2023-08-03T10:52:19.660' AS DateTime), CAST(N'2023-08-03T10:52:19.660' AS DateTime), N'1a17a621-92e2-4e29-bbac-3ce171ecd7ee')
GO
INSERT [dbo].[Review] ([Id], [Title], [Comment], [Rating], [BoardGameId], [CreatedBy], [UpdatedBy], [DateCreated], [DateUpdated], [RegisteredUserId]) VALUES (N'a462e5ad-353a-4b30-b2f2-528a1527724e', N'Liked it a lot', N'I really enjoyed playing Settlers of Catan. The game is easy to learn but offers a lot of strategic depth, which keeps things interesting.   The game board and pieces are high-quality and visually appealing, and the game mechanics are well-designed. The game is also highly replayable,   with different strategies and outcomes each time you play. The only downside is that the game can take a while to play, which may not be suitable for everyone.   Overall, I highly recommend Settlers of Catan to anyone who enjoys strategy games and is looking for a fun and challenging experience.', 4, N'6042bcd9-9938-40ed-a102-0d9a98313310', N'SYSADMIN', N'n/a', CAST(N'2023-08-03T10:52:19.700' AS DateTime), CAST(N'2023-08-03T10:52:19.700' AS DateTime), N'9e96120e-a635-4f05-8c18-42d6166f2624')
GO
INSERT [dbo].[Review] ([Id], [Title], [Comment], [Rating], [BoardGameId], [CreatedBy], [UpdatedBy], [DateCreated], [DateUpdated], [RegisteredUserId]) VALUES (N'4f165875-cbe9-44db-b861-545b372e8490', N'What to say', N'An innovative concept that lacks polish. Interesting but needs more depth to be truly great.', 2, N'81749d28-a4dc-4d70-aeac-9a62c9b5dca5', N'Dave_Gamer', N'n/a', CAST(N'2023-08-03T10:52:19.677' AS DateTime), CAST(N'2023-08-03T10:52:19.677' AS DateTime), N'959de864-9588-4512-a3dc-e61e95fe5377')
GO
INSERT [dbo].[Review] ([Id], [Title], [Comment], [Rating], [BoardGameId], [CreatedBy], [UpdatedBy], [DateCreated], [DateUpdated], [RegisteredUserId]) VALUES (N'0b50fc9d-b7dd-486e-b41a-566006e3ff26', N'Eh', N'A classic card game that never gets old. Simple but still entertaining.', 3, N'9d7dad30-c0ea-44b2-811c-1e27a1072419', N'EvaArt', N'n/a', CAST(N'2023-08-03T10:52:19.627' AS DateTime), CAST(N'2023-08-03T10:52:19.627' AS DateTime), N'e96808e8-42ca-45d5-aa95-cb09c293c59c')
GO
INSERT [dbo].[Review] ([Id], [Title], [Comment], [Rating], [BoardGameId], [CreatedBy], [UpdatedBy], [DateCreated], [DateUpdated], [RegisteredUserId]) VALUES (N'a91f55f5-cd0b-4abb-8090-580bbf603ccc', N'5/5', N'A blossoming concept that takes you through time and space. Unique and well-designed like a timeless garden piece.', 5, N'3b57dec8-e374-41b6-8b10-0964199df9f7', N'IvyGardener', N'n/a', CAST(N'2023-08-03T10:52:19.667' AS DateTime), CAST(N'2023-08-03T10:52:19.667' AS DateTime), N'9c77825d-c08f-4974-8d16-a2e5256d3920')
GO
INSERT [dbo].[Review] ([Id], [Title], [Comment], [Rating], [BoardGameId], [CreatedBy], [UpdatedBy], [DateCreated], [DateUpdated], [RegisteredUserId]) VALUES (N'8494621a-79d6-4580-bc1e-58362d6f941e', N'Won''t play much', N'An underwater game that fails to dive deep. Lacks complexity and real adventure.', 2, N'3620dfd2-8b15-4a9a-9f89-ea6fbc393ba4', N'GraceHacker', N'n/a', CAST(N'2023-08-03T10:52:19.690' AS DateTime), CAST(N'2023-08-03T10:52:19.690' AS DateTime), N'71269e52-04d8-4cbf-b403-8ebaabb23b99')
GO
INSERT [dbo].[Review] ([Id], [Title], [Comment], [Rating], [BoardGameId], [CreatedBy], [UpdatedBy], [DateCreated], [DateUpdated], [RegisteredUserId]) VALUES (N'14e9a106-f5e3-4f1a-8e6a-58def3322d3d', N'Not that fun', N'A space adventure that lacks a bit of innovation. The visuals are appealing, but gameplay needs improvement.', 2, N'd680422b-2a42-4b28-87f5-ca1f70070729', N'EvaArt', N'n/a', CAST(N'2023-08-03T10:52:19.710' AS DateTime), CAST(N'2023-08-03T10:52:19.710' AS DateTime), N'e96808e8-42ca-45d5-aa95-cb09c293c59c')
GO
INSERT [dbo].[Review] ([Id], [Title], [Comment], [Rating], [BoardGameId], [CreatedBy], [UpdatedBy], [DateCreated], [DateUpdated], [RegisteredUserId]) VALUES (N'718563b9-5c7f-4c2f-b2ae-5ae3f4cbd5cd', N'So imaginative', N'An exploration game with depth and beauty. It''s like diving into an underwater garden, full of surprises.', 5, N'3620dfd2-8b15-4a9a-9f89-ea6fbc393ba4', N'IvyGardener', N'n/a', CAST(N'2023-08-03T10:52:19.683' AS DateTime), CAST(N'2023-08-03T10:52:19.683' AS DateTime), N'9c77825d-c08f-4974-8d16-a2e5256d3920')
GO
INSERT [dbo].[Review] ([Id], [Title], [Comment], [Rating], [BoardGameId], [CreatedBy], [UpdatedBy], [DateCreated], [DateUpdated], [RegisteredUserId]) VALUES (N'4bcd18d4-6421-41a2-864a-61966c1254cd', N'Meh', N'A futuristic rebellion that falls flat in execution. Interesting theme but lacking in fun gameplay.', 2, N'e28c31f8-42ef-495f-bbbc-41ea117b25ff', N'Dave_Gamer', N'n/a', CAST(N'2023-08-03T10:52:19.697' AS DateTime), CAST(N'2023-08-03T10:52:19.697' AS DateTime), N'959de864-9588-4512-a3dc-e61e95fe5377')
GO
INSERT [dbo].[Review] ([Id], [Title], [Comment], [Rating], [BoardGameId], [CreatedBy], [UpdatedBy], [DateCreated], [DateUpdated], [RegisteredUserId]) VALUES (N'f840cea4-e6d1-4c3f-8484-6271696ccf6d', N'2/5', N'A fun and accessible game for all ages, but experienced gamers might find it too simple.', 2, N'551bcaf7-03a6-4999-b160-a6716835a553', N'AliceW', N'n/a', CAST(N'2023-08-03T10:52:19.720' AS DateTime), CAST(N'2023-08-03T10:52:19.720' AS DateTime), N'2c621cd3-8d8b-44e2-8601-52a3526d3028')
GO
INSERT [dbo].[Review] ([Id], [Title], [Comment], [Rating], [BoardGameId], [CreatedBy], [UpdatedBy], [DateCreated], [DateUpdated], [RegisteredUserId]) VALUES (N'7dd25ed1-38bd-4c17-8e1c-63e1037d4bfd', N'Not too much fun', N'A whimsical game that falls flat. Lacks innovation and complexity, leaving much to be desired.', 2, N'd45435d7-ca16-47c1-82f9-69a2dcf99c39', N'GraceHacker', N'n/a', CAST(N'2023-08-03T10:52:19.650' AS DateTime), CAST(N'2023-08-03T10:52:19.650' AS DateTime), N'71269e52-04d8-4cbf-b403-8ebaabb23b99')
GO
INSERT [dbo].[Review] ([Id], [Title], [Comment], [Rating], [BoardGameId], [CreatedBy], [UpdatedBy], [DateCreated], [DateUpdated], [RegisteredUserId]) VALUES (N'89405d3e-8bd2-483b-87a5-645b0b8f1e51', N'ARRRRRRR', N'A swashbuckling adventure that''s full of excitement, though the build quality of the pieces could be better.', 3, N'621fac3f-fb10-4475-ac33-1b1b6435eac8', N'HarryBuilder', N'n/a', CAST(N'2023-08-03T10:52:19.687' AS DateTime), CAST(N'2023-08-03T10:52:19.687' AS DateTime), N'1a17a621-92e2-4e29-bbac-3ce171ecd7ee')
GO
INSERT [dbo].[Review] ([Id], [Title], [Comment], [Rating], [BoardGameId], [CreatedBy], [UpdatedBy], [DateCreated], [DateUpdated], [RegisteredUserId]) VALUES (N'6bf6e262-f44c-4a5c-9401-6550f21567db', N'It''s ok', N'On one hand, I love the challenge of coming up with new words and trying to score big points.   The game is well-made, with high-quality tiles and a sturdy game board. However, the game can be slow-paced and can take a while to play,   which can be frustrating if you''re short on time. Additionally, the scoring system can be confusing at times, and it can be difficult   to keep track of all the letters on the board. Overall, I would recommend Scrabble to those who enjoy word games and are looking for a mental challenge,   but it''s not for everyone.', 3, N'ac13abe5-c2d3-4de6-854c-7bbe50b2bb6e', N'SYSADMIN', N'n/a', CAST(N'2023-08-03T10:52:19.633' AS DateTime), CAST(N'2023-08-03T10:52:19.633' AS DateTime), N'9e96120e-a635-4f05-8c18-42d6166f2624')
GO
INSERT [dbo].[Review] ([Id], [Title], [Comment], [Rating], [BoardGameId], [CreatedBy], [UpdatedBy], [DateCreated], [DateUpdated], [RegisteredUserId]) VALUES (N'd0e8f78e-e5d9-4c82-9f16-6599e34064a2', N'Cool', N'A thrilling survival game set in space. It''s a feast for the eyes but could use more depth in strategy.', 3, N'81749d28-a4dc-4d70-aeac-9a62c9b5dca5', N'FrankCook', N'n/a', CAST(N'2023-08-03T10:52:19.633' AS DateTime), CAST(N'2023-08-03T10:52:19.633' AS DateTime), N'f6f0bdda-bf62-44a8-ac70-706eb59bafad')
GO
INSERT [dbo].[Review] ([Id], [Title], [Comment], [Rating], [BoardGameId], [CreatedBy], [UpdatedBy], [DateCreated], [DateUpdated], [RegisteredUserId]) VALUES (N'4ba10abf-e5ab-4f55-8dc1-67ed5bab9574', N'Ingenious!', N'A classic word game that never gets old. Educational and fun for word lovers.', 5, N'ac13abe5-c2d3-4de6-854c-7bbe50b2bb6e', N'BobDylan', N'n/a', CAST(N'2023-08-03T10:52:19.673' AS DateTime), CAST(N'2023-08-03T10:52:19.673' AS DateTime), N'b7b94a79-26a4-4c4b-934d-437f9d85378c')
GO
INSERT [dbo].[Review] ([Id], [Title], [Comment], [Rating], [BoardGameId], [CreatedBy], [UpdatedBy], [DateCreated], [DateUpdated], [RegisteredUserId]) VALUES (N'1a585b94-79a6-439f-8a9a-682e34c0af24', N'Very good dummy game', N'A delightful game of words and wit. The strategic thinking required is both challenging and engaging.', 4, N'897f8b53-0136-4162-8bae-8509a0c160fc', N'Dummy42', N'n/a', CAST(N'2023-08-03T10:52:19.717' AS DateTime), CAST(N'2023-08-03T10:52:19.717' AS DateTime), N'0ae0f5ff-d5e2-4f65-947e-49c0c046d44d')
GO
INSERT [dbo].[Review] ([Id], [Title], [Comment], [Rating], [BoardGameId], [CreatedBy], [UpdatedBy], [DateCreated], [DateUpdated], [RegisteredUserId]) VALUES (N'13632ec8-087e-4b3b-8cd4-6831c3fac1f3', N'So amazing', N'A thrilling mystery-solving experience. Perfect for those who love puzzles and intrigue.', 5, N'f28fa03c-4d75-4b80-a2e1-3616acf77566', N'AliceW', N'n/a', CAST(N'2023-08-03T10:52:19.723' AS DateTime), CAST(N'2023-08-03T10:52:19.723' AS DateTime), N'2c621cd3-8d8b-44e2-8601-52a3526d3028')
GO
INSERT [dbo].[Review] ([Id], [Title], [Comment], [Rating], [BoardGameId], [CreatedBy], [UpdatedBy], [DateCreated], [DateUpdated], [RegisteredUserId]) VALUES (N'287c54ed-aa34-47b3-900d-68c6c2606d28', N'Awesome!', N'A cosmic journey that''s a feast for the eyes. Strategic, challenging, and flavorful. A star in my collection!', 5, N'd680422b-2a42-4b28-87f5-ca1f70070729', N'FrankCook', N'n/a', CAST(N'2023-08-03T10:52:19.623' AS DateTime), CAST(N'2023-08-03T10:52:19.623' AS DateTime), N'f6f0bdda-bf62-44a8-ac70-706eb59bafad')
GO
INSERT [dbo].[Review] ([Id], [Title], [Comment], [Rating], [BoardGameId], [CreatedBy], [UpdatedBy], [DateCreated], [DateUpdated], [RegisteredUserId]) VALUES (N'38f1a123-ce1f-4ee7-aacf-69c7a3e955df', N'Fun for the whole family', N'A game of royalty and conquest. Strategy-heavy and visually rich. A must-play!', 5, N'3f8bffa5-6f29-4398-8c3f-d59f1c4f7747', N'EvaArt', N'n/a', CAST(N'2023-08-03T10:52:19.720' AS DateTime), CAST(N'2023-08-03T10:52:19.720' AS DateTime), N'e96808e8-42ca-45d5-aa95-cb09c293c59c')
GO
INSERT [dbo].[Review] ([Id], [Title], [Comment], [Rating], [BoardGameId], [CreatedBy], [UpdatedBy], [DateCreated], [DateUpdated], [RegisteredUserId]) VALUES (N'254456c4-0076-4ff7-a925-6c6edb0683b3', N'My choice for game night from now on', N'A fresh take on the adventure genre, with exciting time travel mechanics.', 4, N'3b57dec8-e374-41b6-8b10-0964199df9f7', N'BobDylan', N'n/a', CAST(N'2023-08-03T10:52:19.663' AS DateTime), CAST(N'2023-08-03T10:52:19.663' AS DateTime), N'b7b94a79-26a4-4c4b-934d-437f9d85378c')
GO
INSERT [dbo].[Review] ([Id], [Title], [Comment], [Rating], [BoardGameId], [CreatedBy], [UpdatedBy], [DateCreated], [DateUpdated], [RegisteredUserId]) VALUES (N'cd6afc5f-3140-4aad-9ebd-6cdc8566ef63', N'Really really good', N'A cosmic experience that is out of this world. Fresh, exciting, and full of surprises.', 5, N'd680422b-2a42-4b28-87f5-ca1f70070729', N'GraceHacker', N'n/a', CAST(N'2023-08-03T10:52:19.657' AS DateTime), CAST(N'2023-08-03T10:52:19.657' AS DateTime), N'71269e52-04d8-4cbf-b403-8ebaabb23b99')
GO
INSERT [dbo].[Review] ([Id], [Title], [Comment], [Rating], [BoardGameId], [CreatedBy], [UpdatedBy], [DateCreated], [DateUpdated], [RegisteredUserId]) VALUES (N'd96117c2-60ef-44a6-8bdf-6de669516479', N'Ok i guess', N'A magical game that captivates the imagination. However, the luck-based elements may not appeal to everyone.', 3, N'687b4366-be2b-40c7-a484-51a8701119aa', N'Dummy42', N'n/a', CAST(N'2023-08-03T10:52:19.693' AS DateTime), CAST(N'2023-08-03T10:52:19.693' AS DateTime), N'0ae0f5ff-d5e2-4f65-947e-49c0c046d44d')
GO
INSERT [dbo].[Review] ([Id], [Title], [Comment], [Rating], [BoardGameId], [CreatedBy], [UpdatedBy], [DateCreated], [DateUpdated], [RegisteredUserId]) VALUES (N'892b6ba9-1680-48d8-8618-6e56160e0bcf', N'A classic!', N'A simple yet engaging card game that brings endless fun to the table. Perfect for family gatherings.', 4, N'9d7dad30-c0ea-44b2-811c-1e27a1072419', N'CathyTech', N'n/a', CAST(N'2023-08-03T10:52:19.700' AS DateTime), CAST(N'2023-08-03T10:52:19.700' AS DateTime), N'21b78c5b-f1b0-4c16-be55-be311f5b58d7')
GO
INSERT [dbo].[Review] ([Id], [Title], [Comment], [Rating], [BoardGameId], [CreatedBy], [UpdatedBy], [DateCreated], [DateUpdated], [RegisteredUserId]) VALUES (N'b6f5e734-3a53-4793-a748-705e61364cee', N'Great fun', N'A royal game that demands strategic thinking. Challenging, exciting, and worthy of replay.', 5, N'3f8bffa5-6f29-4398-8c3f-d59f1c4f7747', N'GraceHacker', N'n/a', CAST(N'2023-08-03T10:52:19.713' AS DateTime), CAST(N'2023-08-03T10:52:19.713' AS DateTime), N'71269e52-04d8-4cbf-b403-8ebaabb23b99')
GO
INSERT [dbo].[Review] ([Id], [Title], [Comment], [Rating], [BoardGameId], [CreatedBy], [UpdatedBy], [DateCreated], [DateUpdated], [RegisteredUserId]) VALUES (N'68a4015d-b807-4eb6-8af5-70cff6328e9d', N'Very fun', N'A clever word game that will test your connections with friends. Hours of fun!', 5, N'd2a5a66e-93e2-4c3d-ae33-8b0f8de59e07', N'BobDylan', N'n/a', CAST(N'2023-08-03T10:52:19.687' AS DateTime), CAST(N'2023-08-03T10:52:19.687' AS DateTime), N'b7b94a79-26a4-4c4b-934d-437f9d85378c')
GO
INSERT [dbo].[Review] ([Id], [Title], [Comment], [Rating], [BoardGameId], [CreatedBy], [UpdatedBy], [DateCreated], [DateUpdated], [RegisteredUserId]) VALUES (N'aa48582d-47b0-4b83-8121-7667ab22e269', N'Dobble', N'Fast-paced and fun, this game tests your reflexes and matching skills like no other.', 5, N'fcafd866-48db-4d9b-a104-62ccb211a6ac', N'Dummy42', N'n/a', CAST(N'2023-08-03T10:52:19.637' AS DateTime), CAST(N'2023-08-03T10:52:19.637' AS DateTime), N'0ae0f5ff-d5e2-4f65-947e-49c0c046d44d')
GO
INSERT [dbo].[Review] ([Id], [Title], [Comment], [Rating], [BoardGameId], [CreatedBy], [UpdatedBy], [DateCreated], [DateUpdated], [RegisteredUserId]) VALUES (N'3db3b84e-6fe2-41b6-9d18-79fbc8654ba5', N'Doctor who haha', N'An innovative concept with a time-travel twist, but the mechanics can be confusing at times.', 3, N'3b57dec8-e374-41b6-8b10-0964199df9f7', N'AliceW', N'n/a', CAST(N'2023-08-03T10:52:19.687' AS DateTime), CAST(N'2023-08-03T10:52:19.687' AS DateTime), N'2c621cd3-8d8b-44e2-8601-52a3526d3028')
GO
INSERT [dbo].[Review] ([Id], [Title], [Comment], [Rating], [BoardGameId], [CreatedBy], [UpdatedBy], [DateCreated], [DateUpdated], [RegisteredUserId]) VALUES (N'd8355c52-9ed1-4dd8-ac52-7a40ac4f2ab2', N'3/5', N'A fast-paced matching game that offers a light and fun experience. Could use more depth for hardcore gamers.', 3, N'fcafd866-48db-4d9b-a104-62ccb211a6ac', N'GraceHacker', N'n/a', CAST(N'2023-08-03T10:52:19.717' AS DateTime), CAST(N'2023-08-03T10:52:19.717' AS DateTime), N'71269e52-04d8-4cbf-b403-8ebaabb23b99')
GO
INSERT [dbo].[Review] ([Id], [Title], [Comment], [Rating], [BoardGameId], [CreatedBy], [UpdatedBy], [DateCreated], [DateUpdated], [RegisteredUserId]) VALUES (N'972a1b0e-10c6-4420-b1fe-7e5d932f2484', N'We enjoyed it', N'A classic game of global domination. Time-consuming but always thrilling.', 4, N'444e71d7-3cde-4f1b-a088-3ca963e25e00', N'EvaArt', N'n/a', CAST(N'2023-08-03T10:52:19.663' AS DateTime), CAST(N'2023-08-03T10:52:19.663' AS DateTime), N'e96808e8-42ca-45d5-aa95-cb09c293c59c')
GO
INSERT [dbo].[Review] ([Id], [Title], [Comment], [Rating], [BoardGameId], [CreatedBy], [UpdatedBy], [DateCreated], [DateUpdated], [RegisteredUserId]) VALUES (N'91749fe6-fb8f-4569-9c12-7e60ead88c25', N'Fun fun fun', N'An intriguing mystery game that keeps you on the edge of your seat. Challenging and fun.', 4, N'f28fa03c-4d75-4b80-a2e1-3616acf77566', N'EvaArt', N'n/a', CAST(N'2023-08-03T10:52:19.657' AS DateTime), CAST(N'2023-08-03T10:52:19.657' AS DateTime), N'e96808e8-42ca-45d5-aa95-cb09c293c59c')
GO
INSERT [dbo].[Review] ([Id], [Title], [Comment], [Rating], [BoardGameId], [CreatedBy], [UpdatedBy], [DateCreated], [DateUpdated], [RegisteredUserId]) VALUES (N'961ceb6c-4931-434c-ad3b-810bfefb0ae3', N'I like zombies', N'A thrilling survival game with a zombie theme. Can be repetitive and unbalanced at times.', 3, N'321cbee4-c718-4855-b9a5-1afccb1afbcf', N'CathyTech', N'n/a', CAST(N'2023-08-03T10:52:19.620' AS DateTime), CAST(N'2023-08-03T10:52:19.620' AS DateTime), N'21b78c5b-f1b0-4c16-be55-be311f5b58d7')
GO
INSERT [dbo].[Review] ([Id], [Title], [Comment], [Rating], [BoardGameId], [CreatedBy], [UpdatedBy], [DateCreated], [DateUpdated], [RegisteredUserId]) VALUES (N'7045a7a7-cf9c-4c0e-acc8-81e4957a9f52', N'Cowboys and indians', N'A thrilling ride through the wild west, but the rules might be too complicated for some players.', 3, N'f19d19c6-792a-42d9-beea-ec977c058745', N'BobDylan', N'n/a', CAST(N'2023-08-03T10:52:19.693' AS DateTime), CAST(N'2023-08-03T10:52:19.693' AS DateTime), N'b7b94a79-26a4-4c4b-934d-437f9d85378c')
GO
INSERT [dbo].[Review] ([Id], [Title], [Comment], [Rating], [BoardGameId], [CreatedBy], [UpdatedBy], [DateCreated], [DateUpdated], [RegisteredUserId]) VALUES (N'be24b953-f2d1-47bc-9b82-84692f605808', N'Can''t not enjoy it', N'A dark and thrilling game that engages the mind and senses. A true gem!', 5, N'47a39d63-1a4e-4e06-8daf-98077f59c2aa', N'GraceHacker', N'n/a', CAST(N'2023-08-03T10:52:19.720' AS DateTime), CAST(N'2023-08-03T10:52:19.720' AS DateTime), N'71269e52-04d8-4cbf-b403-8ebaabb23b99')
GO
INSERT [dbo].[Review] ([Id], [Title], [Comment], [Rating], [BoardGameId], [CreatedBy], [UpdatedBy], [DateCreated], [DateUpdated], [RegisteredUserId]) VALUES (N'1812eaa2-eca9-4f92-a0bd-84ff55195592', N'SO interesting', N'A thrilling survival game with a perfect blend of strategy and horror. The suspense never stops!', 4, N'321cbee4-c718-4855-b9a5-1afccb1afbcf', N'GraceHacker', N'n/a', CAST(N'2023-08-03T10:52:19.707' AS DateTime), CAST(N'2023-08-03T10:52:19.707' AS DateTime), N'71269e52-04d8-4cbf-b403-8ebaabb23b99')
GO
INSERT [dbo].[Review] ([Id], [Title], [Comment], [Rating], [BoardGameId], [CreatedBy], [UpdatedBy], [DateCreated], [DateUpdated], [RegisteredUserId]) VALUES (N'abfeef1a-1059-4fe6-a5bd-851cc44a2e8d', N'So so', N'An outer space survival game that lacks organic growth. The idea is there, but it needs more care and attention.', 2, N'81749d28-a4dc-4d70-aeac-9a62c9b5dca5', N'IvyGardener', N'n/a', CAST(N'2023-08-03T10:52:19.717' AS DateTime), CAST(N'2023-08-03T10:52:19.717' AS DateTime), N'9c77825d-c08f-4974-8d16-a2e5256d3920')
GO
INSERT [dbo].[Review] ([Id], [Title], [Comment], [Rating], [BoardGameId], [CreatedBy], [UpdatedBy], [DateCreated], [DateUpdated], [RegisteredUserId]) VALUES (N'fbb11879-92b2-41d5-902b-855c96d2b86b', N'What to say', N'A prehistoric garden of fun. The thematic elements are appealing, but the gameplay could use a bit more cultivation.', 3, N'551bcaf7-03a6-4999-b160-a6716835a553', N'IvyGardener', N'n/a', CAST(N'2023-08-03T10:52:19.653' AS DateTime), CAST(N'2023-08-03T10:52:19.653' AS DateTime), N'9c77825d-c08f-4974-8d16-a2e5256d3920')
GO
INSERT [dbo].[Review] ([Id], [Title], [Comment], [Rating], [BoardGameId], [CreatedBy], [UpdatedBy], [DateCreated], [DateUpdated], [RegisteredUserId]) VALUES (N'0b99a880-0e79-417e-b360-88ad9f14ba5a', N'Spaceeee', N'An adventurous game with a space theme, but might be too complex for newcomers.', 3, N'81749d28-a4dc-4d70-aeac-9a62c9b5dca5', N'BobDylan', N'n/a', CAST(N'2023-08-03T10:52:19.653' AS DateTime), CAST(N'2023-08-03T10:52:19.653' AS DateTime), N'b7b94a79-26a4-4c4b-934d-437f9d85378c')
GO
INSERT [dbo].[Review] ([Id], [Title], [Comment], [Rating], [BoardGameId], [CreatedBy], [UpdatedBy], [DateCreated], [DateUpdated], [RegisteredUserId]) VALUES (N'1152456b-ddf8-4394-84ef-88fa61604bd6', N'Excellent', N'An intense and immersive game set in a dystopian future. Not for the casual player, but thrilling for those up for the challenge.', 5, N'2d7ddd20-0ad1-4d69-88b8-f5a98569adc5', N'BobDylan', N'n/a', CAST(N'2023-08-03T10:52:19.653' AS DateTime), CAST(N'2023-08-03T10:52:19.653' AS DateTime), N'b7b94a79-26a4-4c4b-934d-437f9d85378c')
GO
INSERT [dbo].[Review] ([Id], [Title], [Comment], [Rating], [BoardGameId], [CreatedBy], [UpdatedBy], [DateCreated], [DateUpdated], [RegisteredUserId]) VALUES (N'12c779dd-107e-4577-87b2-893663c87420', N'Will play again', N'An exciting journey into the Wild West. Some mechanics might feel outdated, but still an enjoyable experience.', 3, N'f19d19c6-792a-42d9-beea-ec977c058745', N'Dave_Gamer', N'n/a', CAST(N'2023-08-03T10:52:19.710' AS DateTime), CAST(N'2023-08-03T10:52:19.710' AS DateTime), N'959de864-9588-4512-a3dc-e61e95fe5377')
GO
INSERT [dbo].[Review] ([Id], [Title], [Comment], [Rating], [BoardGameId], [CreatedBy], [UpdatedBy], [DateCreated], [DateUpdated], [RegisteredUserId]) VALUES (N'8b2cc1f0-aac9-4248-adb6-8c1a0f54071b', N'Love it', N'A classic game of strategy and trading. There''s nothing quite like the satisfaction of building the longest road!', 5, N'6042bcd9-9938-40ed-a102-0d9a98313310', N'Dummy42', N'n/a', CAST(N'2023-08-03T10:52:19.657' AS DateTime), CAST(N'2023-08-03T10:52:19.657' AS DateTime), N'0ae0f5ff-d5e2-4f65-947e-49c0c046d44d')
GO
INSERT [dbo].[Review] ([Id], [Title], [Comment], [Rating], [BoardGameId], [CreatedBy], [UpdatedBy], [DateCreated], [DateUpdated], [RegisteredUserId]) VALUES (N'8e6785d9-e4f1-4a60-ac35-8e7d3bffd0dc', N'It was fun', N'A classic card game that is always a hit at parties. Simple and fun for everyone.', 4, N'9d7dad30-c0ea-44b2-811c-1e27a1072419', N'AliceW', N'n/a', CAST(N'2023-08-03T10:52:19.680' AS DateTime), CAST(N'2023-08-03T10:52:19.680' AS DateTime), N'2c621cd3-8d8b-44e2-8601-52a3526d3028')
GO
INSERT [dbo].[Review] ([Id], [Title], [Comment], [Rating], [BoardGameId], [CreatedBy], [UpdatedBy], [DateCreated], [DateUpdated], [RegisteredUserId]) VALUES (N'7bc26eba-b4c5-43b2-895e-903a48f68b53', N'Classic!', N'A game that grows on you over time. Strategic and well-crafted. A bit like tending to a garden of opportunities.', 4, N'6042bcd9-9938-40ed-a102-0d9a98313310', N'IvyGardener', N'n/a', CAST(N'2023-08-03T10:52:19.710' AS DateTime), CAST(N'2023-08-03T10:52:19.710' AS DateTime), N'9c77825d-c08f-4974-8d16-a2e5256d3920')
GO
INSERT [dbo].[Review] ([Id], [Title], [Comment], [Rating], [BoardGameId], [CreatedBy], [UpdatedBy], [DateCreated], [DateUpdated], [RegisteredUserId]) VALUES (N'427859cc-de5b-47e8-886a-96a8789b9df3', N'Sharks!', N'A serene and beautiful game with an ocean theme. It''s relaxing but may lack excitement for some.', 3, N'3620dfd2-8b15-4a9a-9f89-ea6fbc393ba4', N'BobDylan', N'n/a', CAST(N'2023-08-03T10:52:19.693' AS DateTime), CAST(N'2023-08-03T10:52:19.693' AS DateTime), N'b7b94a79-26a4-4c4b-934d-437f9d85378c')
GO
INSERT [dbo].[Review] ([Id], [Title], [Comment], [Rating], [BoardGameId], [CreatedBy], [UpdatedBy], [DateCreated], [DateUpdated], [RegisteredUserId]) VALUES (N'fa61ae9e-b04c-4bba-a429-9bdd120799df', N'Deserves low rating', N'Ahoy! A swashbuckling adventure awaits in this treasure-hunting game. The theme is engaging but the gameplay could use more variety.', 2, N'621fac3f-fb10-4475-ac33-1b1b6435eac8', N'Dummy42', N'n/a', CAST(N'2023-08-03T10:52:19.673' AS DateTime), CAST(N'2023-08-03T10:52:19.673' AS DateTime), N'0ae0f5ff-d5e2-4f65-947e-49c0c046d44d')
GO
INSERT [dbo].[Review] ([Id], [Title], [Comment], [Rating], [BoardGameId], [CreatedBy], [UpdatedBy], [DateCreated], [DateUpdated], [RegisteredUserId]) VALUES (N'd6efe613-8044-4e31-8ea4-9c0230b969d9', N'Interesting take', N'An underwater adventure that''s refreshing but lacks some depth. More content would be a splash!', 3, N'3620dfd2-8b15-4a9a-9f89-ea6fbc393ba4', N'FrankCook', N'n/a', CAST(N'2023-08-03T10:52:19.623' AS DateTime), CAST(N'2023-08-03T10:52:19.623' AS DateTime), N'f6f0bdda-bf62-44a8-ac70-706eb59bafad')
GO
INSERT [dbo].[Review] ([Id], [Title], [Comment], [Rating], [BoardGameId], [CreatedBy], [UpdatedBy], [DateCreated], [DateUpdated], [RegisteredUserId]) VALUES (N'd12d7238-3bf5-45ba-8433-9c178e0d9517', N'Worth the money', N'The mechanical theme is intriguing but lacks depth. The construction is solid but not groundbreaking.', 3, N'e28c31f8-42ef-495f-bbbc-41ea117b25ff', N'HarryBuilder', N'n/a', CAST(N'2023-08-03T10:52:19.710' AS DateTime), CAST(N'2023-08-03T10:52:19.710' AS DateTime), N'1a17a621-92e2-4e29-bbac-3ce171ecd7ee')
GO
INSERT [dbo].[Review] ([Id], [Title], [Comment], [Rating], [BoardGameId], [CreatedBy], [UpdatedBy], [DateCreated], [DateUpdated], [RegisteredUserId]) VALUES (N'7b6a034b-8c04-442d-b4fe-a22cee580557', N'I like vampires but', N'An atmospheric game with a unique theme. Some may find the rules confusing.', 2, N'47a39d63-1a4e-4e06-8daf-98077f59c2aa', N'BobDylan', N'n/a', CAST(N'2023-08-03T10:52:19.677' AS DateTime), CAST(N'2023-08-03T10:52:19.677' AS DateTime), N'b7b94a79-26a4-4c4b-934d-437f9d85378c')
GO
INSERT [dbo].[Review] ([Id], [Title], [Comment], [Rating], [BoardGameId], [CreatedBy], [UpdatedBy], [DateCreated], [DateUpdated], [RegisteredUserId]) VALUES (N'79b61e6e-0af4-4f39-a985-a2e7867cf914', N'Robots!', N'A futuristic adventure that blends AI and human interaction. Interesting but could use more innovation.', 3, N'e28c31f8-42ef-495f-bbbc-41ea117b25ff', N'GraceHacker', N'n/a', CAST(N'2023-08-03T10:52:19.670' AS DateTime), CAST(N'2023-08-03T10:52:19.670' AS DateTime), N'71269e52-04d8-4cbf-b403-8ebaabb23b99')
GO
INSERT [dbo].[Review] ([Id], [Title], [Comment], [Rating], [BoardGameId], [CreatedBy], [UpdatedBy], [DateCreated], [DateUpdated], [RegisteredUserId]) VALUES (N'6c7e0130-f630-44fb-b132-a37eb43f4221', N'Coooool', N'A stylish and engaging game with a cool theme, but might be too complex for casual gamers.', 3, N'2d7ddd20-0ad1-4d69-88b8-f5a98569adc5', N'AliceW', N'n/a', CAST(N'2023-08-03T10:52:19.693' AS DateTime), CAST(N'2023-08-03T10:52:19.693' AS DateTime), N'2c621cd3-8d8b-44e2-8601-52a3526d3028')
GO
INSERT [dbo].[Review] ([Id], [Title], [Comment], [Rating], [BoardGameId], [CreatedBy], [UpdatedBy], [DateCreated], [DateUpdated], [RegisteredUserId]) VALUES (N'131171d1-f0f7-48ef-a6aa-a401d264f349', N'Could be better', N'An engaging treasure hunt, but can become repetitive after a few plays.', 2, N'621fac3f-fb10-4475-ac33-1b1b6435eac8', N'AliceW', N'n/a', CAST(N'2023-08-03T10:52:19.703' AS DateTime), CAST(N'2023-08-03T10:52:19.703' AS DateTime), N'2c621cd3-8d8b-44e2-8601-52a3526d3028')
GO
INSERT [dbo].[Review] ([Id], [Title], [Comment], [Rating], [BoardGameId], [CreatedBy], [UpdatedBy], [DateCreated], [DateUpdated], [RegisteredUserId]) VALUES (N'510bd06a-8f1a-41bf-8fa9-a731d958c1a7', N'10/10', N'A cosmic adventure with intricate design and well-thought-out gameplay. Engaging and aesthetically pleasing.', 5, N'81749d28-a4dc-4d70-aeac-9a62c9b5dca5', N'HarryBuilder', N'n/a', CAST(N'2023-08-03T10:52:19.673' AS DateTime), CAST(N'2023-08-03T10:52:19.673' AS DateTime), N'1a17a621-92e2-4e29-bbac-3ce171ecd7ee')
GO
INSERT [dbo].[Review] ([Id], [Title], [Comment], [Rating], [BoardGameId], [CreatedBy], [UpdatedBy], [DateCreated], [DateUpdated], [RegisteredUserId]) VALUES (N'ff295b32-5200-46b2-b330-a74f4877eca5', N'Pretty ok', N'A playful adventure with dinosaurs. Great for kids, but adults may find it lacking in depth.', 3, N'551bcaf7-03a6-4999-b160-a6716835a553', N'CathyTech', N'n/a', CAST(N'2023-08-03T10:52:19.690' AS DateTime), CAST(N'2023-08-03T10:52:19.690' AS DateTime), N'21b78c5b-f1b0-4c16-be55-be311f5b58d7')
GO
INSERT [dbo].[Review] ([Id], [Title], [Comment], [Rating], [BoardGameId], [CreatedBy], [UpdatedBy], [DateCreated], [DateUpdated], [RegisteredUserId]) VALUES (N'622c6a91-2a86-4d3e-b6a7-aa33fea6aae5', N'Booring', N'A classic that has lost its charm over time. Simple and repetitive, not suitable for serious gamers.', 2, N'9d7dad30-c0ea-44b2-811c-1e27a1072419', N'GraceHacker', N'n/a', CAST(N'2023-08-03T10:52:19.630' AS DateTime), CAST(N'2023-08-03T10:52:19.630' AS DateTime), N'71269e52-04d8-4cbf-b403-8ebaabb23b99')
GO
INSERT [dbo].[Review] ([Id], [Title], [Comment], [Rating], [BoardGameId], [CreatedBy], [UpdatedBy], [DateCreated], [DateUpdated], [RegisteredUserId]) VALUES (N'ed9a9ecd-e323-43a6-bc61-aab130a6430d', N'True and tested', N'A simple and timeless game. Like a well-tended garden, it offers comfort and joy to those who play.', 4, N'9d7dad30-c0ea-44b2-811c-1e27a1072419', N'IvyGardener', N'n/a', CAST(N'2023-08-03T10:52:19.660' AS DateTime), CAST(N'2023-08-03T10:52:19.660' AS DateTime), N'9c77825d-c08f-4974-8d16-a2e5256d3920')
GO
INSERT [dbo].[Review] ([Id], [Title], [Comment], [Rating], [BoardGameId], [CreatedBy], [UpdatedBy], [DateCreated], [DateUpdated], [RegisteredUserId]) VALUES (N'5f4b5c6b-86e5-46b0-bb4c-ab15f44f171e', N'Made me write a review', N'A word-building classic that''s well-constructed and always engaging. A staple for any game night!', 4, N'ac13abe5-c2d3-4de6-854c-7bbe50b2bb6e', N'HarryBuilder', N'n/a', CAST(N'2023-08-03T10:52:19.710' AS DateTime), CAST(N'2023-08-03T10:52:19.710' AS DateTime), N'1a17a621-92e2-4e29-bbac-3ce171ecd7ee')
GO
INSERT [dbo].[Review] ([Id], [Title], [Comment], [Rating], [BoardGameId], [CreatedBy], [UpdatedBy], [DateCreated], [DateUpdated], [RegisteredUserId]) VALUES (N'690e209b-5b9e-4b43-bc98-ac1082b4e69e', N'Mysterious', N'A mysterious and puzzling game that keeps you guessing. Intriguing but sometimes confusing.', 3, N'f28fa03c-4d75-4b80-a2e1-3616acf77566', N'GraceHacker', N'n/a', CAST(N'2023-08-03T10:52:19.713' AS DateTime), CAST(N'2023-08-03T10:52:19.713' AS DateTime), N'71269e52-04d8-4cbf-b403-8ebaabb23b99')
GO
INSERT [dbo].[Review] ([Id], [Title], [Comment], [Rating], [BoardGameId], [CreatedBy], [UpdatedBy], [DateCreated], [DateUpdated], [RegisteredUserId]) VALUES (N'de96eb5d-c274-43ee-8cf0-accf303f88c0', N'Great game!', N'A futuristic concept that has been brilliantly realized. The design and construction of the game are top-notch.', 5, N'3b57dec8-e374-41b6-8b10-0964199df9f7', N'HarryBuilder', N'n/a', CAST(N'2023-08-03T10:52:19.677' AS DateTime), CAST(N'2023-08-03T10:52:19.677' AS DateTime), N'1a17a621-92e2-4e29-bbac-3ce171ecd7ee')
GO
INSERT [dbo].[Review] ([Id], [Title], [Comment], [Rating], [BoardGameId], [CreatedBy], [UpdatedBy], [DateCreated], [DateUpdated], [RegisteredUserId]) VALUES (N'046d1623-73ed-4d41-b36f-afed51411dcc', N'What lol', N'A light and entertaining game. Visually appealing but lacks depth for serious gamers.', 3, N'fcafd866-48db-4d9b-a104-62ccb211a6ac', N'EvaArt', N'n/a', CAST(N'2023-08-03T10:52:19.680' AS DateTime), CAST(N'2023-08-03T10:52:19.680' AS DateTime), N'e96808e8-42ca-45d5-aa95-cb09c293c59c')
GO
INSERT [dbo].[Review] ([Id], [Title], [Comment], [Rating], [BoardGameId], [CreatedBy], [UpdatedBy], [DateCreated], [DateUpdated], [RegisteredUserId]) VALUES (N'42152404-f2df-470e-aeb3-b0488e44604a', N'Fun!', N'A word-building game that serves a challenging mental exercise. Always a treat to play!', 4, N'ac13abe5-c2d3-4de6-854c-7bbe50b2bb6e', N'FrankCook', N'n/a', CAST(N'2023-08-03T10:52:19.630' AS DateTime), CAST(N'2023-08-03T10:52:19.630' AS DateTime), N'f6f0bdda-bf62-44a8-ac70-706eb59bafad')
GO
INSERT [dbo].[Review] ([Id], [Title], [Comment], [Rating], [BoardGameId], [CreatedBy], [UpdatedBy], [DateCreated], [DateUpdated], [RegisteredUserId]) VALUES (N'346e0621-5fe2-4cf1-907a-b069cf115227', N'Interesting game', N'A thrilling adventure in the Wild West that''s full of action and excitement. Truly engaging!', 4, N'f19d19c6-792a-42d9-beea-ec977c058745', N'GraceHacker', N'n/a', CAST(N'2023-08-03T10:52:19.690' AS DateTime), CAST(N'2023-08-03T10:52:19.690' AS DateTime), N'71269e52-04d8-4cbf-b403-8ebaabb23b99')
GO
INSERT [dbo].[Review] ([Id], [Title], [Comment], [Rating], [BoardGameId], [CreatedBy], [UpdatedBy], [DateCreated], [DateUpdated], [RegisteredUserId]) VALUES (N'48162c4e-6fa4-4908-b9cf-b1c40b734ada', N'Jurassic park eh', N'A colorful dinosaur-themed game that''s great for families. Lacks complexity for hardcore gamers.', 3, N'551bcaf7-03a6-4999-b160-a6716835a553', N'EvaArt', N'n/a', CAST(N'2023-08-03T10:52:19.670' AS DateTime), CAST(N'2023-08-03T10:52:19.670' AS DateTime), N'e96808e8-42ca-45d5-aa95-cb09c293c59c')
GO
INSERT [dbo].[Review] ([Id], [Title], [Comment], [Rating], [BoardGameId], [CreatedBy], [UpdatedBy], [DateCreated], [DateUpdated], [RegisteredUserId]) VALUES (N'9f77e105-d397-480d-837c-b2d945de8836', N'Would recommend', N'An exploration game that blossoms with creativity and innovation. Like discovering a new species of plant in a cosmic garden.', 5, N'd680422b-2a42-4b28-87f5-ca1f70070729', N'IvyGardener', N'n/a', CAST(N'2023-08-03T10:52:19.660' AS DateTime), CAST(N'2023-08-03T10:52:19.660' AS DateTime), N'9c77825d-c08f-4974-8d16-a2e5256d3920')
GO
INSERT [dbo].[Review] ([Id], [Title], [Comment], [Rating], [BoardGameId], [CreatedBy], [UpdatedBy], [DateCreated], [DateUpdated], [RegisteredUserId]) VALUES (N'b87136da-c5a5-4b52-8388-b4f017df8a43', N'So clever', N'A clever word-based game that requires thinking and teamwork. Always a hit at game night.', 4, N'd2a5a66e-93e2-4c3d-ae33-8b0f8de59e07', N'EvaArt', N'n/a', CAST(N'2023-08-03T10:52:19.697' AS DateTime), CAST(N'2023-08-03T10:52:19.697' AS DateTime), N'e96808e8-42ca-45d5-aa95-cb09c293c59c')
GO
INSERT [dbo].[Review] ([Id], [Title], [Comment], [Rating], [BoardGameId], [CreatedBy], [UpdatedBy], [DateCreated], [DateUpdated], [RegisteredUserId]) VALUES (N'c9bcfdff-2cb0-403b-be8f-b63dc2ad6b82', N'Very smart', N'A unique concept that''s executed well. The time-traveling mechanics add an exciting twist to the gameplay.', 4, N'3b57dec8-e374-41b6-8b10-0964199df9f7', N'CathyTech', N'n/a', CAST(N'2023-08-03T10:52:19.713' AS DateTime), CAST(N'2023-08-03T10:52:19.713' AS DateTime), N'21b78c5b-f1b0-4c16-be55-be311f5b58d7')
GO
INSERT [dbo].[Review] ([Id], [Title], [Comment], [Rating], [BoardGameId], [CreatedBy], [UpdatedBy], [DateCreated], [DateUpdated], [RegisteredUserId]) VALUES (N'3f6d0ad0-b267-4f9b-8bea-b7a3a13ad953', N'THE card game', N'A family favorite that never gets old. But watch out for those Draw Four cards!', 3, N'9d7dad30-c0ea-44b2-811c-1e27a1072419', N'Dummy42', N'n/a', CAST(N'2023-08-03T10:52:19.690' AS DateTime), CAST(N'2023-08-03T10:52:19.690' AS DateTime), N'0ae0f5ff-d5e2-4f65-947e-49c0c046d44d')
GO
INSERT [dbo].[Review] ([Id], [Title], [Comment], [Rating], [BoardGameId], [CreatedBy], [UpdatedBy], [DateCreated], [DateUpdated], [RegisteredUserId]) VALUES (N'83136d28-b125-4f62-a8c0-b8d9e2e241e8', N'Fairy Tale Showdown', N'A whimsical fairy tale game that charms players. A bit simplistic but lovely nonetheless.', 3, N'd45435d7-ca16-47c1-82f9-69a2dcf99c39', N'EvaArt', N'n/a', CAST(N'2023-08-03T10:52:19.660' AS DateTime), CAST(N'2023-08-03T10:52:19.660' AS DateTime), N'e96808e8-42ca-45d5-aa95-cb09c293c59c')
GO
INSERT [dbo].[Review] ([Id], [Title], [Comment], [Rating], [BoardGameId], [CreatedBy], [UpdatedBy], [DateCreated], [DateUpdated], [RegisteredUserId]) VALUES (N'5adf0953-40bd-4262-a1d9-bc5a0d00c87a', N'Ha!', N'A game with hidden layers and twists like a mysterious garden maze. Engaging and thought-provoking.', 4, N'f28fa03c-4d75-4b80-a2e1-3616acf77566', N'IvyGardener', N'n/a', CAST(N'2023-08-03T10:52:19.707' AS DateTime), CAST(N'2023-08-03T10:52:19.707' AS DateTime), N'9c77825d-c08f-4974-8d16-a2e5256d3920')
GO
INSERT [dbo].[Review] ([Id], [Title], [Comment], [Rating], [BoardGameId], [CreatedBy], [UpdatedBy], [DateCreated], [DateUpdated], [RegisteredUserId]) VALUES (N'2cd8b7bd-6d40-4797-b76c-c3e5385ebc7e', N'Meh', N'An engaging game set in space, but with unpolished mechanics. Needs improvement to truly shine.', 2, N'81749d28-a4dc-4d70-aeac-9a62c9b5dca5', N'CathyTech', N'n/a', CAST(N'2023-08-03T10:52:19.660' AS DateTime), CAST(N'2023-08-03T10:52:19.660' AS DateTime), N'21b78c5b-f1b0-4c16-be55-be311f5b58d7')
GO
INSERT [dbo].[Review] ([Id], [Title], [Comment], [Rating], [BoardGameId], [CreatedBy], [UpdatedBy], [DateCreated], [DateUpdated], [RegisteredUserId]) VALUES (N'a18951d4-8ba0-48af-b312-c405270375b7', N'Not too bad', N'A puzzle game that''s both fun and frustrating. Some may find it too challenging.', 3, N'8af096b7-82ca-4ac3-93d2-a04a2469df95', N'BobDylan', N'n/a', CAST(N'2023-08-03T10:52:19.630' AS DateTime), CAST(N'2023-08-03T10:52:19.630' AS DateTime), N'b7b94a79-26a4-4c4b-934d-437f9d85378c')
GO
INSERT [dbo].[Review] ([Id], [Title], [Comment], [Rating], [BoardGameId], [CreatedBy], [UpdatedBy], [DateCreated], [DateUpdated], [RegisteredUserId]) VALUES (N'04daefbe-c1ca-4bac-aa85-c4244630d39e', N'AMazing game!', N'A visually stunning game that stimulates the imagination. Accessible and enjoyable for everyone.', 5, N'9e1b951c-eebd-4eb3-8119-6fe1c90ecc8a', N'Dave_Gamer', N'n/a', CAST(N'2023-08-03T10:52:19.623' AS DateTime), CAST(N'2023-08-03T10:52:19.623' AS DateTime), N'959de864-9588-4512-a3dc-e61e95fe5377')
GO
INSERT [dbo].[Review] ([Id], [Title], [Comment], [Rating], [BoardGameId], [CreatedBy], [UpdatedBy], [DateCreated], [DateUpdated], [RegisteredUserId]) VALUES (N'ccb0b90a-0099-4837-805b-c7407bca3583', N'Cool i guess', N'A family-friendly adventure with dinosaurs. Fun for kids but may be too simple for adults.', 3, N'551bcaf7-03a6-4999-b160-a6716835a553', N'Dave_Gamer', N'n/a', CAST(N'2023-08-03T10:52:19.717' AS DateTime), CAST(N'2023-08-03T10:52:19.717' AS DateTime), N'959de864-9588-4512-a3dc-e61e95fe5377')
GO
INSERT [dbo].[Review] ([Id], [Title], [Comment], [Rating], [BoardGameId], [CreatedBy], [UpdatedBy], [DateCreated], [DateUpdated], [RegisteredUserId]) VALUES (N'ca02ffe4-4a36-4356-a3e5-ca30ae2851af', N'Nothing much to say', N'A prehistoric adventure that falls short in design complexity. The theme is fun but execution lacks excitement.', 2, N'551bcaf7-03a6-4999-b160-a6716835a553', N'HarryBuilder', N'n/a', CAST(N'2023-08-03T10:52:19.690' AS DateTime), CAST(N'2023-08-03T10:52:19.690' AS DateTime), N'1a17a621-92e2-4e29-bbac-3ce171ecd7ee')
GO
INSERT [dbo].[Review] ([Id], [Title], [Comment], [Rating], [BoardGameId], [CreatedBy], [UpdatedBy], [DateCreated], [DateUpdated], [RegisteredUserId]) VALUES (N'5086514c-6aee-4442-be93-cbcb043bfcb2', N'Warhammer was better', N'Embark on a space adventure with friends. Interesting but might not appeal to everyone.', 3, N'd680422b-2a42-4b28-87f5-ca1f70070729', N'AliceW', N'n/a', CAST(N'2023-08-03T10:52:19.670' AS DateTime), CAST(N'2023-08-03T10:52:19.670' AS DateTime), N'2c621cd3-8d8b-44e2-8601-52a3526d3028')
GO
INSERT [dbo].[Review] ([Id], [Title], [Comment], [Rating], [BoardGameId], [CreatedBy], [UpdatedBy], [DateCreated], [DateUpdated], [RegisteredUserId]) VALUES (N'e5a3cdf1-4385-4b3a-86fc-cc32c51a6c3b', N'Classic game, what to say', N'A classic game of world domination that''s both thrilling and challenging. May be too complex for some.', 4, N'444e71d7-3cde-4f1b-a088-3ca963e25e00', N'CathyTech', N'n/a', CAST(N'2023-08-03T10:52:19.630' AS DateTime), CAST(N'2023-08-03T10:52:19.630' AS DateTime), N'21b78c5b-f1b0-4c16-be55-be311f5b58d7')
GO
INSERT [dbo].[Review] ([Id], [Title], [Comment], [Rating], [BoardGameId], [CreatedBy], [UpdatedBy], [DateCreated], [DateUpdated], [RegisteredUserId]) VALUES (N'88ca24ab-9abb-4b5e-81f2-d0743bdc9094', N'Lots of fun', N'Cooperation is key in this thrilling game of global disease control. Every decision counts!', 5, N'2e6dc62d-8c91-48b7-a7e5-959b286b41ff', N'Dummy42', N'n/a', CAST(N'2023-08-03T10:52:19.697' AS DateTime), CAST(N'2023-08-03T10:52:19.697' AS DateTime), N'0ae0f5ff-d5e2-4f65-947e-49c0c046d44d')
GO
INSERT [dbo].[Review] ([Id], [Title], [Comment], [Rating], [BoardGameId], [CreatedBy], [UpdatedBy], [DateCreated], [DateUpdated], [RegisteredUserId]) VALUES (N'5097cd30-77c3-469e-92c8-d4490b227781', N'Not my first choice', N'A charming concept with poorly executed game mechanics. The aesthetics are nice, but the gameplay falls flat.', 2, N'd45435d7-ca16-47c1-82f9-69a2dcf99c39', N'HarryBuilder', N'n/a', CAST(N'2023-08-03T10:52:19.680' AS DateTime), CAST(N'2023-08-03T10:52:19.680' AS DateTime), N'1a17a621-92e2-4e29-bbac-3ce171ecd7ee')
GO
INSERT [dbo].[Review] ([Id], [Title], [Comment], [Rating], [BoardGameId], [CreatedBy], [UpdatedBy], [DateCreated], [DateUpdated], [RegisteredUserId]) VALUES (N'430bc0d1-e9d7-47e0-9793-d64e96dbab52', N'Pretty good', N'A whimsical game that''s perfect for families. May lack depth for serious gamers.', 3, N'687b4366-be2b-40c7-a484-51a8701119aa', N'BobDylan', N'n/a', CAST(N'2023-08-03T10:52:19.637' AS DateTime), CAST(N'2023-08-03T10:52:19.637' AS DateTime), N'b7b94a79-26a4-4c4b-934d-437f9d85378c')
GO
INSERT [dbo].[Review] ([Id], [Title], [Comment], [Rating], [BoardGameId], [CreatedBy], [UpdatedBy], [DateCreated], [DateUpdated], [RegisteredUserId]) VALUES (N'93648bf6-2ce2-4fa7-b8d3-d94fad511cf2', N'Ok', N'Quick and sprightly, this game offers fast-paced fun but doesn''t have the depth or complexity for a full harvest of enjoyment.', 3, N'fcafd866-48db-4d9b-a104-62ccb211a6ac', N'IvyGardener', N'n/a', CAST(N'2023-08-03T10:52:19.687' AS DateTime), CAST(N'2023-08-03T10:52:19.687' AS DateTime), N'9c77825d-c08f-4974-8d16-a2e5256d3920')
GO
INSERT [dbo].[Review] ([Id], [Title], [Comment], [Rating], [BoardGameId], [CreatedBy], [UpdatedBy], [DateCreated], [DateUpdated], [RegisteredUserId]) VALUES (N'7b0fe9e3-5f6b-4677-ad6c-d990d3ba0d70', N'I enjoyed it a lot', N'A whimsical game that appeals to the imagination. Great for playing with kids.', 4, N'd45435d7-ca16-47c1-82f9-69a2dcf99c39', N'AliceW', N'n/a', CAST(N'2023-08-03T10:52:19.707' AS DateTime), CAST(N'2023-08-03T10:52:19.707' AS DateTime), N'2c621cd3-8d8b-44e2-8601-52a3526d3028')
GO
INSERT [dbo].[Review] ([Id], [Title], [Comment], [Rating], [BoardGameId], [CreatedBy], [UpdatedBy], [DateCreated], [DateUpdated], [RegisteredUserId]) VALUES (N'a6dd8e39-19f5-4236-b7de-d9fa46d1bb28', N'Amazing game', N'An imaginative and beautifully illustrated game. Great for creative thinkers.', 5, N'9e1b951c-eebd-4eb3-8119-6fe1c90ecc8a', N'BobDylan', N'n/a', CAST(N'2023-08-03T10:52:19.703' AS DateTime), CAST(N'2023-08-03T10:52:19.703' AS DateTime), N'b7b94a79-26a4-4c4b-934d-437f9d85378c')
GO
INSERT [dbo].[Review] ([Id], [Title], [Comment], [Rating], [BoardGameId], [CreatedBy], [UpdatedBy], [DateCreated], [DateUpdated], [RegisteredUserId]) VALUES (N'53afb3f7-5c3d-4d84-827b-da924b028765', N'Cyberpuuuunk', N'A stylish game with a cyberpunk theme. Engaging but could use more strategic depth.', 3, N'2d7ddd20-0ad1-4d69-88b8-f5a98569adc5', N'Dave_Gamer', N'n/a', CAST(N'2023-08-03T10:52:19.663' AS DateTime), CAST(N'2023-08-03T10:52:19.663' AS DateTime), N'959de864-9588-4512-a3dc-e61e95fe5377')
GO
INSERT [dbo].[Review] ([Id], [Title], [Comment], [Rating], [BoardGameId], [CreatedBy], [UpdatedBy], [DateCreated], [DateUpdated], [RegisteredUserId]) VALUES (N'e591d09e-dd36-4ab0-af9c-dced5ece8c21', N'Fun on occassion', N'A whimsical and magical game that lacks proper nourishment in its rules. The idea is enchanting but needs pruning.', 2, N'687b4366-be2b-40c7-a484-51a8701119aa', N'IvyGardener', N'n/a', CAST(N'2023-08-03T10:52:19.680' AS DateTime), CAST(N'2023-08-03T10:52:19.680' AS DateTime), N'9c77825d-c08f-4974-8d16-a2e5256d3920')
GO
INSERT [dbo].[Review] ([Id], [Title], [Comment], [Rating], [BoardGameId], [CreatedBy], [UpdatedBy], [DateCreated], [DateUpdated], [RegisteredUserId]) VALUES (N'51b8b5ca-b02c-4ee3-a522-dfb251e94f54', N'Epic!', N'An epic battle for control that can become heated among friends. Strategic thinking is a must!', 4, N'3f8bffa5-6f29-4398-8c3f-d59f1c4f7747', N'AliceW', N'n/a', CAST(N'2023-08-03T10:52:19.700' AS DateTime), CAST(N'2023-08-03T10:52:19.700' AS DateTime), N'2c621cd3-8d8b-44e2-8601-52a3526d3028')
GO
INSERT [dbo].[Review] ([Id], [Title], [Comment], [Rating], [BoardGameId], [CreatedBy], [UpdatedBy], [DateCreated], [DateUpdated], [RegisteredUserId]) VALUES (N'7cd4c70b-15a7-4019-9a8b-e01045ff753f', N'Disappointing', N'An outer-space adventure that promises excitement but falls short in execution. A bit disappointing.', 2, N'd680422b-2a42-4b28-87f5-ca1f70070729', N'CathyTech', N'n/a', CAST(N'2023-08-03T10:52:19.683' AS DateTime), CAST(N'2023-08-03T10:52:19.683' AS DateTime), N'21b78c5b-f1b0-4c16-be55-be311f5b58d7')
GO
INSERT [dbo].[Review] ([Id], [Title], [Comment], [Rating], [BoardGameId], [CreatedBy], [UpdatedBy], [DateCreated], [DateUpdated], [RegisteredUserId]) VALUES (N'e22925d5-1ef9-44e3-83db-e114a1320913', N'Cool game', N'A timeless word game that remains a challenge. Always enjoyable and educational.', 4, N'ac13abe5-c2d3-4de6-854c-7bbe50b2bb6e', N'Dave_Gamer', N'n/a', CAST(N'2023-08-03T10:52:19.683' AS DateTime), CAST(N'2023-08-03T10:52:19.683' AS DateTime), N'959de864-9588-4512-a3dc-e61e95fe5377')
GO
INSERT [dbo].[Review] ([Id], [Title], [Comment], [Rating], [BoardGameId], [CreatedBy], [UpdatedBy], [DateCreated], [DateUpdated], [RegisteredUserId]) VALUES (N'a9f07466-7bbe-4126-bf16-e1545c11264c', N'10 out of 10!', N'Whimsical and delightful as a blooming garden in spring. A true fairy tale experience that enchants players of all ages.', 5, N'd45435d7-ca16-47c1-82f9-69a2dcf99c39', N'IvyGardener', N'n/a', CAST(N'2023-08-03T10:52:19.673' AS DateTime), CAST(N'2023-08-03T10:52:19.673' AS DateTime), N'9c77825d-c08f-4974-8d16-a2e5256d3920')
GO
INSERT [dbo].[Review] ([Id], [Title], [Comment], [Rating], [BoardGameId], [CreatedBy], [UpdatedBy], [DateCreated], [DateUpdated], [RegisteredUserId]) VALUES (N'9ff34a56-424f-4e4d-903f-e1abd1ddb15b', N'Better get something else', N'A journey through time that''s interesting but a bit overcooked. Needs more balance.', 2, N'3b57dec8-e374-41b6-8b10-0964199df9f7', N'FrankCook', N'n/a', CAST(N'2023-08-03T10:52:19.653' AS DateTime), CAST(N'2023-08-03T10:52:19.653' AS DateTime), N'f6f0bdda-bf62-44a8-ac70-706eb59bafad')
GO
INSERT [dbo].[Review] ([Id], [Title], [Comment], [Rating], [BoardGameId], [CreatedBy], [UpdatedBy], [DateCreated], [DateUpdated], [RegisteredUserId]) VALUES (N'e6ad1309-59d7-41fe-a1d9-e2177e8977e6', N'7/5', N'A beautifully crafted game that shows attention to detail in every piece. Strategy meets artistry.', 5, N'3f8bffa5-6f29-4398-8c3f-d59f1c4f7747', N'HarryBuilder', N'n/a', CAST(N'2023-08-03T10:52:19.663' AS DateTime), CAST(N'2023-08-03T10:52:19.663' AS DateTime), N'1a17a621-92e2-4e29-bbac-3ce171ecd7ee')
GO
INSERT [dbo].[Review] ([Id], [Title], [Comment], [Rating], [BoardGameId], [CreatedBy], [UpdatedBy], [DateCreated], [DateUpdated], [RegisteredUserId]) VALUES (N'03785afe-8cd6-4f80-b696-e3fc982ba9fa', N'Pretty average', N'A fun-filled pirate adventure that can become repetitive. Great for younger players.', 3, N'621fac3f-fb10-4475-ac33-1b1b6435eac8', N'EvaArt', N'n/a', CAST(N'2023-08-03T10:52:19.727' AS DateTime), CAST(N'2023-08-03T10:52:19.727' AS DateTime), N'e96808e8-42ca-45d5-aa95-cb09c293c59c')
GO
INSERT [dbo].[Review] ([Id], [Title], [Comment], [Rating], [BoardGameId], [CreatedBy], [UpdatedBy], [DateCreated], [DateUpdated], [RegisteredUserId]) VALUES (N'abdf46bf-9c53-482e-9f69-e7f7ec574566', N'Would play again', N'A strategic game that''s as intense as a simmering pot. Teamwork is key, and it''s always satisfying.', 4, N'2e6dc62d-8c91-48b7-a7e5-959b286b41ff', N'FrankCook', N'n/a', CAST(N'2023-08-03T10:52:19.700' AS DateTime), CAST(N'2023-08-03T10:52:19.700' AS DateTime), N'f6f0bdda-bf62-44a8-ac70-706eb59bafad')
GO
INSERT [dbo].[Review] ([Id], [Title], [Comment], [Rating], [BoardGameId], [CreatedBy], [UpdatedBy], [DateCreated], [DateUpdated], [RegisteredUserId]) VALUES (N'cae4cc4f-4673-4d4c-adcf-ea1c7890b920', N'Amazing game', N'A futuristic adventure with endless possibilities. The tension builds with every turn.', 4, N'81749d28-a4dc-4d70-aeac-9a62c9b5dca5', N'AliceW', N'n/a', CAST(N'2023-08-03T10:52:19.690' AS DateTime), CAST(N'2023-08-03T10:52:19.690' AS DateTime), N'2c621cd3-8d8b-44e2-8601-52a3526d3028')
GO
INSERT [dbo].[Review] ([Id], [Title], [Comment], [Rating], [BoardGameId], [CreatedBy], [UpdatedBy], [DateCreated], [DateUpdated], [RegisteredUserId]) VALUES (N'5d42cd5f-2ad2-4d34-ab7c-edb0cbc566c5', N'We liked it', N'A magical game that enchants players of all ages. Simple yet satisfying.', 4, N'687b4366-be2b-40c7-a484-51a8701119aa', N'EvaArt', N'n/a', CAST(N'2023-08-03T10:52:19.673' AS DateTime), CAST(N'2023-08-03T10:52:19.673' AS DateTime), N'e96808e8-42ca-45d5-aa95-cb09c293c59c')
GO
INSERT [dbo].[Review] ([Id], [Title], [Comment], [Rating], [BoardGameId], [CreatedBy], [UpdatedBy], [DateCreated], [DateUpdated], [RegisteredUserId]) VALUES (N'68f2701b-403e-4edd-9b16-f18bd4a99f70', N'Definitely recommend', N'An epic battle for supremacy, filled with strategy and intrigue. A must-have for any serious board game collector.', 5, N'3f8bffa5-6f29-4398-8c3f-d59f1c4f7747', N'CathyTech', N'n/a', CAST(N'2023-08-03T10:52:19.627' AS DateTime), CAST(N'2023-08-03T10:52:19.627' AS DateTime), N'21b78c5b-f1b0-4c16-be55-be311f5b58d7')
GO
INSERT [dbo].[Review] ([Id], [Title], [Comment], [Rating], [BoardGameId], [CreatedBy], [UpdatedBy], [DateCreated], [DateUpdated], [RegisteredUserId]) VALUES (N'0923f698-f11b-4db9-9943-f5233bb7f0b7', N'Underwhelming', N'A game that seems dead on arrival. The concept is there, but it fails to blossom into a satisfying experience.', 2, N'321cbee4-c718-4855-b9a5-1afccb1afbcf', N'IvyGardener', N'n/a', CAST(N'2023-08-03T10:52:19.693' AS DateTime), CAST(N'2023-08-03T10:52:19.693' AS DateTime), N'9c77825d-c08f-4974-8d16-a2e5256d3920')
GO
INSERT [dbo].[Review] ([Id], [Title], [Comment], [Rating], [BoardGameId], [CreatedBy], [UpdatedBy], [DateCreated], [DateUpdated], [RegisteredUserId]) VALUES (N'15dde3ad-9fa5-4e8c-9801-f57b302dbbe2', N'3/5', N'A suspenseful game full of twists and turns. Engaging but may be too complex for younger players.', 3, N'f28fa03c-4d75-4b80-a2e1-3616acf77566', N'CathyTech', N'n/a', CAST(N'2023-08-03T10:52:19.710' AS DateTime), CAST(N'2023-08-03T10:52:19.710' AS DateTime), N'21b78c5b-f1b0-4c16-be55-be311f5b58d7')
GO
INSERT [dbo].[Review] ([Id], [Title], [Comment], [Rating], [BoardGameId], [CreatedBy], [UpdatedBy], [DateCreated], [DateUpdated], [RegisteredUserId]) VALUES (N'20fc17e6-e5e8-4278-b255-f9c98875c0b0', N'Not the Walking Dead', N'A survival game with a twist. The zombie theme is well-executed, but some mechanics feel unbalanced.', 3, N'321cbee4-c718-4855-b9a5-1afccb1afbcf', N'Dave_Gamer', N'n/a', CAST(N'2023-08-03T10:52:19.680' AS DateTime), CAST(N'2023-08-03T10:52:19.680' AS DateTime), N'959de864-9588-4512-a3dc-e61e95fe5377')
GO
INSERT [dbo].[Review] ([Id], [Title], [Comment], [Rating], [BoardGameId], [CreatedBy], [UpdatedBy], [DateCreated], [DateUpdated], [RegisteredUserId]) VALUES (N'84453dd0-63d9-4f9a-a5ca-fb172d43ad61', N'Isn''t exactly Bladerunner', N'A tech-driven game that could benefit from more refined design. Interesting concept but needs more innovation.', 3, N'2d7ddd20-0ad1-4d69-88b8-f5a98569adc5', N'HarryBuilder', N'n/a', CAST(N'2023-08-03T10:52:19.707' AS DateTime), CAST(N'2023-08-03T10:52:19.707' AS DateTime), N'1a17a621-92e2-4e29-bbac-3ce171ecd7ee')
GO
INSERT [dbo].[Review] ([Id], [Title], [Comment], [Rating], [BoardGameId], [CreatedBy], [UpdatedBy], [DateCreated], [DateUpdated], [RegisteredUserId]) VALUES (N'2a4541f6-ce92-491d-8e33-fea08cd0c574', N'Amazing', N'A tech-driven dystopian game that truly resonates with my hacker heart. Deep, immersive, and exciting.', 5, N'2d7ddd20-0ad1-4d69-88b8-f5a98569adc5', N'GraceHacker', N'n/a', CAST(N'2023-08-03T10:52:19.633' AS DateTime), CAST(N'2023-08-03T10:52:19.633' AS DateTime), N'71269e52-04d8-4cbf-b403-8ebaabb23b99')
GO
ALTER TABLE [dbo].[Review]  WITH CHECK ADD  CONSTRAINT [FK_Review_BoardGame_BoardGameId] FOREIGN KEY([BoardGameId])
REFERENCES [dbo].[BoardGame] ([Id])
GO
ALTER TABLE [dbo].[Review] CHECK CONSTRAINT [FK_Review_BoardGame_BoardGameId]
GO
ALTER TABLE [dbo].[Review]  WITH CHECK ADD  CONSTRAINT [FK_Review_RegisteredUser_RegisteredUserId] FOREIGN KEY([RegisteredUserId])
REFERENCES [dbo].[RegisteredUser] ([Id])
GO
ALTER TABLE [dbo].[Review] CHECK CONSTRAINT [FK_Review_RegisteredUser_RegisteredUserId]
GO
USE [master]
GO
ALTER DATABASE [PlayPalMini] SET  READ_WRITE 
GO
