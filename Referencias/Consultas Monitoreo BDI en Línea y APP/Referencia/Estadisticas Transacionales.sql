--Estadisticas Transacionales
select DATEPART(YYYY,fecha_ingreso) as año,DATEPART(mm,fecha_ingreso)as mes, DATEPART(dd,fecha_ingreso) as dia,
count(*) as cantidad
from Sentinel_7.ST03.SSS_Trans with(nolock)
where fecha_ingreso >='2023-05-01'
group by  DATEPART(YYYY,fecha_ingreso), DATEPART(mm,fecha_ingreso),DATEPART(dd,fecha_ingreso)
order by 1,2,3


select DATEPART(YYYY,fecha_ingreso) as año,DATEPART(mm,fecha_ingreso)as mes, DATEPART(dd,fecha_ingreso) as dia,
count(*) as cantidad
from Sentinel_7.ST03.SSS_Trans_Hist with(nolock)
where fecha_ingreso >='2023-05-01'
group by  DATEPART(YYYY,fecha_ingreso), DATEPART(mm,fecha_ingreso),DATEPART(dd,fecha_ingreso)
order by 1,2,3

  DECLARE @FECHAHORA_INICIO DATETIME = GETDATE() - 60;
  DECLARE @FECHAHORA_FINAL DATETIME =  GETDATE();
  SELECT @FECHAHORA_INICIO, @FECHAHORA_FINAL;
  select top 10 ss.*
  FROM [SII.Omega.Weblog].[dbo].[UsersSessions] ss WITH (NOLOCK)
  where ss.[createdDate] >= @FECHAHORA_INICIO
  ORDER BY ss.[ID] DESC;

  --DECLARE @FECHAHORA_INICIO DATETIME = GETDATE() - 60;
  --DECLARE @FECHAHORA_FINAL DATETIME =  GETDATE();
  select top 100 ssdt.*
  FROM  [SII.Omega.Weblog].[dbo].[UsersSessionsHttpDetail] ssdt WITH (NOLOCK) 
  where ssdt.operationDate >= @FECHAHORA_INICIO
  and ssdt.userSessionID = 1239912
  ORDER BY ssdt.[ID] DESC, ssdt.[userSessionID] DESC, ssdt.operationDate desc;