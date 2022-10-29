<%@ page language="java" import="java.sql.*" contentType="text/html"%>
<html>
<head>
<title>e-HONDA-DMS</title>
</head>
<body>
<%!
 Connection conn;
 Statement stmtSave;
 String sdc,sdn,pn,cp,loc,ct,st,gst,ph,fx,mid,web,uid,pass;
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
  sdc=request.getParameter("txtSDcode");
  sdn=request.getParameter("txtSDname");
  pn=request.getParameter("txtPname");
  cp=request.getParameter("txtConperson");
  loc=request.getParameter("txtlocality");
  ct=request.getParameter("txtcity");
  st=request.getParameter("cmbstate");
  gst=request.getParameter("txtGstno");
  ph=request.getParameter("telphoneno");
  fx=request.getParameter("txtfaxno");
  mid=request.getParameter("txtMid");
  web=request.getParameter("urlwebsite");
  uid=request.getParameter("txtuid");
  pass=request.getParameter("txtpass");
  doConnect();
  try{   
	  stmtSave=conn.createStatement();
	  stmtSave.executeUpdate("insert into edms_tblsubdealer values ('"+sdc+"','"+sdn+"','"+pn+"','"+cp+"','"+loc+"','"+ct+"','"+st+"','"+gst+"','"+ph+"','"+fx+"','"+mid+"','"+web+"','"+uid+"','"+pass+"')");
	  out.println("<script type='text/javaScript'>");
		out.println("alert("+"'Your data saved successfully..'"+");\n");
		out.println("setTimeout(function(){window.location.href='edms_subdealerc.jsp'},100);");
		out.println("</script>\n");
  }
  catch(SQLException se){
	  out.println("Server Error.Try Again Later");
  }
  %>
  </body>
  </html>