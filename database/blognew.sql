USE [blogdb]
GO
/****** Object:  User [bloguser]    Script Date: 06/26/2015 16:33:39 ******/
CREATE USER [bloguser] FOR LOGIN [bloguser] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[userinfo]    Script Date: 06/26/2015 16:33:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[userinfo](
	[id] [nchar](10) NULL,
	[name] [nchar](20) NOT NULL,
	[tel] [nvarchar](20) NOT NULL,
	[pwd] [nvarchar](20) NOT NULL,
	[gender] [nchar](10) NULL,
	[flag] [int] NULL,
	[qq] [nvarchar](50) NOT NULL,
	[reg_time] [datetime] NULL,
	[login_time] [datetime] NULL,
	[visitcount] [int] NULL,
	[postcount] [int] NULL,
	[replycount] [int] NULL,
	[logo] [nvarchar](50) NULL,
	[email] [nvarchar](50) NULL,
	[sign] [nvarchar](200) NULL,
	[reallname] [nvarchar](20) NULL,
	[school] [nvarchar](50) NULL,
	[address] [nvarchar](50) NULL,
 CONSTRAINT [PK_userinfo] PRIMARY KEY CLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[replyinfo]    Script Date: 06/26/2015 16:33:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[replyinfo](
	[replyid] [int] IDENTITY(1,1) NOT NULL,
	[postid] [int] NULL,
	[replycontent] [nvarchar](max) NULL,
	[replyimages] [nvarchar](50) NULL,
	[replytime] [datetime] NULL,
	[replyname] [nvarchar](50) NULL,
	[send] [nchar](10) NULL,
	[replyemail] [nvarchar](20) NULL,
 CONSTRAINT [PK_replyinfo] PRIMARY KEY CLUSTERED 
(
	[replyid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[postinfo]    Script Date: 06/26/2015 16:33:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[postinfo](
	[postid] [int] IDENTITY(1,1) NOT NULL,
	[boardid] [int] NOT NULL,
	[posttitle] [nvarchar](50) NOT NULL,
	[postcontent] [nvarchar](max) NOT NULL,
	[postimages] [nvarchar](50) NULL,
	[posttime] [datetime] NOT NULL,
	[postname] [nvarchar](20) NOT NULL,
	[postclick] [int] NULL,
	[replycount] [int] NULL,
	[replytime] [datetime] NULL,
	[replyname] [nvarchar](50) NULL,
	[postabstract] [nvarchar](200) NULL,
	[postimg] [nvarchar](50) NULL,
 CONSTRAINT [PK_postinfo] PRIMARY KEY CLUSTERED 
(
	[postid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[message]    Script Date: 06/26/2015 16:33:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[message](
	[MessageID] [int] IDENTITY(1,1) NOT NULL,
	[Message] [nchar](10) NULL,
	[Type] [int] NULL,
	[Time] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[boardinfo]    Script Date: 06/26/2015 16:33:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[boardinfo](
	[boardid] [int] IDENTITY(1,1) NOT NULL,
	[boardtime] [datetime] NOT NULL,
	[boarddescription] [nvarchar](200) NOT NULL,
	[boardname] [nvarchar](20) NULL,
 CONSTRAINT [PK_boardinfo] PRIMARY KEY CLUSTERED 
(
	[boardid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Default [DF_postinfo_postclick]    Script Date: 06/26/2015 16:33:39 ******/
ALTER TABLE [dbo].[postinfo] ADD  CONSTRAINT [DF_postinfo_postclick]  DEFAULT ((0)) FOR [postclick]
GO
/****** Object:  Default [DF_postinfo_replycount]    Script Date: 06/26/2015 16:33:39 ******/
ALTER TABLE [dbo].[postinfo] ADD  CONSTRAINT [DF_postinfo_replycount]  DEFAULT ((0)) FOR [replycount]
GO
/****** Object:  Default [DF_replyinfo_send]    Script Date: 06/26/2015 16:33:39 ******/
ALTER TABLE [dbo].[replyinfo] ADD  CONSTRAINT [DF_replyinfo_send]  DEFAULT ((0)) FOR [send]
GO
/****** Object:  Default [DF_userinfo_visitcount]    Script Date: 06/26/2015 16:33:39 ******/
ALTER TABLE [dbo].[userinfo] ADD  CONSTRAINT [DF_userinfo_visitcount]  DEFAULT ((0)) FOR [visitcount]
GO
/****** Object:  Default [DF_userinfo_postcount]    Script Date: 06/26/2015 16:33:39 ******/
ALTER TABLE [dbo].[userinfo] ADD  CONSTRAINT [DF_userinfo_postcount]  DEFAULT ((0)) FOR [postcount]
GO
/****** Object:  Default [DF_userinfo_replycount]    Script Date: 06/26/2015 16:33:39 ******/
ALTER TABLE [dbo].[userinfo] ADD  CONSTRAINT [DF_userinfo_replycount]  DEFAULT ((0)) FOR [replycount]
GO
