
IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].[SP_MENU]') and xtype in (N'FN', N'IF', N'TF', N'P'))
drop procedure [dbo].[SP_MENU] 
GO 
SET ANSI_NULLS ON 
GO 
SET QUOTED_IDENTIFIER ON 
GO 

CREATE PROCEDURE dbo.SP_MENU ( 
  @OPCION_PROCESO int = NULL, 
  @ID INT = NULL , 
  @ID_MENU INT = NULL , 
  @LABEL_MENU NVARCHAR(50) = NULL , 
  @URL NVARCHAR(50) = NULL , 
  @ICONO NVARCHAR(100) = NULL , 
  @TOOLTIP NVARCHAR(100) = NULL 
) 

AS 
BEGIN 
IF @OPCION_PROCESO = 1
BEGIN
select 
ID , 
ID_MENU , 
LABEL_MENU , 
URL , 
ICONO , 
TOOLTIP 
from Gen.MENU
WHERE (@ID = 0 OR (@ID <> 0 AND ID = @ID)) 
END

IF @OPCION_PROCESO = 2
BEGIN
INSERT INTO Gen.MENU ( 
  ID_MENU , 
  LABEL_MENU , 
  URL , 
  ICONO , 
  TOOLTIP 
) VALUES ( 
  @ID_MENU , 
  @LABEL_MENU , 
  @URL , 
  @ICONO , 
  @TOOLTIP 
)
--SELECT SCOPE_IDENTITY() 'ID' 
declare @Key int = @@identity
select * from Gen.MENU where ID = @Key
END
IF @OPCION_PROCESO = 3
BEGIN
UPDATE Gen.MENU SET 
ID_MENU = @ID_MENU , 
LABEL_MENU = @LABEL_MENU , 
URL = @URL , 
ICONO = @ICONO , 
TOOLTIP = @TOOLTIP 
WHERE
ID = @ID 
select * from Gen.MENU where ID = @ID
END

IF @OPCION_PROCESO = 4
BEGIN
DELETE FROM Gen.MENU
WHERE 
ID = @ID 
END
IF @OPCION_PROCESO = 5
BEGIN
select 'buenas'
END




END 
GO 


