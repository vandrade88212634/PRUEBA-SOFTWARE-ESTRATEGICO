MENUIF EXISTS (select * from dbo.sysobjects where id = object_id(N'[dbo].[SP_FIND_MENUS_USUARIO]') and xtype in (N'FN', N'IF', N'TF', N'P'))
drop procedure [dbo].[SP_FIND_MENUS_USUARIO] 
GO 
SET ANSI_NULLS ON 
GO 
SET QUOTED_IDENTIFIER ON 
GO 

CREATE PROCEDURE SP_FIND_MENUS_USUARIO (  
	@ID_USUARIO INT
) 

AS 
BEGIN 

SELECT     Menu.ID, Menu.ID_MENU, Menu.LABEL_MENU, Menu.URL, Menu.ICONO, Menu.TOOLTIP
FROM         Gen.MENU AS Menu INNER JOIN
                      Gen.MENU_ROL AS Menu_Rol ON Menu.ID = Menu_Rol.ID_MENU INNER JOIN
                      Gen.USUARIO_ROL AS Usuario_Rol ON Menu_Rol.ID_ROL = Usuario_Rol.ID_ROL
WHERE     (Usuario_Rol.ID_USUARIO = @ID_USUARIO)
GROUP BY   Menu.ID, Menu.ID_MENU, Menu.LABEL_MENU, Menu.URL, Menu.ICONO, Menu.TOOLTIP

/*
select * from Gen.Menu 	where Id in ( 	select Id_Menu 
										from Gen.Menu_Rol 
										where Id_Rol in ( select Id_Rol 
														  from Gen.Usuario_Rol 
														  where Id_Usuario in (@ID_USUARIO)) 
										group by Id_Menu)	
*/

END 
GO 

