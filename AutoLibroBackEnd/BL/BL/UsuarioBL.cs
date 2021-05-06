using Model;

using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BL
{
    public class UsuarioBL
    {
        CapaDatos Datos = new CapaDatos();
        public UsuarioBL()
        {
            
        }

        public bool ValidarLogin(string nickname, string password)
        {
           
            if (Datos.ValidaUsuario(nickname, password))
            {
                return true;

            }
            else
            {
                return false;
            }


            
        }

        public IList<usuario> ConsultarUsuario()
        {

            List<usuario> res = Datos.MostrarDatosUsuario();

            return res;
           
        }

        public IList<usuario> ConsultarUsuariosconFiltro(string vFiltro)
        {
            
            List<usuario> res = Datos.MostrarDatosUsuarioFiltro(vFiltro);

            return res;

        }

        public bool CrearUsuarios(usuario oUsuario)
        {


            return Datos.GuardarUsuario(oUsuario);

            
        }
        public bool ModificarUsuario(usuario oUsuario)
        {
            return Datos.ModificarUsuario(oUsuario);

        }

        public bool EliminarUsuario(int id)
        {
            return Datos.EliminarUsuario(id);
        }



    }
}
