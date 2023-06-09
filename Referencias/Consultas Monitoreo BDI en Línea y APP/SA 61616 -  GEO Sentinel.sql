--SA 61616 - Monitoreo Banca Móvil y Banca Electrónica + GEO Sentinel (Ambiente Laboratorio)Consultas Monitoreo BDI en Línea y APP
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Ruta de Proyecto: 
--\\bdifileserver02\Common\Tecnologia\Desarrollo\Proyectos\Monitoreo Banca Móvil y Banca Electrónica + GEO Sentinel (Ambiente Laboratorio)
--C:\Users\emendez\Documents\Casos SysAid\_Incidencias  Casos Habituales Sentinel\SA 61616 - GEO Sentinel en Línea y APP

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

USE [DBIntermediaGeolocalizacion]
GO
--00>
	--sp_help '[DBIntermediaGeolocalizacion].[dbo].[Intermedia_PARAMETROS_GEO]'
	--Intermedia_PARAMETROS_GEO_CREATE_TABLE.SQL
	--IntermediaUsersSessions_CREATE_TABLE.SQL
	SELECT * FROM [dbo].[IntermediaUsersSessions];
	--IntermendiaUsersSessionsHttpDetail_CREATE_TABLE.SQL
    SELECT * FROM [dbo].[IntermendiaUsersSessionsHttpDetail];

--APP
--01>SSS_Trans_Diario_Geo
--02>SSS_No_Monetaria_APP
--OMNIA
--01>SSS_Trans_Diario_Geo
--03>SSS_No_Monetaria_OMNIA
--
--SSS_trans_diario(APP+OMNIA)
--01>SSS_Trans_Diario_Geo>04>SSS_trans_diario


