<%@ page language="java" import="java.sql.*" %>
<%!
Connection conn;
Statement stmtFillvc,stmtFillArray;
ResultSet rsvc,rsArray;
String vc;
String vns[],colours[],purchaseprices[],taxslabs[];
int i;
public void doConnect(){
	try{
		Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	try{
		conn=DriverManager.getConnection("jdbc:odbc:Localserver","sa","root");
	}
	catch(SQLException se){
		System.out.println("Unable to connect");
	}
	}
	catch(ClassNotFoundException cnfe){
		System.out.println("Unable to load driver");	
	}
}
%>
<% 
vns=new String[50];
colours=new String[50];
purchaseprices=new String[50];
taxslabs=new String[50];
doConnect();
	try{
		stmtFillArray=conn.createStatement();
		rsArray=stmtFillArray.executeQuery("select* from edms_tblvehicle");
		i=0;
		while(rsArray.next()){
			vns[i]=rsArray.getString("vname");
			colours[i]=rsArray.getString("colour");
			purchaseprices[i]=rsArray.getString("purprice");
			taxslabs[i]=rsArray.getString("taxslab");
	        i=i+1;
		}
	}
	catch(SQLException se){
		System.out.println("Error on Fill Array"+se);
	}
	%>
<html>
<head>
<title>e-HONDA-DMS</title>
<script language="javascript">
function goFind()
{
window.location="edms_purvehiclefc.jsp";
}
var jvns=new Array();
var jcolours=new Array();
var jpurchaseprices=new Array();
var jtaxslabs=new Array();
var j,k;
function showDealerData(){
j=0;
<%
i=0;
while(i<vns.length){
%>
jvns[j]="<%=vns[i]%>";
jcolours[j]="<%=colours[i]%>";
jpurchaseprices[j]="<%=purchaseprices[i]%>";
jtaxslabs[j]="<%=taxslabs[i]%>";
j=j+1;
<%
i=i+1;
}
%>
k=document.f1.cmbvcode.selectedIndex;
document.f1.txtvname.value=jvns[k-1];
document.f1.txtcolor.value=jcolours[k-1].trim();
document.f1.txtprice.value=jpurchaseprices[k-1];
document.f1.txtgst.value=jtaxslabs[k-1].trim();
}
function showAmt(){
	var price,qty,amt;
	price=parseFloat(document.f1.txtprice.value);
	qty=parseInt(document.f1.txtqty.value);
	amt=price*qty;
	document.f1.txtamt.value=amt;
}
function showNetAmt(){
	var disp,disamt,gstp,gstamt,netamt,txable;
	amt=parseFloat(document.f1.txtamt.value);
	disp=parseFloat(document.f1.txtdis.value);
	disamt=amt*disp/100;
	document.f1.txtdisamt.value=disamt;
	taxable=amt-disamt;
	gstp=parseFloat(document.f1.txtgst.value);
	gstamt=taxable*gstp/100;
	netamt=taxable+gstamt;
	document.f1.txtgstamt.value=gstamt;
	document.f1.txtnetamt.value=netamt;
}
</script>
</head>
<body bgcolor="#FDF5E6">

<center>
<table width="98%" bgcolor="marroon"><tr><td height="60" align="middle">
<font color="white" size="6">e-HONDA-DMS</font></td></tr>
</table>
</center>
<center>
<font color="black" size="5" >Purchase of vehicle</font>
</center>

<form name="f1" action="edms_purvehicles.jsp" method="get">
<center>
<table width="600" border="0" >
<tr>
<td><font class="head2">Invoice no:</font></td>
<td><input type= "text" name="txtInvoiceno" title="Input your dealercode" class="ovalstyle"></font></td>
<td><font class="head2">Date:</font></td>
<td><input type="text" name="txtDate" class="ovalstyle"></font></td>
</tr>
<tr>
<td><font class="head2">Company Name :</font></td>
<td><select name="cmbcompno" class="ovalstyle">
<option value="null">-select-</option>
<option value="Honda Moto cop" onchange="showAddress()">Honda Moto Corp</option>
</select>
</td><br>
</tr> 
 
 <tr>
<td><font class="head2">Locality:</td>
<td><input type="text" name="txtlocality" value="Badambadi" class="ovalstyle" ></td>
</tr>

<tr>
<td><font class="head2">City:</td>
<td><input type="text" name="txtcity" autocomplete="on" value="Cuttack" class="ovalstyle" ></td>
</tr>

<tr>
<td><font class="head2">State:</td>
<td><input type="text" name="txtstate" value="Odisha" class="ovalstyle"></td>
</tr>

<tr>
<td><font class="head2">Purchase Type:</td>
<td><select name="cmbpurtype" class="ovalstyle">
 <option value="null">-select-</option>
 <option value="CREDIT">CREDIT</option>
 <option value="CASH">CASH</option>
 </select>
 </td><br>
</tr>
</table>
</center>
<center>
<table width="800" border="0">
<tr bgcolor="#ccddcc">
<td>SL#</td>
<td>V-Code</td>
<td>V-Name</td>
<td>Color</td>
<td>Price</td>
<td>Qty</td>
<td>Amount</td>
<td>Discount%</td>
<td>Discount Amt</td>
<td>GST%</td>
<td>GST Amt</td>
<td>Net Amt</td>
</tr>
<tr>
<td><input type="text" size="3" name="txtsl"></td>
<td><select name="cmbvcode"  class="ovalstyle" onChange="showDealerData()">
<option value="null">-select-</option>
	<%
	doConnect();
	try{
		stmtFillvc=conn.createStatement();
		rsvc=stmtFillvc.executeQuery("select * from edms_tblvehicle");
		while(rsvc.next()){
			vc=rsvc.getString("vcode");
			%>
			<option value="<%=vc%>"><%=vc%></option>
			<%
		}
	}
	catch(SQLException se){
		System.out.println("Error"+se);
	}
	%>
</select>
</td>
<td><input type="text" size="9" name="txtvname"></td>
<td><input type="text" size="9" name="txtcolor"></td>
<td><input type="text" size="9" name="txtprice"></td>
<td><input type="text" size="9" name="txtqty" onblur="showAmt()"></td>
<td><input type="text" size="9" name="txtamt"></td>
<td><input type="text" size="9" name="txtdis" onblur="showNetAmt()"></td>
<td><input type="text" size="9" name="txtdisamt"></td>
<td><input type="text" size="9" name="txtgst"></td>
<td><input type="text" size="9" name="txtgstamt"></td><br>
<td><input type="text" size="9" name="txtnetamt"></td>
</tr>
</table>
</center>
<br>


<center>
<input type="submit" name="btnSub" value="Submit" class="ovalstyle" >
<input type="button" name="btnFind" value="Find" class="ovalstyle" onclick="goFind()">
<input type="Reset" name="btnRes" value="Reset" class="ovalstyle" >
</center>

<br>
<center><hr width="98%" height="2" color="marroon"></center>
<center>
<table width="98%" bgcolor="black">
<tr><td height="50" align="middle"><font color="white" size="4">&copy SATYAM HONDA-2020&nbsp;&nbsp;&nbsp;</font>
</td></tr></table>
</center>
</form>
</body>
</html> 