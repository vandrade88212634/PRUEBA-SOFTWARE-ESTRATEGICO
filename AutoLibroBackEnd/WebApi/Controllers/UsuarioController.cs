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
    public class UsuarioController : ApiController
    {

        [HttpGet]
        public IList<usuario> GetAllUsuario()
        {
            IList<usuario> lstUsuarios = new List<usuario>();
            UsuarioBL bl = new UsuarioBL();
            lstUsuarios = bl.ConsultarUsuario();
            return lstUsuarios;
        }


        [HttpGet]
        public bool GetAllUsuario(string nickname, string password)
        {
           
            UsuarioBL bl = new UsuarioBL();
            
            
            return bl.ValidarLogin(nickname,password);
        }

        [HttpGet]
        public IList<usuario> GetAllUsuario(string vfiltro)
        {
            IList<usuario> lstUsuarios = new List<usuario>();
            UsuarioBL bl = new UsuarioBL();
            lstUsuarios = bl.ConsultarUsuariosconFiltro(vfiltro);
            return lstUsuarios;
        }


        [HttpPost]
        public HttpResponseMessage Post([FromBody] usuario value)
        {
            HttpResponseMessage respuesta;
            try
            {
                UsuarioBL bl = new UsuarioBL();
                bool res = bl.ModificarUsuario(value);
                 respuesta = Request.CreateResponse(HttpStatusCode.OK, res);
            }
            catch (Exception ex)
            {
                respuesta = Request.CreateResponse(HttpStatusCode.Conflict, ex.Message);
            }

            return respuesta;

        }

        [HttpPut]
        public HttpResponseMessage Put([FromBody] usuario value)
        {
            HttpResponseMessage respuesta;
            try
            {
                
                UsuarioBL bl = new UsuarioBL();
                bool res = bl.CrearUsuarios(value);


                respuesta = Request.CreateResponse(HttpStatusCode.OK, res);
            }
            catch (Exception ex)
            {
                respuesta = Request.CreateResponse(HttpStatusCode.Conflict, ex.Message);
            }

            return respuesta;
        }

        [HttpDelete]
        public HttpResponseMessage DeleteUsuario(int id)
        {
            HttpResponseMessage respuesta;

            try
            {
               
                UsuarioBL bl = new UsuarioBL();
               bool res = bl.EliminarUsuario(id);

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
