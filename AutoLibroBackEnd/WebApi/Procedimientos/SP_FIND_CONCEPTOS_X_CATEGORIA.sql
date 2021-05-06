IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].[SP_FIND_CONCEPTOS_X_CATEGORIA]') and xtype in (N'FN', N'IF', N'TF', N'P'))
	drop procedure [dbo].[SP_FIND_CONCEPTOS_X_CATEGORIA] 
GO 
SET ANSI_NULLS ON 
GO 
SET QUOTED_IDENTIFIER ON 
GO 
 
CREATE PROCEDURE SP_FIND_CONCEPTOS_X_CATEGORIA (  	
	@ID_CATEGORIA INT 
) 

AS 
BEGIN 

SELECT	* FROM  vCONCEPTO_FULL    
WHERE (@ID_CATEGORIA = -1 OR (@ID_CATEGORIA <> -1 AND ID_CATEGORIA = @ID_CATEGORIA)) 

END 
GO 
