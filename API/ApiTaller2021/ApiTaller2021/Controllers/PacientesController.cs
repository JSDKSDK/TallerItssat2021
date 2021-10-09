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
    [RoutePrefix("api/pacientes")]
    public class PacientesController : ApiController
    {

        ConexionDB dbcon = new ConexionDB();


        [HttpGet]
        [Route("getcountpacientes")]

        public int getcountpacientes()
        {

            int PACIENTES = 0;


            string queryusuario = "select COUNT(FIIDPACIENTE) PACIENTES from hospitales.pacientes;";

            if (dbcon.OpenConnection() == true)
            {

                MySqlCommand cmd = new MySqlCommand(queryusuario, ConexionDB.connection);
                MySqlDataReader dataReader = cmd.ExecuteReader();

                while (dataReader.Read())
                {
                    PACIENTES = Convert.ToInt32(dataReader["PACIENTES"]);



                }

                dbcon.CloseConnection();


            }

            return PACIENTES;
        }
        
    }
}
