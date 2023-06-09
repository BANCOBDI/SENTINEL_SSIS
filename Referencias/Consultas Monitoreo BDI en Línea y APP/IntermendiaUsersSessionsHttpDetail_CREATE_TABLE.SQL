USE [DBIntermediaGeolocalizacion]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[IntermendiaUsersSessionsHttpDetail](
	[ID] [bigint] NULL,
	[userSessionID] [bigint] NULL,
	[clientIP] [varchar](50) NULL,
	[operationDate] [datetime] NULL,
	[userAgent] [varchar](200) NULL,
	[host] [varchar](50) NULL,
	[referer] [varchar](800) NULL,
	[httpMethod] [varchar](10) NULL,
	[requestUri] [varchar](800) NULL,
	[httpStatusCode] [varchar](4) NULL,
	[cookies] [varchar](2000) NULL,
	[httpParams] [varchar](max) NULL,
	[responseHtml] [varchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO


