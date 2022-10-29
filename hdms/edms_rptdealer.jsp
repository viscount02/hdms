<%@ page language="java" contentType="text/html" import="java.sql.*" %>
<%!
Connection conn;
Statement stmtselect;
ResultSet rsDealer;
String dcode,dname,cp,loc,ct,st,gst,ph,fx,eml,web;
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
 Dealer Profile</font>
 
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
<td><font color="white">DCode</td>
<td><font color="white">DName</td>
<td><font color="white">Cont.person</td>
<td><font color="white">Locality</td>
<td><font color="white">City</td>
<td><font color="white">State</td>
<td><font color="white">G.S.T.%</td>
<td><font color="white">PhoneNo</td>
<td><font color="white">FaxNo</td>
<td><font color="white">EmailId</td>
<td><font color="white">Website</td>
</tr>
<%
 doconnect();
 try{ 
  stmtselect=conn.createStatement();
  rsDealer=stmtselect.executeQuery("select * from edms_tbldealer");
  slno=1;
  while(rsDealer.next()){
  dcode=rsDealer.getString("dcode");
 dname=rsDealer.getString("dname");
 cp=rsDealer.getString("conper");
 loc=rsDealer.getString("locality");
 ct=rsDealer.getString("city");
 st=rsDealer.getString("state");
 gst=rsDealer.getString("gstno");
 ph=rsDealer.getString("phone");
 fx=rsDealer.getString("faxno");
 eml=rsDealer.getString("emailid");
 web=rsDealer.getString("website");
 if(slno % 2 == 0)
	   out.println("<tr bgcolor=\"#ccddcc\">");
   else
	   out.println("</tr>");
 %>
 
 <td><%=slno%></td>
 <td><%=dcode%></td>
 <td><%=dname%></td>
 <td><%=cp%></td>
 <td><%=loc%></td>
 <td><%=ct%></td>
 <td><%=st%></td>
 <td><%=gst%></td>
 <td><%=ph%></td>
 <td><%=fx%></td>
 <td><%=eml%></td>
 <td><%=web%></td>
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