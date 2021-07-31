<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>

<html>
<style>
form {
    border: 5px solid #4CAF50;
    width:30%;
    align-items:center;
    margin-left:30%;
    margin-top:5%;
}

input[type=text], input[type=password] {
    width: 40%;
    padding: 12px 20px;
    margin: 8px 0;
    display: inline-block;
    border: 1px solid #ccc;
    box-sizing: border-box;
}

button {
    background-color: #4CAF50;
    color: white;
    padding: 4px 0px;
    margin: 8px 0;
    border: none;
    cursor: pointer;
    width: 40%;
}

button:hover {
    opacity: 0.8;
}

.cancelbtn {
    width: auto;
    padding: 10px 18px;
    background-color: #f44336;
}

.imgcontainer {
    text-align: center;
    margin: 24px 0 12px 0;
}

img.avatar {
    width: 20%;
    border-radius: 20%;
}

.container {
    padding: 16px;
     text-align: center;
    margin: 24px 0 12px 0;
}

span.psw {
    float: right;
    padding-top: 16px;
}

/* Change styles for span and cancel button on extra small screens */
@media screen and (max-width: 300px) {
    span.psw {
       display: block;
       float: none;
    }
    .cancelbtn {
       width: 40%;
    }
}
</style>
<body>

 

<form id="from1" runat="server">
  <div class="imgcontainer">
    <img src="images/Awatar.jpeg" alt="Avatar" class="avatar" >
  </div>

  <div class="container">
    <label>
        <b>Username</b></label>
    
      <asp:TextBox ID="txtUserName" runat="server" placeholder="Enter Username" required></asp:TextBox>

      <br />
    <label><b>Password</b></label>
     <asp:TextBox ID="txtPassword" runat="server" placeholder="Enter password" required TextMode="Password"></asp:TextBox>
        </br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <asp:Button ID="btnLogin" runat="server" Text="Login"  type="submit" BackColor="#00CC66" ForeColor="White" Height="38px" Width="145px" OnClick="btnLogin_Click"/>
     
      <br />
     
    <input type="checkbox" checked="checked"> Remember me
  </div>

  <div class="container" style="background-color:#f1f1f1">
    <button type="button" class="cancelbtn">Cancel</button>
    &nbsp;&nbsp; <a href="#">Forgot password?</a>   &nbsp;&nbsp;<span class="psw"><a href="AddPerson.aspx">Sign IN</a></span> <br />
     * For New customer sign in OR call 90 29 29 00 22
       
  </div>
</form>
</body>
</html>
