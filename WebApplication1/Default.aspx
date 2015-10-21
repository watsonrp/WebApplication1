<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebApplication1.Default" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>

        <table border="1">
    <%
        var client = new Amazon.DynamoDBv2.AmazonDynamoDBClient(Amazon.RegionEndpoint.APSoutheast2);

 
        var tables = client.ListTables();

        Amazon.DynamoDBv2.Model.ScanRequest request = new Amazon.DynamoDBv2.Model.ScanRequest()
        {
            TableName = "DemoItems"
        };
        Amazon.DynamoDBv2.Model.ScanResponse items = client.Scan(request);

        for(var i = 0; i < items.Count; i++)
        {
            //items.Items[i].ElementAt(0).Value;
           Response.Write("<tr><td>"+items.Items[i].ElementAt(0).Value.S + "</td><td>" + items.Items[i].ElementAt(1).Value.S+"</td></tr>");
        }
    %>
            </table>
    </div>
        <hr />
        Item ID
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <br />
        Item Text
        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
        <br />
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Add Item" />
    </form>
</body>
</html>
