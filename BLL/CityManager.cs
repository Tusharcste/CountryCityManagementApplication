using CountryManagementWebApp.DAL.Gateway;
using CountryManagementWebApp.DAL.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CountryManagementWebApp.BLL
{
    public class CityManager
    {
        CityGateway nCityGateway = new CityGateway();

        CitiesViewModelGateway nCitiesViewModelGateway = new CitiesViewModelGateway();

        public string Save(City aCity)
        {
            if (nCityGateway.GetCountryCityNameIsExist(aCity.CityName))
            {
                return "<strong>Warning!</strong> City: '" + aCity.CityName + "' already exist.";
            }
            else
            {
                if (nCityGateway.CitySave(aCity) > 0)
                {
                    return "<strong>Success!</strong> Save Successfully";
                }
                return "<strong>Error!</strong> Save Failed";
            }
        }

        public List<City> GetCityList()
        {
            return nCityGateway.GetCities();
        }

        public List<CitiesViewModel> GetAllCities()
        {
            return nCitiesViewModelGateway.GetCityList();
        }

        public List<CitiesViewModel> GetAllCitiesByName(string cityName)
        {
            return nCitiesViewModelGateway.GetAllCitiesByName(cityName);
        }

        public List<CitiesViewModel> GetAllCitiesByCountryId(string selectedCountryId)
        {
            return nCitiesViewModelGateway.GetAllCitiesByCountryId(selectedCountryId);
        }

    }
}