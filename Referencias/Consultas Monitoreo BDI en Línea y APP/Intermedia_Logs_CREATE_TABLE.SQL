USE [DBIntermediaGeolocalizacion]
GO

/*SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Intermedia_Logs](
	[ID] int IDENTITY (1,1) NOT NULL,
	[ITEM] [nvarchar](50) NOT NULL,
	[DETAILS] [nvarchar](4000) NULL,
	[I_DATE] [datetime] NULL,
	[I_USER] [nvarchar](256)  NULL,
	CONSTRAINT PK_Intermedia_Logs PRIMARY KEY CLUSTERED ([ID])
) ON [PRIMARY]
GO*/

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Emendez
-- Create date: 20230609
-- Description:	Llenado del Audit Trail
-- =============================================
--CREATE TRIGGER dbo.TRG_Intermedia_Logs
ALTER TRIGGER dbo.TRG_Intermedia_Logs 
    ON  dbo.Intermedia_Logs AFTER INSERT
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for trigger here
	--INSERT
	select getdate()
		UPDATE [dbo].[TRG_Intermedia_Logs]
		SET [I_DATE] =getdate()
		   ,[I_USER] = ORIGINAL_LOGIN()
		FROM [dbo].[TRG_Intermedia_Logs] DT 
		INNER JOIN inserted I ON (DT.[ID] = I.[ID]);
END
GO