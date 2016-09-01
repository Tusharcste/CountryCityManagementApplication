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
    public partial class ViewCitiesUI : System.Web.UI.Page
    {
        CityManager nCityManager = new CityManager();
        CountryManager nCountryManager = new CountryManager();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetAllCities();

                List<Country> aCountries = nCountryManager.GetCountryList();
                countryDropDownList.DataSource = aCountries;
                countryDropDownList.DataTextField = "CountryName";
                countryDropDownList.DataValueField = "CountryId";
                countryDropDownList.DataBind();
                countryDropDownList.Items.Insert(0, new ListItem("--Select Country--", ""));
            }
        }

        private void RadioButtonLogic()
        {
            if (cityNameRadioButton.Checked)
            {
                cityNameTextBox.Text = "";
                cityNameTextBox.Enabled = true;
                countryDropDownList.Enabled = false;

            }
            else if (countryIdRadioButton.Checked)
            {
                countryDropDownList.Enabled = true;
                cityNameTextBox.Enabled = false;
            }
        }

        private void GetListOfCitiesByCityName()
        {
            msgDisplayLabel.Text = String.Empty;
            List<CitiesViewModel> all = nCityManager.GetAllCitiesByName(cityNameTextBox.Text);
            if (all.Count == 0)
            {
                msgDisplayLabel.Text = "<span class='label label-warning label-mini'>Data Not Found By City Name: <b>" + cityNameTextBox.Text + "</b></span>";
                cityDisplayGridView.DataSource = null;
                cityDisplayGridView.DataBind();

            }
            else
            {
                msgDisplayLabel.Text = String.Empty;
                cityDisplayGridView.DataSource = all;
                cityDisplayGridView.DataBind();
            }
        }

        private void GetListOfCitiesByCountryId()
        {
            msgDisplayLabel.Text = String.Empty;
            List<CitiesViewModel> all = nCityManager.GetAllCitiesByCountryId(countryDropDownList.SelectedValue);
            if (all.Count == 0)
            {
                msgDisplayLabel.Text = "<span class='label label-warning label-mini'>Data Not Found By Selected Country: <b>" + countryDropDownList.SelectedItem.Text + "</b></span>";
                cityDisplayGridView.DataSource = null;
                cityDisplayGridView.DataBind();
            }
            else
            {
                msgDisplayLabel.Text = String.Empty;
                cityDisplayGridView.DataSource = all;
                cityDisplayGridView.DataBind();
            }
        }

        protected void nRadioButton_checked(object sender, EventArgs e)
        {
            RadioButtonLogic();
        }

        protected void searchButton_Click(object sender, EventArgs e)
        {
            if (cityNameRadioButton.Checked)
            {
                if (cityNameTextBox.Text == String.Empty || cityNameTextBox.Text.Length == 0)
                {
                    msgDisplayLabel.Text = "<span class='label label-warning label-mini'>City Name Field Is Required!</span>";
                }
                else
                {
                    GetListOfCitiesByCityName();
                }

            }

            else //(countryIdRadioButton.Checked)
            {
                if (countryDropDownList.Items.Count == 0)
                {
                    msgDisplayLabel.Text = "<span class='label label-warning label-mini'>- Select Any One -</span>";
                }
                else
                {
                    GetListOfCitiesByCountryId();
                }

            }
        }

        private void GetAllCities()
        {
            List<CitiesViewModel> all = nCityManager.GetAllCities();
            if (all.Count == 0)
            {
                msgDisplayLabel.Text = "<span class='label label-warning label-mini'>Data Not Found!</span>";
                cityDisplayGridView.DataSource = null;
                cityDisplayGridView.DataBind();
            }
            else
            {
                msgDisplayLabel.Text = String.Empty;
                cityDisplayGridView.DataSource = all;
                cityDisplayGridView.DataBind();
            }
        }

        protected void cityDisplay_OnPageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            cityDisplayGridView.PageIndex = e.NewPageIndex;
            if (cityNameRadioButton.Checked)
            {
                GetListOfCitiesByCityName();
            }
            else
            {
                GetListOfCitiesByCountryId();
            }
        }
    }
}