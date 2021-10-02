using DAO.ConexionDB;
using Models;
using MySqlConnector;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace ApiTaller2021.Controllers
{
    [RoutePrefix("api/consultorios")]
    public class ConsultoriosController : ApiController
    {

        ConexionDB dbcon = new ConexionDB();


        [HttpGet]
        [Route("getconsultorio")]
        public List<ModelConsultorio> getconsultorios()
        {

            List<ModelConsultorio> consultorio = new List<ModelConsultorio>();

            string queryonsultorio = "SELECT CON.NUMERO_CONSULTORIO,CON.NOMBRE_CONSULTORIO,AR.NOMBRE_AREA, AR.DESCRIPCION,  CASE AR.HABILITADO WHEN 0 THEN 'APAGADO' ELSE 'ENCENDIDO' END ESTATUS_AREA FROM hospitales.consultorio AS CON inner join hospitales.areas as AR on CON.FIIDAREA = AR.FIIDAREA WHERE CON.FIIDAREA = 1; ";

            if (dbcon.OpenConnection() == true)
            {
                MySqlCommand cmd = new MySqlCommand(queryonsultorio, ConexionDB.connection);
                MySqlDataReader dataReader = cmd.ExecuteReader();


                while (dataReader.Read())
                {

                    consultorio.Add(new ModelConsultorio
                    {
                        NUMERO_CONSULTORIO = Convert.ToInt32(dataReader["NUMERO_CONSULTORIO"]),
                        NOMBRE_CONSULTORIO = Convert.ToString(dataReader["NOMBRE_CONSULTORIO"]),
                        NOMBRE_AREA= Convert.ToString(dataReader["NOMBRE_AREA"]),
                        DESCRIPCION = Convert.ToString(dataReader["DESCRIPCION"]),
                        ESTATUS_AREA= Convert.ToString(dataReader["ESTATUS_AREA"])
                    });


                }

                dbcon.CloseConnection();


            }


            return consultorio;
        }
    }
}
