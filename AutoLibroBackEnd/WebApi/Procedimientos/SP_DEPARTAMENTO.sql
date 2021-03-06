
IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].[SP_DEPARTAMENTO]') and xtype in (N'FN', N'IF', N'TF', N'P'))
drop procedure [dbo].[SP_DEPARTAMENTO] 
GO 
SET ANSI_NULLS ON 
GO 
SET QUOTED_IDENTIFIER ON 
GO 

CREATE PROCEDURE dbo.SP_DEPARTAMENTO ( 
  @OPCION_PROCESO int = NULL, 
  @ID INT = NULL , 
  @DESCRIPCION NVARCHAR(50) = NULL 
) 

AS 
BEGIN 
IF @OPCION_PROCESO = 1
BEGIN
select 
ID , 
DESCRIPCION 
from Gen.DEPARTAMENTO
WHERE (@ID = 0 OR (@ID <> 0 AND ID = @ID)) 
END

IF @OPCION_PROCESO = 2
BEGIN
INSERT INTO Gen.DEPARTAMENTO ( 
  DESCRIPCION 
) VALUES ( 
  @DESCRIPCION 
)
--SELECT SCOPE_IDENTITY() 'ID' 
declare @Key int = @@identity
select * from Gen.DEPARTAMENTO where ID = @Key
END
IF @OPCION_PROCESO = 3
BEGIN
UPDATE Gen.DEPARTAMENTO SET 
DESCRIPCION = @DESCRIPCION 
WHERE
ID = @ID 
select * from Gen.DEPARTAMENTO where ID = @ID
END

IF @OPCION_PROCESO = 4
BEGIN
DELETE FROM Gen.DEPARTAMENTO
WHERE 
ID = @ID 
END
IF @OPCION_PROCESO = 5
BEGIN
select 'buenas'
END




END 
GO 


