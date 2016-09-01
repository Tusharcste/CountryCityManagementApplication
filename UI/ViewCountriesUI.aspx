<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewCountriesUI.aspx.cs" Inherits="CountryManagementWebApp.UI.ViewCountrysUI" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>

    <title>CMS |View Countries</title>

    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    <link href="../Content/font-awesome.min.css" rel="stylesheet" />
    <link href="../CSS/style.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="MainScriptManager" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="pnlHelloWorld" runat="server">
            <ContentTemplate>
                <div>


                    <section style="width: 1280px;margin:0 auto;box-shadow:0px 0px 5px #000000;" id="container" >
                      <!--header start-->
                      <header style="width: 1280px;margin: 0 auto;" class="header black-bg">
                            <a href="IndexUI.aspx" class="logo"><b>Country & City Information</b></a>
                            <div class="nav notify-row" id="top_menu">
                                <ul class="nav top-menu">
                                    <li class="dropdown">
                                        <a class="activeMenu" href="IndexUI.aspx">
                                            <i class="fa fa-home"></i> Home
                                        </a>
                                    </li>
                                    <li class="dropdown">
                                        <a href="CountryEntryUI.aspx">
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

                              <div class="row mt">
                                   
                                  <div class="col-lg-12 col-md-12 col-sm-12">
                                        <div class="showback">
      					                    
						    
                                            <ajaxToolkit:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="0" Height="100%" Width="100%">
                                                <ajaxToolkit:TabPanel ID="TabPanel4" runat="server" HeaderText="TabPanel1">
                                                                  
                                                    <HeaderTemplate>
                                                        <h4 style="margin: 5px;"><i class="fa fa-angle-right"></i> View Countries</h4>
                                                    </HeaderTemplate>
                                                    <ContentTemplate>

                                                        <table class="table">
                                                            <tr>
                                                                <td colspan="2">
                                                                    <fieldset class="fieldset">
                                                                        <legend class="legend">Search Criteria</legend>

                                                                        <table class="table">
                                                                            <tr>
                                                                                <td>
                                                                                    <label class="control-label" for="searchNameTextBox"><b>Name</b></label>
                                                                                </td>
                                                                                <td>
                                                                                    <asp:TextBox CssClass="form-control" ID="searchNameTextBox" runat="server"></asp:TextBox>

                                                                                    <asp:RequiredFieldValidator
                                                                                        ID="RequiredFieldValidator1"
                                                                                        runat="server"
                                                                                        ForeColor="Red"
                                                                                        ControlToValidate="searchNameTextBox"
                                                                                        ErrorMessage="The field is Black"></asp:RequiredFieldValidator>
                                                                                </td>
                                                                                <td>
                                                                                    <asp:Button CssClass="btn btn-info" AutoPostBack="True" ID="searchButton" runat="server" OnClick="searchButton_Click" Text="Search"></asp:Button>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                        <asp:Label ID="msgDisplayLabel" runat="server" Text=""></asp:Label>    
                                                                    </fieldset>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                                 
                                                                </td>
                                                                <td>
                                                                                  
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="position:relative;" colspan="2">
                                                                              
                                                                    <asp:GridView CssClass="table-bordered" ID="countryDisplayGridView" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None"
                                                                        AutoPostBack="True" allowpaging="True" AllowSorting="True" OnPageIndexChanging="countryDisplay_OnPageIndexChanging" PageSize="3" Width="100%" BorderStyle="None">
                                                                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                                                        <Columns>
                                                                            <asp:TemplateField HeaderText="SL#">
                                                                                <ItemTemplate>
                                                                                        <%#Container.DataItemIndex+1 %>
                                                                                </ItemTemplate>
                                                                                <ControlStyle CssClass="text-center" />
                                                                                <HeaderStyle CssClass="text-center th-list-danger" />
                                                                                <ItemStyle CssClass="text-center" />
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="Name">
                                                                                <ItemTemplate>
                                                                                    <%--<asp:HiddenField runat="server" ID="idHiddenFieldId" Value='<%#Eval("Id") %>' />--%>
                                                                                    <asp:Label ID="nameLabel" runat="server" Text='<%#Eval("CountryName") %>'></asp:Label>
                                                                                </ItemTemplate>
                                                                                <HeaderStyle CssClass="text-center th-list-primary" />
                                                                                <ItemStyle CssClass="text-padding" />
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="About">
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="aboutLabel" runat="server" Text='<%#Eval("CountryAbout") %>'></asp:Label>
                                                                                </ItemTemplate>
                                                                                <HeaderStyle CssClass="text-center th-list-primary" />
                                                                                <ItemStyle CssClass="text-padding" />
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="No. of cities">
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="noofcitiesLabel" runat="server" Text='<%#Eval("NoOfCities") %>'></asp:Label>
                                                                                </ItemTemplate>
                                                                                <HeaderStyle CssClass="text-center th-list-primary" />
                                                                                <ItemStyle CssClass="text-padding" />
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="No. of city dwellers">
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="noofcitydwellersLabel" runat="server" Text='<%#Eval("NoOfCityDwellers") %>'></asp:Label>
                                                                                </ItemTemplate>
                                                                                <HeaderStyle CssClass="text-center th-list-primary" />
                                                                                <ItemStyle CssClass="text-padding" />
                                                                            </asp:TemplateField>
                                                                        </Columns>
                                                                        <EditRowStyle BackColor="#999999" />
                                                                        <FooterStyle BackColor="#FFD777" Font-Bold="True" ForeColor="#666666" />
                                                                        <HeaderStyle BackColor="#FFD777" Font-Bold="True" ForeColor="#666666" HorizontalAlign="Center" />
                                                                        <PagerSettings FirstPageText="&lt;&lt;" LastPageText="&gt;&gt;" />
                                                                        <PagerStyle CssClass="pagination-grid" BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                                                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                                                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                                                        <SortedAscendingCellStyle BackColor="#E9E7E2" />
                                                                        <SortedAscendingHeaderStyle BackColor="#506C8C" />
                                                                        <SortedDescendingCellStyle BackColor="#FFFDF8" />
                                                                        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                                                                </asp:GridView>

                                                                </td>
                                                            </tr>
                                                        </table>


                                                    </ContentTemplate>
                    
                                                </ajaxToolkit:TabPanel>
                                            </ajaxToolkit:TabContainer>

                                             				
      				                    </div>
                      
                      
                                  </div>
                  
                              </div><! --/row -->
                          </section>
                      </section>

                      <!--main content end-->
                      <!--footer start-->
                      <footer class="site-footer">
                          <div class="text-center">
                              Copyright &copy; 2016 - <strong>The Debuggers</strong> All rights reserved.
                          </div>
                      </footer>
                      <!--footer end-->
                  </section>

    



    
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
    <script src="../Scripts/jquery-1.9.1.min.js"></script>
    <script src="../Scripts/bootstrap.min.js"></script>
</body>
</html>
