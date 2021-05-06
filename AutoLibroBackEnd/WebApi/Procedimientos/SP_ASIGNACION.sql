
IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].[SP_ASIGNACION]') and xtype in (N'FN', N'IF', N'TF', N'P'))
drop procedure [dbo].[SP_ASIGNACION] 
GO 
SET ANSI_NULLS ON 
GO 
SET QUOTED_IDENTIFIER ON 
GO 

CREATE PROCEDURE dbo.SP_ASIGNACION ( 
  @OPCION_PROCESO int = NULL, 
  @ID INT = NULL , 
  @ID_AFILIADO INT = NULL , 
  @FECHA_INICIO DATE = NULL , 
  @FECHA_FIN DATE = NULL , 
  @ID_DEPENDENCIA INT = NULL , 
  @VALOR_ASIGNACION NUMERIC(28,4) = NULL 
) 

AS 
BEGIN 
IF @OPCION_PROCESO = 1
BEGIN
select 
ID , 
ID_AFILIADO , 
FECHA_INICIO , 
FECHA_FIN , 
ID_DEPENDENCIA , 
VALOR_ASIGNACION 
from Nomina.ASIGNACION
WHERE (@ID = 0 OR (@ID <> 0 AND ID = @ID)) 
END

IF @OPCION_PROCESO = 2
BEGIN
INSERT INTO Nomina.ASIGNACION ( 
  ID_AFILIADO , 
  FECHA_INICIO , 
  FECHA_FIN , 
  ID_DEPENDENCIA , 
  VALOR_ASIGNACION 
) VALUES ( 
  @ID_AFILIADO , 
  @FECHA_INICIO , 
  @FECHA_FIN , 
  @ID_DEPENDENCIA , 
  @VALOR_ASIGNACION 
)
--SELECT SCOPE_IDENTITY() 'ID' 
declare @Key int = @@identity
select * from Nomina.ASIGNACION where ID = @Key
END
IF @OPCION_PROCESO = 3
BEGIN
UPDATE Nomina.ASIGNACION SET 
ID_AFILIADO = @ID_AFILIADO , 
FECHA_INICIO = @FECHA_INICIO , 
FECHA_FIN = @FECHA_FIN , 
ID_DEPENDENCIA = @ID_DEPENDENCIA , 
VALOR_ASIGNACION = @VALOR_ASIGNACION 
WHERE
ID = @ID 
select * from Nomina.ASIGNACION where ID = @ID
END

IF @OPCION_PROCESO = 4
BEGIN
DELETE FROM Nomina.ASIGNACION
WHERE 
ID = @ID 
END
IF @OPCION_PROCESO = 5
BEGIN
select 'buenas'
END




END 
GO 


