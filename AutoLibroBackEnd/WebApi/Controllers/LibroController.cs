using BL;
using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Cors;

namespace WebApi.Controllers
{
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    public class LibroController : ApiController
    {

        [HttpGet]
        public IList<libro> GetAllLibro()
        {
            IList<libro> lstLibros = new List<libro>();
            LibroBL bl = new LibroBL();
            lstLibros = bl.ConsultarLibro();
            return lstLibros;
        }


        [HttpGet]
        public IList<libro> GetAllLibro(string vfiltro)
        {
            IList<libro> lstLibros = new List<libro>();
            LibroBL bl = new LibroBL();
            lstLibros = bl.ConsultarLibroconFiltro(vfiltro);
            
            return lstLibros;
        }



        [HttpPost]
        public HttpResponseMessage Post([FromBody] libro value)
        {
            HttpResponseMessage respuesta;
            try
            {
                LibroBL bl = new LibroBL();
                bool res = bl.ModificarLibro(value);
                 respuesta = Request.CreateResponse(HttpStatusCode.OK, res);
            }
            catch (Exception ex)
            {
                respuesta = Request.CreateResponse(HttpStatusCode.Conflict, ex.Message);
            }

            return respuesta;

        }

        [HttpPut]
        public HttpResponseMessage Put([FromBody] libro value)
        {
            HttpResponseMessage respuesta;
            try
            {
                
                LibroBL bl = new LibroBL();
                bool res = bl.CrearLibro(value);


                respuesta = Request.CreateResponse(HttpStatusCode.OK, res);
            }
            catch (Exception ex)
            {
                respuesta = Request.CreateResponse(HttpStatusCode.Conflict, ex.Message);
            }

            return respuesta;
        }

        [HttpDelete]
        public HttpResponseMessage DeleteLibro(int id)
        {
            HttpResponseMessage respuesta;

            try
            {
               
                LibroBL bl = new LibroBL();
               bool res = bl.EliminarLibro(id);

                respuesta = Request.CreateResponse(HttpStatusCode.OK, res);
            }
            catch (Exception ex)
            {
                respuesta = Request.CreateResponse(HttpStatusCode.Conflict, ex.Message);
            }

            return respuesta;
        }

    }
}
