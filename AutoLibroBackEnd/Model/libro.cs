//------------------------------------------------------------------------------
// <auto-generated>
//     Este código se generó a partir de una plantilla.
//
//     Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//     Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Model
{
    using System;
    using System.Collections.Generic;
    
    public partial class libro
    {
        public byte id { get; set; }
        public string descripcion { get; set; }
        public string editorial { get; set; }
        public Nullable<byte> idautor { get; set; }
    
        public virtual autor autor { get; set; }
    }
}
