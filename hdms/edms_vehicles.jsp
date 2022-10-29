<%@ page language="java" import="java.sql.*" contentType="text/html"%>
<html>
<head>
<title>e-HONDA-DMS</title>
</head>
<body>
<%!
Connection conn;
Statement stmtSave;
String vc,vn,cc,fc,col,pp,sp,ts,os,ms,img;
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
  vc=request.getParameter("txtVcode");
  vn=request.getParameter("txtVname");
  cc=request.getParameter("txtCcapacity");
  fc=request.getParameter("txtFcapacity");
  col=request.getParameter("cmbcolour");
  pp=request.getParameter("txtPprice");
  sp=request.getParameter("txtSprice");
  ts=request.getParameter("cmbTslab");
  os=request.getParameter("txtOstock");
  ms=request.getParameter("txtMstock");
  img=request.getParameter("fileImage");
  doConnect();
  try{   
	  stmtSave=conn.createStatement();
	  stmtSave.executeUpdate("insert into edms_tblvehicle values ('"+vc+"','"+vn+"','"+cc+"','"+fc+"','"+col+"','"+pp+"','"+sp+"','"+ts+"','"+os+"','"+ms+"','"+img+"')");
	  out.println("<script type='text/javaScript'>");
		out.println("alert("+"'Your data submited successfully..'"+");\n");
		out.println("setTimeout(function(){window.location.href='edms_vehiclec.jsp'},100);");
		out.println("</script>\n");
  }
  catch(SQLException se){
	  out.println("Server Error.Try Again Later");
  }
  %>
  </body>
  </html>