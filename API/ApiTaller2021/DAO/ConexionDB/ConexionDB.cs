using MySqlConnector;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAO.ConexionDB
{
    public class ConexionDB
    {
        public static MySqlConnection connection;

        public ConexionDB()
        {
            Initialize();
        }

        private static void Initialize()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["ConexionDev"].ConnectionString;
            connection = new MySqlConnection(connectionString);
        }

        public bool OpenConnection()
        {
            try
            {
                connection.Open();

                return true;
            }
            catch (MySqlException ex)
            {
                Console.WriteLine(ex);
                return false;
            }
        }

        public bool CloseConnection()
        {
            try
            {
                connection.Close();
                return true;
            }
            catch (MySqlException ex)
            {
                Console.WriteLine(ex);
                return false;
            }
        }





    }
}
