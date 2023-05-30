--SSS_NO_MONETARIA_APP_QUERY.SQL
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

USE [SII.Omega.Weblog];

IF OBJECT_ID(N'tempdb..#SSS_NO_MONETARIA_APP') IS NOT NULL
BEGIN
DROP TABLE #SSS_NO_MONETARIA_APP
END


CREATE TABLE #SSS_NO_MONETARIA_APP(
No_trx	Varchar(50),
Fecha	datetime,
Tipo_trx	Varchar(250),
Categ_Trans	Varchar(250),
Evento	Varchar(80),
Estatus	Varchar(50),
Canal	Varchar(50),
Oficina_del_Transaccion	Varchar(50),
Tipo_Cliente	Varchar(50),
No_Contrato	Varchar(50),
No_Terminal	Varchar(50),
COD_Comercio	Varchar(50),
Nombre_Comercio	Varchar(50),
No_Socio	Varchar(50),
No_Sucursal_Socio	Varchar(50),
No_Agencia	Varchar(50),
COD_Cajero	Varchar(50),
Numero_SIB	Varchar(50),
COD_Operacion_SIB	Varchar(50),
No_Sesion	Varchar(50),
No_Aprobacion_Tarjeta	Varchar(50),
COD_TRX_Procesador	Varchar(50),
COD_Procesador	Varchar(50),
Nombre_Red	Varchar(50),
No_CTA_Origen	Varchar(50),
Tipo_CTA_Origen	Varchar(50),
No_CTA_Destino	Varchar(50),
Tipo_CTA_Destino	Varchar(50),
CTA_entidad_remitente	Varchar(50),
cliente_remitente	Varchar(50),
Tipo_ID_remitente	Varchar(50),
Entidad_remitente	Varchar(50),
CTA_entidad_receptora	Varchar(50),
cliente_receptor	Varchar(50),
Tipo_ID_receptor	Varchar(50),
IDENTI_receptor	Varchar(50),
Entidad_receptora	Varchar(50),
Email	Varchar(256),
Estatus_cuenta	Varchar(50),
Referencia_Usuario	Varchar(50),
Moneda_Origen	Varchar(6),
Monto_Origen	DECIMAL(18,4),
Moneda_Destino	Varchar(6),
Monto_Destino	DECIMAL(18,4),
Subtotal	DECIMAL(18,4),
Monto_Comision_Usuario	DECIMAL(18,4),
Impuesto	DECIMAL(18,4),
Monto_Impuesto	DECIMAL(18,4),
Monto_Impuesto_2_	DECIMAL(18,4),
Comision_En_Linea	Varchar(50),
Detalle_trx	Varchar(250),
Referencia	Varchar(50),
Envia_Notificacion	INT,
Email_Beneficiario	Varchar(256),
Usuario	Varchar(50),
COD_Respuesta_Backend	Varchar(8000),
Descripcion_Backend	Varchar(8000),
No_Aprobacion_Trader	Varchar(50),
Categoria_CTA_Origen	Varchar(50),
SubCategoria_CTA_Origen	Varchar(50),
Categoria_CTA_Destino	Varchar(50),
SubCategoria_CTA_Destino	Varchar(50),
Responsable	Varchar(50)
);


--CREATE PROCEDURE SP_NO_MONETARIA_APP
--AS
DECLARE @FECHA1 DATETIME =  GETDATE();
DECLARE @FECHA2 DATETIME =  GETDATE() + 1;
DECLARE @PATH VARCHAR(250) = 'payee/getContractServices';

SELECT @FECHA1, @FECHA2;

/*
PATH QUE NO IRIAN A FORMATEARSE

account/getStatementDates
summary/summary/account/detail/
autopayment/paymentAgendaForToday
summary/summary/accounts
payee/getLoanBalance
payee/getRechargeInfo
customer/getFavoriteTransactionsDetail
payee/editPayee
summary/accountsStats
device/pushenrollment
payee/deletePayee
payee/getBillBalance
payee/validatePayee
scheduledTransactions/listSchedules
payee/getInterbankingPayees/list
payee/getMyAccountsPayees
*/

