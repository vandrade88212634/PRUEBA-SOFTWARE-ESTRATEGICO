
IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].[SP_DEPENDENCIA]') and xtype in (N'FN', N'IF', N'TF', N'P'))
drop procedure [dbo].[SP_DEPENDENCIA] 
GO 
SET ANSI_NULLS ON 
GO 
SET QUOTED_IDENTIFIER ON 
GO 

CREATE PROCEDURE dbo.SP_DEPENDENCIA ( 
  @OPCION_PROCESO int = NULL, 
  @ID INT = NULL , 
  @NOMBRE NVARCHAR(200) = NULL , 
  @ID_EMPRESA INT = NULL 
) 

AS 
BEGIN 
IF @OPCION_PROCESO = 1
BEGIN
select 
ID , 
NOMBRE , 
ID_EMPRESA 
from Nomina.DEPENDENCIA
WHERE (@ID = 0 OR (@ID <> 0 AND ID = @ID)) 
END

IF @OPCION_PROCESO = 2
BEGIN
INSERT INTO Nomina.DEPENDENCIA ( 
  NOMBRE , 
  ID_EMPRESA 
) VALUES ( 
  @NOMBRE , 
  @ID_EMPRESA 
)
--SELECT SCOPE_IDENTITY() 'ID' 
declare @Key int = @@identity
select * from Nomina.DEPENDENCIA where ID = @Key
END
IF @OPCION_PROCESO = 3
BEGIN
UPDATE Nomina.DEPENDENCIA SET 
NOMBRE = @NOMBRE , 
ID_EMPRESA = @ID_EMPRESA 
WHERE
ID = @ID 
select * from Nomina.DEPENDENCIA where ID = @ID
END

IF @OPCION_PROCESO = 4
BEGIN
DELETE FROM Nomina.DEPENDENCIA
WHERE 
ID = @ID 
END
IF @OPCION_PROCESO = 5
BEGIN
select 'buenas'
END




END 
GO 


