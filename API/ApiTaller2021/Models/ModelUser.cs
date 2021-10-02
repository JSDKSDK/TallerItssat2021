using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Models
{
    public class ModelUser
    {
        public int FIIDUSUARIO_SISTEMA { get; set; }
        public string NOMBRE_USUARIO { get; set; }
        public int NUMERO_USUARIO { get; set; }
        public DateTime FECHA_CREACION { get; set; }
        public bool HABILITADO { get; set; }
        public DateTime ULTIMA_MODIFICACION { get; set; }
        public int USUARIO_MODIFICO { get; set; }

    }
}
