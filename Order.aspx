<%@ Page Title="" Language="C#" MasterPageFile="~/MainPage.master" AutoEventWireup="true" CodeFile="Order.aspx.cs" Inherits="Order" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="g" runat="server">
        <ContentTemplate>
            <table width="100%">
                <tr height="20px" style="background-color: #CCCCCC" align="left" runat="server" id="trsearchlabel">
                    <td colspan="5" style="font-size: 14px; font-weight: bold">Search </td>
                </tr>
                <tr runat="server" id="trsearchlabel1">
                    <td align="left">First Name
                <asp:Label ID="Label1" runat="server" Text="*" ForeColor="#993300" /></td>
                    <td align="left">Last Name 
                <asp:Label ID="Label2" runat="server" Text="*" ForeColor="#993300" /></td>
                    <td align="left">Mobile No.
                <asp:Label ID="Label3" runat="server" Text="*" ForeColor="#993300" />
                    </td>
                    <td align="left">Alternate Cont. No
                <asp:Label ID="Label4" runat="server" Text="*" ForeColor="#993300" /></td>

                    <td align="left">&nbsp;</td>

                </tr>
                <tr height="30px" runat="server" id="trsearchlabel2">
                    <td align="left">
                        <asp:TextBox ID="txtFirstname" runat="server" Width="220px"></asp:TextBox></td>
                    <td align="left">
                        <asp:TextBox ID="txtLastname" runat="server" Width="220px"></asp:TextBox></td>
                    <td align="left">
                        <asp:TextBox ID="txtMobileNO" runat="server" Width="220px" MaxLength="10" onkeypress="return isNumberKey(event)"></asp:TextBox></td>
                    <td align="left">
                        <asp:TextBox ID="txtAlternate" runat="server" Width="220px" MaxLength="10" onkeypress="return isNumberKey(event)"></asp:TextBox></td>
                    <td align="left">
                        <asp:ImageButton ID="btnSearch" runat="server" ImageUrl="~/images/download.jpg" OnClick="btnSearch_Click" Width="40px" />
                    </td>

                </tr>
                <tr runat="server" id="trsearchlabel3">
                    <td align="left">&nbsp;</td>
                    <td align="left">&nbsp;</td>
                    <td align="left">
                        <asp:HiddenField ID="hdnRecogniseID" runat="server" />
                    </td>
                    <td align="left">
                        <asp:HiddenField ID="hdnLoginID" runat="server" />
                        <asp:Label ID="LoginID" runat="server" />
                    </td>
                    <td align="left">

                        <asp:HiddenField ID="hdnLoginName" runat="server" />
                        <asp:Label ID="LoginName" runat="server" />

                    </td>

                </tr>


                <tr height="30px" runat="server" id="trsearchlabel4">
                    <td align="left" colspan="5">
                        <asp:GridView ID="gvCustomerList" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="White"
                            BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" DataKeyNames="CustID" GridLines="Horizontal"
                            OnPageIndexChanging="gvCustomerList_PageIndexChanging" OnRowCommand="gvCustomerList_RowCommand" TabIndex="-1" Width="100%" ForeColor="Black">
                            <AlternatingRowStyle BackColor="#CCCCCC" />
                            <Columns>
                                <asp:TemplateField HeaderStyle-HorizontalAlign="Left" HeaderText="Edit" ItemStyle-Width="25px">
                                    <ItemTemplate>
                                        <asp:ImageButton ID="imgsel" runat="server" CausesValidation="false" CommandArgument="<%# Container.DataItemIndex %>" CommandName="selectLead" ImageUrl="~/images/pencil.png" ToolTip="Select" />

                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle Width="25px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderStyle-HorizontalAlign="Left" HeaderText="CustomerID" ItemStyle-HorizontalAlign="Left">
                                    <ItemTemplate>
                                        <asp:Label ID="CustID" runat="server" Text='<%#Eval("CustID")%>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Left" Width="100px" />
                                    <ItemStyle HorizontalAlign="Left" Width="100px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderStyle-HorizontalAlign="Left" HeaderText="Customer Name" ItemStyle-HorizontalAlign="Left">
                                    <ItemTemplate>
                                        <asp:Label ID="FirstName" runat="server" Text='<%#Eval("FirstName")%>'></asp:Label>
                                        <asp:Label ID="LastName" runat="server" Text='<%#Eval("LastName")%>'></asp:Label>

                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Left" Width="100px" />
                                    <ItemStyle HorizontalAlign="Left" Width="100px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderStyle-HorizontalAlign="Left" HeaderText="Contact No" ItemStyle-HorizontalAlign="Left">
                                    <ItemTemplate>
                                        <asp:Label ID="MobileNo" runat="server" Text='<%#Eval("MobileNo")%>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Left" Width="100px" />
                                    <ItemStyle HorizontalAlign="Left" Width="100px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderStyle-HorizontalAlign="Left" HeaderText="Alt. Contact No" ItemStyle-HorizontalAlign="Left">
                                    <ItemTemplate>
                                        <asp:Label ID="AltContactNo" runat="server" Text='<%#Eval("AltContactNo")%>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Left" Width="100px" />
                                    <ItemStyle HorizontalAlign="Left" Width="100px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderStyle-HorizontalAlign="Left" HeaderText="Address" ItemStyle-HorizontalAlign="Left">
                                    <ItemTemplate>
                                        <asp:Label ID="Ship_City" runat="server" Text='<%#Eval("Ship_City")%>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Left" Width="100px" />
                                    <ItemStyle HorizontalAlign="Left" Width="100px" />
                                </asp:TemplateField>

                            </Columns>
                            <EmptyDataTemplate>No records Found</EmptyDataTemplate>
                            <FooterStyle BackColor="#CCCCCC" />
                            <HeaderStyle BackColor="#666666" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                            <SortedAscendingCellStyle BackColor="#F1F1F1" />
                            <SortedAscendingHeaderStyle BackColor="#808080" />
                            <SortedDescendingCellStyle BackColor="#CAC9C9" />
                            <SortedDescendingHeaderStyle BackColor="#383838" />
                        </asp:GridView>
                    </td>

                </tr>
                <tr height="30px">
                    <td align="left">&nbsp;</td>
                    <td align="left">&nbsp;</td>
                    <td align="left">&nbsp;</td>
                    <td align="left">&nbsp;</td>
                    <td align="left">&nbsp;</td>

                </tr>


                <tr height="20px" style="background-color: #CCCCCC" align="left" id="trcustdetails" runat="server" visible="false">
                    <td colspan="5" style="font-size: 14px; font-weight: bold">Customer Details</td>
                </tr>
                <tr id="trselectedcustomer1" runat="server" visible="false">
                    <td align="left" >Customer ID
                <asp:Label ID="Label5" runat="server" Text="*" ForeColor="#993300" /></td>
                    <td align="left"  >Last Name 
                <asp:Label ID="Label6" runat="server" Text="*" ForeColor="#993300" /></td>
                    <td align="left" >Mobile No.
                <asp:Label ID="Label7" runat="server" Text="*" ForeColor="#993300" />
                    </td>
                    <td align="left" style="height: 16px">Alternate Cont. No
                <asp:Label ID="Label8" runat="server" Text="*" ForeColor="#993300" /></td>

                    <td align="left"  visible="false" >Delivery Date.
                        <asp:Label ID="Label16" runat="server" ForeColor="#993300" Text="*" />
                    </td>

                </tr>
                <tr id="trselectedcustomer2" runat="server" visible="false">
                    <td align="left" >
                        <asp:TextBox ID="txtfname" runat="server" Width="220px" ReadOnly="true"></asp:TextBox></td>
                    <td align="left" >
                        <asp:TextBox ID="txtlname" runat="server" Width="220px" ReadOnly="true"></asp:TextBox></td>
                    <td align="left" >
                        <asp:TextBox ID="txtmob" runat="server" Width="220px" MaxLength="10" onkeypress="return isNumberKey(event)" ReadOnly="true"></asp:TextBox></td>
                    <td align="left" >
                        <asp:TextBox ID="txtaltmob" runat="server" Width="220px" MaxLength="10" onkeypress="return isNumberKey(event)" ReadOnly="true"></asp:TextBox></td>
                    <td align="left" visible="false" >
                       
                        <asp:TextBox ID="txtDeliveryDate" runat="server"   Width="220px"></asp:TextBox>
                        <ajaxToolkit:CalendarExtender ID="CalendarExtender2" runat="server" Format="MM/dd/yyyy"
                        TargetControlID="txtDeliveryDate">
                    </ajaxToolkit:CalendarExtender>
                       
                    </td>

                </tr>
                
                 <tr id="trselectedcustomer5" runat="server" visible="false">
                    <td align="left" ></td>
                        
                    <td align="left" >
                         </td>
                    <td align="left" >
                         <asp:Button ID="btnPlaceorder" runat="server" Text="New order" OnClick="btnPlaceorder_Click" BackColor="Gray" ForeColor="White" Width="75px" />
                        &nbsp;<asp:Button ID="btnEdit" runat="server" Text="Edit " OnClick="btnEdit_Click" BackColor="Gray" ForeColor="White" CausesValidation="False" />
                        &nbsp<asp:Button ID="btnBack" runat="server" Text="Back " OnClick="btnback_Click" BackColor="Gray" ForeColor="White" CausesValidation="False" />
                         </td>
                    <td align="left" >
                         </td>
                    <td align="left"  >
                        
                    </td>

                </tr>
                



                <tr height="20px" style="background-color: #CCCCCC" align="left" visible="false" runat="server">
                    <td colspan="5" style="font-size: 14px; font-weight: bold">Place Order</td>
                </tr>
                <tr height="30px" visible="false" runat="server">
                    <td align="left">Order Type
                <asp:Label ID="Label9" runat="server" Text="*" ForeColor="#993300" /></td>
                    <td align="left">
                        <asp:DropDownList ID="ddlOrderType" runat="server" Width="220px">
                        </asp:DropDownList>
                    </td>
                    <td align="left">
                        <br />
                    </td>
                    <td align="left">
                        <asp:TextBox ID="TextBox1" runat="server" Width="220px" Visible="False"></asp:TextBox></td>

                </tr>
                <tr height="30px" visible="false" runat="server">
                    <td align="left">Product Type
                <asp:Label ID="Label12" runat="server" Text="*" ForeColor="#993300" /></td>
                    <td align="left">Product Name
                <asp:Label ID="Label13" runat="server" Text="*" ForeColor="#993300" /></td>
                    <td align="left">Quantity
                <asp:Label ID="Label14" runat="server" Text="*" ForeColor="#993300" />&nbsp;<asp:Label ID="lblPerquantity" runat="server" Text="*" ForeColor="#993300" />
                        <asp:Label ID="lblPer" runat="server" Text="*" ForeColor="#993300" />
                        <asp:Label ID="lblunit" runat="server" Text="*" ForeColor="#993300" /></td>
                    <td align="left">Total
                <asp:Label ID="Label15" runat="server" Text="*" ForeColor="#993300" /></td>
                    <td align="left">
                        
                    </td>

                </tr>
                <tr height="30px" visible="false" runat="server">
                    <td align="left">
                        <asp:DropDownList ID="ddlProductType" runat="server" Width="220px" AutoPostBack="True" OnSelectedIndexChanged="ddlProductType_SelectedIndexChanged">
                            <asp:ListItem></asp:ListItem>
                            <asp:ListItem>New Order</asp:ListItem>
                            <asp:ListItem>Make good</asp:ListItem>
                            <asp:ListItem></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td align="left">
                        <asp:DropDownList ID="ddlProductName" runat="server" Width="220px" AutoPostBack="True" OnSelectedIndexChanged="ddlProductName_SelectedIndexChanged">
                            <asp:ListItem></asp:ListItem>
                            <asp:ListItem>New Order</asp:ListItem>
                            <asp:ListItem>Make good</asp:ListItem>
                            <asp:ListItem></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td align="left">
                        <asp:TextBox ID="txtQuantity" runat="server" Width="220px" AutoPostBack="True" OnTextChanged="txtQuantity_TextChanged"></asp:TextBox></td>
                    <td align="left">
                        <asp:TextBox ID="txtTotal" runat="server" Width="220px"></asp:TextBox></td>
                    <td align="left">
                        <asp:Button ID="btnConfirm" runat="server" Text="Add" BackColor="Gray" ForeColor="White" Width="63px" OnClick="btnConfirm_Click" />
                    </td>

                </tr>
                <tr height="30px" id="grdorderhide" runat="server">
                    <td align="right" colspan="4">


                        <asp:GridView ID="grvStudentDetails" runat="server" ShowFooter="True" AutoGenerateColumns="False"
                            CellPadding="3" ForeColor="Black" GridLines="Vertical" OnRowDeleting="grvStudentDetails_RowDeleting"
                            Width="97%" Style="text-align: left" OnRowDataBound="grvStudentDetails_RowDataBound" BackColor="White"
                             BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px">
                            <Columns>
                                <asp:BoundField DataField="RowNumber" HeaderText="SNo" />
                                <asp:TemplateField HeaderText="Order Type">
                                    <ItemTemplate>
                                        <asp:DropDownList ID="ddlOrderTypegrd" runat="server" Width="120px">
                                            
                                            <asp:ListItem Value="1">New Order</asp:ListItem>
                                            <asp:ListItem Value="2">Make Good</asp:ListItem>
                                            <asp:ListItem Value="3">Replace</asp:ListItem>

                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="rEQddlOrderTypegrd" runat="server" ControlToValidate="ddlOrderTypegrd"
                                            ErrorMessage="*" InitialValue="Select"></asp:RequiredFieldValidator>
                                    </ItemTemplate>
                                    <FooterStyle HorizontalAlign="Right" />
                                    <FooterTemplate>
                                        <asp:Button ID="ButtonAdd" runat="server" Text="Add New Row" OnClick="ButtonAdd_Click" BackColor="#666666" ForeColor="White" />&nbsp;&nbsp;
                              <asp:Button ID="btnSaveorder" runat="server" Text="Submit Order" OnClick="btnSaveorder_Click" BackColor="#666666" ForeColor="White"/>
                                    </FooterTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Product Type">
                                    <ItemTemplate>
                                         <asp:DropDownList ID="ddlproductTypegrd" runat="server" Width="120px" AutoPostBack="True" OnSelectedIndexChanged="ddlproductTypegrd_SelectedIndexChanged">
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="REQproductTypegrd" runat="server" ControlToValidate="ddlproductTypegrd"
                                            ErrorMessage="*" InitialValue="Select"></asp:RequiredFieldValidator>

                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Product">
                                    <ItemTemplate>
                                        <asp:DropDownList ID="ddlproductgrd" runat="server" Width="120px" AutoPostBack="True" OnSelectedIndexChanged="ddlproductgrd_SelectedIndexChanged"></asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="REQproductgrd" runat="server" ControlToValidate="ddlproductgrd"
                                            ErrorMessage="*" InitialValue="Select"></asp:RequiredFieldValidator>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Quantity">
                                    <ItemTemplate>
                                        <asp:DropDownList ID="ddlQuantitygrd" runat="server" Width="120px" AutoPostBack="True" OnSelectedIndexChanged="ddlQuantitygrd_SelectedIndexChanged">
                                        </asp:DropDownList>
                                        <%-- <asp:TextBox ID="txtQuantitygrd" runat="server" Width="50px" AutoPostBack="True" OnTextChanged="txtQuantitygrd_TextChanged"></asp:TextBox>--%>

                                        <asp:RequiredFieldValidator ID="REQuantitygrd" runat="server" ControlToValidate="ddlQuantitygrd"
                                            ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Total">
                                    <ItemTemplate>
                                        <asp:TextBox ID="txtTotalgrd" runat="server" Width="70px" ReadOnly="true"></asp:TextBox>
                                        <asp:HiddenField ID="hdnRate" runat="server"></asp:HiddenField>

                                        <asp:RequiredFieldValidator ID="ReqTotalgrd" runat="server" ControlToValidate="txtTotalgrd"
                                            ErrorMesshdnOrderIDage="*" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="" >
                                    <ItemTemplate>

                                        <asp:TextBox ID="txtOrder" runat="server" Text="0" Width="1px"></asp:TextBox>


                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:CommandField ShowDeleteButton="True" />
                            </Columns>
                            <FooterStyle BackColor="#CCCCCC" />
                            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                            <AlternatingRowStyle BackColor="#CCCCCC" />
                            <SortedAscendingCellStyle BackColor="#F1F1F1" />
                            <SortedAscendingHeaderStyle BackColor="#808080" />
                            <SortedDescendingCellStyle BackColor="#CAC9C9" />
                            <SortedDescendingHeaderStyle BackColor="#383838" />
                        </asp:GridView>
                         <asp:Label ID="Label18" runat="server" Text="Total :"></asp:Label>&nbsp;
                        <asp:Label ID="lblTotal" runat="server" Text="0"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
                    </td>
                    <td>Last 5  Complaint remarks

                    </td>
                </tr>
                <tr height="30px">
                    <td align="left">&nbsp;</td>
                    <td align="left">&nbsp;</td>
                    <td align="right">
                       
                    </td>
                    <td align="center">
                        
                    </td>
                    <td align="left">&nbsp;</td>

                </tr>
            </table>
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="grvStudentDetails" EventName="RowCommand" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>

