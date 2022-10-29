<%@ page language="java" import="java.sql.*" %>
<%!
Connection conn;
Statement stmtFillArray,stmtFillsd;
ResultSet rssd,rsArray;
String sd;
String locs[],cts[],sts[];;
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
locs=new String[50];
cts=new String[50];
sts=new String[50];
doConnect();
      try{
		stmtFillArray=conn.createStatement();
		rsArray=stmtFillArray.executeQuery("select* from edms_tblsubdealer");
		i=0;
		while(rsArray.next()){
			locs[i]=rsArray.getString("locality");
			cts[i]=rsArray.getString("city");
			sts[i]=rsArray.getString("state");
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
window.location="edms_recvoufc.jsp";
}
var jlocs=new Array();
var jcts=new Array();
var jsts=new Array();
var j,k;
function showSubDealerData(){
	j=0;
	<%
	i=0;
	while(i<locs.length){
	%>
	jlocs[j]="<%=locs[i]%>";
	jcts[j]="<%=cts[i]%>";
	jsts[j]="<%=sts[i]%>";
	j=j+1;
	<%
	i=i+1;
	}
	%>
k=document.f1.cmbsdname.selectedIndex;
document.f1.txtlocality.value=jlocs[k-1];
document.f1.txtcity.value=jcts[k-1];
document.f1.txtstate.value=jsts[k-1];
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
<font color="black" size="5">Receipt Voucher</font>
</center>
<form name="f1" action="edms_recvous.jsp" method="get">
<center>
<table width="600" border="0" >
<tr>
<td><font class="head2">Voucher No:</font></td>
<td><input type= "text" name="txtvouno"class="ovalstyle"></font></td>
<td><font class="head2">Voucher Date:</font></td>
<td><input type="text" name="txtdate" class="ovalstyle"></font></td>
</tr>

<tr>
<td><font class="head2">subdealer Name :</font></td>
<td><select name="cmbsdname" class="ovalstyle" onclick="showSubDealerData()">
<option value="null">-select-</option>
<%
	doConnect();
	try{
		stmtFillsd=conn.createStatement();
		rssd=stmtFillsd.executeQuery("select * from edms_tblsubdealer");
		while(rssd.next()){
			sd=rssd.getString("sdname");
			%>
			<option value="<%=sd%>"><%=sd%></option>
			<%
		}
	}
	catch(SQLException se){
		System.out.println("Error"+se);
	}
	%>
</select>
</td><br>
</tr>

<tr>
<td><font class="head2">Locality:</td>
<td><input type="text" name="txtlocality" class="ovalstyle" ></td>
</tr>

<tr>
<td><font class="head2">City:</td>
<td><input type="text" name="txtcity" autocomplete="on" class="ovalstyle" ></td>
</tr>

<tr>
<td><font class="head2">State/Union Territory:</td>
<td><input type="text" name="txtstate" class="ovalstyle" ></td>
</tr>

<tr>
<td><font class="head2">Receipt Mode:</td>
<td><select name="cmbrecmode" class="ovalstyle" >
<option value="null">-select-</option>
<option value="CASH">CASH</option>
<option value="CHEAQUE">CHEAQUE</option>
<option value="DRAFT">DRAFT</option>
<option value="ONLINE">ONLINE</option>
</select></td><br>
</tr>

<tr>
<td><font class="head2">Reference No:</font></td>
<td><input type= "text" name="txtrefno"class="ovalstyle"></font></td>
<td><font class="head2">Reference Date:</font></td>
<td><input type="text" name="txtrefdate" class="ovalstyle"></font></td>
</tr>

<tr>
<td><font class="head2">Bank:</td>
<td><select name="cmbbank" class="ovalstyle">
<option value="null">-select-</option>
<option value="ANDHRA BANK">ANDHRA BANK</option>
<option value="BANK OF BARODA">BANK OF BARODA</option>
<option value="CANADA BANK">CANADA BANK</option>
<option value="STATE BANK OF INDIA">STATE BANK OF INDIA</option>
<option value="INDIAN BANK">INDIAN BANK</option>
<option value="CENTRAL BANK OF INDIA">CENTRAL BANK OF INDIA</option>
<option value="UNION BANK OF INDIA">UNION BANK OF INDIA</option>
<option value="UCO BANK">UCO BANK</option>
</select></td></br>
</tr>

<tr>
<td><font class="head2">Amount:</td>
<td><input type="text" name="txtamt" class="ovalstyle"></td>
</tr>
</table>
</center>

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