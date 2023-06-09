USE [DBIntermediaGeolocalizacion]
GO
--DROP TRIGGER dbo.TRG_Intermedia_PARAMETROS_GEO
--DROP TABLE [dbo].[Intermedia_PARAMETROS_GEO]
GO
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Intermedia_PARAMETROS_GEO](
	[ID] int IDENTITY (1,1) NOT NULL,
	[VarKey] [nvarchar](50) NOT NULL,
	[VarValueTxt] [nvarchar](4000) NULL,
	[VarValueDecimal] [Decimal] (38,6) NULL,
	[VarValueInteger] [bigint] NULL,
	[I_DATE] [datetime] NULL,
	[I_USER] [nvarchar](256)  NULL,
	[U_DATE] [datetime] NULL,
	[U_USER] [nvarchar](256)  NULL,
	CONSTRAINT PK_Intermedia_PARAMETROS_GEO PRIMARY KEY CLUSTERED ([VarKEY])
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Emendez
-- Create date: 20230609
-- Description:	Llenado del Audit Trail
-- =============================================
--CREATE TRIGGER dbo.TRG_Intermedia_PARAMETROS_GEO 
ALTER TRIGGER dbo.TRG_Intermedia_PARAMETROS_GEO 
    ON  dbo.Intermedia_PARAMETROS_GEO AFTER INSERT,DELETE,UPDATE
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for trigger here
	IF EXISTS ( SELECT 1 FROM Deleted )
	BEGIN
		IF EXISTS ( SELECT 1 FROM Inserted )
		BEGIN
			--UPDATE
			--select getdate()
			UPDATE [dbo].[Intermedia_PARAMETROS_GEO]
			   SET [I_DATE] = ISNULL(ISNULL(I.I_DATE,D.I_DATE),getdate())
				  ,[I_USER] = ISNULL(ISNULL(I.I_USER,D.I_USER),ORIGINAL_LOGIN())
				  ,[U_DATE] = getdate()
				  ,[U_USER] =  ORIGINAL_LOGIN()
			 FROM [dbo].[Intermedia_PARAMETROS_GEO] DT 
			 INNER JOIN inserted I ON (DT.[ID] = I.[ID])
			 INNER JOIN deleted D ON (DT.[ID] = d.[ID]);

			INSERT INTO [dbo].[Intermedia_Logs] ([OPERACTION] ,[VarKey] ,[VarValueTxt] ,[VarValueDecimal],[VarValueInteger])
			SELECT 'U', DT.[VarKey] ,DT.[VarValueTxt] , DT.[VarValueDecimal], DT.[VarValueInteger]
			FROM [dbo].[Intermedia_PARAMETROS_GEO] DT 
			INNER JOIN deleted D ON (DT.[ID] = D.[ID]);
		END
		ELSE
		BEGIN
			--DELETE
			--select getdate()
			INSERT INTO [dbo].[Intermedia_Logs] ([OPERACTION] ,[VarKey] ,[VarValueTxt] ,[VarValueDecimal],[VarValueInteger])
			SELECT 'D', DT.[VarKey] ,DT.[VarValueTxt] , DT.[VarValueDecimal], DT.[VarValueInteger]
			FROM [dbo].[Intermedia_PARAMETROS_GEO] DT 
			INNER JOIN deleted D ON (DT.[ID] = D.[ID]);
		END
	END
	ELSE
	   BEGIN
			--INSERT
			--select getdate()
			UPDATE [dbo].[Intermedia_PARAMETROS_GEO]
			   SET [I_DATE] =getdate()
				  ,[I_USER] = ORIGINAL_LOGIN()
				  ,[U_DATE] = NULL
				  ,[U_USER] = NULL
			 FROM [dbo].[Intermedia_PARAMETROS_GEO] DT 
			 INNER JOIN inserted I ON (DT.[ID] = I.[ID]);

			 INSERT INTO [dbo].[Intermedia_Logs] ([OPERACTION] ,[VarKey] ,[VarValueTxt] ,[VarValueDecimal],[VarValueInteger])
			 SELECT 'I', DT.[VarKey] ,DT.[VarValueTxt] , DT.[VarValueDecimal], DT.[VarValueInteger]
			 FROM [dbo].[Intermedia_PARAMETROS_GEO] DT 
			 INNER JOIN inserted I ON (DT.[ID] = I.[ID]);
	   END 
	END
GO
--TRUNCATE TABLE [dbo].[Intermedia_PARAMETROS_GEO];
GO
INSERT INTO [dbo].[Intermedia_PARAMETROS_GEO] ([VarKEY], [VarValueInteger]) VALUES ('UsersSessions.ID',NULL);
INSERT INTO [dbo].[Intermedia_PARAMETROS_GEO] ([VarKEY], [VarValueInteger]) VALUES ('UsersSessionsHttpDetail.ID',NULL);

GO
