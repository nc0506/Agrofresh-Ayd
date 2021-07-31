<%@ Page Title="" Language="C#" MasterPageFile="~/MainPage.master" AutoEventWireup="true"
    CodeFile="RateMaster.aspx.cs" Inherits="ProductType" %>
 
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table style="width: 1016px; margin-right: 506px">
        <tr>
            <td class="style2" colspan="2">
                <strong>Add&nbsp; Rate&nbsp; </strong>
            </td>
            <td>
                &nbsp;
            </td>
            <td class="style1">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td class="style2" colspan="2">
                <asp:Label ID="lblID" runat="server" Text="Label"></asp:Label>
            </td>
            <td>
                &nbsp;
            </td>
            <td class="style1">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td class="style2">
                Product Type:
            </td>
            <td valign="left">
                <asp:DropDownList ID="ddlproducttype" runat="server" Height="21px" Width="363px"
                    AutoPostBack="True" OnSelectedIndexChanged="ddlproducttype_SelectedIndexChanged">
                </asp:DropDownList>
            </td>
            <td>
                &nbsp;
            </td>
            <td class="style1">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td class="style2">
                Product :
            </td>
            <td valign="left">
                <asp:DropDownList ID="ddlproduct" runat="server" Height="26px" Width="363px">
                </asp:DropDownList>
            </td>
            <td>
                &nbsp;
            </td>
            <td class="style1">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td class="style2">
                Rate:
            </td>
           <td valign="left">
                <asp:TextBox ID="Textrate" runat="server" Height="23px" Width="354px"></asp:TextBox>
            </td>
            <td>
                &nbsp;
            </td>
            <td class="style1">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td class="style2">
                Type:
            </td>
           <td valign="left">
                <asp:TextBox ID="Texttype" runat="server" Width="355px"></asp:TextBox>
            </td>
            <td>
                &nbsp;
            </td>
            <td class="style1">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td class="style2">
                Quantity:
            </td>
            <td valign="left">
                <asp:TextBox ID="TextQuantity" runat="server" Width="354px"></asp:TextBox>
            </td>
            <td>
                &nbsp;
            </td>
            <td class="style1">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;
            </td>
            <td valign="left">
                <asp:Button ID="btnsubmit" runat="server" Text="SUBMIT" Width="123px" OnClick="btnsubmit_Click" />
                &nbsp;
                <asp:Button ID="Btnupdate" runat="server" Text="UPDATE" Width="77px" OnClick="Btnupdate_Click" />
            &nbsp;<asp:Label ID="lblrate" runat="server" Text="Label"></asp:Label>
                <asp:Label ID="lblrateperquantity" runat="server" Text="Label"></asp:Label>
            </td>
            <td>
                &nbsp;
            </td>
            <td class="style1">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;
            </td>
            <td>
                &nbsp;
            </td>
            <td>
                &nbsp;
            </td>
            <td class="style1">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;
            </td>
            <td>
                <asp:GridView ID="Gridproduct" runat="server" AutoGenerateColumns="False" BackColor="#CCCCCC"
                    BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" 
                    CellPadding="4" CellSpacing="2"
                    OnPageIndexChanging="Gridproduct_PageIndexChanging" 
                    OnRowCommand="Gridproduct_RowCommand" PageSize="5" ForeColor="Black">
                    <Columns>
                        <asp:TemplateField HeaderStyle-HorizontalAlign="Left" HeaderText="Edit" ItemStyle-Width="25px">
                            <ItemTemplate>
                                <asp:ImageButton ID="imgsel" runat="server" CausesValidation="false" CommandArgument='<%# Eval("RATEID")%>'
                                    CommandName="selectLead" ImageUrl="~/img/pencil.png" ToolTip="Select" />
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Left" />
                            <ItemStyle Width="25px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderStyle-HorizontalAlign="Left" HeaderText="ID" ItemStyle-HorizontalAlign="Left">
                            <ItemTemplate>
                                <%#Eval("RATEID")%>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Left" Width="100px" />
                            <ItemStyle HorizontalAlign="Left" Width="100px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderStyle-HorizontalAlign="Left" HeaderText="Product Type" ItemStyle-HorizontalAlign="Left">
                            <ItemTemplate>
                                <%#Eval("ProductType")%>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Left" Width="100px" />
                            <ItemStyle HorizontalAlign="Left" Width="100px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderStyle-HorizontalAlign="Left" HeaderText="Product" ItemStyle-HorizontalAlign="Left">
                            <ItemTemplate>
                                <%#Eval("ProductName")%>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Left" Width="100px" />
                            <ItemStyle HorizontalAlign="Left" Width="100px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderStyle-HorizontalAlign="Left" HeaderText="Rate" ItemStyle-HorizontalAlign="Left">
                            <ItemTemplate>
                                <%#Eval("Rate")%>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Left" Width="100px" />
                            <ItemStyle HorizontalAlign="Left" Width="100px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderStyle-HorizontalAlign="Left" HeaderText="Type" ItemStyle-HorizontalAlign="Left">
                            <ItemTemplate>
                                <%#Eval("UnitType")%>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Left" Width="100px" />
                            <ItemStyle HorizontalAlign="Left" Width="100px" />
                        </asp:TemplateField>
                        
                    </Columns>
                    <FooterStyle BackColor="#CCCCCC" />
                    <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
                    <RowStyle BackColor="White" />
                    <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#808080" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#383838" />
                </asp:GridView>
            </td>
            <td>
                &nbsp;
            </td>
            <td class="style1">
                &nbsp;
            </td>
        </tr>
    </table>
</asp:Content>
