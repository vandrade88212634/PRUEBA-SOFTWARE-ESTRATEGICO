
IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].[SP_ROL]') and xtype in (N'FN', N'IF', N'TF', N'P'))
drop procedure [dbo].[SP_ROL] 
GO 
SET ANSI_NULLS ON 
GO 
SET QUOTED_IDENTIFIER ON 
GO 

CREATE PROCEDURE dbo.SP_ROL ( 
  @OPCION_PROCESO int = NULL, 
  @ID INT = NULL , 
  @ID_IPS INT = NULL , 
  @NOMBRE_ROL NVARCHAR(50) = NULL 
) 

AS 
BEGIN 
IF @OPCION_PROCESO = 1
BEGIN
select 
ID , 
ID_IPS , 
NOMBRE_ROL 
from Gen.ROL
WHERE (@ID = 0 OR (@ID <> 0 AND ID = @ID)) 
END

IF @OPCION_PROCESO = 2
BEGIN
INSERT INTO Gen.ROL ( 
  ID_IPS , 
  NOMBRE_ROL 
) VALUES ( 
  @ID_IPS , 
  @NOMBRE_ROL 
)
--SELECT SCOPE_IDENTITY() 'ID' 
declare @Key int = @@identity
select * from Gen.ROL where ID = @Key
END
IF @OPCION_PROCESO = 3
BEGIN
UPDATE Gen.ROL SET 
ID_IPS = @ID_IPS , 
NOMBRE_ROL = @NOMBRE_ROL 
WHERE
ID = @ID 
select * from Gen.ROL where ID = @ID
END

IF @OPCION_PROCESO = 4
BEGIN
DELETE FROM Gen.ROL
WHERE 
ID = @ID 
END
IF @OPCION_PROCESO = 5
BEGIN
select 'buenas'
END




END 
GO 


