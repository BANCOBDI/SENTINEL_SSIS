SELECT
ID AS ID_TRANSACCION,
NULL AS CODIGO_TRANSACCION,
'APP' AS CANAL,
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
'SSS_TRANS_DIARIO_GEO_SII' TRAMA,
AT AS IP_CLIENTE,
NULL AS PULSEPLUS_LATITUDE,
NULL AS PULSEPLUS_LONGITUDE,
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
  LEFT JOIN [SII.Omega.Weblog].[dbo].[UsersSessionsHttpDetail] ssdt on (ssdt.[userSessionID] = ss.[ID])\
  WHERE CONVERT(datetime,ss.[createdDate],112) BETWEEN CONVERT(datetime, @FECHA1, 112) AND CONVERT(datetime, @FECHA2, 112)
  ) as t
  ORDER BY ID_TRANSACCION DESC;