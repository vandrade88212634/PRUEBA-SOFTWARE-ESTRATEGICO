
IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].[SP_VCONCEPTO_FULL]') and xtype in (N'FN', N'IF', N'TF', N'P'))
drop procedure [dbo].[SP_VCONCEPTO_FULL] 
GO 
SET ANSI_NULLS ON 
GO 
SET QUOTED_IDENTIFIER ON 
GO 

CREATE PROCEDURE dbo.SP_VCONCEPTO_FULL ( 
  @OPCION_PROCESO int = NULL, 
  @ID INT = NULL , 
  @NOMBRE NVARCHAR(200) = NULL , 
  @PORCENTAJE NUMERIC(8,5) = NULL , 
  @VALOR NUMERIC(30,5) = NULL , 
  @PORCENTAJE_EMPLEADO NUMERIC(8,5) = NULL , 
  @PORCENTAJE_EMPRESA NUMERIC(8,5) = NULL , 
  @TERCERO NVARCHAR(500) = NULL , 
  @ID_CATEGORIA INT = NULL , 
  @ID_ESTADO INT = NULL , 
  @ID_PERIODO INT = NULL , 
  @ID_COMPORTAMIENTO INT = NULL , 
  @ID_DESTINO INT = NULL , 
  @ID_BASE_LIQUIDACION INT = NULL , 
  @LABEL_CATEGORIA NVARCHAR(200) = NULL , 
  @LABEL_ESTADO NVARCHAR(100) = NULL , 
  @LABEL_PERIODO NVARCHAR(100) = NULL , 
  @LABEL_COMPORTAMIENTO NVARCHAR(100) = NULL , 
  @LABEL_DESTINO NVARCHAR(100) = NULL , 
  @LABEL_BASE_LIQUIDACION NVARCHAR(100) = NULL 
) 

AS 
BEGIN 
IF @OPCION_PROCESO = 1
BEGIN
select 
ID , 
NOMBRE , 
PORCENTAJE , 
VALOR , 
PORCENTAJE_EMPLEADO , 
PORCENTAJE_EMPRESA , 
TERCERO , 
ID_CATEGORIA , 
ID_ESTADO , 
ID_PERIODO , 
ID_COMPORTAMIENTO , 
ID_DESTINO , 
ID_BASE_LIQUIDACION , 
LABEL_CATEGORIA , 
LABEL_ESTADO , 
LABEL_PERIODO , 
LABEL_COMPORTAMIENTO , 
LABEL_DESTINO , 
LABEL_BASE_LIQUIDACION 
from dbo.VCONCEPTO_FULL
WHERE (@ID = 0 OR (@ID <> 0 AND ID = @ID)) 
END

IF @OPCION_PROCESO = 2
BEGIN
INSERT INTO dbo.VCONCEPTO_FULL ( 
  ID , 
  NOMBRE , 
  PORCENTAJE , 
  VALOR , 
  PORCENTAJE_EMPLEADO , 
  PORCENTAJE_EMPRESA , 
  TERCERO , 
  ID_CATEGORIA , 
  ID_ESTADO , 
  ID_PERIODO , 
  ID_COMPORTAMIENTO , 
  ID_DESTINO , 
  ID_BASE_LIQUIDACION , 
  LABEL_CATEGORIA , 
  LABEL_ESTADO , 
  LABEL_PERIODO , 
  LABEL_COMPORTAMIENTO , 
  LABEL_DESTINO , 
  LABEL_BASE_LIQUIDACION 
) VALUES ( 
  @ID , 
  @NOMBRE , 
  @PORCENTAJE , 
  @VALOR , 
  @PORCENTAJE_EMPLEADO , 
  @PORCENTAJE_EMPRESA , 
  @TERCERO , 
  @ID_CATEGORIA , 
  @ID_ESTADO , 
  @ID_PERIODO , 
  @ID_COMPORTAMIENTO , 
  @ID_DESTINO , 
  @ID_BASE_LIQUIDACION , 
  @LABEL_CATEGORIA , 
  @LABEL_ESTADO , 
  @LABEL_PERIODO , 
  @LABEL_COMPORTAMIENTO , 
  @LABEL_DESTINO , 
  @LABEL_BASE_LIQUIDACION 
)
--SELECT SCOPE_IDENTITY() 'ID' 
declare @Key int = @@identity
select * from dbo.VCONCEPTO_FULL where ID = @Key
END
IF @OPCION_PROCESO = 3
BEGIN
UPDATE dbo.VCONCEPTO_FULL SET 
ID = @ID , 
NOMBRE = @NOMBRE , 
PORCENTAJE = @PORCENTAJE , 
VALOR = @VALOR , 
PORCENTAJE_EMPLEADO = @PORCENTAJE_EMPLEADO , 
PORCENTAJE_EMPRESA = @PORCENTAJE_EMPRESA , 
TERCERO = @TERCERO , 
ID_CATEGORIA = @ID_CATEGORIA , 
ID_ESTADO = @ID_ESTADO , 
ID_PERIODO = @ID_PERIODO , 
ID_COMPORTAMIENTO = @ID_COMPORTAMIENTO , 
ID_DESTINO = @ID_DESTINO , 
ID_BASE_LIQUIDACION = @ID_BASE_LIQUIDACION , 
LABEL_CATEGORIA = @LABEL_CATEGORIA , 
LABEL_ESTADO = @LABEL_ESTADO , 
LABEL_PERIODO = @LABEL_PERIODO , 
LABEL_COMPORTAMIENTO = @LABEL_COMPORTAMIENTO , 
LABEL_DESTINO = @LABEL_DESTINO , 
LABEL_BASE_LIQUIDACION = @LABEL_BASE_LIQUIDACION 
WHERE
ID = @ID 
select * from dbo.VCONCEPTO_FULL where ID = @ID
END

IF @OPCION_PROCESO = 4
BEGIN
DELETE FROM dbo.VCONCEPTO_FULL
WHERE 
ID = @ID 
END
IF @OPCION_PROCESO = 5
BEGIN
select 'buenas'
END




END 
GO 


