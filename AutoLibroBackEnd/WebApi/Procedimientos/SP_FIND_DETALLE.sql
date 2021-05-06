IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].[SP_FIND_DETALLE]') and xtype in (N'FN', N'IF', N'TF', N'P'))
	drop procedure [dbo].[SP_FIND_DETALLE] 
GO 
SET ANSI_NULLS ON 
GO 
SET QUOTED_IDENTIFIER ON 
GO 
 
CREATE PROCEDURE SP_FIND_DETALLE (  	
	@IdMaestra INT 
) 

AS 
BEGIN 
	SELECT  
	ID ,
	ID_MAESTRA,
	NOMBRE ,
	DESCRIPCION,
	CODIGO
	FROM Gen.DETALLE  
	WHERE 
	(ID_MAESTRA = @IdMaestra) 
	ORDER BY NOMBRE
END 
GO 
