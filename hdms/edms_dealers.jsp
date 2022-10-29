<%@ page language="java" import="java.sql.*" contentType="text/html"%>
<html>
<head>
<title>e-HONDA-DMS</title>
</head>
<body>
<%!
 Connection conn;
 Statement stmtSave;
 String dc,dn,cp,loc,ct,st,gst,ph,fx,mid,web;
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
  dc=request.getParameter("txtDcode");
  dn=request.getParameter("txtDname");
  cp=request.getParameter("txtConperson");
  loc=request.getParameter("txtlocality");
  ct=request.getParameter("txtcity");
  st=request.getParameter("cmbstate");
  gst=request.getParameter("txtGstno");
  ph=request.getParameter("telphoneno");
  fx=request.getParameter("txtfaxno");
  mid=request.getParameter("txtMid");
  web=request.getParameter("urlwebsite");
  doConnect();
  try{   
	  stmtSave=conn.createStatement();
	  stmtSave.executeUpdate("insert into edms_tbldealer values ('"+dc+"','"+dn+"','"+cp+"','"+loc+"','"+ct+"','"+st+"','"+gst+"','"+ph+"','"+fx+"','"+mid+"','"+web+"')");
	  out.println("<script type='text/javaScript'>");
		out.println("alert("+"'Your data submitted successfully..'"+");\n");
		out.println("setTimeout(function(){window.location.href='edms_dealerc.jsp'},100);");
		out.println("</script>\n");


  }
  catch(SQLException se){
	  out.println("Server Error.Try Again Later");
  }
  %>
  </body>
  </html>