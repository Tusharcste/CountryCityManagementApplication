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
    public partial class ViewCountrysUI : System.Web.UI.Page
    {
        CountryManager nCountryManager = new CountryManager();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetAllCountries();
            }
        }

        protected void searchButton_Click(object sender, EventArgs a)
        {
            List<CountriesViewModel> all = nCountryManager.GetAllCountriesByName(searchNameTextBox.Text);
            if (all.Count == 0)
            {
                msgDisplayLabel.Text = "<span class='label label-warning label-mini'>Data Not Found By <b>" + searchNameTextBox.Text + "</b></span>";
                countryDisplayGridView.DataSource = null;
                countryDisplayGridView.DataBind();

            }
            else
            {
                msgDisplayLabel.Text = String.Empty;
                countryDisplayGridView.DataSource = all;
                countryDisplayGridView.DataBind();
            }
        }

        private void GetAllCountries()
        {
            List<CountriesViewModel> all = nCountryManager.GetAllCountries();
            if (all.Count == 0)
            {
                msgDisplayLabel.Text = "<span class='label label-warning label-mini'>Data Not Found!</span>";
                countryDisplayGridView.DataSource = null;
                countryDisplayGridView.DataBind();

            }
            else
            {
                msgDisplayLabel.Text = String.Empty;
                countryDisplayGridView.DataSource = all;
                countryDisplayGridView.DataBind();
            }
        }

        protected void countryDisplay_OnPageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            countryDisplayGridView.PageIndex = e.NewPageIndex;
            GetAllCountries();
        }
    }
}