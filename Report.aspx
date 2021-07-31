<%@ Page Title="" Language="C#" MasterPageFile="~/MainPage.master" AutoEventWireup="true" CodeFile="Report.aspx.cs" Inherits="Report" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <table width="100%">
        <tr>
            <td>&nbsp;</td>
            <td width="250px"></td>
            <td width="250px"></td>
            <td width="250px"></td>
            <td>&nbsp;</td>
            <td></td>
        </tr>
        <tr>
            
            <td width="150px">
                &nbsp;</td>
            
            <td width="150px">
                <asp:Label ID="Label1" runat="server" Text="Start Date"></asp:Label>
            </td>
            <td>
                <asp:Label ID="Label2" runat="server" Text="End Date"></asp:Label>
            </td>
            <td>Mode Of Payment</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            

            <td >
                &nbsp;</td>
            

            <td >
                <asp:TextBox ID="txtStartDate" runat="server" Width="200px"></asp:TextBox>
                <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" Format="dd/MM/yyyy"
                    TargetControlID="txtStartDate">
                </ajaxToolkit:CalendarExtender>
            </td>
            <td >
                <asp:TextBox ID="txtEndDate" runat="server" Width="200px"></asp:TextBox>
                <ajaxToolkit:CalendarExtender ID="txtEndDate_CalendarExtender" runat="server" Format="dd/MM/yyyy"
                    TargetControlID="txtEndDate">
                </ajaxToolkit:CalendarExtender>
                <br />
            </td>
            <td>
                <asp:DropDownList ID="ddlModeOfPayment" runat="server" Width="200px"></asp:DropDownList></td>
            <td>
                &nbsp;</td>
            <td></td>
        </tr>
        <tr>
            
            <td>
                &nbsp;</td>
            
            <td>
                <br />
                <asp:Button ID="btnSearch" runat="server" OnClick="btnSearch_Click"
                    Text="Export Unique Report" Width="199px" />
            </td>
            <td>
                <br />
                <asp:Button ID="btnDump" runat="server" OnClick="btnDump_Click"
                    Text="Export Dump Report" Width="201px" />
            </td>
            <td><br /><asp:Button ID="btnView" runat="server" OnClick="btnView_Click"
                    Text="View" Width="201px" /></td>
            <td>&nbsp;</td>
            <td></td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td></td>
            <td>
               
            </td>
            <td></td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td></td>
            <td></td>
            <td></td>
            <td>&nbsp;</td>
            <td></td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td colspan="5">

                <asp:GridView ID="gvReportList" runat="server"   AutoGenerateColumns="False" BackColor="White"
                            BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3"   GridLines="Horizontal"
                            TabIndex="-1" Width="100%" ForeColor="Black">
                            <AlternatingRowStyle BackColor="#CCCCCC" />
                            <Columns>
                                <asp:TemplateField HeaderText="Sr No" HeaderStyle-Width="50px" HeaderStyle-HorizontalAlign="Left">
                                    <ItemTemplate>
                                        <%# Container.DataItemIndex + 1 %>
                                    </ItemTemplate>
            
                                </asp:TemplateField>
                                <asp:TemplateField HeaderStyle-HorizontalAlign="Left" HeaderText="OrderID" ItemStyle-HorizontalAlign="Left">
                                    <ItemTemplate>
                                        <asp:Label ID="OrderID" runat="server" Text='<%#Eval("OrderID")%>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Left" Width="100px" />
                                    <ItemStyle HorizontalAlign="Left" Width="100px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderStyle-HorizontalAlign="Left" HeaderText="Customer Name" ItemStyle-HorizontalAlign="Left">
                                    <ItemTemplate>
                                        <asp:Label ID="FirstName" runat="server" Text='<%#Eval("FirstName")%>'></asp:Label>
                                        <asp:Label ID="Label3" runat="server" Text='<%#Eval("lastName")%>'></asp:Label>

                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Left" Width="150px" />
                                    <ItemStyle HorizontalAlign="Left" Width="150px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderStyle-HorizontalAlign="Left" HeaderText="OrderDate" ItemStyle-HorizontalAlign="Left">
                                    <ItemTemplate>
                                        <asp:Label ID="OrderDate" runat="server" Text='<%#Eval("OrderDate")%>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Left" Width="100px" />
                                    <ItemStyle HorizontalAlign="Left" Width="100px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderStyle-HorizontalAlign="Left" HeaderText="TotalAmount" ItemStyle-HorizontalAlign="Left">
                                    <ItemTemplate>
                                        <asp:Label ID="TotalAmount" runat="server" Text='<%#Eval("TotalAmount")%>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Left" Width="100px" />
                                    <ItemStyle HorizontalAlign="Left" Width="100px" />
                                </asp:TemplateField>
                                
                                <asp:TemplateField HeaderStyle-HorizontalAlign="Left" HeaderText="City" ItemStyle-HorizontalAlign="Left">
                                    <ItemTemplate>
                                        <asp:Label ID="Ship_City" runat="server" Text='<%#Eval("Ship_city")%>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Left" Width="100px" />
                                    <ItemStyle HorizontalAlign="Left" Width="100px" />
                                </asp:TemplateField>

                                
                                <asp:TemplateField HeaderStyle-HorizontalAlign="Left" HeaderText="Delivery Date" ItemStyle-HorizontalAlign="Left">
                                    <ItemTemplate>
                                        <asp:Label ID="DeliveryDate" runat="server" Text='<%#Eval("DeliveryDate")%>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Left" Width="80px" />
                                    <ItemStyle HorizontalAlign="Left" Width="80px" />
                                </asp:TemplateField>


                                <asp:TemplateField HeaderStyle-HorizontalAlign="Left" HeaderText="Ordered By" ItemStyle-HorizontalAlign="Left">
                                    <ItemTemplate>
                                        <asp:Label ID="OrderedBy" runat="server" Text='<%#Eval("Ordered By")%>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Left" Width="80px" />
                                    <ItemStyle HorizontalAlign="Left" Width="80px" />
                                </asp:TemplateField>
      
                                <asp:TemplateField HeaderStyle-HorizontalAlign="Left" HeaderText="DeliveryStatus" ItemStyle-HorizontalAlign="Left">
                                    <ItemTemplate>
                                          <asp:Label ID="DeliveryStatus" runat="server" Text='<%#Eval("DeliveryStatus")%>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Left" Width="80px" />
                                    <ItemStyle HorizontalAlign="Left" Width="80px" />
                                </asp:TemplateField>
                                 <asp:TemplateField HeaderStyle-HorizontalAlign="Left" HeaderText="MOP" ItemStyle-HorizontalAlign="Left">
                                    <ItemTemplate>
                                          <asp:Label ID="MOP" runat="server" Text='<%#Eval("MOP")%>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Left" Width="100px" />
                                    <ItemStyle HorizontalAlign="Left" Width="100px" />
                                </asp:TemplateField>
                                 <asp:TemplateField HeaderStyle-HorizontalAlign="Left" HeaderText="Amount Received/Pending" ItemStyle-HorizontalAlign="Left">
                                    <ItemTemplate>
                                          <asp:Label ID="AmountRP" runat="server" Text='<%#Eval("AmountRP")%>'></asp:Label>
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
        <tr>
            <td>&nbsp;</td>
            <td></td>
            <td></td>
            <td></td>
            <td>&nbsp;</td>
            <td></td>
        </tr>
    </table>

</asp:Content>

