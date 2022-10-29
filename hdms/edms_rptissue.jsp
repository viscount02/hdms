<%@ page language="java" contentType="text/html" import="java.sql.*" %>
<%!
Connection conn;
Statement stmtselect;
ResultSet rsissue;
String invno,invdt,sdname,loc,ct,st,invt,sl,vcode,vname,col,pri,qty,amt,dis,disamt,gst,gstamt,netamt;
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
 Issue To Sub-Dealer</font>
 
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
<td><font color="white">Invoiceno</td>
<td><font color="white">InvoiceDate</td>
<td><font color="white">SdName</td>
<td><font color="white">Locality</td>
<td><font color="white">City</td>
<td><font color="white">State</td>
<td><font color="white">Invoicetype</td>
<td><font color="white">SL#</td>
<td><font color="white">Vcode</td>
<td><font color="white">Vname</td>
<td><font color="white">Color</td>
<td><font color="white">Price</td>
<td><font color="white">Qty</td>
<td><font color="white">Amount</td>
<td><font color="white">Discount%</td>
<td><font color="white">Discountamt</td>
<td><font color="white">G.S.T.%</td>
<td><font color="white">GstAmt</td>
<td><font color="white">NetAmt</td>
</tr>
<%
 doconnect();
 try{ 
  stmtselect=conn.createStatement();
  rsissue=stmtselect.executeQuery("select * from edms_tblissue");
  slno=1;
  while(rsissue.next()){
  invno=rsissue.getString("invoiceno");
  invdt=rsissue.getString("invoicedate");
 sdname=rsissue.getString("subdealername");
 loc=rsissue.getString("locality");
 ct=rsissue.getString("city");
 st=rsissue.getString("state");
 invt=rsissue.getString("invoicetype");
 sl=rsissue.getString("sl");
 vcode=rsissue.getString("vcode");
 vname=rsissue.getString("vname");
 col=rsissue.getString("color");
 pri=rsissue.getString("price");
 qty=rsissue.getString("quantity");
 amt=rsissue.getString("amount");
 dis=rsissue.getString("discount");
 disamt=rsissue.getString("disamt");
 gst=rsissue.getString("gst");
 gstamt=rsissue.getString("gstamt");
 netamt=rsissue.getString("netamt");
 if(slno % 2 == 0)
	   out.println("<tr bgcolor=\"#ccddcc\">");
   else
	   out.println("</tr>");
 %>
 <td><%=slno%></td>
 <td><%=invno%></td>
 <td><%=invdt%></td>
 <td><%=sdname%></td>
 <td><%=loc%></td>
 <td><%=ct%></td>
 <td><%=st%></td>
 <td><%=invt%></td>
 <td><%=sl%></td>
 <td><%=vcode%></td>
 <td><%=vname%></td>
 <td><%=col%></td>
 <td><%=pri%></td>
 <td><%=qty%></td>
 <td><%=amt%></td>
 <td><%=dis%></td>
 <td><%=disamt%></td>
 <td><%=gst%></td>
 <td><%=gstamt%></td>
 <td><%=netamt%></td>
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