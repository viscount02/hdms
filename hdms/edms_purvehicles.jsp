<%@ page language="java" import="java.sql.*" contentType="text/html"%>
<html>
<head>
<title>e-HONDA-DMS</title>
</head>
<body>
<%!
 Connection conn;
 Statement stmtSave;
 String invno,dt,cn,loc,ct,st,pt,sl,vc,vn,col,price,qty,amt,dis,disamt,gst,gstamt,netamt;
 public void doConnect(){
 try{
  Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
  try{
    conn=DriverManager.getConnection("jdbc:odbc:LocalServer","sa","root");
	}
 catch(SQLException se){
  System.out.println("Unable to connect"+se);
 }
 }
 catch(ClassNotFoundException cnfe){
	 System.out.println("Unble to load driver");
 }
 }
 %>
 <%
  invno=request.getParameter("txtInvoiceno");
  dt=request.getParameter("txtDate");
  cn=request.getParameter("cmbcompno");
  loc=request.getParameter("txtlocality");
  ct=request.getParameter("txtcity");
  st=request.getParameter("txtstate");
  pt=request.getParameter("cmbpurtype");
  sl=request.getParameter("txtsl");
  vc=request.getParameter("cmbvcode");
  vn=request.getParameter("txtvname");
  col=request.getParameter("txtcolor");
  price=request.getParameter("txtprice");
  qty=request.getParameter("txtqty");
  amt=request.getParameter("txtamt");
  dis=request.getParameter("txtdis");
  disamt=request.getParameter("txtdisamt");	
  gst=request.getParameter("txtgst");
  gstamt=request.getParameter("txtgstamt");
  netamt=request.getParameter("txtnetamt");
  doConnect();
  try{   
	  stmtSave=conn.createStatement();
	  stmtSave.executeUpdate("insert into edms_tblpurvehicle values ('"+invno+"','"+dt+"','"+cn+"','"+loc+"','"+ct+"','"+st+"','"+pt+"','"+sl+"','"+vc+"','"+vn+"','"+col+"','"+price+"','"+qty+"','"+amt+"','"+dis+"','"+disamt+"','"+gst+"','"+gstamt+"','"+netamt+"')");
	  out.println("<script type='text/javaScript'>");
		out.println("alert("+"'Your data submited successfully..'"+");\n");
		out.println("setTimeout(function(){window.location.href='edms_purvehiclec.jsp'},100);");
		out.println("</script>\n");
  }
  catch(SQLException se){
	  out.println("Server Error.Try Again Later"+se);
  }
  %>
  </body>
  </html>