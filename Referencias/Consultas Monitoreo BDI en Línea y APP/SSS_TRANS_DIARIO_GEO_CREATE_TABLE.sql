--CREATE TABLE SSS_TRANS_DIARIO_GEO for OMNIA + APP
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
use DBIntermediaGeolocalizacion;

DROP TABLE SSS_TRANS_DIARIO_GEO;

CREATE TABLE SSS_TRANS_DIARIO_GEO(
Id_Transaccion	VARCHAR(256),
Id_UEN			VARCHAR(3),
Fecha_Ingreso	DATETIME,
CODIGO_TRANSACCION	DECIMAL(18,4),
CANAL	VARCHAR(15),
TIPO_TRANSACCION	VARCHAR(250),
TRAMA_ORIGEN	VARCHAR(75),
Procesado   INT,
IP_CLIENTE	VARCHAR(128),
PULSEPLUS_LATITUDE	DECIMAL(18,4),
PULSEPLUS_LONGITUDE	DECIMAL(18,4)
);