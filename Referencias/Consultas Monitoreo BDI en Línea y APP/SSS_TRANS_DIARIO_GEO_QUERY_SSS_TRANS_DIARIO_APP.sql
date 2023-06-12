--SSS_TRANS_DIARIO_GEO_QUERY_SSS_TRANS_DIARIO_APP.sql
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--USE [SII.Omega.Weblog]
USE [DBIntermediaGeolocalizacion]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		EMENDEZ
-- Create date: 20230611
-- Description:	Llena SSS_Trans_Diario_Geo_APP
-- =============================================

/*
DECLARE @RC int
DECLARE @Fecha_Inicio datetime = GETDATE()-365-365
DECLARE @Fecha_Final datetime = GETDATE()
EXECUTE @RC = [dbo].[Insert_SSS_Trans_Diario_Geo_APP] 
   @Fecha_Inicio
  ,@Fecha_Final
SELECT * FROM [dbo].[SSS_TRANS_DIARIO_GEO]
*/

--CREATE PROCEDURE Insert_SSS_Trans_Diario_Geo_APP
ALTER PROCEDURE Insert_SSS_Trans_Diario_Geo_APP 
	-- Add the parameters for the stored procedure here
	@Fecha_Inicio datetime, 
	@Fecha_Final datetime 
AS
	Declare @Id_UEN as nvarchar(3) = '001'
	Declare @Canal as nvarchar(15) = 'APP'
	Declare @Trama_Origen as nvarchar(75) = 'SSS_No_Monetaria_APP'
	Declare @Procesado as nvarchar(50) = 0
	DECLARE @SSDT_ID as Bigint = 0 
	Declare @DefaultEventApp as nvarchar(250) = 'Intento de Login en proceso'
	DECLARE @FECHAHORA_INICIO DATETIME =  ISNULL(@Fecha_Inicio, DATEADD(MINUTE, -15, GETDATE()))
	DECLARE @FECHAHORA_FINAL DATETIME =  ISNULL(@Fecha_Final,GETDATE());
	DECLARE @miCursor CURSOR;
	--[dbo].[SSS_TRANS_DIARIO_GEO]
	DECLARE @C_Id_Transaccion nvarchar(256)
	Declare @C_Id_UEN as nvarchar(3) = '001'
	DECLARE @c_Fecha_Ingreso AS DATETIME
	DECLARE @C_CODIGO_TRANSACCION DECIMAL(18,4)
	DECLARE @C_CANAL nvarchar(15)
	DECLARE @C_TIPO_TRANSACCION nvarchar(250)
	DECLARE @C_TRAMA_ORIGEN nvarchar(75)
	DECLARE @C_Procesado INTEGER
	DECLARE @C_IP_CLIENTE nvarchar(128)
	DECLARE @C_PULSEPLUS_LATITUDE DECIMAL(18,4)
	DECLARE @C_PULSEPLUS_LONGITUDE DECIMAL(18,4)

BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SET @miCursor = CURSOR FOR
	SELECT
	TOP (200)
	CONCAT(ss.[ID],'-',ISNULL(@SSDT_ID,0)) AS ID_TRANSACCION,
	@Id_UEN as Id_UEN,
	ss.createdDate as Fecha_Ingreso,
	ISNULL(@SSDT_ID,0) AS CODIGO_TRANSACCION,
	@Canal AS CANAL,
	@DefaultEventApp as TIPO_TRANSACCION,
	@Trama_Origen as TRAMA,
	@Procesado as Procesado,
	ss.[clientIP] AS IP_CLIENTE,
	NULL AS PULSEPLUS_LATITUDE,
	NULL AS PULSEPLUS_LONGITUDE
	  --FROM [SII.Omega.Weblog].[dbo].[UsersSessions] ss WITH (NOLOCK)
	  FROM [DBIntermediaGeolocalizacion].[dbo].[IntermediaUsersSessions] ss WITH (NOLOCK)
    WHERE ss.createdDate BETWEEN @FECHAHORA_INICIO AND @FECHAHORA_FINAL
	union all
	SELECT
	TOP (200)
	CONCAT(ss.[ID],'-',ISNULL(ssdt.[ID],0)) AS ID_TRANSACCION,
	@Id_UEN as Id_UEN,
	ISNULL(ssdt.operationDate,ss.createdDate) as Fecha_Ingreso,
	ISNULL(ssdt.[ID],0) AS CODIGO_TRANSACCION,
	@Canal AS CANAL,
	--SUBSTRING(requestUri, 45, 100) as TIPO_TRANSACCION,
	ISNULL(
	REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
	IIF(CHARINDEX('?',SUBSTRING(ssdt.requestUri, 45, 100)) = 0, SUBSTRING(ssdt.requestUri, 45, 100), SUBSTRING(ssdt.requestUri, 45, (CHARINDEX('?',SUBSTRING(ssdt.requestUri, 45, 100))) - 1)), 
	'1', ''),
	'2', ''),
	'3', ''),
	'4', ''),
	'5', ''),
	'6', ''),
	'7', ''),
	'8', ''),
	'9', ''),
	'0', ''),
	@DefaultEventApp) as TIPO_TRANSACCION,
	@Trama_Origen as TRAMA,
	@Procesado as Procesado,
	ss.[clientIP] AS IP_CLIENTE,
	NULL AS PULSEPLUS_LATITUDE,
	NULL AS PULSEPLUS_LONGITUDE
	  --FROM [SII.Omega.Weblog].[dbo].[UsersSessions] ss WITH (NOLOCK)
	  FROM [DBIntermediaGeolocalizacion].[dbo].[IntermediaUsersSessions] ss WITH (NOLOCK)
	  --LEFT JOIN [SII.Omega.Weblog].[dbo].[UsersSessionsHttpDetail] ssdt WITH (NOLOCK) on (ssdt.[userSessionID] = ss.[ID])
	  LEFT JOIN [DBIntermediaGeolocalizacion].[dbo].[IntermendiaUsersSessionsHttpDetail] ssdt WITH (NOLOCK) on (ssdt.[userSessionID] = ss.[ID])
	WHERE ssdt.[ID] IS NOT NULL  
	AND ISNULL(ssdt.operationDate,ss.createdDate) BETWEEN @FECHAHORA_INICIO AND @FECHAHORA_FINAL
	ORDER BY 3, 1 ASC;

	OPEN @miCursor;
	
	FETCH NEXT FROM @miCursor INTO @C_Id_Transaccion, @C_Id_UEN , @c_Fecha_Ingreso, @C_CODIGO_TRANSACCION, @C_CANAL, @C_TIPO_TRANSACCION, @C_TRAMA_ORIGEN, @C_Procesado ,@C_IP_CLIENTE, @C_PULSEPLUS_LATITUDE, @C_PULSEPLUS_LONGITUDE;

	WHILE @@FETCH_STATUS = 0
	BEGIN
		INSERT INTO [dbo].[SSS_TRANS_DIARIO_GEO] ([Id_Transaccion] ,[Id_UEN] ,[Fecha_Ingreso],[CODIGO_TRANSACCION] ,[CANAL] ,[TIPO_TRANSACCION] ,[TRAMA_ORIGEN] ,[IP_CLIENTE] ,[PULSEPLUS_LATITUDE] ,[PULSEPLUS_LONGITUDE] ,[Procesado])
		VALUES (@C_Id_Transaccion ,@C_Id_UEN  ,@c_Fecha_Ingreso ,@C_CODIGO_TRANSACCION, @C_CANAL, @C_TIPO_TRANSACCION, @C_TRAMA_ORIGEN, @C_IP_CLIENTE, @C_PULSEPLUS_LATITUDE, @C_PULSEPLUS_LONGITUDE, @C_Procesado)
		
		FETCH NEXT FROM @miCursor INTO @C_Id_Transaccion, @C_Id_UEN , @c_Fecha_Ingreso, @C_CODIGO_TRANSACCION, @C_CANAL, @C_TIPO_TRANSACCION, @C_TRAMA_ORIGEN, @C_Procesado ,@C_IP_CLIENTE, @C_PULSEPLUS_LATITUDE, @C_PULSEPLUS_LONGITUDE;
	END;

	CLOSE @miCursor;
	DEALLOCATE @miCursor;
END
GO