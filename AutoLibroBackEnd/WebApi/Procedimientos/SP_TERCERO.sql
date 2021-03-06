
IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].[SP_TERCERO]') and xtype in (N'FN', N'IF', N'TF', N'P'))
drop procedure [dbo].[SP_TERCERO] 
GO 
SET ANSI_NULLS ON 
GO 
SET QUOTED_IDENTIFIER ON 
GO 

CREATE PROCEDURE dbo.SP_TERCERO ( 
  @OPCION_PROCESO int = NULL, 
  @ID INT = NULL , 
  @IDENTIFICACION NVARCHAR(50) = NULL , 
  @DIGITO_VERIFICACION NVARCHAR(1) = NULL , 
  @ID_TIPO_IDENTIFICACION INT = NULL , 
  @PRIMER_NOMBRE NVARCHAR(50) = NULL , 
  @SEGUNDO_NOMBRE NVARCHAR(50) = NULL , 
  @PRIMER_APELLIDO NVARCHAR(50) = NULL , 
  @SEGUNDO_APELLIDO NVARCHAR(50) = NULL , 
  @RAZON_SOCIAL NVARCHAR(200) = NULL , 
  @DIRECCION NVARCHAR(500) = NULL , 
  @TELEFONO NVARCHAR(20) = NULL , 
  @EMAIL NVARCHAR(50) = NULL , 
  @ID_CIUDAD INT = NULL , 
  @ID_REGIMEN INT = NULL , 
  @ID_ENTIDAD_RECIPROCA INT = NULL , 
  @ID_CHIP INT = NULL , 
  @CODIGO_ENTIDAD NVARCHAR(20) = NULL 
) 

AS 
BEGIN 
IF @OPCION_PROCESO = 1
BEGIN
select 
ID , 
IDENTIFICACION , 
DIGITO_VERIFICACION , 
ID_TIPO_IDENTIFICACION , 
PRIMER_NOMBRE , 
SEGUNDO_NOMBRE , 
PRIMER_APELLIDO , 
SEGUNDO_APELLIDO , 
RAZON_SOCIAL , 
DIRECCION , 
TELEFONO , 
EMAIL , 
ID_CIUDAD , 
ID_REGIMEN , 
ID_ENTIDAD_RECIPROCA , 
ID_CHIP , 
CODIGO_ENTIDAD 
from Gen.TERCERO
WHERE (@ID = 0 OR (@ID <> 0 AND ID = @ID)) 
END

IF @OPCION_PROCESO = 2
BEGIN
INSERT INTO Gen.TERCERO ( 
  IDENTIFICACION , 
  DIGITO_VERIFICACION , 
  ID_TIPO_IDENTIFICACION , 
  PRIMER_NOMBRE , 
  SEGUNDO_NOMBRE , 
  PRIMER_APELLIDO , 
  SEGUNDO_APELLIDO , 
  RAZON_SOCIAL , 
  DIRECCION , 
  TELEFONO , 
  EMAIL , 
  ID_CIUDAD , 
  ID_REGIMEN , 
  ID_ENTIDAD_RECIPROCA , 
  ID_CHIP , 
  CODIGO_ENTIDAD 
) VALUES ( 
  @IDENTIFICACION , 
  @DIGITO_VERIFICACION , 
  @ID_TIPO_IDENTIFICACION , 
  @PRIMER_NOMBRE , 
  @SEGUNDO_NOMBRE , 
  @PRIMER_APELLIDO , 
  @SEGUNDO_APELLIDO , 
  @RAZON_SOCIAL , 
  @DIRECCION , 
  @TELEFONO , 
  @EMAIL , 
  @ID_CIUDAD , 
  @ID_REGIMEN , 
  @ID_ENTIDAD_RECIPROCA , 
  @ID_CHIP , 
  @CODIGO_ENTIDAD 
)
--SELECT SCOPE_IDENTITY() 'ID' 
declare @Key int = @@identity
select * from Gen.TERCERO where ID = @Key
END
IF @OPCION_PROCESO = 3
BEGIN
UPDATE Gen.TERCERO SET 
IDENTIFICACION = @IDENTIFICACION , 
DIGITO_VERIFICACION = @DIGITO_VERIFICACION , 
ID_TIPO_IDENTIFICACION = @ID_TIPO_IDENTIFICACION , 
PRIMER_NOMBRE = @PRIMER_NOMBRE , 
SEGUNDO_NOMBRE = @SEGUNDO_NOMBRE , 
PRIMER_APELLIDO = @PRIMER_APELLIDO , 
SEGUNDO_APELLIDO = @SEGUNDO_APELLIDO , 
RAZON_SOCIAL = @RAZON_SOCIAL , 
DIRECCION = @DIRECCION , 
TELEFONO = @TELEFONO , 
EMAIL = @EMAIL , 
ID_CIUDAD = @ID_CIUDAD , 
ID_REGIMEN = @ID_REGIMEN , 
ID_ENTIDAD_RECIPROCA = @ID_ENTIDAD_RECIPROCA , 
ID_CHIP = @ID_CHIP , 
CODIGO_ENTIDAD = @CODIGO_ENTIDAD 
WHERE
ID = @ID 
select * from Gen.TERCERO where ID = @ID
END

IF @OPCION_PROCESO = 4
BEGIN
DELETE FROM Gen.TERCERO
WHERE 
ID = @ID 
END
IF @OPCION_PROCESO = 5
BEGIN
select 'buenas'
END




END 
GO 


