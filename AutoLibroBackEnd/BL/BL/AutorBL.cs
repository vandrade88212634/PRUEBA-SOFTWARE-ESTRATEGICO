using Model;

using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BL
{
    public class AutorBL
    {
        CapaDatos Datos = new CapaDatos();
        public AutorBL()
        {
            
        }

        public IList<autor> ConsultarAutor()
        {

            List<autor> res = Datos.MostrarDatosAutor();

            return res;
           
        }

        public IList<autor> ConsultarAutorconFiltro(string vFiltro)
        {
            
            List<autor> res = Datos.MostrarDatosAutorFiltro(vFiltro);

            return res;

        }

        public bool CrearAutor(autor oAutor)
        {


            return Datos.GuardarAutor(oAutor);

            
        }

        public bool ModificarAutor(autor oAutor)
        {
            return Datos.ModificarAutor(oAutor);

        }

        public bool EliminarAutor(int id)
        {
            return Datos.EliminarAutor(id);
        }



    }
}
