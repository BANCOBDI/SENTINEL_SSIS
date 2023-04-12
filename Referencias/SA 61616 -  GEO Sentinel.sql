--SA 61616 - Monitoreo Banca Móvil y Banca Electrónica + GEO Sentinel (Ambiente Laboratorio)Consultas Monitoreo BDI en Línea y APP

--Ruta de Proyecto: 
--\\bdifileserver02\Common\Tecnologia\Desarrollo\Proyectos\Monitoreo Banca Móvil y Banca Electrónica + GEO Sentinel (Ambiente Laboratorio)\Consultas Monitoreo BDI en Línea y APP



SELECT * FROM SSS_TRANS_DIARIO_GEO
WHERE CANAL = 'OMNIA'

SELECT * FROM SSS_TRANS_DIARIO_GEO
WHERE CANAL = 'APP'

SELECT * FROM SSS_NO_MONETARIA_OMNIA;