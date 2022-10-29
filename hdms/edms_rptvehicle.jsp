<%@ page language="java" contentType="text/html" import="java.sql.*" %>
<%!
Connection conn;
Statement stmtselect;
ResultSet rsVehicle;
String vcode,vname,cbcp,fc,color,pp,sp,gstslab,os,vcl;
int slno;
public void doconnect(){
try{
Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
}
catch(ClassNotFoundException cnfe){
System.out.println("unable to Load Driver");
}
try{
conn=DriverManager.getConnection("jdbc:odbc:LocalServer","sa","root");
}
catch(SQLException se){
System.out.println("Unable to connect");
}
}
%>
<center>
<table width="99%"  border="0" >
<tr height="55">
<td align="center" bgcolor="darkblue">
<font color="white" size="5">
<sub>
 <img src="back.png" title="Go Back" width="100" height="35" align="left" onclick="window.close()">
 </sub>
 Vehicle Information</font>
 
</td></tr></table></center>
<br>
<blockquote>
<font color="blue" size="5" ><b>Satyam Honda</b></font><br>
<font color="blue" size="4">Buxibazar<br>
Cuttack-753001<br>
</blockquote>
<center>

<table width="99%">
<tr bgcolor="darkblue" height="30">
<td/nowrap><font color="white">Sl No.</td>
<td><font color="white">V.Code</td>
<td/nowrap><font color="white">Vehicle Name</td>
<td><font color="white">C.C.</td>
<td><font color="white">Fuel.Cap</td>
<td><font color="white">Color</td>
<td><font color="white">Pur.Price</td>
<td><font color="white">Sales.Price</td>
<td><font color="white">G.S.T.%</td>
<td><font color="white">Stock</td>
<td><font color="white">Image</td>
</tr>
<%
 doconnect();
 try{ 
  stmtselect=conn.createStatement();
  rsVehicle=stmtselect.executeQuery("select * from edms_tblvehicle");
  slno=1;
  while(rsVehicle.next()){
  vcode=rsVehicle.getString("vcode");
 vname=rsVehicle.getString("vname");
 cbcp=rsVehicle.getString("ccapacity");
 fc=rsVehicle.getString("fcapacity");
 color=rsVehicle.getString("colour");
 pp=rsVehicle.getString("purprice");
 sp=rsVehicle.getString("saleprice");
 gstslab=rsVehicle.getString("taxslab");
 os=rsVehicle.getString("openstock");
 vcl=rsVehicle.getString("image");
 if(slno % 2 == 0)
	   out.println("<tr bgcolor=\"#ccddcc\">");
   else
	   out.println("</tr>");
 %>
 
 <td><%=slno%></td>
 <td><%=vcode%></td>
 <td><%=vname%></td>
 <td><%=cbcp%></td>
 <td><%=fc%></td>
 <td><%=color%></td>
 <td><%=pp%></td>
 <td><%=sp%></td>
 <td><%=gstslab%></td>
 <td><%=os%></td>
 <td align="center"><img src=<%=vcl%> width="100" height="80" align="center"></td>
 </tr>
 <%
 slno=slno+1;
 }   // while ends
 }   // try ends
 catch(SQLException se){
 out.println("Unable to show Data"+se);
 }
 %>
 </table>
 </center>
 </body>
 </html>
 
 
 
 
 
 
 


