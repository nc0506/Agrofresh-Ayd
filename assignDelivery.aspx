<%@ Page Title="" Language="C#" MasterPageFile="~/MainPage.master" AutoEventWireup="true" CodeFile="assignDelivery.aspx.cs" Inherits="assignDelivery" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script type="text/javascript">
        $("[id*=chkHeader]").live("click", function () {
            var chkHeader = $(this);
            var grid = $(this).closest("table");
            $("input[type=checkbox]", grid).each(function () {
                if (chkHeader.is(":checked")) {
                    $(this).attr("checked", "checked");
                    $("td", $(this).closest("tr")).addClass("selected");
                } else {
                    $(this).removeAttr("checked");
                    $("td", $(this).closest("tr")).removeClass("selected");
                }
            });
        });
        $("[id*=chkRow]").live("click", function () {
            var grid = $(this).closest("table");
            var chkHeader = $("[id*=chkHeader]", grid);
            if (!$(this).is(":checked")) {
                $("td", $(this).closest("tr")).removeClass("selected");
                chkHeader.removeAttr("checked");
            } else {
                $("td", $(this).closest("tr")).addClass("selected");
                if ($("[id*=chkRow]", grid).length == $("[id*=chkRow]:checked", grid).length) {
                    chkHeader.attr("checked", "checked");
                }
            }
        });
    </script>
    <table width="100%">
        <tr height="20px" style="background-color: #CCCCCC" align="left" runat="server" id="trsearchlabel">
            <td colspan="5" style="font-size: 14px; font-weight: bold">Search </td>
        </tr>
        <tr>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
        </tr>
        <tr>

            <td width="150px">
                <asp:Label ID="Label1" runat="server" Text="Start Date"></asp:Label>
            </td>
            <td>
                <asp:Label ID="Label2" runat="server" Text="End Date"></asp:Label>
            </td>
            <td>
                <asp:Label ID="Label3" runat="server" Text="City"></asp:Label>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>


            <td width="220px">
                <asp:TextBox ID="txtStartDate" runat="server" Width="200px"></asp:TextBox>
                <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server"  Format="dd/MM/yyyy"
                    TargetControlID="txtStartDate">
                </ajaxToolkit:CalendarExtender>
            </td>
            <td width="220px">
                <asp:TextBox ID="txtEndDate" runat="server" Width="200px"></asp:TextBox>
                <ajaxToolkit:CalendarExtender ID="txtEndDate_CalendarExtender" runat="server"  Format="dd/MM/yyyy"
                    TargetControlID="txtEndDate">
                </ajaxToolkit:CalendarExtender>
                <br />
            </td>
            <td width="200px">
                <asp:DropDownList ID="ddlCity" runat="server" Width="190px">
                </asp:DropDownList>
            </td>
            <td>
                <asp:Button ID="btnSearch" runat="server" OnClick="btnSearch_Click"
                    Text="Search By Order Date" Width="128px" />
            &nbsp;
                <asp:Button ID="btnSearchdelivery" runat="server" OnClick="btnSearchdelivery_Click"
                    Text="Search By Delivery Date" Width="138px" />
            </td>
        </tr>
        <tr>
            <td></td>
            <td>
                <br />

            </td>
            <td>
                Delivery Date :<br />

            </td>
            <td></td>
        </tr>
        <tr>
            <td style="height: 28px"></td>
            <td align="right" style="height: 28px"></td>
            <td valign="Top" style="height: 28px">
                <asp:TextBox ID="txtDeliveryDate" runat="server" Width="200px"></asp:TextBox>
                <ajaxToolkit:CalendarExtender ID="txtEndDate0_CalendarExtender" runat="server"  Format="dd/MM/yyyy"
                    TargetControlID="txtDeliveryDate">
                </ajaxToolkit:CalendarExtender>
                </td>
            <td style="height: 28px">
                <asp:Button ID="btnAssign" runat="server"
                    Text="Assign Date" Width="100px" OnClick="btnAssign_Click" />
                <br />
            </td>
        </tr>

        <tr>
            <td>&nbsp;</td>
            <td align="right">&nbsp;</td>
            <td valign="Top">
                <asp:DropDownList ID="ddlDeliveryStatus" runat="server" Width="190px">
                    <asp:ListItem>select</asp:ListItem>
                    <asp:ListItem>Delivered</asp:ListItem>
                    <asp:ListItem>Not Delivered</asp:ListItem>
                </asp:DropDownList>
                </td>
            <td>
                <asp:Button ID="btnstatusupdate" runat="server"
                    Text="Update Status" Width="100px" OnClick="btnstatusupdate_Click" />
            </td>
        </tr>

        <tr>
            <td>&nbsp;</td>
            <td align="right">&nbsp;</td>
            <td valign="Top">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>

        <tr height="30px" runat="server" id="trsearchlabel4">
            <td align="left" colspan="5">
                <asp:GridView ID="gvCustomerList" runat="server"   AutoGenerateColumns="False" BackColor="White"
                    BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" DataKeyNames="ID" GridLines="Horizontal"
                    OnPageIndexChanging="gvCustomerList_PageIndexChanging" OnRowCommand="gvCustomerList_RowCommand" TabIndex="-1" Width="100%" ForeColor="Black">
                    <AlternatingRowStyle BackColor="#CCCCCC" />
                    <Columns>

                        <asp:TemplateField  HeaderStyle-HorizontalAlign="Left" HeaderText="Edit" ItemStyle-Width="25px">
                            <HeaderTemplate>
                                <asp:CheckBox ID="chkHeader" runat="server" />
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:CheckBox ID="chkRow" runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <%--<asp:TemplateField HeaderStyle-HorizontalAlign="Left" HeaderText="Edit" ItemStyle-Width="25px">
                            <ItemTemplate>
                                <asp:ImageButton ID="imgsel" runat="server" CausesValidation="false" CommandArgument="<%# Container.DataItemIndex %>" CommandName="selectLead" ImageUrl="~/images/pencil.png" ToolTip="Select" />
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Left" />
                            <ItemStyle Width="25px" />
                        </asp:TemplateField>--%>
                        <asp:TemplateField HeaderStyle-HorizontalAlign="Left" HeaderText="OrderID" ItemStyle-HorizontalAlign="Left">
                            <ItemTemplate>
                                <asp:Label ID="OrderID" runat="server" Text='<%#Eval("OrderID")%>'></asp:Label>
                                <asp:HiddenField ID="hdnID" Value='<%#Eval("ID")%>' runat="server" />
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Left" Width="100px" />
                            <ItemStyle HorizontalAlign="Left" Width="100px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderStyle-HorizontalAlign="Left" HeaderText="Customer Name" ItemStyle-HorizontalAlign="Left">
                            <ItemTemplate>
                                <asp:Label ID="FirstName" runat="server" Text='<%#Eval("Name")%>'></asp:Label>

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

                        <asp:TemplateField HeaderStyle-HorizontalAlign="Left" HeaderText="Total Amount" ItemStyle-HorizontalAlign="Left">
                            <ItemTemplate>
                                <asp:Label ID="TotalAmount" runat="server" Text='<%#Eval("TotalAmount")%>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Left" Width="100px" />
                            <ItemStyle HorizontalAlign="Left" Width="100px" />
                        </asp:TemplateField>

                        <asp:TemplateField HeaderStyle-HorizontalAlign="Left" HeaderText="DeliveryDate" ItemStyle-HorizontalAlign="Left">
                            <ItemTemplate>
                                <asp:Label ID="DeliveryDate" runat="server" Text='<%#Eval("DeliveryDate")%>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Left" Width="100px" />
                            <ItemStyle HorizontalAlign="Left" Width="100px" />
                        </asp:TemplateField>

                         <asp:TemplateField HeaderStyle-HorizontalAlign="Left" HeaderText="DeliveryStatus" ItemStyle-HorizontalAlign="Left">
                            <ItemTemplate>
                                <asp:Label ID="DeliveryStatus" runat="server" Text='<%#Eval("DeliveryStatus")%>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Left" Width="100px" />
                            <ItemStyle HorizontalAlign="Left" Width="100px" />
                        </asp:TemplateField>

                        <asp:TemplateField HeaderStyle-HorizontalAlign="Left" HeaderText="Ordered Date" ItemStyle-HorizontalAlign="Left">
                            <ItemTemplate>
                                <asp:Label ID="OrderDate" runat="server" Text='<%#Eval("OrderDate")%>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Left" Width="100px" />
                            <ItemStyle HorizontalAlign="Left" Width="100px" />
                        </asp:TemplateField>


                        <asp:TemplateField HeaderStyle-HorizontalAlign="Left" HeaderText="City" ItemStyle-HorizontalAlign="Left">
                            <ItemTemplate>
                                <asp:Label ID="Ship_City" runat="server" Text='<%#Eval("Ship_City")%>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Left" Width="100px" />
                            <ItemStyle HorizontalAlign="Left" Width="100px" />
                        </asp:TemplateField>

                       <%-- <asp:TemplateField HeaderStyle-HorizontalAlign="Left" HeaderText="Select" ItemStyle-HorizontalAlign="Left">
                            <ItemTemplate>
                                <asp:CheckBox ID="chkSelect" runat="server" />
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Left" Width="100px" />
                            <ItemStyle HorizontalAlign="Left" Width="100px" />
                        </asp:TemplateField>--%>

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



        <tr height="30px">
            <td align="left">&nbsp;</td>
            <td align="left">&nbsp;</td>
            <td align="left">&nbsp;</td>
            <td align="left">&nbsp;</td>
            <td align="left">&nbsp;</td>

        </tr>
    </table>
</asp:Content>

