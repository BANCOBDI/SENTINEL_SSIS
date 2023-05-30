--SA 61616 - Monitoreo Banca Móvil y Banca Electrónica + GEO Sentinel (Ambiente Laboratorio)Consultas Monitoreo BDI en Línea y APP
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Ruta de Proyecto: 
--\\bdifileserver02\Common\Tecnologia\Desarrollo\Proyectos\Monitoreo Banca Móvil y Banca Electrónica + GEO Sentinel (Ambiente Laboratorio)
--C:\Users\emendez\Documents\Casos SysAid\_Incidencias  Casos Habituales Sentinel\SA 61616 - GEO Sentinel en Línea y APP

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--01>SSS_Trans_Diario_Geo
--02>SSS_No_Monetaria_APP
--03>SSS_No_Monetaria_OMNIA
--
--04>SSS_trans_diario


--FUENTE DE DATOS
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------



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


