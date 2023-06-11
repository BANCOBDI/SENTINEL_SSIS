SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Emendez
-- Create date: 20230611
-- Description:	Lee Parametro
-- =============================================
--CREATE FUNCTION Get_Txt_PARAMETROS_GEO 
ALTER FUNCTION Get_Txt_PARAMETROS_GEO 
(
	-- Add the parameters for the function here
	@Parametro [nvarchar](50)
)
RETURNS [nvarchar](4000)
AS
BEGIN
	-- Declare the return variable here
	DECLARE @Result [nvarchar](4000)

	-- Add the T-SQL statements to compute the return value here
	SELECT @Result = ISNULL([VarValueTxt],'') 
	FROM [dbo].[Intermedia_PARAMETROS_GEO] WITH (NOLOCK) 
	where VarKey = @Parametro

	-- Return the result of the function
	RETURN @Result

END
GO
--CREATE FUNCTION Get_Dec_PARAMETROS_GEO 
ALTER FUNCTION Get_Dec_PARAMETROS_GEO 
(
	-- Add the parameters for the function here
	@Parametro [nvarchar](50)
)
RETURNS [Decimal] (38,6)
AS
BEGIN
	-- Declare the return variable here
	DECLARE @Result [Decimal] (38,6)

	-- Add the T-SQL statements to compute the return value here
	SELECT @Result = ISNULL([VarValueDecimal],0) 
	FROM [dbo].[Intermedia_PARAMETROS_GEO] WITH (NOLOCK) 
	where VarKey = @Parametro

	-- Return the result of the function
	RETURN @Result

END
GO
--CREATE FUNCTION Get_Int_PARAMETROS_GEO 
ALTER FUNCTION Get_Int_PARAMETROS_GEO 
(
	-- Add the parameters for the function here
	@Parametro [nvarchar](50)
)
RETURNS [bigint]
AS
BEGIN
	-- Declare the return variable here
	DECLARE @Result [bigint]

	-- Add the T-SQL statements to compute the return value here
	SELECT @Result = ISNULL([VarValueInteger],0) 
	FROM [dbo].[Intermedia_PARAMETROS_GEO] WITH (NOLOCK) 
	where VarKey = @Parametro

	-- Return the result of the function
	RETURN @Result

END
GO

/*
Select dbo.Get_Txt_PARAMETROS_GEO('UsersSessions.ID')
Select dbo.Get_Txt_PARAMETROS_GEO('UsersSessionsHttpDetail.ID')
Select dbo.Get_Dec_PARAMETROS_GEO('UsersSessions.ID')
Select dbo.Get_Dec_PARAMETROS_GEO('UsersSessionsHttpDetail.ID') 
Select dbo.Get_Int_PARAMETROS_GEO('UsersSessions.ID')
Select dbo.Get_Int_PARAMETROS_GEO('UsersSessionsHttpDetail.ID')*/
