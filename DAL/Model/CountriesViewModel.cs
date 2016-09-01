using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CountryManagementWebApp.DAL.Model
{
    public class CountriesViewModel
    {
        public string CountryName { get; set; }
        public string CountryAbout { get; set; }
        public int NoOfCities { get; set; }
        public string CityName { get; set; }
        public int NoOfCityDwellers { get; set; }
    }
}