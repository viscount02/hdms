<%@ page language="java" contentType="text/html" import="java.sql.*" %>
<%!
Connection conn;
Statement stmtselect;
ResultSet rspmtvou;
String vouno,dt,cmpn,loc,ct,st,pmtmode,refno,refdt,bank,amt;
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
 <img src="back.png" width="100" height="35" align="left" onclick="window.close()">
 </sub>
 Payemnt Voucher</font>
 
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
<td><font color="white">Voucherno</td>
<td><font color="white">Date</td>
<td><font color="white">CompanyName</td>
<td><font color="white">Locality</td>
<td><font color="white">City</td>
<td><font color="white">State</td>
<td><font color="white">PaymentMode</td>
<td><font color="white">RefrenceNo</td>
<td><font color="white">ReferenceDate</td>
<td><font color="white">Bank</td>
<td><font color="white">Amount</td>
</tr>
<%
 doconnect();
 try{ 
  stmtselect=conn.createStatement();
  rspmtvou=stmtselect.executeQuery("select * from edms_tblpmtvou");
  slno=1;
  while(rspmtvou.next()){
 vouno=rspmtvou.getString("voucherno");
 dt=rspmtvou.getString("date");
 cmpn=rspmtvou.getString("companyname");
 loc=rspmtvou.getString("locality");
 ct=rspmtvou.getString("city");
 st=rspmtvou.getString("state");
 pmtmode=rspmtvou.getString("pmtmode");
 refno=rspmtvou.getString("refno");
 refdt=rspmtvou.getString("refdate");
 bank=rspmtvou.getString("bank");
 amt=rspmtvou.getString("amount");
 if(slno % 2 == 0)
	   out.println("<tr bgcolor=\"#ccddcc\">");
   else
	   out.println("</tr>");
 %>
 
 <td><%=slno%></td>
 <td><%=vouno%></td>
 <td><%=dt%></td>
 <td><%=cmpn%></td>
 <td><%=loc%></td>
 <td><%=ct%></td>
 <td><%=st%></td>
 <td><%=pmtmode%></td>
 <td><%=refno%></td>
 <td><%=refdt%></td>
 <td><%=bank%></td>
 <td><%=amt%></td>
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