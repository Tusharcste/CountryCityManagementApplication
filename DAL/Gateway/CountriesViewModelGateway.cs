using CountryManagementWebApp.DAL.Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace CountryManagementWebApp.DAL.Gateway
{
    public class CountriesViewModelGateway : Gateway
    {
        public string nameOfCountry;
        public string aboutOfCountry;
        public List<CountriesViewModel> GetCountryList()
        {
            Query = "SELECT * FROM CountriesViewModel";
            Command = new SqlCommand(Query, Connection);
            Connection.Open();
            Reader = Command.ExecuteReader();
            while (Reader.Read())
            {
                nameOfCountry = Reader["Name"].ToString();
                aboutOfCountry = Reader["About"].ToString();
            }
            Reader.Close();
            Connection.Close();


            Query = "SELECT COUNT(Name) AS NoOfCity,SUM(NoOfDwellers) AS NoOfTotalDwellers FROM CountriesViewModel";
            Command = new SqlCommand(Query, Connection);
            Connection.Open();
            Reader = Command.ExecuteReader();
            List<CountriesViewModel> yCountryList = new List<CountriesViewModel>();

            while (Reader.Read())
            {
                CountriesViewModel aCountry = new CountriesViewModel();
                aCountry.CountryName = nameOfCountry;
                aCountry.CountryAbout = aboutOfCountry;
                aCountry.NoOfCities = (int)Reader["NoOfCity"];
                aCountry.NoOfCityDwellers = (int)Reader["NoOfTotalDwellers"];
                yCountryList.Add(aCountry);
            }
            Reader.Close();
            Connection.Close();

            return yCountryList;
        }

        public List<CountriesViewModel> GetAllCountriesByName(string countryName)
        {
            Query = "SELECT DISTINCT Name,About FROM CountriesViewModel WHERE Name LIKE '%' + @Name + '%' ";
            Command = new SqlCommand(Query, Connection);
            Command.Parameters.Clear();
            Command.Parameters.Add("Name", SqlDbType.NVarChar);
            Command.Parameters["Name"].Value = countryName;
            Connection.Open();
            Reader = Command.ExecuteReader();



            while (Reader.Read())
            {
                nameOfCountry = Reader["Name"].ToString();
                aboutOfCountry = Reader["About"].ToString();
            }
            Reader.Close();
            Connection.Close();


            Query = "SELECT COUNT(Name) AS NoOfCity,SUM(NoOfDwellers) AS NoOfTotalDwellers FROM CountriesViewModel WHERE Name LIKE '%' + @Name + '%'";
            Command = new SqlCommand(Query, Connection);
            Command.Parameters.Clear();
            Command.Parameters.Add("Name", SqlDbType.NVarChar);
            Command.Parameters["Name"].Value = countryName;
            Connection.Open();
            Reader = Command.ExecuteReader();
            List<CountriesViewModel> yCountryList = new List<CountriesViewModel>();

            while (Reader.Read())
            {
                CountriesViewModel aCountry = new CountriesViewModel();
                aCountry.CountryName = nameOfCountry;
                aCountry.CountryAbout = aboutOfCountry;
                aCountry.NoOfCities = (int)Reader["NoOfCity"];
                aCountry.NoOfCityDwellers = (int)Reader["NoOfTotalDwellers"];
                yCountryList.Add(aCountry);
            }
            Reader.Close();
            Connection.Close();

            return yCountryList;
        }
    }
}