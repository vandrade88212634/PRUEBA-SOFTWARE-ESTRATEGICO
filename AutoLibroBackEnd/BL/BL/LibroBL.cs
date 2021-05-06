using Model;

using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BL
{
    public class LibroBL
    {
        CapaDatos Datos = new CapaDatos();
        public LibroBL()
        {
            
        }

        public IList<libro> ConsultarLibro()
        {

            List<libro> res = Datos.MostrarDatosLibro();

            return res;
           
        }

        public IList<libro> ConsultarLibroconFiltro(string vFiltro)
        {
            
            List<libro> res = Datos.MostrarDatoslibroFiltro(vFiltro);

            return res;

        }

        public bool CrearLibro(libro oLibro)
        {


            return Datos.GuardarLibro(oLibro);

            
        }

        public bool ModificarLibro(libro oLibro)
        {
            return Datos.ModificarLibro(oLibro);

        }

        public bool EliminarLibro(int id)
        {
            return Datos.EliminarLibro(id);
        }

    }
}
