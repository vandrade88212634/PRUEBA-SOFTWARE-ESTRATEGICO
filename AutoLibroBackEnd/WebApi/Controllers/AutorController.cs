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
    public class AutorController : ApiController
    {

        [HttpGet]
        public IList<autor> GetAllAutor()
        {
            IList<autor> lstAutor = new List<autor>();
            AutorBL bl = new AutorBL();
            lstAutor = bl.ConsultarAutor();
            return lstAutor;
        }


        [HttpGet]
        public IList<autor> GetAllAutor(string vfiltro)
        {
            IList<autor> lstAutores = new List<autor>();
            AutorBL bl = new AutorBL();
            lstAutores = bl.ConsultarAutorconFiltro(vfiltro);
            
            return lstAutores;
        }



        [HttpPost]
        public HttpResponseMessage Post([FromBody] autor value)
        {
            HttpResponseMessage respuesta;
            try
            {
                AutorBL bl = new AutorBL();
                bool res = bl.ModificarAutor(value);
                 respuesta = Request.CreateResponse(HttpStatusCode.OK, res);
            }
            catch (Exception ex)
            {
                respuesta = Request.CreateResponse(HttpStatusCode.Conflict, ex.Message);
            }

            return respuesta;

        }

        [HttpPut]
        public HttpResponseMessage Put([FromBody] autor value)
        {
            HttpResponseMessage respuesta;
            try
            {
                
                AutorBL bl = new AutorBL();
                bool res = bl.CrearAutor(value);


                respuesta = Request.CreateResponse(HttpStatusCode.OK, res);
            }
            catch (Exception ex)
            {
                respuesta = Request.CreateResponse(HttpStatusCode.Conflict, ex.Message);
            }

            return respuesta;
        }

        [HttpDelete]
        public HttpResponseMessage DeleteAutor(int id)
        {
            HttpResponseMessage respuesta;

            try
            {
               
                AutorBL bl = new AutorBL();
               bool res = bl.EliminarAutor(id);

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
