--SSS_NO_MONETARIA_APP_CREATE_TABLE.SQL
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
USE [DBIntermediaGeolocalizacion]
GO

/****** Object:  Table [dbo].[SSS_NO_MONETARIA_APP]    Script Date: 6/11/2023 10:33:58 PM ******/
SET ANSI_NULLS ON
GO
--DROP TABLE [dbo].[SSS_NO_MONETARIA_APP]
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[SSS_NO_MONETARIA_APP](
	[Id_Transaccion] [varchar](50) NULL,
	[Fecha] [datetime] NULL,
	[Tipo_trx] [varchar](250) NULL,
	[Categ_Trans] [varchar](250) NULL,
	[Evento] [varchar](80) NULL,
	[Estatus] [varchar](50) NULL,
	[Canal] [varchar](50) NULL,
	[Oficina_del_Transaccion] [varchar](50) NULL,
	[Tipo_Cliente] [varchar](50) NULL,
	[No_Contrato] [varchar](50) NULL,
	[No_Terminal] [varchar](50) NULL,
	[COD_Comercio] [varchar](50) NULL,
	[Nombre_Comercio] [varchar](50) NULL,
	[No_Socio] [varchar](50) NULL,
	[No_Sucursal_Socio] [varchar](50) NULL,
	[No_Agencia] [varchar](50) NULL,
	[COD_Cajero] [varchar](50) NULL,
	[Numero_SIB] [varchar](50) NULL,
	[COD_Operacion_SIB] [varchar](50) NULL,
	[No_Sesion] [varchar](50) NULL,
	[No_Aprobacion_Tarjeta] [varchar](50) NULL,
	[COD_TRX_Procesador] [varchar](50) NULL,
	[COD_Procesador] [varchar](50) NULL,
	[Nombre_Red] [varchar](50) NULL,
	[No_CTA_Origen] [varchar](50) NULL,
	[Tipo_CTA_Origen] [varchar](50) NULL,
	[No_CTA_Destino] [varchar](50) NULL,
	[Tipo_CTA_Destino] [varchar](50) NULL,
	[CTA_entidad_remitente] [varchar](50) NULL,
	[cliente_remitente] [varchar](50) NULL,
	[Tipo_ID_remitente] [varchar](50) NULL,
	[Entidad_remitente] [varchar](50) NULL,
	[CTA_entidad_receptora] [varchar](50) NULL,
	[cliente_receptor] [varchar](50) NULL,
	[Tipo_ID_receptor] [varchar](50) NULL,
	[IDENTI_receptor] [varchar](50) NULL,
	[Entidad_receptora] [varchar](50) NULL,
	[Email] [varchar](256) NULL,
	[Estatus_cuenta] [varchar](50) NULL,
	[Referencia_Usuario] [varchar](50) NULL,
	[Moneda_Origen] [varchar](6) NULL,
	[Monto_Origen] [decimal](18, 4) NULL,
	[Moneda_Destino] [varchar](6) NULL,
	[Monto_Destino] [decimal](18, 4) NULL,
	[Subtotal] [decimal](18, 4) NULL,
	[Monto_Comision_Usuario] [decimal](18, 4) NULL,
	[Impuesto] [decimal](18, 4) NULL,
	[Monto_Impuesto] [decimal](18, 4) NULL,
	[Monto_Impuesto_2_] [decimal](18, 4) NULL,
	[Comision_En_Linea] [varchar](50) NULL,
	[Detalle_trx] [varchar](250) NULL,
	[Referencia] [varchar](50) NULL,
	[Envia_Notificacion] [int] NULL,
	[Email_Beneficiario] [varchar](256) NULL,
	[Usuario] [varchar](50) NULL,
	[COD_Respuesta_Backend] [varchar](8000) NULL,
	[Descripcion_Backend] [varchar](8000) NULL,
	[No_Aprobacion_Trader] [varchar](50) NULL,
	[Categoria_CTA_Origen] [varchar](50) NULL,
	[SubCategoria_CTA_Origen] [varchar](50) NULL,
	[Categoria_CTA_Destino] [varchar](50) NULL,
	[SubCategoria_CTA_Destino] [varchar](50) NULL,
	[Responsable] [varchar](50) NULL,
	[Procesado] [int] NULL,
	[Id_UEN] [varchar](50) NULL,
	[Fecha_Ingreso] [datetime] NULL,
	[Numero_Cliente] [varchar](20) NULL
) ON [PRIMARY]
GO

