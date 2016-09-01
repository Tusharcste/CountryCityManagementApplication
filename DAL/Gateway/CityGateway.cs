using CountryManagementWebApp.DAL.Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace CountryManagementWebApp.DAL.Gateway
{
    public class CityGateway : Gateway
    {
        public int CitySave(City aCity)
        {
            Query = "INSERT INTO Cities VALUES(@CountryId, @Name, @About, @NoOfDwellers,@Location, @Weather)";
            Command = new SqlCommand(Query, Connection);
            Command.Parameters.Clear();
            Command.Parameters.Add("CountryId", SqlDbType.Int);
            Command.Parameters["CountryId"].Value = aCity.CountryId;
            Command.Parameters.Add("Name", SqlDbType.NVarChar);
            Command.Parameters["Name"].Value = aCity.CityName;
            Command.Parameters.Add("About", SqlDbType.NVarChar);
            Command.Parameters["About"].Value = aCity.CityAbout;
            Command.Parameters.Add("NoOfDwellers", SqlDbType.Int);
            Command.Parameters["NoOfDwellers"].Value = aCity.NoOfDwellers;
            Command.Parameters.Add("Location", SqlDbType.NVarChar);
            Command.Parameters["Location"].Value = aCity.Location;
            Command.Parameters.Add("Weather", SqlDbType.NVarChar);
            Command.Parameters["Weather"].Value = aCity.Weather;
            Connection.Open();
            int rowAffected = Command.ExecuteNonQuery();
            Connection.Close();
            return rowAffected;
        }

        public bool GetCountryCityNameIsExist(string cityName)
        {
            Query = "SELECT * FROM Cities AS ci INNER JOIN Countries AS co ON ci.CountryId = co.CountryId WHERE ci.Name =  @Name";
            Command = new SqlCommand(Query, Connection);
            Command.Parameters.Clear();
            Command.Parameters.Add("Name", SqlDbType.NVarChar);
            Command.Parameters["Name"].Value = cityName;
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

        public List<City> GetCities()
        {
            Query = "SELECT ci.Name, ci.NoOfDwellers, co.Name AS Country FROM Cities AS ci INNER JOIN Countries AS co ON co.CountryId = ci.CountryId Order by Name";
            Command = new SqlCommand(Query, Connection);
            Connection.Open();
            Reader = Command.ExecuteReader();
            List<City> aCityList = new List<City>();
            while (Reader.Read())
            {
                City aCity = new City();
                aCity.CityName = Reader["Name"].ToString();
                aCity.NoOfDwellers = Convert.ToInt32(Reader["NoOfDwellers"]);
                aCity.CountryName = Reader["Country"].ToString();
                aCityList.Add(aCity);
            }
            Reader.Close();
            Connection.Close();
            return aCityList;
        }
    }
}