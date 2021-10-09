using DAO.ConexionDB;
using MySqlConnector;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace ApiTaller2021.Controllers
{
    [RoutePrefix("api/medicos")]
    public class MedicosController : ApiController
    {
        ConexionDB dbcon = new ConexionDB();


        [HttpGet]
        [Route("getcountmedicos")]

        public int getcountmedicos ()
        {

            int DOCTORES = 0;
          

            string queryusuario = "SELECT COUNT(FIIDDOCTOR) DOCTORES from hospitales.doctores;";

            if (dbcon.OpenConnection() == true)
            {

                MySqlCommand cmd = new MySqlCommand(queryusuario, ConexionDB.connection);
                MySqlDataReader dataReader = cmd.ExecuteReader();

                while (dataReader.Read())
                {
                    DOCTORES =Convert.ToInt32(dataReader["DOCTORES"]);

                  

                }

                dbcon.CloseConnection();


            }

            return DOCTORES;
        }
    }
}