--FUENTE DE DATOS
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--SSS_NO_MONETARIA_APP_QUERY.SQL
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
USE [SII.Omega.Weblog];

  DECLARE @FECHAHORA_INICIO DATETIME =  DATEADD(MINUTE, -15, GETDATE())
  DECLARE @FECHAHORA_FINAL DATETIME =  GETDATE();
  DECLARE @PATH VARCHAR(250) = 'payee/getContractServices';
  SELECT @FECHAHORA_INICIO, @FECHAHORA_FINAL;
  SELECT CONCAT(ss.[ID], '-' , ssdt.ID, '-' , REPLACE(REPLACE(REPLACE(REPLACE(CONVERT(nvarchar, ssdt.operationDate, 121),'-',''),':',''),'.',''),' ','')) as [No_trx]
  --select ss.*
  --select ssdt.*
  FROM [SII.Omega.Weblog].[dbo].[UsersSessions] ss WITH (NOLOCK)
  LEFT JOIN [SII.Omega.Weblog].[dbo].[UsersSessionsHttpDetail] ssdt WITH (NOLOCK) on (ssdt.[userSessionID] = ss.[ID])
  --WHERE CONVERT(datetime,ss.[createdDate],112) BETWEEN CONVERT(datetime, @FECHAHORA_INICIO, 112) AND CONVERT(datetime, @FECHAHORA_FINAL, 112)
  WHERE ss.[createdDate] BETWEEN @FECHAHORA_INICIO AND  @FECHAHORA_FINAL
  and ss.[ID] is not null
  --ORDER BY ss.[ID];
  --ORDER BY ss.[ID] DESC
  ;


  --sp_help '[SII.Omega.Weblog].[dbo].[UsersSessions]'
  --sp_help '[DBIntermediaGeolocalizacion].[dbo].[IntermediaUsersSessions]'
  DECLARE @FECHAHORA_INICIO DATETIME =  DATEADD(MINUTE, -60, GETDATE())
  DECLARE @FECHAHORA_FINAL DATETIME =  GETDATE();
  SELECT @FECHAHORA_INICIO, @FECHAHORA_FINAL;
  select top 1000 ss.*
  FROM [SII.Omega.Weblog].[dbo].[UsersSessions] ss WITH (NOLOCK)
  /*WHERE ss.[createdDate] BETWEEN @FECHAHORA_INICIO AND  @FECHAHORA_FINAL
  and ss.[ID] is not null*/
  --where ss.ID = 1236035
  --where ss.userID = 'EMENDEZ' 
  where ss.userID = 'xxx' 
  --and ss.[createdDate] >= @FECHAHORA_INICIO
  ORDER BY ss.[ID] DESC;

  --sp_help '[SII.Omega.Weblog].[dbo].[UsersSessionsHttpDetail]'
  --sp_help '[DBIntermediaGeolocalizacion].[dbo].[IntermendiaUsersSessionsHttpDetail]'
  --DECLARE @FECHAHORA_INICIO DATETIME =  DATEADD(MINUTE, -15, GETDATE());
  --DECLARE @FECHAHORA_FINAL DATETIME =  GETDATE();
  --SELECT @FECHAHORA_INICIO, @FECHAHORA_FINAL;
  select top 100 ssdt.*
  FROM  [SII.Omega.Weblog].[dbo].[UsersSessionsHttpDetail] ssdt WITH (NOLOCK) 
  --where ssdt.userSessionID = 1236035
  where ssdt.userSessionID in (1236909, 1236941 )
  ORDER BY ssdt.[ID] DESC, ssdt.[userSessionID] DESC, ssdt.operationDate desc;


   select ss.ID
  --select top 10 ss.ID
  FROM [SII.Omega.Weblog].[dbo].[UsersSessions] ss WITH (NOLOCK)
  --where ss.ID between 1239900 and 1239914;
  where ss.ID between @ID_Inicio and @ID_Final;

  select ssdt.ID
  --select top 10 ss.ID
  FROM [SII.Omega.Weblog].[dbo].[UsersSessionsHttpDetail] ssdt WITH (NOLOCK)
  --where ssdt.ID between 1239900 and 1239914;
  where ssdt.ID between @ID_Inicio and @ID_Final;


	SELECT ss.[ID]  ,ss.[sessionID] ,ss.[userID] ,ss.[channelName] ,ss.[sessionData] ,ss.[createdDate] ,ss.[lastActivityDate] ,ss.[clientIP] ,ss.[mobileIMEI] ,ss.[mobileNumber] ,ss.[userCulture] ,ss.[timeout] FROM [SII.Omega.Weblog].[dbo].[UsersSessions] ss WITH (NOLOCK) where ss.ID between @ID_Inicio and @ID_Final
	--"SELECT ss.[ID]  ,ss.[sessionID] ,ss.[userID] ,ss.[channelName] ,ss.[sessionData] ,ss.[createdDate] ,ss.[lastActivityDate] ,ss.[clientIP] ,ss.[mobileIMEI] ,ss.[mobileNumber] ,ss.[userCulture] ,ss.[timeout]  FROM [SII.Omega.Weblog].[dbo].[UsersSessions] ss WITH (NOLOCK) where ss.ID between " + (DT_STR, 18 , 1252) @[User::CtrUsersSessions_ID]  + " and "  +  (DT_STR, 18 , 1252) @[User::CtrUsersSessions_ID_APP]
	SELECT ssdt.[ID] ,ssdt.[userSessionID] ,ssdt.[clientIP] ,ssdt.[operationDate] ,ssdt.[userAgent] ,ssdt.[host] ,ssdt.[referer] ,ssdt.[httpMethod] ,ssdt.[requestUri] ,ssdt.[httpStatusCode] ,ssdt.[cookies] ,ssdt.[httpParams] ,ssdt.[responseHtml]  FROM [SII.Omega.Weblog].[dbo].[UsersSessionsHttpDetail] ssdt WITH (NOLOCK) where ssdt.ID between @ID_Inicio and @ID_Final
	--"SELECT ssdt.[ID] ,ssdt.[userSessionID] ,ssdt.[clientIP] ,ssdt.[operationDate] ,ssdt.[userAgent] ,ssdt.[host] ,ssdt.[referer] ,ssdt.[httpMethod] ,ssdt.[requestUri] ,ssdt.[httpStatusCode] ,ssdt.[cookies] ,ssdt.[httpParams] ,ssdt.[responseHtml] FROM [SII.Omega.Weblog].[dbo].[UsersSessionsHttpDetail] ssdt WITH (NOLOCK) where ssdt.ID between " +  (DT_STR, 18 , 1252)@[User::CtrUsersSessionsHttpDetail_ID]  + " and l" + (DT_STR, 18 , 1252)@[User::CtrUsersSessionsHttpDetail_ID_APP]


  USE [SII.Omega.Weblog];
  select ISNULL(max(ss.ID),0) as ID FROM  [SII.Omega.Weblog].[dbo].[UsersSessions] ss WITH (NOLOCK) 
  select ISNULL(max(ssdt.ID),0) as ID FROM  [SII.Omega.Weblog].[dbo].[UsersSessionsHttpDetail] ssdt WITH (NOLOCK) 


