using AjaxControlToolkit;
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
    public partial class CountryEntryUI : System.Web.UI.Page
    {
        CountryManager nCountryManager = new CountryManager();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PopulateCountriesGrideView();
            }  
        }

        private void PopulateCountriesGrideView()
        {
            countryDisplayGridView.DataSource = nCountryManager.GetCountryList();
            countryDisplayGridView.DataBind();
        }

        private void ClearField()
        {
            countryNameTextBox.Text = "";
            aboutCKEditor.Text = "";
        }

        protected void saveButton_Click(object sender, EventArgs e)
        {
            Country aCountry = new Country();

            aCountry.CountryName = countryNameTextBox.Text;
            aCountry.CountryAbout = aboutCKEditor.Text;

            msgStatus.InnerHtml = nCountryManager.Save(aCountry);

            ClearField();

            PopulateCountriesGrideView();
        }
    }
}