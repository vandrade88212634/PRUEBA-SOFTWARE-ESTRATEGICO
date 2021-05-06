
IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].[SP_MAESTRA]') and xtype in (N'FN', N'IF', N'TF', N'P'))
drop procedure [dbo].[SP_MAESTRA] 
GO 
SET ANSI_NULLS ON 
GO 
SET QUOTED_IDENTIFIER ON 
GO 

CREATE PROCEDURE dbo.SP_MAESTRA ( 
  @OPCION_PROCESO int = NULL, 
  @ID INT = NULL , 
  @TABLA NVARCHAR(200) = NULL 
) 

AS 
BEGIN 
IF @OPCION_PROCESO = 1
BEGIN
select 
ID , 
TABLA 
from Gen.MAESTRA
WHERE (@ID = 0 OR (@ID <> 0 AND ID = @ID)) 
END

IF @OPCION_PROCESO = 2
BEGIN
INSERT INTO Gen.MAESTRA ( 
  TABLA 
) VALUES ( 
  @TABLA 
)
--SELECT SCOPE_IDENTITY() 'ID' 
declare @Key int = @@identity
select * from Gen.MAESTRA where ID = @Key
END
IF @OPCION_PROCESO = 3
BEGIN
UPDATE Gen.MAESTRA SET 
TABLA = @TABLA 
WHERE
ID = @ID 
select * from Gen.MAESTRA where ID = @ID
END

IF @OPCION_PROCESO = 4
BEGIN
DELETE FROM Gen.MAESTRA
WHERE 
ID = @ID 
END
IF @OPCION_PROCESO = 5
BEGIN
select 'buenas'
END




END 
GO 


