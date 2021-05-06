
IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].[SP_CHIP]') and xtype in (N'FN', N'IF', N'TF', N'P'))
drop procedure [dbo].[SP_CHIP] 
GO 
SET ANSI_NULLS ON 
GO 
SET QUOTED_IDENTIFIER ON 
GO 

CREATE PROCEDURE dbo.SP_CHIP ( 
  @OPCION_PROCESO int = NULL, 
  @ID INT = NULL , 
  @CODIGO NVARCHAR(20) = NULL , 
  @NOMBRE NVARCHAR(200) = NULL 
) 

AS 
BEGIN 
IF @OPCION_PROCESO = 1
BEGIN
select 
ID , 
CODIGO , 
NOMBRE 
from Gen.CHIP
WHERE (@ID = 0 OR (@ID <> 0 AND ID = @ID)) 
END

IF @OPCION_PROCESO = 2
BEGIN
INSERT INTO Gen.CHIP ( 
  CODIGO , 
  NOMBRE 
) VALUES ( 
  @CODIGO , 
  @NOMBRE 
)
--SELECT SCOPE_IDENTITY() 'ID' 
declare @Key int = @@identity
select * from Gen.CHIP where ID = @Key
END
IF @OPCION_PROCESO = 3
BEGIN
UPDATE Gen.CHIP SET 
CODIGO = @CODIGO , 
NOMBRE = @NOMBRE 
WHERE
ID = @ID 
select * from Gen.CHIP where ID = @ID
END

IF @OPCION_PROCESO = 4
BEGIN
DELETE FROM Gen.CHIP
WHERE 
ID = @ID 
END
IF @OPCION_PROCESO = 5
BEGIN
select 'buenas'
END




END 
GO 


