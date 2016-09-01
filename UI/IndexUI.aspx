<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IndexUI.aspx.cs" Inherits="CountryManagementWebApp.UI.indexUI" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>

    <title>CMS | Home</title>

    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    <link href="../Content/font-awesome.min.css" rel="stylesheet" />
    <link href="../CSS/style.css" rel="stylesheet" />

</head>
<body onload="ShowCurrentTime()">
    <form id="form1" runat="server">
        <div>


            <section style="width: 1280px;margin:0 auto;box-shadow:0px 0px 5px #000000;" id="container" >
              
              <!--header start-->
              <header style="width: 1280px;margin: 0 auto;" class="header black-bg">
                      
                    <a href="IndexUI.aspx" class="logo text-primary"><b>Country & City Information</b></a>
                    
                    <div class="nav notify-row" id="top_menu">
                        
                        <ul class="nav top-menu">
                            
                            <li class="dropdown">
                                <a class="activeMenu" href="IndexUI.aspx">
                                    <i class="fa fa-home"></i> Home
                                </a>
                            </li>

                            <li class="dropdown">
                                <a class="activeMenu" href="CountryEntryUI.aspx">
                                    <i class="fa fa-globe"></i> Country Entry
                                </a>
                            </li>
                            
                            <li id="header_inbox_bar" class="dropdown">
                                <a href="CityEntryUI.aspx">
                                    <i class="fa fa-sitemap"></i> City Entry
                                </a>
                            </li>
                            
                            <li id="" class="dropdown">
                                <a href="ViewCitiesUI.aspx">
                                    <i class="fa fa-info-circle"></i> View Cities
                                </a>
                            </li>

                             <li id="" class="dropdown">
                                <a href="ViewCountriesUI.aspx">
                                    <i class="fa fa-eye"></i> View Countries
                                </a>
                            </li>
                        </ul>
                        
                    </div>
                </header>
              <!--header end-->
      
              
              <!--main content start-->
              <section style="width: 1280px;" id="main-content">
                  <section class="wrapper">
                     <asp:ScriptManager ID="MainScriptManager" runat="server"></asp:ScriptManager>
                     <asp:UpdatePanel ID="pnlHelloWorld" runat="server">
                         <ContentTemplate>
                             

                             <div class="row mt">
                                  <div class="col-md-12 col-sm-12">
                                      <%--<asp:Timer ID="Timer" runat="server" Interval="3000" OnTick="Timer_Tick"></asp:Timer>--%>
                                      <div id="slideshow_panel" runat="server" class="instagram-panel pn">
								            <i class="fa fa-globe fa-4x"></i>
								            <p>COUNTRY & CITY INFORMATION</p>
								            <p>
                                                <%--<i class="fa fa-comment"></i> 18 | <i class="fa fa-heart"></i> 49--%>
                                                <div id="lblTime"></div>

								            </p>
							          </div>

                                      
                                      <%--<asp:Image ID="Image1" runat="server" />--%>
                                        <%--<div class="content-panel pn">
                                            
						                    <div id="spotify">
							                    <div class="col-xs-4 col-xs-offset-8">
								                    <button class="btn btn-sm btn-clear-g">FOLLOW</button>
							                    </div>
							                    <div class="sp-title">
								                    <h3>SLIDE SHOW CAPTION</h3>
							                    </div>
							                    <div class="play">
								                    <i class="fa fa-play-circle"></i>
							                    </div>
						                    </div>
					                    </div>--%>

                                    </div>
                              </div>
                          </ContentTemplate>
                      </asp:UpdatePanel>


                      <div class="row mt">
                                   
                          <div class="col-lg-4 col-md-4 col-sm-12">
                                <div class="showback">
      					            <h4><i class="fa fa-angle-right"></i> Status</h4>
						    
                                    <div class="row mtbox">
                  		                <div class="col-md-6 col-sm-6">
                  			                <div class="box1">
					  			                <span class="li_heart"></span>
					  			                <h3 id="countryCount" runat="server">0</h3>
                  			                </div>
					  			                <p>Total no of Countries</p>
                  		                </div>

                  		                <div class="col-md-6 col-sm-6">
                  			                <div class="box1">
					  			                <span class="li_cloud"></span>
					  			                <h3 id="cityCount" runat="server">0</h3>
                  			                </div>
					  			                <p>Total no of Cities</p>
                  		                </div>
                  	
                  	                </div><!-- /row mt -->  				
      				            </div>
                      
                      
                          </div>
                          <div class="col-lg-8 col-md-8 col-sm-12">

                              <div class="showback">
      					            <h4><i class="fa fa-angle-right"></i> Shortcut Menu</h4>
						    
                                	<div class="steps">
							            <label><a href="CountryEntryUI.aspx">Country Entry</a></label>
                                        <label><a href="CityEntryUI.aspx">City Entry</a></label>
                                        <label><a href="ViewCitiesUI.aspx">View Cities</a></label>
                                        <label><a href="ViewCountriesUI.aspx">View Countries</a></label>
							        </div>			
      				            </div>

                          </div>
                  
                      </div><!-- row -->
                  </section>
              </section>

              <!--main content end-->
              <!--footer start-->
              <footer class="site-footer">
                  <div class="text-center">
                      Copyright &copy; 2016 - <strong><asp:LinkButton ID="LinkButton1" runat="server" OnClientClick="aspnetForm.target ='_blank';" PostBackUrl="facebook.com">The Debuggers</asp:LinkButton></strong> All rights reserved.
                  </div>
              </footer>
              <!--footer end-->
          </section>
    
        </div>
    </form>
    
    <script src="../Scripts/jquery-1.9.1.min.js"></script>
    <script src="../Scripts/bootstrap.min.js"></script>
    <script>
        function ShowCurrentTime() {
            var dt = new Date();
            document.getElementById("lblTime").innerHTML = dt.toLocaleTimeString();
            window.setTimeout("ShowCurrentTime()", 1000); // Here 1000(milliseconds) means one 1 Sec  
        }
    </script>
    
</body>
</html>
