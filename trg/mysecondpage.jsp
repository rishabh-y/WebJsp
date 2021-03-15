<%@ page  language = "java" import="java.sql.*,java.util.*,java.io.*" session="true" %>
<%@ include file = "dbcon_trg.jsp" %>

<html>
<head>
<title>first page title</title>

<style>
.h1 {
  background-color: blue;
  color: red;
font-size: 60px;
font-family:arial;
text-align: center;
}
.h2 {
  background-color: #CCFFFF;
  color: red;
text-align: center;
}
.h3 {
  background-color: #CCFFFF;
  color: red;
text-align: center;
}
</style>
</head>

<%
String emp_registered="";
String user_id = request.getParameter("user_id");
//out.println(user_id);
String password = request.getParameter("password");
//out.println(password);
try
   {


Statement stmt0 = conn.createStatement();
	ResultSet rs0 = stmt0.executeQuery("select count(*) ctr from trainee where user_id='"+user_id+"'"); 
   	  while ( rs0.next())  {                                                
       		 emp_registered = rs0.getString("ctr");
          
          }                                                
	rs0.close();

//out.println("emp_registered"+emp_registered);

if (emp_registered.equals("0")) {%>
<script>
alert("Invalid user id entered.");
window.history.go(-1);
</script>
<%}%>
<body  bgcolor="#CCFFFF">
<table width="900px" border=0 align="center">
<tr><td width="150px" ><img src="new_sail_logo.png" width="150px" height="165px" ></td><td width="600px" class="h1" >Bhilai Steel Plant</td><td width="150px" >&nbsp;</td></tr>
<tr><td colspan=3 class="h2" ><%=emp_registered%></td></tr>
</table>
</html>
<%
conn.close();
} 
catch	(SQLException e)
              {
               System.err.println("SQLException :"+e.getMessage());
              }

%>