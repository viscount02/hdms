<%@ page language="java" contentType="text/html" import="java.sql.*" %>
<%!
Connection conn;
Statement stmtselect;
ResultSet rsrecvou;
String vouno,voudt,sdname,loc,ct,st,recmode,refno,refdt,bank,amt;
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
 Receipt Voucher</font>
 
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
<td><font color="white">VoucherDate</td>
<td><font color="white">Sdname</td>
<td><font color="white">Locality</td>
<td><font color="white">City</td>
<td><font color="white">State</td>
<td><font color="white">ReceiptMode</td>
<td><font color="white">RefrenceNo</td>
<td><font color="white">ReferenceDate</td>
<td><font color="white">Bank</td>
<td><font color="white">Amount</td>
</tr>
<%
 doconnect();
 try{ 
  stmtselect=conn.createStatement();
  rsrecvou=stmtselect.executeQuery("select * from edms_tblrecvou");
  slno=1;
  while(rsrecvou.next()){
 vouno=rsrecvou.getString("voucherno");
 voudt=rsrecvou.getString("voucherdate");
 sdname=rsrecvou.getString("subdealername");
 loc=rsrecvou.getString("locality");
 ct=rsrecvou.getString("city");
 st=rsrecvou.getString("state");
 recmode=rsrecvou.getString("receiptmode");
 refno=rsrecvou.getString("refno");
 refdt=rsrecvou.getString("refdt");
 bank=rsrecvou.getString("bank");
 amt=rsrecvou.getString("amount");
 if(slno % 2 == 0)
	   out.println("<tr bgcolor=\"#ccddcc\">");
   else
	   out.println("</tr>");
 %>
 
 <td><%=slno%></td>
 <td><%=vouno%></td>
 <td><%=voudt%></td>
 <td><%=sdname%></td>
 <td><%=loc%></td>
 <td><%=ct%></td>
 <td><%=st%></td>
 <td><%=recmode%></td>
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