using CountryManagementWebApp.DAL.Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace CountryManagementWebApp.DAL.Gateway
{
    public class CitiesViewModelGateway : Gateway
    {
        public List<CitiesViewModel> GetCityList()
        {
            Query = "SELECT * FROM CitiesViewModel Order by CityName";
            Command = new SqlCommand(Query, Connection);
            Connection.Open();
            Reader = Command.ExecuteReader();
            List<CitiesViewModel> xCityList = new List<CitiesViewModel>();
            while (Reader.Read())
            {
                CitiesViewModel aCity = new CitiesViewModel();
                aCity.CityName = Reader["CityName"].ToString();
                aCity.CityAbout = Reader["About"].ToString();
                aCity.NoOfDwellers = (int)Reader["NoOfDwellers"];
                aCity.Location = Reader["Location"].ToString();
                aCity.Weather = Reader["Weather"].ToString();
                aCity.CountryName = Reader["Country"].ToString();
                aCity.AboutCountry = Reader["About Country"].ToString();
                xCityList.Add(aCity);
            }
            Reader.Close();
            Connection.Close();
            return xCityList;
        }

        public List<CitiesViewModel> GetAllCitiesByName(string cityName)
        {
            Query = "SELECT * FROM CitiesViewModel WHERE CityName LIKE '%' + @CityName + '%' ORDER BY CityName ";
            Command = new SqlCommand(Query, Connection);
            Command.Parameters.Clear();
            Command.Parameters.Add("CityName", SqlDbType.NVarChar);
            Command.Parameters["CityName"].Value = cityName;
            Connection.Open();
            Reader = Command.ExecuteReader();
            List<CitiesViewModel> yCityList = new List<CitiesViewModel>();
            while (Reader.Read())
            {
                CitiesViewModel aCity = new CitiesViewModel();
                aCity.CityName = Reader["CityName"].ToString();
                aCity.CityAbout = Reader["About"].ToString();
                aCity.NoOfDwellers = (int)Reader["NoOfDwellers"];
                aCity.Location = Reader["Location"].ToString();
                aCity.Weather = Reader["Weather"].ToString();
                aCity.CountryName = Reader["Country"].ToString();
                aCity.AboutCountry = Reader["About Country"].ToString();
                yCityList.Add(aCity);
            }
            Reader.Close();
            Connection.Close();
            return yCityList;
        }

        public List<CitiesViewModel> GetAllCitiesByCountryId(string selectedCountryId)
        {
            Query = "SELECT * FROM CitiesViewModel WHERE CountryId = @CountryId";
            Command = new SqlCommand(Query, Connection);
            Command.Parameters.Clear();
            Command.Parameters.Add("CountryId", SqlDbType.Int);
            Command.Parameters["CountryId"].Value = Convert.ToInt32(selectedCountryId);
            Connection.Open();
            Reader = Command.ExecuteReader();
            List<CitiesViewModel> yCityList = new List<CitiesViewModel>();
            while (Reader.Read())
            {
                CitiesViewModel aCity = new CitiesViewModel();
                aCity.CityName = Reader["CityName"].ToString();
                aCity.CityAbout = Reader["About"].ToString();
                aCity.NoOfDwellers = (int)Reader["NoOfDwellers"];
                aCity.Location = Reader["Location"].ToString();
                aCity.Weather = Reader["Weather"].ToString();
                aCity.CountryName = Reader["Country"].ToString();
                aCity.AboutCountry = Reader["About Country"].ToString();
                yCityList.Add(aCity);
            }
            Reader.Close();
            Connection.Close();
            return yCityList;
        }
    }
}