using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CountryManagementWebApp
{
    /// <summary>
    /// Summary description for Upload
    /// </summary>
    public class Upload : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            HttpPostedFile uploadsPostedFile = context.Request.Files["upload"];
            string aCKEditorFuncNum = context.Request["CKEditorFuncNum"];
            string file = System.IO.Path.GetFileName(uploadsPostedFile.FileName);
            uploadsPostedFile.SaveAs(context.Server.MapPath(".") + "\\Images\\" + file);
            string url = "/Images/" + file;
            context.Response.Write("<script>window.parent.CKEDITOR.tools.callFunction(" + aCKEditorFuncNum + ", \"" + url + "\");</script>");
            context.Response.End(); 
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}