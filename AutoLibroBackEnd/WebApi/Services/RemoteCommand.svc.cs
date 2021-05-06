using BL;
using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;

namespace WebApi.Services
{
    // NOTA: puede usar el comando "Rename" del menú "Refactorizar" para cambiar el nombre de clase "RemoteCommand" en el código, en svc y en el archivo de configuración a la vez.
    // NOTA: para iniciar el Cliente de prueba WCF para probar este servicio, seleccione RemoteCommand.svc o RemoteCommand.svc.cs en el Explorador de soluciones e inicie la depuración.
    public class RemoteCommand : IRemoteCommand
    {
        

        public void DoWork()
        {
        }


        public bool CambiarEstadoCambioPendiente(int id, int estado)
        {
            /*
            GenBitacoraBL bitacoraBl = new GenBitacoraBL();
            bool exito = false;
            try
            {
                bitacoraBl.CambiarEstadoCambioPendiente(id,estado);
                exito = true;
            }
            catch (Exception ex)
            {
                exito = false;

            }
            
            */
            return true;
        }


       

        public bool SincronizarBase(string cadenaActualizacion)
        {
            /*
            bool exito = false;
            bool toDelete = false;
            GenBitacoraBL bitacoraBl = new GenBitacoraBL();
            try
            {
                string[] conf = cadenaActualizacion.Split(';');
                string tabla = conf[0];
                string idCampo = conf[1];
                string accion = conf[2];
                string nombres = conf[3];
                string valores = conf[4];
                string sqlInsert = "";
                string sqlUpdate = "";
                string sqlDelete = "";
                StringDTO[] nombresLocal = null;
                string nuevosNombres = "";
                string nuevosValores = "";




                nombresLocal = bitacoraBl.ObtenerCamposTablas(tabla).ToList().ToArray(); //ctx.SP_OBTENE_CAMPOS_TABLAS(tabla).ToList<string>().ToArray();




                string[] nombresSplit = nombres.Split(',');
                string[] valoresSplit = valores.Split('|');
                bool permitido = false;

                if (accion.ToUpper() == "BORRADO")
                {
                    sqlDelete = "DELETE FROM " + tabla + " WHERE ID = " + idCampo + "";
                    bitacoraBl.SincronizarBaseDatos(tabla, idCampo, "", "", sqlDelete, cadenaActualizacion, 1);
                    toDelete = true;
                    exito = true;
                }
                else
                {


                    for (int i = 0; i < nombresSplit.Length; i++)
                    {
                        permitido = false;
                        foreach (StringDTO item in nombresLocal)
                        {
                            if (item.Valor.Trim().ToUpper() == nombresSplit[i].Trim().ToUpper())
                            {
                                if (item.Valor.Trim().ToUpper() == "ID" )//&& tabla == "INDCIO.CONTRIBUYENTE")
                                {
                                    permitido = false;
                                    break;
                                }
                                else
                                {
                                    permitido = true;
                                    break;
                                }



                            }
                        }
                        if (permitido)
                        {
                            if (nombresSplit[i].ToUpper() != "ID")// || (tabla.ToUpper() != "FECHA_LIMITE_PAGO" && tabla.ToUpper() != "ACTIVIDADES_ECONOMICAS"))
                            {
                                nuevosNombres = nuevosNombres + nombresSplit[i] + ",";
                                nuevosValores = nuevosValores + valoresSplit[i] + "|";
                            }
                        }
                    }
                    nuevosNombres = nuevosNombres.Substring(0, nuevosNombres.Length - 1);
                    nuevosValores = nuevosValores.Substring(0, nuevosValores.Length - 1);

                    nombresSplit = nuevosNombres.Split(',');
                    valoresSplit = nuevosValores.Split('|');

                    nombres = nuevosNombres;

                    string valoresCompletos = "";
                    string valoresUpdate = "";


                    if (accion.ToUpper().IndexOf("BORRADO") < 0)
                    {
                        for (int i = 0; i < nombresSplit.Length; i++)
                        {

                            if (nombresSplit[i].ToUpper() == "ID_CONTRIBUYENTE")
                            {
                                valoresCompletos = valoresCompletos + "(SELECT TOP 1 ID FROM INDCIO.CONTRIBUYENTE WHERE NUM_IDENTIFICACION = '" + valoresSplit[i] + "')" + ",";
                                valoresUpdate = valoresUpdate + nombresSplit[i] + " = " + "(SELECT TOP 1 ID FROM INDCIO.CONTRIBUYENTE WHERE NUM_IDENTIFICACION = '" + valoresSplit[i] + "')" + ",";
                            }
                            else if (nombresSplit[i].ToUpper() == "ID_ACTIVIDAD_ECONOMICA")
                            {
                                valoresCompletos = valoresCompletos + "(SELECT TOP 1 ID FROM INDCIO.ACTIVIDADES_ECONOMICAS WHERE CODIGO = '" + valoresSplit[i] + "')" + ",";
                                valoresUpdate = valoresUpdate + nombresSplit[i] + " = " + "(SELECT TOP 1 ID FROM INDCIO.ACTIVIDADES_ECONOMICAS WHERE CODIGO = '" + valoresSplit[i] + "')" + ",";
                            }
                            else
                            {
                                valoresCompletos = valoresCompletos + (valoresSplit[i].ToUpper().IndexOf("CONVERT") >= 0 ? valoresSplit[i] : "'" + valoresSplit[i].Replace("'", "''") + "'") + ",";
                                valoresUpdate = valoresUpdate + nombresSplit[i] + " = " + (valoresSplit[i].ToUpper().IndexOf("CONVERT") >= 0 ? valoresSplit[i] : "'" + valoresSplit[i].Replace("'", "''") + "'") + ",";
                            }

                        }

                        valoresCompletos = valoresCompletos.Substring(0, valoresCompletos.Length - 1);
                        valoresUpdate = valoresUpdate.Substring(0, valoresUpdate.Length - 1);
                    }

                    sqlInsert = " INSERT INTO " + tabla + " (" + nombres + ") values (";
                    sqlUpdate = " UPDATE " + tabla + " SET ";




                    sqlInsert = sqlInsert + valoresCompletos + ")";
                    sqlUpdate = sqlUpdate + valoresUpdate + " WHERE ID = '" + idCampo + "'";



                    var filas = bitacoraBl.SincronizarBaseDatos(tabla, idCampo, sqlInsert, sqlUpdate, sqlDelete, cadenaActualizacion, 0);




                    exito = true;

                }












            }
            catch (Exception ex)
            {
                exito = false;
            }
            */
            return true;
        }
    }
}
