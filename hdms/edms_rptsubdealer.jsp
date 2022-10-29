<%@ page language="java" contentType="text/html" import="java.sql.*" %>
<%!
Connection conn;
Statement stmtselect;
ResultSet rsSdealer;
String sdcode,sdname,pn,cp,loc,ct,st,gst,ph,fx,eml,web,uid,pass;
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
 Sub-Dealer Information</font>
 
</td></tr></table></center>
<br>
<blockquote>
 <font color="blue" size="5"><b>Satyam Honda</b></font><br>
<font color="blue" size="4">Buxibazar<br>
Cuttack-753001<br>
</blockquote>
<center>

<table width="99%">
<tr bgcolor="darkblue" height="30">
<td/nowrap><font color="white">Sl No.</td>
<td><font color="white">SdCode</td>
<td><font color="white">Sdame</td>
<td><font color="white">propName</td>
<td><font color="white">Cont.person</td>
<td><font color="white">Locality</td>
<td><font color="white">City</td>
<td><font color="white">State</td>
<td><font color="white">G.S.T.%</td>
<td><font color="white">PhoneNo</td>
<td><font color="white">FaxNo</td>
<td><font color="white">EmailId</td>
<td><font color="white">Website</td>
<td><font color="white">Userid</td>
<td><font color="white">Password</td>
</tr>
<%
 doconnect();
 try{ 
  stmtselect=conn.createStatement();
  rsSdealer=stmtselect.executeQuery("select * from edms_tblsubdealer");
  slno=1;
  while(rsSdealer.next()){
  sdcode=rsSdealer.getString("sdcode");
 sdname=rsSdealer.getString("sdname");
 pn=rsSdealer.getString("pname");
 cp=rsSdealer.getString("cperson");
 loc=rsSdealer.getString("locality");
 ct=rsSdealer.getString("city");
 st=rsSdealer.getString("state");
 gst=rsSdealer.getString("gstno");
 ph=rsSdealer.getString("phone");
 fx=rsSdealer.getString("faxno");
 eml=rsSdealer.getString("emailid");
 web=rsSdealer.getString("website");
 uid=rsSdealer.getString("userid");
 pass=rsSdealer.getString("password");
 if(slno % 2 == 0)
	   out.println("<tr bgcolor=\"#ccddcc\">");
   else
	   out.println("</tr>");
 %>
 
 <td><%=slno%></td>
 <td><%=sdcode%></td>
 <td><%=sdname%></td>
 <td><%=pn%></td>
 <td><%=cp%></td>
 <td><%=loc%></td>
 <td><%=ct%></td>
 <td><%=st%></td>
 <td><%=gst%></td>
 <td><%=ph%></td>
 <td><%=fx%></td>
 <td><%=eml%></td>
 <td><%=web%></td>
 <td><%=uid%></td>
 <td><%=pass%></td>
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