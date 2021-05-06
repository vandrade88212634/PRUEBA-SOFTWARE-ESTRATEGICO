
IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].[SP_TIPO_IDENTIFICACION]') and xtype in (N'FN', N'IF', N'TF', N'P'))
drop procedure [dbo].[SP_TIPO_IDENTIFICACION] 
GO 
SET ANSI_NULLS ON 
GO 
SET QUOTED_IDENTIFIER ON 
GO 

CREATE PROCEDURE dbo.SP_TIPO_IDENTIFICACION ( 
  @OPCION_PROCESO int = NULL, 
  @ID INT = NULL , 
  @DESCRIPCION NVARCHAR(100) = NULL 
) 

AS 
BEGIN 
IF @OPCION_PROCESO = 1
BEGIN
select 
ID , 
DESCRIPCION 
from Gen.TIPO_IDENTIFICACION
WHERE (@ID = 0 OR (@ID <> 0 AND ID = @ID)) 
END

IF @OPCION_PROCESO = 2
BEGIN
INSERT INTO Gen.TIPO_IDENTIFICACION ( 
  DESCRIPCION 
) VALUES ( 
  @DESCRIPCION 
)
--SELECT SCOPE_IDENTITY() 'ID' 
declare @Key int = @@identity
select * from Gen.TIPO_IDENTIFICACION where ID = @Key
END
IF @OPCION_PROCESO = 3
BEGIN
UPDATE Gen.TIPO_IDENTIFICACION SET 
DESCRIPCION = @DESCRIPCION 
WHERE
ID = @ID 
select * from Gen.TIPO_IDENTIFICACION where ID = @ID
END

IF @OPCION_PROCESO = 4
BEGIN
DELETE FROM Gen.TIPO_IDENTIFICACION
WHERE 
ID = @ID 
END
IF @OPCION_PROCESO = 5
BEGIN
select 'buenas'
END




END 
GO 


