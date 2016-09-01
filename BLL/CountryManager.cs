using CountryManagementWebApp.DAL.Gateway;
using CountryManagementWebApp.DAL.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CountryManagementWebApp.BLL
{
    public class CountryManager
    {
        CountryGateway nCountryGateway = new CountryGateway();

        CountriesViewModelGateway nCountriesViewModelGateway = new CountriesViewModelGateway();

        public string Save(Country aCountry)
        {
            if (nCountryGateway.GetCountryNameIsExist(aCountry.CountryName))
            {
                return "<strong>Warning!</strong> Country: '" + aCountry.CountryName + "' already exist.";
            }
            else
            {
                if (nCountryGateway.Save(aCountry) > 0)
                {
                    return "<strong>Success!</strong> Save Successfully";
                }
                return "<strong>Error!</strong> Save Failed";
            }
        }

        public List<Country> GetCountryList()
        {
            return nCountryGateway.GetCountries();
        }

        public List<CountriesViewModel> GetAllCountries()
        {
            return nCountriesViewModelGateway.GetCountryList();
        }

        public List<CountriesViewModel> GetAllCountriesByName(string countryName)
        {
            return nCountriesViewModelGateway.GetAllCountriesByName(countryName);
        }

    }
}