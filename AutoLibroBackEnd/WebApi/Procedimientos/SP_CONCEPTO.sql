
IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].[SP_CONCEPTO]') and xtype in (N'FN', N'IF', N'TF', N'P'))
drop procedure [dbo].[SP_CONCEPTO] 
GO 
SET ANSI_NULLS ON 
GO 
SET QUOTED_IDENTIFIER ON 
GO 

CREATE PROCEDURE dbo.SP_CONCEPTO ( 
  @OPCION_PROCESO int = NULL, 
  @ID INT = NULL , 
  @NOMBRE NVARCHAR(200) = NULL , 
  @PORCENTAJE NUMERIC(8,5) = NULL , 
  @VALOR NUMERIC(30,5) = NULL , 
  @PORCENTAJE_EMPLEADO NUMERIC(8,5) = NULL , 
  @PORCENTAJE_EMPRESA NUMERIC(8,5) = NULL , 
  @PRESUPUESTO NVARCHAR(200) = NULL , 
  @CONTABILIDAD NVARCHAR(200) = NULL , 
  @TERCERO NVARCHAR(500) = NULL , 
  @ID_CATEGORIA INT = NULL , 
  @ID_ESTADO INT = NULL , 
  @ID_PERIODO INT = NULL , 
  @ID_COMPORTAMIENTO INT = NULL , 
  @ID_DESTINO INT = NULL , 
  @ID_BASE_LIQUIDACION INT = NULL 
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
PRESUPUESTO , 
CONTABILIDAD , 
TERCERO , 
ID_CATEGORIA , 
ID_ESTADO , 
ID_PERIODO , 
ID_COMPORTAMIENTO , 
ID_DESTINO , 
ID_BASE_LIQUIDACION 
from Nomina.CONCEPTO
WHERE (@ID = 0 OR (@ID <> 0 AND ID = @ID)) 
END

IF @OPCION_PROCESO = 2
BEGIN
INSERT INTO Nomina.CONCEPTO ( 
  NOMBRE , 
  PORCENTAJE , 
  VALOR , 
  PORCENTAJE_EMPLEADO , 
  PORCENTAJE_EMPRESA , 
  PRESUPUESTO , 
  CONTABILIDAD , 
  TERCERO , 
  ID_CATEGORIA , 
  ID_ESTADO , 
  ID_PERIODO , 
  ID_COMPORTAMIENTO , 
  ID_DESTINO , 
  ID_BASE_LIQUIDACION 
) VALUES ( 
  @NOMBRE , 
  @PORCENTAJE , 
  @VALOR , 
  @PORCENTAJE_EMPLEADO , 
  @PORCENTAJE_EMPRESA , 
  @PRESUPUESTO , 
  @CONTABILIDAD , 
  @TERCERO , 
  @ID_CATEGORIA , 
  @ID_ESTADO , 
  @ID_PERIODO , 
  @ID_COMPORTAMIENTO , 
  @ID_DESTINO , 
  @ID_BASE_LIQUIDACION 
)
--SELECT SCOPE_IDENTITY() 'ID' 
declare @Key int = @@identity
select * from Nomina.CONCEPTO where ID = @Key
END
IF @OPCION_PROCESO = 3
BEGIN
UPDATE Nomina.CONCEPTO SET 
NOMBRE = @NOMBRE , 
PORCENTAJE = @PORCENTAJE , 
VALOR = @VALOR , 
PORCENTAJE_EMPLEADO = @PORCENTAJE_EMPLEADO , 
PORCENTAJE_EMPRESA = @PORCENTAJE_EMPRESA , 
PRESUPUESTO = @PRESUPUESTO , 
CONTABILIDAD = @CONTABILIDAD , 
TERCERO = @TERCERO , 
ID_CATEGORIA = @ID_CATEGORIA , 
ID_ESTADO = @ID_ESTADO , 
ID_PERIODO = @ID_PERIODO , 
ID_COMPORTAMIENTO = @ID_COMPORTAMIENTO , 
ID_DESTINO = @ID_DESTINO , 
ID_BASE_LIQUIDACION = @ID_BASE_LIQUIDACION 
WHERE
ID = @ID 
select * from Nomina.CONCEPTO where ID = @ID
END

IF @OPCION_PROCESO = 4
BEGIN
DELETE FROM Nomina.CONCEPTO
WHERE 
ID = @ID 
END
IF @OPCION_PROCESO = 5
BEGIN
select 'buenas'
END




END 
GO 