DECLARE @No_trx	Varchar(50);
DECLARE @Fecha	datetime;
DECLARE @Tipo_trx	Varchar(250);
DECLARE @Categ_Trans	Varchar(250);
DECLARE @Evento	Varchar(80);
DECLARE @Estatus	Varchar(50);
DECLARE @Canal	Varchar(50);
DECLARE @Oficina_del_Transaccion	Varchar(50);
DECLARE @Tipo_Cliente	Varchar(50);
DECLARE @No_Contrato	Varchar(50);
DECLARE @No_Terminal	Varchar(50);
DECLARE @COD_Comercio	Varchar(50);
DECLARE @Nombre_Comercio	Varchar(50);
DECLARE @No_Socio	Varchar(50);
DECLARE @No_Sucursal_Socio	Varchar(50);
DECLARE @No_Agencia	Varchar(50);
DECLARE @COD_Cajero	Varchar(50);
DECLARE @Numero_SIB	Varchar(50);
DECLARE @COD_Operacion_SIB	Varchar(50);
DECLARE @No_Sesion	Varchar(50);
DECLARE @No_Aprobacion_Tarjeta	Varchar(50);
DECLARE @COD_TRX_Procesador	Varchar(50);
DECLARE @COD_Procesador	Varchar(50);
DECLARE @Nombre_Red	Varchar(50);
DECLARE @No_CTA_Origen	Varchar(50);
DECLARE @Tipo_CTA_Origen	Varchar(50);
DECLARE @No_CTA_Destino	Varchar(50);
DECLARE @Tipo_CTA_Destino	Varchar(50);
DECLARE @CTA_entidad_remitente	Varchar(50);
DECLARE @cliente_remitente	Varchar(50);
DECLARE @Tipo_ID_remitente	Varchar(50);
DECLARE @Entidad_remitente	Varchar(50);
DECLARE @CTA_entidad_receptora	Varchar(50);
DECLARE @cliente_receptor	Varchar(50);
DECLARE @Tipo_ID_receptor	Varchar(50);
DECLARE @IDENTI_receptor	Varchar(50);
DECLARE @Entidad_receptora	Varchar(50);
DECLARE @Email	Varchar(256);
DECLARE @Estatus_cuenta	Varchar(50);
DECLARE @Referencia_Usuario	Varchar(50);
DECLARE @Moneda_Origen	Varchar(6);
DECLARE @Monto_Origen	DECIMAL(18,4);
DECLARE @Moneda_Destino	Varchar(6);
DECLARE @Monto_Destino	DECIMAL(18,4);
DECLARE @Subtotal	DECIMAL(18,4);
DECLARE @Monto_Comision_Usuario	DECIMAL(18,4);
DECLARE @Impuesto	DECIMAL(18,4);
DECLARE @Monto_Impuesto	DECIMAL(18,4);
DECLARE @Monto_Impuesto_2_	DECIMAL(18,4);
DECLARE @Comision_En_Linea	Varchar(50);
DECLARE @Detalle_trx	Varchar(250);
DECLARE @Referencia	Varchar(50);
DECLARE @Envia_Notificacion	INT;
DECLARE @Email_Beneficiario	Varchar(256);
DECLARE @Usuario	Varchar(50);
DECLARE @COD_Respuesta_Backend	Varchar(8000);
DECLARE @Descripcion_Backend	Varchar(8000);
DECLARE @No_Aprobacion_Trader	Varchar(50);
DECLARE @Categoria_CTA_Origen	Varchar(50);
DECLARE @SubCategoria_CTA_Origen	Varchar(50);
DECLARE @Categoria_CTA_Destino	Varchar(50);
DECLARE @SubCategoria_CTA_Destino	Varchar(50);
DECLARE @Responsable	Varchar(50);

DECLARE @ID varchar(250);
DECLARE @sessionID varchar(250);
DECLARE @userID varchar(250);
DECLARE @channelName varchar(250);
DECLARE @sessionData varchar(250);
DECLARE @createdDate datetime;
DECLARE @lastActivityDate datetime;
DECLARE @mobileIMEI varchar(250);
DECLARE @userSessionID varchar(250);
DECLARE @IP_CLIENTE varchar(250);
DECLARE @operationDate datetime;
DECLARE @userAgent varchar(250);
DECLARE @host varchar(250);
DECLARE @referer varchar(250);
DECLARE @httpMethod varchar(250);
DECLARE @httpStatusCode varchar(250);
DECLARE @cookies varchar(250);
DECLARE @httpParams varchar(250);
DECLARE @responseHtml varchar(MAX);
DECLARE @EVENTO2 varchar(250);

DECLARE @miCursor CURSOR;

BEGIN

