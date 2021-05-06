using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;

namespace WebApi.Services
{
    // NOTA: puede usar el comando "Rename" del menú "Refactorizar" para cambiar el nombre de interfaz "IRemoteCommand" en el código y en el archivo de configuración a la vez.
    [ServiceContract]
    public interface IRemoteCommand
    {
        [OperationContract]
        void DoWork();

        [OperationContract]
        bool SincronizarBase(string cadenaActualizacion);

        

        [OperationContract]
        bool CambiarEstadoCambioPendiente(int id , int estado);
    }
}
