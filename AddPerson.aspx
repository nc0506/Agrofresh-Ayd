<%@ Page Title="" Language="C#" MasterPageFile="~/MainPage.master" AutoEventWireup="true" CodeFile="AddPerson.aspx.cs" Inherits="AddPerson" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    &nbsp;<table width="100%">
        <tr height="20px" style="background-color: #CCCCCC" align="left">
            <td colspan="5" style="font-size: 14px; font-weight: bold">Personal Details</td>
        </tr>
        <tr>
            <td align="left">s
                First Name
                <asp:Label ID="Label1" runat="server" Text="*" ForeColor="#993300" /></td>
            <td align="left">Middle Name   </td>
            <td align="left">Last Name 
                <asp:Label ID="Label2" runat="server" Text="*" ForeColor="#993300" /></td>
            <td align="left">Mobile No.
                <asp:Label ID="Label3" runat="server" Text="*" ForeColor="#993300" />
            </td>
            <td align="left">Alternate Cont. No
                <asp:Label ID="Label4" runat="server" Text="*" ForeColor="#993300" /></td>

        </tr>
        <tr height="30px">
            <td align="left">
                <asp:TextBox ID="txtFname" runat="server" Width="220px" required></asp:TextBox></td>
            <td align="left">
                <asp:TextBox ID="txtMiddleName" runat="server" Width="220px"></asp:TextBox></td>
            <td align="left">
                <asp:TextBox ID="txtLastname" runat="server" Width="220px" required></asp:TextBox></td>
            <td align="left">
                <asp:TextBox ID="txtMobileNO" runat="server" Width="220px" required MaxLength="10" onkeypress="return isNumberKey(event)"></asp:TextBox></td>
            <td align="left">
                <asp:TextBox ID="txtAlternate" runat="server" Width="220px" required MaxLength="10" onkeypress="return isNumberKey(event)"></asp:TextBox></td>

        </tr>
        <tr>
            <td align="left">Email ID </td>
            <td align="left">Date Of Birth</td>
            <td align="left">Anniversary Date</td>
            <td align="left">
                <asp:HiddenField ID="hdnLoginID" runat="server" />
                <asp:Label ID="LoginID" runat="server" />
            </td>
            <td align="left">

                <asp:HiddenField ID="hdnLoginName" runat="server" />
                <asp:Label ID="LoginName" runat="server" />

            </td>

        </tr>
        <tr height="30px">
            <td align="left">
                <asp:TextBox ID="txtEmailID" runat="server" Width="220px"></asp:TextBox></td>
            <td align="left">
                <asp:TextBox ID="txtDOB" runat="server" Width="220px"></asp:TextBox>
                <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" Format="MM/dd/yyyy"
                    TargetControlID="txtDOB">
                </ajaxToolkit:CalendarExtender>

            </td>
            <td align="left">
                <asp:TextBox ID="txtannivdate" runat="server" Width="220px"></asp:TextBox>
                <ajaxToolkit:CalendarExtender ID="CalendarExtender2" runat="server" Format="MM/dd/yyyy"
                    TargetControlID="txtannivdate">
                </ajaxToolkit:CalendarExtender>

            </td>
            <td align="left">
                <asp:HiddenField ID="hdnRecogniseID" runat="server" />
                <asp:Label ID="RecogniseID" runat="server" />
            </td>
            <td align="left"></td>

        </tr>

        <tr height="20px" style="background-color: #CCCCCC" align="left">
            <td colspan="5" style="font-size: 14px; font-weight: bold">Current Address</td>
        </tr>

        <tr height="30px">
            <td align="left">Flat/Room No.
                <asp:Label ID="Label5" runat="server" Text="*" ForeColor="#993300" /></td>
            <td align="left">Floor No.
                <asp:Label ID="Label6" runat="server" Text="*" ForeColor="#993300" /></td>
            <td align="left">Building Name/Chawl Name
                <asp:Label ID="Label7" runat="server" Text="*" ForeColor="#993300" /></td>
            <td align="left">Area
                <asp:Label ID="Label8" runat="server" Text="*" ForeColor="#993300" /></td>
            <td align="left">Steet Name
                <asp:Label ID="Label9" runat="server" Text="*" ForeColor="#993300" /></td>

        </tr>
        <tr>
            <td align="left">
                <asp:TextBox ID="txtFlatno" runat="server" Width="220px" required></asp:TextBox></td>
            <td align="left">
                <asp:TextBox ID="txtFloorNo" runat="server" Width="220px" required></asp:TextBox></td>
            <td align="left">
                <asp:TextBox ID="txtBuildingName" runat="server" Width="220px" required></asp:TextBox></td>
            <td align="left">
                <asp:TextBox ID="txtArea" runat="server" Width="220px" required></asp:TextBox></td>
            <td align="left">
                <asp:TextBox ID="txtStreetroad" runat="server" Width="220px" required></asp:TextBox></td>

        </tr>
        <tr>
            <td align="left">Landmark 1
                <asp:Label ID="Label10" runat="server" Text="*" ForeColor="#993300" /></td>
            <td align="left">Landmark 1 </td>
            <td align="left">State
                <asp:Label ID="Label12" runat="server" Text="*" ForeColor="#993300" /></td>
            <td align="left">City
                <asp:Label ID="Label11" runat="server" Text="*" ForeColor="#993300" /></td>
            <td align="left">Pin Code
                <asp:Label ID="Label13" runat="server" Text="*" ForeColor="#993300" /></td>
            <td align="left"></td>

        </tr>
        <tr height="30px">
            <td align="left">
                <asp:TextBox ID="txtLandmark1" runat="server" Width="220px" required></asp:TextBox></td>
            <td align="left">
                <asp:TextBox ID="txtlandmark2" runat="server" Width="220px"></asp:TextBox>
            </td>
            <td align="left">
                <asp:DropDownList ID="ddlState" runat="server" Width="220px">
                    <asp:ListItem>Maharashtra</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td align="left">
                <asp:DropDownList ID="ddlcity" runat="server" Width="220px">
                    <asp:ListItem>Maharashtra</asp:ListItem>
                </asp:DropDownList></td>
            <td align="left">
                <asp:TextBox ID="txtPincode" runat="server" Width="220px" required MaxLength="6" onkeypress="return isNumberKey(event)"></asp:TextBox></td>

        </tr>

        <tr height="20px" style="background-color: #CCCCCC" align="left">
            <td colspan="5" style="font-size: 14px; font-weight: bold">Shipping Address&nbsp;(Same as above)
                <asp:CheckBox ID="chkCheckAll" runat="server" OnCheckedChanged="chkCheckAll_CheckedChanged" AutoPostBack="True" />
            </td>
        </tr>
        <tr height="30px">
            <td align="left">Flat/Room No.
                <asp:Label ID="Label14" runat="server" Text="*" ForeColor="#993300" /></td>
            <td align="left">Floor No.
                <asp:Label ID="Label15" runat="server" Text="*" ForeColor="#993300" /></td>
            <td align="left">Building Name/Chawl Name
                <asp:Label ID="Label16" runat="server" Text="*" ForeColor="#993300" /></td>
            <td align="left">Area
                <asp:Label ID="Label17" runat="server" Text="*" ForeColor="#993300" /></td>
            <td align="left">Steet Name
                <asp:Label ID="Label18" runat="server" Text="*" ForeColor="#993300" /></td>

        </tr>
        <tr>
            <td align="left">
                <asp:TextBox ID="txtFlatnoShip" runat="server" Width="220px" required></asp:TextBox></td>
            <td align="left">
                <asp:TextBox ID="txtFloorNoShip" runat="server" Width="220px" required></asp:TextBox></td>
            <td align="left">
                <asp:TextBox ID="txtBuildingNameShip" runat="server" Width="220px" required></asp:TextBox></td>
            <td align="left">
                <asp:TextBox ID="txtAreaShip" runat="server" Width="220px" required></asp:TextBox></td>
            <td align="left">
                <asp:TextBox ID="txtStreetroadShip" runat="server" Width="220px" required></asp:TextBox></td>

        </tr>
        <tr height="30px">
            <td align="left">Landmark 1
                <asp:Label ID="Label19" runat="server" Text="*" ForeColor="#993300" /></td>
            <td align="left">Landmark 2 </td>
            <td align="left">State
                <asp:Label ID="Label20" runat="server" Text="*" ForeColor="#993300" /></td>
            <td align="left">City
                <asp:Label ID="Label21" runat="server" Text="*" ForeColor="#993300" /></td>
            <td align="left">Pin Code
                <asp:Label ID="Label22" runat="server" Text="*" ForeColor="#993300" /></td>
            <td align="left"></td>

        </tr>
        <tr height="30px">
            <td align="left">
                <asp:TextBox ID="txtLandmark1ship" runat="server" Width="220px" required></asp:TextBox></td>
            <td align="left">
                <asp:TextBox ID="txtLandmark2ship" runat="server" Width="220px"></asp:TextBox>
            </td>
            <td align="left">
                <asp:DropDownList ID="ddlStateShip" runat="server" Width="220px" required>
                    <asp:ListItem>Maharashtra</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td align="left">
                 
                <asp:DropDownList ID="ddlCityShip" runat="server" required Width="220px">
                    <asp:ListItem></asp:ListItem>
                </asp:DropDownList>
            </td>
            <td align="left">
                <asp:TextBox ID="txtPincodeShip" runat="server" Width="220px" required MaxLength="6" onkeypress="return isNumberKey(event)"></asp:TextBox></td>

        </tr>

        <tr height="40px">
            <td align="left" colspan="5">
                <asp:CheckBox ID="CheckBox1" runat="server" Text="    &amp;nbsp;  I here by authorise Agro Fresh  to call &amp; send text messages to me " />
            </td>


        </tr>

        <tr height="40px">
            <td align="left"></td>

            <td align="left"></td>

            <td align="left">
                <asp:Button ID="btnSave" runat="server" Text="Save" Width="100px" OnClick="btnSave_Click" />
                &nbsp;
                <asp:Button ID="btnCancel" runat="server" Text="Cancel" Width="100px" />
            </td>
            <td align="left"></td>
            <td align="left"></td>


        </tr>

        <tr height="40px">
            <td align="left"></td>

            <td align="left"></td>

            <td align="left"></td>
            <td align="left"></td>
            <td align="left"></td>


        </tr>

    </table>
</asp:Content>

