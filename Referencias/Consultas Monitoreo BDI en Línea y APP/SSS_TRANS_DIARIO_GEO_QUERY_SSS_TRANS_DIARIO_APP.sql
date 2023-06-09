--SSS_TRANS_DIARIO_GEO_QUERY_SSS_TRANS_DIARIO_APP.sql
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
USE [SII.Omega.Weblog]

Declare @Id_UEN as nvarchar(3) = '001'
Declare @Canal as nvarchar(15) = 'APP'
Declare @Trama_Origen as nvarchar(75) = 'SSS_No_Monetaria_APP'
Declare @Procesado as nvarchar(50) = '0'
Declare @DefaultEventApp as nvarchar(250) = 'Intento de Login en proceso'
DECLARE @FECHAHORA_INICIO DATETIME =  DATEADD(MINUTE, -15, GETDATE())
DECLARE @FECHAHORA_FINAL DATETIME =  GETDATE();

--SELECT @FECHAHORA_INICIO, @FECHAHORA_FINAL;

SELECT
TOP (200)
CONCAT(ss.[ID],'-',ISNULL(ssdt.[ID],0)) AS ID_TRANSACCION,
@Id_UEN as Id_UEN,
ISNULL(ssdt.operationDate,ss.createdDate) as Fecha_Ingreso,
NULL AS CODIGO_TRANSACCION,
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
/*SELECT
	  ss.[ID]
      ,ss.[sessionID]
      ,ss.[userID]
      ,ss.[channelName]
      ,ss.[sessionData]
      ,ss.[createdDate]
      ,ss.[lastActivityDate]
      ,ss.[clientIP]
      ,ss.[mobileIMEI]
      ,ssdt.[userSessionID]
      ,ssdt.[clientIP]
      ,ssdt.[operationDate]
      ,ssdt.[userAgent]
      ,ssdt.[host]
      ,ssdt.[referer]
      ,ssdt.[httpMethod]
      ,ssdt.[requestUri]
      ,ssdt.[httpStatusCode]
      ,ssdt.[cookies]
      ,ssdt.[httpParams]
      ,ssdt.[responseHtml]*/
  FROM [dbo].[UsersSessions] ss
  LEFT JOIN [SII.Omega.Weblog].[dbo].[UsersSessionsHttpDetail] ssdt on (ssdt.[userSessionID] = ss.[ID])
  --WHERE CONVERT(datetime,ss.[createdDate],112) BETWEEN CONVERT(datetime, @FECHA1, 112) AND CONVERT(datetime, @FECHA2, 112)
  --WHERE ss.[userID] = 'CBENNASAR'  
  --and CONVERT(VARCHAR(8),ss.[createdDate],112) = '20221108'
  --and ss.id = 119736
  --order by ss.id desc
  ORDER BY ID_TRANSACCION DESC;

/*
select  * from (
  SELECT distinct TOP (200)
responseHtml,
httpMethod
FROM (
SELECT
	  ss.[ID]
      ,ss.[sessionID]
      ,ss.[userID]
      ,ss.[channelName]
      ,ss.[sessionData]
      ,ss.[createdDate]
      ,ss.[lastActivityDate]
      ,ss.[clientIP] as ac
      ,ss.[mobileIMEI]
      ,ssdt.[userSessionID]
      ,ssdt.[clientIP] as at
      ,ssdt.[operationDate]
      ,ssdt.[userAgent]
      ,ssdt.[host]
      ,ssdt.[referer]
      ,ssdt.[httpMethod]
      ,ssdt.[requestUri]
      ,ssdt.[httpStatusCode]
      ,ssdt.[cookies]
      ,ssdt.[httpParams]
      ,ssdt.[responseHtml]
  FROM [SII.Omega.Weblog].[dbo].[UsersSessions] ss
  LEFT JOIN [SII.Omega.Weblog].[dbo].[UsersSessionsHttpDetail] ssdt on (ssdt.[userSessionID] = ss.[ID])
  --WHERE ss.[userID] = 'CBENNASAR'  
  --and CONVERT(VARCHAR(8),ss.[createdDate],112) = '20221108'
  --and ss.id = 119736
  --order by ss.id desc
  ) as t) f
  order by 1;
  */