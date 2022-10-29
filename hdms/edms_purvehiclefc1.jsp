<%@ page language="java" import="java.sql.*" %>
<%!
Connection conn;
Statement stmtFillvc,stmtFillinvno,stmtFillArray;
ResultSet rsinvno,rsArray,rsvc;
String invno,vc;
String dates[],cmpns[],locs[],cts[],sts[],purchasetypes[],sls[],vcs[],vns[],colours[],prices[],qtys[],amts[],diss[],disamts[],gsts[],gstamts[],netamts[];
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
dates=new String[50];
cmpns=new String[50];
locs=new String[50];
cts=new String[50];
sts=new String[50];
purchasetypes=new String[50];
sls=new String[50];
vcs=new String[50];
vns=new String[50];
colours=new String[50];
prices=new String[50];
qtys=new String[50];
amts=new String[50];
diss=new String[50];
disamts=new String[50];
gsts=new String[50];
gstamts=new String[50];
netamts=new String[50];
doConnect();
	try{
		stmtFillArray=conn.createStatement();
		rsArray=stmtFillArray.executeQuery("select* from edms_tblpurvehicle");
		i=0;
		while(rsArray.next()){
			dates[i]=rsArray.getString("date");
			cmpns[i]=rsArray.getString("companyname");
			locs[i]=rsArray.getString("locality");
			cts[i]=rsArray.getString("city");
			sts[i]=rsArray.getString("state");
			purchasetypes[i]=rsArray.getString("purchasetype");
			sls[i]=rsArray.getString("slno");
			vcs[i]=rsArray.getString("vcode");
			vns[i]=rsArray.getString("vname");
			colours[i]=rsArray.getString("color");
			prices[i]=rsArray.getString("price");
			qtys[i]=rsArray.getString("quantity");
			amts[i]=rsArray.getString("amount");
			diss[i]=rsArray.getString("discount");
			disamts[i]=rsArray.getString("disamt");
			gsts[i]=rsArray.getString("gst");
			gstamts[i]=rsArray.getString("gstamt");
			netamts[i]=rsArray.getString("netamt");
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
function goBack()
{
window.location="edms_purvehiclec.jsp";
}
var jdates=new Array();
var jcmpns=new Array();
var jlocs=new Array();
var jcts=new Array();
var jsts=new Array();
var jpurchasetypes=new Array();
var jsls=new Array();
var jvcs=new Array();
var jvns=new Array();
var jcolours=new Array();
var jprices=new Array();
var jqtys=new Array();
var jamts=new Array();
var jdiss=new Array();
var jdisamts=new Array();
var jgsts=new Array();
var jgstamts=new Array();
var jnetamts=new Array();
var j,k;
function showDealerData(){
j=0;
<%
i=0;
while(i<dates.length){
%>
jdates[j]="<%=dates[i]%>";
jcmpns[j]="<%=cmpns[i]%>";
jlocs[j]="<%=locs[i]%>";
jcts[j]="<%=cts[i]%>";
jsts[j]="<%=sts[i]%>";
jpurchasetypes[j]="<%=purchasetypes[i]%>";
jsls[j]="<%=sls[i]%>";
jvcs[j]="<%=vcs[i]%>";
jvns[j]="<%=vns[i]%>";
jcolours[j]="<%=colours[i]%>";
jprices[j]="<%=prices[i]%>";
jqtys[j]="<%=qtys[i]%>";
jamts[j]="<%=amts[i]%>";
jdiss[j]="<%=diss[i]%>";
jdisamts[j]="<%=disamts[i]%>";
jgsts[j]="<%=gsts[i]%>";
jgstamts[j]="<%=gstamts[i]%>";
jnetamts[j]="<%=netamts[i]%>";
j=j+1;
<%
i=i+1;
}
%>
k=document.f1.cmbinvno.selectedIndex;
document.f1.txtDate.value=jdates[k-1];
document.f1.cmbcompno.value=jcmpns[k-1].trim();
document.f1.txtlocality.value=jlocs[k-1];
document.f1.txtcity.value=jcts[k-1];
document.f1.txtstate.value=jsts[k-1];
document.f1.cmbpurtype.value=jpurchasetypes[k-1].trim();
document.f1.txtsl.value=jsls[k-1];
document.f1.cmbvcode.value=jvcs[k-1].trim();
document.f1.txtvname.value=jvns[k-1];
document.f1.txtcolor.value=jcolours[k-1];
document.f1.txtprice.value=jprices[k-1];
document.f1.txtqty.value=jqtys[k-1];
document.f1.txtamt.value=jamts[k-1];
document.f1.txtdis.value=jdiss[k-1];
document.f1.txtdisamt.value=jdisamts[k-1];
document.f1.txtgst.value=jgsts[k-1];
document.f1.txtgstamt.value=jgstamts[k-1];
document.f1.txtnetamt.value=jnetamts[k-1];
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

<form name="f1" action="edms_purvehiclefs.jsp" method="get">
<center>
<table width="600" border="0" >
<tr>
<td><font class="head2">Invoice no:</font></td>
<td><select name="cmbinvno" class="ovalstyle"onChange="showDealerData()">
          <option value="null">-Select-</option>

	<%
	doConnect();
	try{
		stmtFillinvno=conn.createStatement();
		rsinvno=stmtFillinvno.executeQuery("select * from edms_tblpurvehicle");
		while(rsinvno.next()){
			invno=rsinvno.getString("invoiceno");
			%>
			<option value="<%=invno%>"><%=invno%></option>
			<%
		}
	}
	catch(SQLException se){
		System.out.println("Error"+se);
	}
	%>
	</select>
</td>
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
<td><select name="cmbvcode" class="ovalstyle" onChange="showDealerData()" >
  <option value="null">-Select-</option>
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
<input type="submit" name="btnUp" value="Update" class="ovalstyle" >
<input type="submit" name="btnDel" value="Delete" class="ovalstyle">
<input type="Button" name="btnback" value="Back" class="ovalstyle" onclick="goBack()">
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