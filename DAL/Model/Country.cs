using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CountryManagementWebApp.DAL.Model
{
    public class Country
    {
        public int CountryId { get; set; }
        public string CountryName { get; set; }
        public string CountryAbout { get; set; }
        public int TotalNoOfCountries { get; set; }
    }
}