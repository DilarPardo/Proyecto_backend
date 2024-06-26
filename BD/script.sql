USE [master]
GO
/****** Object:  Database [institution]    Script Date: 23/04/2024 10:58:04 a. m. ******/
CREATE DATABASE [institution]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'institution', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\institution.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'institution_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\institution_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [institution] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [institution].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [institution] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [institution] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [institution] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [institution] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [institution] SET ARITHABORT OFF 
GO
ALTER DATABASE [institution] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [institution] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [institution] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [institution] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [institution] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [institution] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [institution] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [institution] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [institution] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [institution] SET  DISABLE_BROKER 
GO
ALTER DATABASE [institution] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [institution] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [institution] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [institution] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [institution] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [institution] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [institution] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [institution] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [institution] SET  MULTI_USER 
GO
ALTER DATABASE [institution] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [institution] SET DB_CHAINING OFF 
GO
ALTER DATABASE [institution] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [institution] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [institution] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [institution] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [institution] SET QUERY_STORE = ON
GO
ALTER DATABASE [institution] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [institution]
GO
/****** Object:  User [school]    Script Date: 23/04/2024 10:58:04 a. m. ******/
CREATE USER [school] FOR LOGIN [school] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [school]
GO
/****** Object:  Table [dbo].[course_teacher]    Script Date: 23/04/2024 10:58:05 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[course_teacher](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[course_id] [bigint] NOT NULL,
	[teacher_id] [bigint] NOT NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[courses]    Script Date: 23/04/2024 10:58:05 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[courses](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](255) NOT NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[failed_jobs]    Script Date: 23/04/2024 10:58:05 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[failed_jobs](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[uuid] [nvarchar](255) NOT NULL,
	[connection] [nvarchar](max) NOT NULL,
	[queue] [nvarchar](max) NOT NULL,
	[payload] [nvarchar](max) NOT NULL,
	[exception] [nvarchar](max) NOT NULL,
	[failed_at] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[migrations]    Script Date: 23/04/2024 10:58:05 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[migrations](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[migration] [nvarchar](255) NOT NULL,
	[batch] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[password_reset_tokens]    Script Date: 23/04/2024 10:58:05 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[password_reset_tokens](
	[email] [nvarchar](255) NOT NULL,
	[token] [nvarchar](255) NOT NULL,
	[created_at] [datetime] NULL,
 CONSTRAINT [password_reset_tokens_email_primary] PRIMARY KEY CLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[password_resets]    Script Date: 23/04/2024 10:58:05 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[password_resets](
	[email] [nvarchar](255) NOT NULL,
	[token] [nvarchar](255) NOT NULL,
	[created_at] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[personal_access_tokens]    Script Date: 23/04/2024 10:58:05 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[personal_access_tokens](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[tokenable_type] [nvarchar](255) NOT NULL,
	[tokenable_id] [bigint] NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[token] [nvarchar](64) NOT NULL,
	[abilities] [nvarchar](max) NULL,
	[last_used_at] [datetime] NULL,
	[expires_at] [datetime] NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[qualifications]    Script Date: 23/04/2024 10:58:05 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[qualifications](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[student_id] [bigint] NOT NULL,
	[course_id] [bigint] NOT NULL,
	[grade] [float] NOT NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[students]    Script Date: 23/04/2024 10:58:05 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[students](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[teachers]    Script Date: 23/04/2024 10:58:05 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[teachers](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 23/04/2024 10:58:05 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[email] [nvarchar](255) NOT NULL,
	[email_verified_at] [datetime] NULL,
	[password] [nvarchar](255) NOT NULL,
	[remember_token] [nvarchar](100) NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[courses] ON 

INSERT [dbo].[courses] ([id], [title], [created_at], [updated_at]) VALUES (1, N'Primero', CAST(N'2024-04-23T14:24:10.973' AS DateTime), CAST(N'2024-04-23T14:24:10.973' AS DateTime))
INSERT [dbo].[courses] ([id], [title], [created_at], [updated_at]) VALUES (2, N'Segundo', CAST(N'2024-04-23T14:24:33.397' AS DateTime), CAST(N'2024-04-23T14:24:47.280' AS DateTime))
INSERT [dbo].[courses] ([id], [title], [created_at], [updated_at]) VALUES (3, N'Tercero', CAST(N'2024-04-23T14:25:25.987' AS DateTime), CAST(N'2024-04-23T14:25:25.987' AS DateTime))
INSERT [dbo].[courses] ([id], [title], [created_at], [updated_at]) VALUES (5, N'Cuarto', CAST(N'2024-04-23T14:25:40.723' AS DateTime), CAST(N'2024-04-23T14:25:40.723' AS DateTime))
SET IDENTITY_INSERT [dbo].[courses] OFF
GO
SET IDENTITY_INSERT [dbo].[migrations] ON 

INSERT [dbo].[migrations] ([id], [migration], [batch]) VALUES (1, N'2014_10_12_000000_create_users_table', 1)
INSERT [dbo].[migrations] ([id], [migration], [batch]) VALUES (2, N'2014_10_12_100000_create_password_reset_tokens_table', 1)
INSERT [dbo].[migrations] ([id], [migration], [batch]) VALUES (3, N'2014_10_12_100000_create_password_resets_table', 1)
INSERT [dbo].[migrations] ([id], [migration], [batch]) VALUES (4, N'2019_08_19_000000_create_failed_jobs_table', 1)
INSERT [dbo].[migrations] ([id], [migration], [batch]) VALUES (5, N'2019_12_14_000001_create_personal_access_tokens_table', 1)
INSERT [dbo].[migrations] ([id], [migration], [batch]) VALUES (6, N'2024_04_11_235427_create_teachers_table', 1)
INSERT [dbo].[migrations] ([id], [migration], [batch]) VALUES (7, N'2024_04_11_235459_create_students_table', 1)
INSERT [dbo].[migrations] ([id], [migration], [batch]) VALUES (8, N'2024_04_11_235512_create_courses_table', 1)
INSERT [dbo].[migrations] ([id], [migration], [batch]) VALUES (9, N'2024_04_11_235526_create_qualifications_table', 1)
SET IDENTITY_INSERT [dbo].[migrations] OFF
GO
SET IDENTITY_INSERT [dbo].[personal_access_tokens] ON 

INSERT [dbo].[personal_access_tokens] ([id], [tokenable_type], [tokenable_id], [name], [token], [abilities], [last_used_at], [expires_at], [created_at], [updated_at]) VALUES (1, N'App\Models\User', 2, N'token', N'007d8fb72ac4847fe6b640c5ed00caad9145066f2522c0ed60986fce88b42010', N'["*"]', CAST(N'2024-04-23T15:15:51.650' AS DateTime), NULL, CAST(N'2024-04-23T15:15:23.237' AS DateTime), CAST(N'2024-04-23T15:15:51.650' AS DateTime))
SET IDENTITY_INSERT [dbo].[personal_access_tokens] OFF
GO
SET IDENTITY_INSERT [dbo].[qualifications] ON 

INSERT [dbo].[qualifications] ([id], [student_id], [course_id], [grade], [created_at], [updated_at]) VALUES (1, 1, 1, 2, CAST(N'2024-04-23T14:29:41.037' AS DateTime), CAST(N'2024-04-23T14:29:41.037' AS DateTime))
INSERT [dbo].[qualifications] ([id], [student_id], [course_id], [grade], [created_at], [updated_at]) VALUES (2, 3, 3, 5, CAST(N'2024-04-23T14:30:28.600' AS DateTime), CAST(N'2024-04-23T14:33:35.157' AS DateTime))
INSERT [dbo].[qualifications] ([id], [student_id], [course_id], [grade], [created_at], [updated_at]) VALUES (4, 2, 2, 10, CAST(N'2024-04-23T14:32:18.693' AS DateTime), CAST(N'2024-04-23T14:32:18.693' AS DateTime))
SET IDENTITY_INSERT [dbo].[qualifications] OFF
GO
SET IDENTITY_INSERT [dbo].[students] ON 

INSERT [dbo].[students] ([id], [name], [created_at], [updated_at]) VALUES (1, N'Sandra Romero', CAST(N'2024-04-23T14:18:56.627' AS DateTime), CAST(N'2024-04-23T14:18:56.627' AS DateTime))
INSERT [dbo].[students] ([id], [name], [created_at], [updated_at]) VALUES (2, N'Yerlin cazanova', CAST(N'2024-04-23T14:19:55.463' AS DateTime), CAST(N'2024-04-23T14:20:13.847' AS DateTime))
INSERT [dbo].[students] ([id], [name], [created_at], [updated_at]) VALUES (3, N'carlos arturo', CAST(N'2024-04-23T14:21:03.303' AS DateTime), CAST(N'2024-04-23T14:21:03.303' AS DateTime))
INSERT [dbo].[students] ([id], [name], [created_at], [updated_at]) VALUES (6, N'Yan carlos', CAST(N'2024-04-23T14:21:46.783' AS DateTime), CAST(N'2024-04-23T14:21:46.783' AS DateTime))
INSERT [dbo].[students] ([id], [name], [created_at], [updated_at]) VALUES (7, N'Aderson Felix', CAST(N'2024-04-23T15:15:51.747' AS DateTime), CAST(N'2024-04-23T15:15:51.747' AS DateTime))
SET IDENTITY_INSERT [dbo].[students] OFF
GO
SET IDENTITY_INSERT [dbo].[teachers] ON 

INSERT [dbo].[teachers] ([id], [name], [created_at], [updated_at]) VALUES (1, N'Juan ricado', CAST(N'2024-04-23T14:14:09.723' AS DateTime), CAST(N'2024-04-23T14:14:09.723' AS DateTime))
INSERT [dbo].[teachers] ([id], [name], [created_at], [updated_at]) VALUES (2, N'Roberto carlos', CAST(N'2024-04-23T14:14:34.893' AS DateTime), CAST(N'2024-04-23T14:16:05.623' AS DateTime))
INSERT [dbo].[teachers] ([id], [name], [created_at], [updated_at]) VALUES (3, N'pedro perez', CAST(N'2024-04-23T14:15:39.440' AS DateTime), CAST(N'2024-04-23T14:15:39.440' AS DateTime))
INSERT [dbo].[teachers] ([id], [name], [created_at], [updated_at]) VALUES (6, N'juan pedro', CAST(N'2024-04-23T14:18:12.283' AS DateTime), CAST(N'2024-04-23T14:18:25.860' AS DateTime))
SET IDENTITY_INSERT [dbo].[teachers] OFF
GO
SET IDENTITY_INSERT [dbo].[users] ON 

INSERT [dbo].[users] ([id], [name], [email], [email_verified_at], [password], [remember_token], [created_at], [updated_at]) VALUES (1, N'admin', N'admin@gmail.com', NULL, N'$2y$10$s.7XZhKlDvcIMhC1QYAPROpEz09znFLUj8frsCbKZ0ZO7Ot4CVep.', NULL, CAST(N'2024-04-23T14:05:59.350' AS DateTime), CAST(N'2024-04-23T14:05:59.350' AS DateTime))
INSERT [dbo].[users] ([id], [name], [email], [email_verified_at], [password], [remember_token], [created_at], [updated_at]) VALUES (2, N'nuevo user', N'nuevouser@gmail.com', NULL, N'$2y$10$5MPsuloDqYlrTydNgmi5k.b3PyLrHuVSRHij95w4qBkMTtjlVmzgy', NULL, CAST(N'2024-04-23T15:08:51.447' AS DateTime), CAST(N'2024-04-23T15:08:51.447' AS DateTime))
SET IDENTITY_INSERT [dbo].[users] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [failed_jobs_uuid_unique]    Script Date: 23/04/2024 10:58:05 a. m. ******/
CREATE UNIQUE NONCLUSTERED INDEX [failed_jobs_uuid_unique] ON [dbo].[failed_jobs]
(
	[uuid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [password_resets_email_index]    Script Date: 23/04/2024 10:58:05 a. m. ******/
CREATE NONCLUSTERED INDEX [password_resets_email_index] ON [dbo].[password_resets]
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [personal_access_tokens_token_unique]    Script Date: 23/04/2024 10:58:05 a. m. ******/
CREATE UNIQUE NONCLUSTERED INDEX [personal_access_tokens_token_unique] ON [dbo].[personal_access_tokens]
(
	[token] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [personal_access_tokens_tokenable_type_tokenable_id_index]    Script Date: 23/04/2024 10:58:05 a. m. ******/
CREATE NONCLUSTERED INDEX [personal_access_tokens_tokenable_type_tokenable_id_index] ON [dbo].[personal_access_tokens]
(
	[tokenable_type] ASC,
	[tokenable_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [users_email_unique]    Script Date: 23/04/2024 10:58:05 a. m. ******/
CREATE UNIQUE NONCLUSTERED INDEX [users_email_unique] ON [dbo].[users]
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[failed_jobs] ADD  DEFAULT (getdate()) FOR [failed_at]
GO
ALTER TABLE [dbo].[course_teacher]  WITH CHECK ADD  CONSTRAINT [course_teacher_course_id_foreign] FOREIGN KEY([course_id])
REFERENCES [dbo].[courses] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[course_teacher] CHECK CONSTRAINT [course_teacher_course_id_foreign]
GO
ALTER TABLE [dbo].[course_teacher]  WITH CHECK ADD  CONSTRAINT [course_teacher_teacher_id_foreign] FOREIGN KEY([teacher_id])
REFERENCES [dbo].[teachers] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[course_teacher] CHECK CONSTRAINT [course_teacher_teacher_id_foreign]
GO
ALTER TABLE [dbo].[qualifications]  WITH CHECK ADD  CONSTRAINT [qualifications_course_id_foreign] FOREIGN KEY([course_id])
REFERENCES [dbo].[courses] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[qualifications] CHECK CONSTRAINT [qualifications_course_id_foreign]
GO
ALTER TABLE [dbo].[qualifications]  WITH CHECK ADD  CONSTRAINT [qualifications_student_id_foreign] FOREIGN KEY([student_id])
REFERENCES [dbo].[students] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[qualifications] CHECK CONSTRAINT [qualifications_student_id_foreign]
GO
USE [master]
GO
ALTER DATABASE [institution] SET  READ_WRITE 
GO
