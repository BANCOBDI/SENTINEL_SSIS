--SA 61616 - Monitoreo Banca Móvil y Banca Electrónica + GEO Sentinel (Ambiente Laboratorio)Consultas Monitoreo BDI en Línea y APP
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Ruta de Proyecto: 
--\\bdifileserver02\Common\Tecnologia\Desarrollo\Proyectos\Monitoreo Banca Móvil y Banca Electrónica + GEO Sentinel (Ambiente Laboratorio)
--C:\Users\emendez\Documents\Casos SysAid\_Incidencias  Casos Habituales Sentinel\SA 61616 - GEO Sentinel en Línea y APP

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


--00>
	--sp_help '[DBIntermediaGeolocalizacion].[dbo].[Intermedia_PARAMETROS_GEO]'
	--Intermedia_PARAMETROS_GEO_CREATE_TABLE.SQL
	--IntermediaUsersSessions_CREATE_TABLE.SQL
	--IntermendiaUsersSessionsHttpDetail_CREATE_TABLE.SQL

--01>SSS_Trans_Diario_Geo
--02>SSS_No_Monetaria_APP
--03>SSS_No_Monetaria_OMNIA
--
--04>SSS_trans_diario


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


