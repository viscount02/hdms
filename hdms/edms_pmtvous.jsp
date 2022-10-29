<%@ page language="java" import="java.sql.*" contentType="text/html"%>
<html>
<head>
<title>e-HONDA-DMS</title>
</head>
<body>
<%!
 Connection conn;
 Statement stmtSave;
 String vouno,dt,cmpna,loc,ct,st,pmt,refno,refdt,bank,amt;
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
  vouno=request.getParameter("txtvouno");
  dt=request.getParameter("txtdate");
  cmpna=request.getParameter("txtcmpna");
  loc=request.getParameter("txtlocality");
  ct=request.getParameter("txtcity");
  st=request.getParameter("cmbstate");
  pmt=request.getParameter("cmbpmtmode");
  refno=request.getParameter("txtrefno");
  refdt=request.getParameter("txtrefdate");
  bank=request.getParameter("cmbbank");
  amt=request.getParameter("txtamt");
  doConnect();
  try{   
	  stmtSave=conn.createStatement();
	  stmtSave.executeUpdate("insert into edms_tblpmtvou values ('"+vouno+"','"+dt+"','"+cmpna+"','"+loc+"','"+ct+"','"+st+"','"+pmt+"','"+refno+"','"+refdt+"','"+bank+"','"+amt+"')");
	  out.println("<script type='text/javaScript'>");
		out.println("alert("+"'Your data saved successfully..'"+");\n");
		out.println("setTimeout(function(){window.location.href='edms_pmtvouc.jsp'},100);");
		out.println("</script>\n");
  }
  catch(SQLException se){
	  out.println("Server Error.Try Again Later");
  }
  %>
  </body>
  </html>