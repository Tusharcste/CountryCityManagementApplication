using CountryManagementWebApp.BLL;
using CountryManagementWebApp.DAL.Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CountryManagementWebApp.UI
{
    public partial class indexUI : System.Web.UI.Page
    {
        CountryManager nCountryManager = new CountryManager();
        CityManager nCityManager = new CityManager();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //SetImage();
                
                List<Country> aCountries = nCountryManager.GetCountryList();
                countryCount.InnerHtml = aCountries.Count.ToString();

                List<City> aCities = nCityManager.GetCityList();
                cityCount.InnerHtml = aCities.Count.ToString();

            }
        }


        //protected void Timer_Tick(object sender, EventArgs e)
        //{
        //    int i = (int)ViewState["ImageDisplayed"];
        //    i = i + 1;
        //    ViewState["ImageDisplayed"] = i;
        //    DataRow imageDataRow = ((DataSet)ViewState["Imagedata"]).Tables["image"].Select().FirstOrDefault(x => x["order"].ToString() == i.ToString());
        //    if (imageDataRow != null)
        //    {
        //        string url = "~/Images/" + imageDataRow["name"].ToString();
        //        //slideshow_panel.Attributes["background"] = "url("+url+") no-repeat center top";
        //        slideshow_panel.Style.Add("background", "url(" + url + ") no-repeat center top");
                    
        //    }
        //    else
        //    {
        //        SetImage();
        //    }
        //}

        //private void SetImage()
        //{
        //    DataSet ds = new DataSet();
        //    ds.ReadXml(Server.MapPath("~/XML/ImageData.xml"));
        //    ViewState["Imagedata"] = ds;
        //    ViewState["ImageDisplayed"] = 1;

        //    DataRow imageDataRow = ds.Tables["image"].Select().FirstOrDefault(x => x["order"].ToString() == "1");
            

        //    string url = "~/Images/" + imageDataRow["name"].ToString();
        //    //slideshow_panel.Attributes["background"] = "url(" + url + ") no-repeat center top";
        //    slideshow_panel.Style.Add("background", "url(" + url + ") no-repeat center top");

        //}

    }
}