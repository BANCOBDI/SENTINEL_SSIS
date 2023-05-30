-- DBIntermediaGeolocalizacion.dbo.SSS_TRANS_DIARIO_GEO definition

-- Drop table

-- DROP TABLE DBIntermediaGeolocalizacion.dbo.SSS_TRANS_DIARIO_GEO;

CREATE TABLE DBIntermediaGeolocalizacion.dbo.SSS_TRANS_DIARIO_GEO (
	ID_TRANSACCION varchar(256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CODIGO_TRANSACCION decimal(18,4) NULL,
	CANAL varchar(15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	TIPO_TRANSACCION varchar(250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	TRAMA_ORIGEN varchar(75) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	IP_CLIENTE varchar(128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	PULSEPLUS_LATITUDE decimal(18,4) NULL,
	PULSEPLUS_LONGITUDE decimal(18,4) NULL
);