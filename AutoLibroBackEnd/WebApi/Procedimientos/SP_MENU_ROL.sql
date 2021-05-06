
IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].[SP_MENU_ROL]') and xtype in (N'FN', N'IF', N'TF', N'P'))
drop procedure [dbo].[SP_MENU_ROL] 
GO 
SET ANSI_NULLS ON 
GO 
SET QUOTED_IDENTIFIER ON 
GO 

CREATE PROCEDURE dbo.SP_MENU_ROL ( 
  @OPCION_PROCESO int = NULL, 
  @ID INT = NULL , 
  @ID_MENU INT = NULL , 
  @ID_ROL INT = NULL 
) 

AS 
BEGIN 
IF @OPCION_PROCESO = 1
BEGIN
select 
ID , 
ID_MENU , 
ID_ROL 
from Gen.MENU_ROL
WHERE (@ID = 0 OR (@ID <> 0 AND ID = @ID)) 
END

IF @OPCION_PROCESO = 2
BEGIN
INSERT INTO Gen.MENU_ROL ( 
  ID_MENU , 
  ID_ROL 
) VALUES ( 
  @ID_MENU , 
  @ID_ROL 
)
--SELECT SCOPE_IDENTITY() 'ID' 
declare @Key int = @@identity
select * from Gen.MENU_ROL where ID = @Key
END
IF @OPCION_PROCESO = 3
BEGIN
UPDATE Gen.MENU_ROL SET 
ID_MENU = @ID_MENU , 
ID_ROL = @ID_ROL 
WHERE
ID = @ID 
select * from Gen.MENU_ROL where ID = @ID
END

IF @OPCION_PROCESO = 4
BEGIN
DELETE FROM Gen.MENU_ROL
WHERE 
ID = @ID 
END
IF @OPCION_PROCESO = 5
BEGIN
select 'buenas'
END




END 
GO 


