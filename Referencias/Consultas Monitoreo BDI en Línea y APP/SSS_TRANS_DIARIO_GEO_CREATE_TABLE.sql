--CREATE TABLE SSS_TRANS_DIARIO_GEO for OMNIA + APP
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
use DBIntermediaGeolocalizacion;

DROP TABLE SSS_TRANS_DIARIO_GEO;

CREATE TABLE SSS_TRANS_DIARIO_GEO(
ID_TRANSACCION	VARCHAR(256),
CODIGO_TRANSACCION	DECIMAL(18,4),
CANAL	VARCHAR(15),
TIPO_TRANSACCION	VARCHAR(250),
TRAMA_ORIGEN	VARCHAR(75),
IP_CLIENTE	VARCHAR(128),
PULSEPLUS_LATITUDE	DECIMAL(18,4),
PULSEPLUS_LONGITUDE	DECIMAL(18,4)
);