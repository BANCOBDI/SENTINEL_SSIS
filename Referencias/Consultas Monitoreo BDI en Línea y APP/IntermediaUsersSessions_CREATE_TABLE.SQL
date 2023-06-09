USE [DBIntermediaGeolocalizacion]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[IntermediaUsersSessions](
	[ID] [bigint] NOT NULL,
	[sessionID] [varchar](512) NULL,
	[userID] [varchar](50) NULL,
	[channelName] [varchar](20) NULL,
	[sessionData] [varbinary](max) NULL,
	[createdDate] [datetime] NULL,
	[lastActivityDate] [datetime] NULL,
	[clientIP] [varchar](50) NULL,
	[mobileIMEI] [varchar](20) NULL,
	[mobileNumber] [varchar](20) NULL,
	[userCulture] [varchar](5) NULL,
	[timeout] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO


