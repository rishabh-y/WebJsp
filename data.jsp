<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page language="Java" import ="java.sql.*, java.util.*" %>

<!DOCTYPE html>
<html>
<head>
	<title>New Jsp1</title>
</head>
<body>
	<%
		String str="Welcome To JSP !";
		String user = request.getParameter("user");
		String pswd = request.getParameter("pswd");
		String db_name = request.getParameter("db_name");
		String tb_name = request.getParameter("tb_name");

	%>
	<h1><%=str%></h1>
	
	<hr>

	<%
	Connection con=null;
	try{
		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+db_name,user,pswd);
		if(con !=null){
		out.println("Connection Successfully Established!");
		}
		else{
			out.println("failed");
		}
	}
	catch(Exception e){
	out.println(e);
}
%>
<br>

<%
	Statement stmt = con.createStatement();
	ResultSet rs = stmt.executeQuery("SELECT * FROM "+tb_name);
	
%>
<table style="border: solid 2px black ">
	<%	
	ResultSetMetaData rsmd = (ResultSetMetaData)rs.getMetaData();
	int colCount = rsmd.getColumnCount();
	
%>	
	<!-- <th><%=rsmd.getColumnName(2)%></th>
	<%

	while(rs.next()){ %>

	<tr>
	<td style="border: solid 2px black "><%=rs.getString("NAME")%></td>
		</tr>
	<%}%>
</table> -->
<%
	ResultSet rs1= stmt.executeQuery("SELECT COUNT(*) rcount FROM "+tb_name);
	String rowCount="";
	// while(rs1.next())
	// 	rowCount = rs1.getString("rcount");
	
	// out.println(rowCount);
%>
<table>
<% while(rs.next()){ %>
	<tr>
		<%for(int i = 1; i<= colCount;i++){

		out.println(rs.getString(i));
	}%>
	</tr>
<%}%>
</table>
<%out.println(colCount);%>
	
<a href="index.html">Back</a>

</body>
</html>
