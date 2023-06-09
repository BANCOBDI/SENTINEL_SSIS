-- DBIntermediaGeolocalizacion.dbo.SSS_NO_MONETARIA_APP definition

-- Drop table

-- DROP TABLE DBIntermediaGeolocalizacion.dbo.SSS_NO_MONETARIA_APP;

CREATE TABLE DBIntermediaGeolocalizacion.dbo.SSS_NO_MONETARIA_APP (
	No_trx varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Fecha datetime NULL,
	Tipo_trx varchar(250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Categ_Trans varchar(250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Evento varchar(80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Estatus varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Canal varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Oficina_del_Transaccion varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Tipo_Cliente varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	No_Contrato varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	No_Terminal varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	COD_Comercio varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Nombre_Comercio varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	No_Socio varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	No_Sucursal_Socio varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	No_Agencia varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	COD_Cajero varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Numero_SIB varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	COD_Operacion_SIB varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	No_Sesion varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	No_Aprobacion_Tarjeta varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	COD_TRX_Procesador varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	COD_Procesador varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Nombre_Red varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	No_CTA_Origen varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Tipo_CTA_Origen varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	No_CTA_Destino varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Tipo_CTA_Destino varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CTA_entidad_remitente varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	cliente_remitente varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Tipo_ID_remitente varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Entidad_remitente varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CTA_entidad_receptora varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	cliente_receptor varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Tipo_ID_receptor varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	IDENTI_receptor varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Entidad_receptora varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Email varchar(256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Estatus_cuenta varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Referencia_Usuario varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Moneda_Origen varchar(6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Monto_Origen decimal(18,4) NULL,
	Moneda_Destino varchar(6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Monto_Destino decimal(18,4) NULL,
	Subtotal decimal(18,4) NULL,
	Monto_Comision_Usuario decimal(18,4) NULL,
	Impuesto decimal(18,4) NULL,
	Monto_Impuesto decimal(18,4) NULL,
	Monto_Impuesto_2_ decimal(18,4) NULL,
	Comision_En_Linea varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Detalle_trx varchar(250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Referencia varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Envia_Notificacion int NULL,
	Email_Beneficiario varchar(256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Usuario varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	COD_Respuesta_Backend varchar(8000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Descripcion_Backend varchar(8000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	No_Aprobacion_Trader varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Categoria_CTA_Origen varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	SubCategoria_CTA_Origen varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Categoria_CTA_Destino varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	SubCategoria_CTA_Destino varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Responsable varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
);