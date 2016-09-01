using CountryManagementWebApp.DAL.Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace CountryManagementWebApp.DAL.Gateway
{
    public class CountryGateway : Gateway
    {
        public int Save(Country aCountry)
        {
            Query = "INSERT INTO Countries (Name, About) VALUES (@Name, @About)";
            Command = new SqlCommand(Query, Connection);
            Command.Parameters.Clear();
            Command.Parameters.Add("Name", SqlDbType.NVarChar);
            Command.Parameters["Name"].Value = aCountry.CountryName;
            Command.Parameters.Add("About", SqlDbType.NVarChar);
            Command.Parameters["About"].Value = aCountry.CountryAbout;
            Connection.Open();
            int rowAffected = Command.ExecuteNonQuery();
            Connection.Close();
            return rowAffected;
        }

        public bool GetCountryNameIsExist(string countryName)
        {
            Query = "SELECT * FROM Countries WHERE Name = @Name Order by Name";

            Command = new SqlCommand(Query, Connection);
            Command.Parameters.Clear();
            Command.Parameters.Add("Name", SqlDbType.NVarChar);
            Command.Parameters["Name"].Value = countryName;
            //Command.Parameters.AddWithValue("@cName", CountryName);
            Connection.Open();
            Reader = Command.ExecuteReader();
            bool hasrow = false;
            if (Reader.HasRows)
            {
                hasrow = true;
            }
            Reader.Close();
            Connection.Close();
            return hasrow;
        }

        public List<Country> GetCountries()
        {
            Query = "SELECT * FROM Countries Order by Name";
            Command = new SqlCommand(Query, Connection);
            Connection.Open();
            Reader = Command.ExecuteReader();
            List<Country> aCountryList = new List<Country>();
            while (Reader.Read())
            {
                Country aCountry = new Country();
                aCountry.CountryId = (int)Reader["CountryId"];
                aCountry.CountryName = Reader["Name"].ToString();
                aCountry.CountryAbout = Reader["About"].ToString();
                aCountryList.Add(aCountry);
            }
            Reader.Close();
            Connection.Close();
            return aCountryList;
        }

    }
}