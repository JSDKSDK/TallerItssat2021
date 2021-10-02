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
    [RoutePrefix("api/user")]
    public class UserController : ApiController
    {

        ConexionDB dbcon = new ConexionDB();


        [HttpGet]
        [Route("getUser")]
        public List<ModelUser> getUser()
        {
            ModelUser user = new ModelUser();

            List<ModelUser> usuarios = new List<ModelUser>();

            string queryusuario = "SELECT * FROM hospitales.usuario_sistema";

            if (dbcon.OpenConnection() ==true)
            {

                MySqlCommand cmd = new MySqlCommand(queryusuario,ConexionDB.connection);
                MySqlDataReader dataReader = cmd.ExecuteReader();

                while (dataReader.Read())
                {

                    usuarios.Add(new ModelUser
                    {
                        FIIDUSUARIO_SISTEMA =Convert.ToInt32(dataReader["FIIDUSUARIO_SISTEMA"]),
                        NOMBRE_USUARIO =Convert.ToString(dataReader["NOMBRE_USUARIO"]),
                        NUMERO_USUARIO = Convert.ToInt32(dataReader["NUMERO_USUARIO"]),
                        FECHA_CREACION = Convert.ToDateTime(dataReader["FECHA_CREACION"]),
                        HABILITADO= Convert.ToBoolean(dataReader["HABILITADO"]),
                        ULTIMA_MODIFICACION = Convert.ToDateTime(dataReader["ULTIMA_MODIFICACION"]),
                        USUARIO_MODIFICO= Convert.ToInt32 (dataReader["USUARIO_MODIFICO"])
                    });
                  
                }

                dbcon.CloseConnection();


            }

            return usuarios;
        }

        [HttpPut]
        [Route("putUser")]

        public bool putUser(int FIIDUSUARIO_SISTEMA,int NUMERO_USUARIO)
        {

            string QUERY = "update hospitales.usuario_sistema set NUMERO_USUARIO = " + NUMERO_USUARIO + " WHERE FIIDUSUARIO_SISTEMA = " + FIIDUSUARIO_SISTEMA + " ";


            if (dbcon.OpenConnection()==true)
            {
                MySqlCommand cmd = new MySqlCommand(QUERY,ConexionDB.connection);

                cmd.ExecuteNonQuery();

            }

            dbcon.CloseConnection();

            return true;
        }


    }
}