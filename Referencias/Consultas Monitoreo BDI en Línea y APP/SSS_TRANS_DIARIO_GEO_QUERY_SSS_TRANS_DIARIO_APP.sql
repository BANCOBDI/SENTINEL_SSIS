--SSS_TRANS_DIARIO_GEO_QUERY_SSS_TRANS_DIARIO_APP.sql
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
USE [SII.Omega.Weblog]

SELECT
TOP (200)
ID AS ID_TRANSACCION,
NULL AS CODIGO_TRANSACCION,
'APP' AS CANAL,
--SUBSTRING(requestUri, 45, 100) as TIPO_TRANSACCION,
REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
IIF(CHARINDEX('?',SUBSTRING(requestUri, 45, 100)) = 0, SUBSTRING(requestUri, 45, 100), SUBSTRING(requestUri, 45, (CHARINDEX('?',SUBSTRING(requestUri, 45, 100))) - 1)), 
'1', ''),
'2', ''),
'3', ''),
'4', ''),
'5', ''),
'6', ''),
'7', ''),
'8', ''),
'9', ''),
'0', '') as TIPO_TRANSACCION,
'SSS_TRANS_DIARIO_APP' TRAMA,
AT AS IP_CLIENTE,
NULL AS PULSEPLUS_LATITUDE,
NULL AS PULSEPLUS_LONGITUDE--,
--*
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
  FROM [dbo].[UsersSessions] ss
  LEFT JOIN [SII.Omega.Weblog].[dbo].[UsersSessionsHttpDetail] ssdt on (ssdt.[userSessionID] = ss.[ID])
  --WHERE CONVERT(datetime,ss.[createdDate],112) BETWEEN CONVERT(datetime, @FECHA1, 112) AND CONVERT(datetime, @FECHA2, 112)
  --WHERE ss.[userID] = 'CBENNASAR'  
  --and CONVERT(VARCHAR(8),ss.[createdDate],112) = '20221108'
  --and ss.id = 119736
  --order by ss.id desc
  ) as t
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