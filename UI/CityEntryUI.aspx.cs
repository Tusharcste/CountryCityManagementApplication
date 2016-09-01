using CountryManagementWebApp.BLL;
using CountryManagementWebApp.DAL.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CountryManagementWebApp.UI
{
    public partial class CityEntryUI : System.Web.UI.Page
    {
        CityManager nCityManager = new CityManager();
        CountryManager nCountryManager = new CountryManager();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PopulateCitiesGrideView();

                List<Country> Countries = nCountryManager.GetCountryList();
                countryDropDownList.DataSource = Countries;
                countryDropDownList.DataTextField = "CountryName";
                countryDropDownList.DataValueField = "CountryId";
                countryDropDownList.DataBind();
                countryDropDownList.Items.Insert(0, new ListItem("--Select Country--", ""));
            }  
        }

        private void PopulateCitiesGrideView()
        {
            cityDisplayGridView.DataSource = nCityManager.GetCityList();
            cityDisplayGridView.DataBind();
        }

        private void ClearField()
        {
            cityNameTextBox.Text = "";
            aboutCityCKEditor.Text = "";
            noOfDwellersTextBox.Text = "";
            locationTextBox.Text = "";
            weatherTextBox.Text = "";
            countryDropDownList.Text = "";
        }

        protected void saveButton_Click(object sender, EventArgs e)
        {
            City aCity = new City();

            aCity.CityName = cityNameTextBox.Text;
            aCity.CityAbout = aboutCityCKEditor.Text;
            //aCity.CityAbout = HttpUtility.HtmlEncode(aboutCityCKEditor.Text);
            aCity.NoOfDwellers = Convert.ToInt32(noOfDwellersTextBox.Text);
            aCity.Location = locationTextBox.Text;
            aCity.Weather = weatherTextBox.Text;
            aCity.CountryId = Convert.ToInt32(countryDropDownList.SelectedValue);

            msgStatus.InnerHtml = nCityManager.Save(aCity);

            ClearField();

            PopulateCitiesGrideView();
        }
    }
}