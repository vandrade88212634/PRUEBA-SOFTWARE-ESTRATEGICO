using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model
{
    public class CapaDatos
    {
        AutoLibroEntities modeldb = new AutoLibroEntities();
        
        public bool GuardarAutor(autor tabAutor)
        {
            modeldb.autor.Add(tabAutor);
            modeldb.SaveChanges();
            return true;

        }

        public List<autor> MostrarDatosAutor()
        {
            var query = (from e in modeldb.autor select e);

            return query.ToList();


        }

        public bool GuardarLibro(libro tabLibro)
        {
            modeldb.libro.Add(tabLibro);
            modeldb.SaveChanges();
            return true;

        }

        public List<libro> MostrarDatosLibro()
        {
            var query = (from e in modeldb.libro select e);

            return query.ToList();


        }

        public bool GuardarUsuario(usuario tabUsuario)
        {
            modeldb.usuario.Add(tabUsuario);
            modeldb.SaveChanges();
            return true;

        }

        public List<usuario> MostrarDatosUsuario()
        {
            var query = (from e in modeldb.usuario select e);

            return query.ToList();


        }

        public List<usuario> MostrarDatosUsuarioFiltro(string vfiltro)
        {
            var query = (from e in modeldb.usuario where e.nombre.Contains(vfiltro) || e.username.Contains(vfiltro)   select e);

            return query.ToList();


        }


        public bool ValidaUsuario(string lcUsername, string lcPassword)
        {
            var query = (from e in modeldb.usuario where e.username==lcUsername  && e.password== lcPassword select e);
            if (query== null)
            {
                return false;
            }
            else
            {
                return true;
            }

        }

        public bool ModificarAutor(autor tabAutor)
        {
            var oAutor = modeldb.autor.Find(tabAutor.id);
            oAutor.nombre = tabAutor.nombre;
            modeldb.Entry(oAutor).State = System.Data.Entity.EntityState.Modified;
            modeldb.SaveChanges();
            return true;

        }

        public bool EliminarAutor(int id)
        {
            var oAutor = modeldb.autor.Find(id);
            modeldb.autor.Remove(oAutor);
            modeldb.SaveChanges();
            return true;

        }

        public List<autor> MostrarDatosAutorFiltro(string vfiltro)
        {
            var query = (from e in modeldb.autor where e.nombre.Contains(vfiltro) select e);

            return query.ToList();


        }

        public List<libro> MostrarDatoslibroFiltro(string vfiltro)
        {
            var query = (from e in modeldb.libro where e.descripcion.Contains(vfiltro) || e.editorial.Contains(vfiltro) select e);

            return query.ToList();


        }


        public bool ModificarLibro(libro tabLibro)
        {
            var oLibro = modeldb.libro.Find(tabLibro.id);
            oLibro.descripcion  = tabLibro.descripcion;
            oLibro.editorial = tabLibro.editorial;
            oLibro.idautor = tabLibro.idautor;
            modeldb.Entry(oLibro).State = System.Data.Entity.EntityState.Modified;
            modeldb.SaveChanges();
            return true;

        }

        public bool EliminarLibro(int id)
        {
            var oLibro = modeldb.libro.Find(id);
            modeldb.libro.Remove(oLibro);
            modeldb.SaveChanges();
            return true;

        }

        public bool ModificarUsuario(usuario tabUsuario)
        {
            var oUsuario = modeldb.usuario.Find(tabUsuario.id);
            oUsuario.nombre = tabUsuario.nombre;
            oUsuario.username = tabUsuario.username;
            oUsuario.password = tabUsuario.password;
            modeldb.Entry(oUsuario).State = System.Data.Entity.EntityState.Modified;
            modeldb.SaveChanges();
            return true;

        }

        public bool EliminarUsuario(int id)
        {
            var oUsuario = modeldb.usuario.Find(id);
            modeldb.usuario.Remove(oUsuario);
            modeldb.SaveChanges();
            return true;

        }

        public List<libro> BuscarLibrosAutor(int idAutor)
        {
            var query = (from e in modeldb.libro where e.idautor == idAutor select e);
            return query.ToList();
        }





    }
}
