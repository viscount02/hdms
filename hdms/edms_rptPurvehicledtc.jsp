<%@ page language="java" import="java.sql.*" %>
<%!
Connection conn;
Statement stmtFilldt,stmtFillArray;
ResultSet rsdt,rsArray;
String dt;
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
<html>
<head>
<title>e-HONDA-DMS</title>
<script language="javascript">
</script>
</head>

<body bgcolor="#FDF5E6">

<center>
<table width="100%" bgcolor="marroon"><tr><td height="60" align="middle">
<font color="white" size="6">e-HONDA-DMS</font></td></tr>
</table>
</center>

<center>
<font color="black" size="5" >Purchase Detail[Any Date]</font>
</center>
<br><br><br>
<form name="f1" action="edms_rptPurvehicledts.jsp" method="get">

<center>
<table width="400" border="0">
<tr>
<td>
<table width="400" border="0">
<tr>
<td><font class="head2">Date:
<select name="cmbdate" class="ovalstyle">
          <option value="null">-Select-</option>
		  <%
	doConnect();
	try{
		stmtFilldt=conn.createStatement();
		rsdt=stmtFilldt.executeQuery("select * from edms_tblpurvehicle");
		while(rsdt.next()){
			dt=rsdt.getString("date");
			%>
			<option value="<%=dt%>"><%=dt%></option>
			<%
		}
	}
	catch(SQLException se){
		System.out.println("Error"+se);
	}
	%>
	</select>
</td>
</tr>
</table>
</td>
</tr>
</table>
<br><br><br>
<center>
<input type="submit" name="btnShow" value="Show" class="ovalstyle" >
<input type="reset" name="btnReset" value="Reset">
</center>

<br>
<center><hr width="100%" height="2" color="marroon"></center>
<center>
<table width="100%" bgcolor="black">
<tr><td height="50" align="middle"><font color="white" size="4">&copy SATYAM HONDA-2020&nbsp;&nbsp;&nbsp;</font>
</td></tr></table>
</center>

</form>
</body>
</html>