--TABLAS INTERMEDIAS
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
use DBIntermediaGeolocalizacion; 
--01>SSS_Trans_Diario_Geo
SELECT * FROM SSS_TRANS_DIARIO_GEO WHERE CANAL = 'OMNIA'
SELECT * FROM SSS_TRANS_DIARIO_GEO WHERE CANAL = 'APP'

SELECT		TRAMA_ORIGEN, COUNT(*) AS CNT
FROM		SSS_TRANS_DIARIO_GEO
GROUP BY	TRAMA_ORIGEN;

--02>SSS_No_Monetaria_APP
SELECT * FROM SSS_NO_MONETARIA_APP;
--03>SSS_No_Monetaria_OMNIA
SELECT * FROM SSS_NO_MONETARIA_OMNIA; 



--Inicialicacion de tablas para proposito de desarrollo
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
USE [DBIntermediaGeolocalizacion]
SELECT * FROM [dbo].[Intermedia_PARAMETROS_GEO]
TRUNCATE TABLE [dbo].[IntermediaUsersSessions];
TRUNCATE TABLE [dbo].[IntermendiaUsersSessionsHttpDetail];
UPDATE [dbo].[Intermedia_PARAMETROS_GEO]  SET [VarValueInteger] = NULL where VarKey = 'UsersSessions.ID'
UPDATE [dbo].[Intermedia_PARAMETROS_GEO]  SET [VarValueInteger] = NULL where VarKey = 'UsersSessionsHttpDetail.ID'
SELECT * FROM [dbo].[Intermedia_PARAMETROS_GEO]
SELECT ISNULL(VarValueInteger,0) + 1 as ID FROM [dbo].[Intermedia_PARAMETROS_GEO] WITH (NOLOCK) where VarKey = 'UsersSessions.ID' 
SELECT ISNULL(VarValueInteger,0) + 1 as ID FROM [dbo].[Intermedia_PARAMETROS_GEO] WITH (NOLOCK) where VarKey = 'UsersSessionsHttpDetail.ID'
SELECT * FROM [dbo].[Intermedia_Logs]
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--TRUNCATE TABLE [DBIntermediaGeolocalizacion].[dbo].[IntermediaUsersSessions]
--TRUNCATE TABLE [DBIntermediaGeolocalizacion].[dbo].[IntermendiaUsersSessionsHttpDetail]
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


USE [DBIntermediaGeolocalizacion]
SELECT * FROM [dbo].[Intermedia_PARAMETROS_GEO]



--SELECT ISNULL(VarValueInteger,0) +1 as ID FROM [dbo].[Intermedia_PARAMETROS_GEO] WITH (NOLOCK) where VarKey = 'UsersSessions.ID' 
--SELECT ISNULL(VarValueInteger,0) +1 as ID FROM [dbo].[Intermedia_PARAMETROS_GEO] WITH (NOLOCK) where VarKey = 'UsersSessionsHttpDetail.ID'

--"UPDATE [dbo].[Intermedia_PARAMETROS_GEO]  SET [VarValueInteger] =  where VarKey = 'UsersSessions.ID'"
--"UPDATE [dbo].[Intermedia_PARAMETROS_GEO]  SET [VarValueInteger] =  where VarKey = 'UsersSessionsHttpDetail.ID'"