SET @miCursor = CURSOR FOR
SELECT
	  ss.[ID]
      ,ss.[sessionID]
      ,ss.[userID]
      ,ss.[channelName]
      ,ss.[sessionData]
      ,ss.[createdDate]
      ,ss.[lastActivityDate]
      --,ss.[clientIP] as ac
      ,ss.[mobileIMEI]
      ,ssdt.[userSessionID]
      ,ssdt.[clientIP] as IP_CLIENTE
      ,ssdt.[operationDate]
      ,ssdt.[userAgent]
      ,ssdt.[host]
      ,ssdt.[referer]
      ,ssdt.[httpMethod]
      ,ssdt.[httpStatusCode]
      ,ssdt.[cookies]
      ,ssdt.[httpParams]
      ,ssdt.[responseHtml]
	  ,REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
	  IIF(CHARINDEX('?',SUBSTRING(ssdt.[requestUri], 45, 100)) = 0, SUBSTRING(ssdt.[requestUri], 45, 100), SUBSTRING(ssdt.[requestUri], 45, (CHARINDEX('?',SUBSTRING(ssdt.[requestUri], 45, 100))) - 1)), 
		'1', ''),
		'2', ''),
		'3', ''),
		'4', ''),
		'5', ''),
		'6', ''),
		'7', ''),
		'8', ''),
		'9', ''),
		'0', '') AS EVENTO
  FROM [SII.Omega.Weblog].[dbo].[UsersSessions] ss WITH (NOLOCK)
  LEFT JOIN [SII.Omega.Weblog].[dbo].[UsersSessionsHttpDetail] ssdt WITH (NOLOCK) on (ssdt.[userSessionID] = ss.[ID])
  WHERE CONVERT(datetime,ss.[createdDate],112) BETWEEN CONVERT(datetime, @FECHA1, 112) AND CONVERT(datetime, @FECHA2, 112);

  OPEN @miCursor;

  FETCH NEXT FROM @miCursor INTO @ID, @sessionId, @userID, @channelName, @sessionData, @createdDate, @lastActivityDate, @mobileIMEI,
  @userSessionID, @IP_CLIENTE, @operationDate, @userAgent, @host, @referer, @httpMethod, @httpStatusCode, @cookies, @httpParams,
  @responseHtml, @EVENTO2;

  WHILE @@FETCH_STATUS = 0
  BEGIN
	SET @No_trx = @ID;
	SET @Fecha = @operationDate;
	SET @Tipo_trx = NULL;
	SET @Categ_Trans = NULL;
	SET @Evento = @EVENTO2;
	SET @Estatus = NULL;
	SET @Canal = 'APP';
	SET @Oficina_del_Transaccion = NULL;
	SET @Tipo_Cliente = NULL;
	SET @No_Contrato = NULL;
	SET @No_Terminal = @host;
	SET @COD_Comercio = NULL;
	SET @Nombre_Comercio = NULL;
	SET @No_Socio = NULL;
	SET @No_Sucursal_Socio = NULL;
	SET @No_Agencia = NULL;
	SET @COD_Cajero = NULL;
	SET @Numero_SIB = NULL;
	SET @COD_Operacion_SIB = NULL;
	SET @No_Sesion = @userSessionID;
	SET @No_Aprobacion_Tarjeta = NULL;
	SET @COD_TRX_Procesador = NULL;
	SET @COD_Procesador = NULL;
	SET @Nombre_Red = NULL;
	SET @No_CTA_Origen = NULL;
	SET @Tipo_CTA_Origen = NULL;
	SET @No_CTA_Destino = NULL;
	SET @Tipo_CTA_Destino = NULL;
	SET @CTA_entidad_remitente = NULL;
	SET @cliente_remitente = NULL;
	SET @Tipo_ID_remitente = NULL;
	SET @Entidad_remitente = NULL;
	SET @CTA_entidad_receptora = NULL;
	SET @cliente_receptor = NULL;
	SET @Tipo_ID_receptor = NULL;
	SET @IDENTI_receptor = NULL;
	SET @Entidad_receptora = NULL;
	SET @Email = NULL;
	SET @Estatus_cuenta = NULL;
	SET @Referencia_Usuario = @userID;
	SET @Moneda_Origen = NULL;
	SET @Monto_Origen = NULL;
	SET @Moneda_Destino = NULL;
	SET @Monto_Destino = NULL;
	SET @Subtotal = NULL;
	SET @Monto_Comision_Usuario = NULL;
	SET @Impuesto = NULL;
	SET @Monto_Impuesto = NULL;
	SET @Monto_Impuesto_2_ = NULL;
	SET @Comision_En_Linea = NULL;
	SET @Detalle_trx = NULL;
	SET @Referencia = NULL;
	SET @Envia_Notificacion = NULL;
	SET @Email_Beneficiario = NULL;
	SET @Usuario = @userID;
	SET @COD_Respuesta_Backend = NULL;
	SET @Descripcion_Backend = NULL;
	SET @No_Aprobacion_Trader = NULL;
	SET @Categoria_CTA_Origen = NULL;
	SET @SubCategoria_CTA_Origen = NULL;
	SET @Categoria_CTA_Destino = NULL;
	SET @SubCategoria_CTA_Destino = NULL;
	SET @Responsable = NULL;

	INSERT INTO #SSS_NO_MONETARIA_APP 
	(NO_TRX,FECHA,TIPO_TRX,CATEG_TRANS,EVENTO,ESTATUS,CANAL,OFICINA_DEL_TRANSACCION,TIPO_CLIENTE,NO_CONTRATO
	,No_Terminal,COD_COMERCIO,NOMBRE_COMERCIO,NO_SOCIO,NO_SUCURSAL_SOCIO,NO_AGENCIA,COD_CAJERO,NUMERO_SIB,COD_OPERACION_SIB
	,NO_SESION,NO_APROBACION_TARJETA,COD_TRX_PROCESADOR,COD_PROCESADOR,NOMBRE_RED,NO_CTA_ORIGEN,TIPO_CTA_ORIGEN
	,NO_CTA_DESTINO,TIPO_CTA_DESTINO,CTA_ENTIDAD_REMITENTE,CLIENTE_REMITENTE,TIPO_ID_REMITENTE,ENTIDAD_REMITENTE
	,CTA_ENTIDAD_RECEPTORA,CLIENTE_RECEPTOR,TIPO_ID_RECEPTOR,IDENTI_RECEPTOR,ENTIDAD_RECEPTORA,EMAIL,ESTATUS_CUENTA
	,REFERENCIA_USUARIO,MONEDA_ORIGEN,MONTO_ORIGEN,MONEDA_DESTINO,MONTO_DESTINO,SUBTOTAL,MONTO_COMISION_USUARIO,IMPUESTO
	,MONTO_IMPUESTO,MONTO_IMPUESTO_2_,COMISION_EN_LINEA,DETALLE_TRX,REFERENCIA,ENVIA_NOTIFICACION,EMAIL_BENEFICIARIO
	,USUARIO,COD_RESPUESTA_BACKEND,DESCRIPCION_BACKEND,NO_APROBACION_TRADER,CATEGORIA_CTA_ORIGEN,SUBCATEGORIA_CTA_ORIGEN
	,CATEGORIA_CTA_DESTINO,SUBCATEGORIA_CTA_DESTINO,RESPONSABLE) VALUES 
	(@No_trx, @Fecha, @Tipo_trx, @Categ_Trans, @Evento, @Estatus, @Canal, @Oficina_del_Transaccion, @Tipo_Cliente, @No_Contrato,
	@No_Terminal, @COD_Comercio, @Nombre_Comercio, @No_Socio, @No_Sucursal_Socio, @No_Agencia,@COD_Cajero,@Numero_SIB,@COD_Operacion_SIB,
	@No_Sesion,@No_Aprobacion_Tarjeta,@COD_TRX_Procesador,@COD_Procesador,@Nombre_Red,@No_CTA_Origen,@Tipo_CTA_Origen,
	@No_CTA_Destino,@Tipo_CTA_Destino,@CTA_entidad_remitente,@cliente_remitente,@Tipo_ID_remitente,@Entidad_remitente,@CTA_entidad_receptora,
	@cliente_receptor,@Tipo_ID_receptor,@IDENTI_receptor,@Entidad_receptora,@Email,@Estatus_cuenta,@Referencia_Usuario,@Moneda_Origen,@Monto_Origen,
	@Moneda_Destino,@Monto_Destino,@Subtotal,@Monto_Comision_Usuario,@Impuesto,@Monto_Impuesto,@Monto_Impuesto_2_,@Comision_En_Linea,@Detalle_trx,
	@Referencia,@Envia_Notificacion,@Email_Beneficiario,@Usuario,@COD_Respuesta_Backend,@Descripcion_Backend,@No_Aprobacion_Trader,@Categoria_CTA_Origen,
	@SubCategoria_CTA_Origen,@Categoria_CTA_Destino,@SubCategoria_CTA_Destino,@Responsable)

	FETCH NEXT FROM @miCursor INTO @ID, @sessionId, @userID, @channelName, @sessionData, @createdDate, @lastActivityDate, @mobileIMEI,
	@userSessionID, @IP_CLIENTE, @operationDate, @userAgent, @host, @referer, @httpMethod, @httpStatusCode, @cookies, @httpParams,
	@responseHtml, @EVENTO2;
	

    END;

  CLOSE @miCursor;
  DEALLOCATE @miCursor;
END;

SELECT * FROM #SSS_NO_MONETARIA_APP
ORDER BY FECHA DESC;