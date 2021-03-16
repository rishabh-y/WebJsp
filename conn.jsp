<%@ page import="java.io.*,java.sql.*" session="true" %>
<%
		//String user = request.getParameter("user");
		//String pswd = request.getParameter("pswd");
		//String db_name = request.getParameter("db_name");
		//String tb_name = request.getParameter("tb_name");
		String db_name = "demo";
		String tb_name = "Attendance";
		String user="guest";
		String pswd = "test";
		
		Connection con=null;
		Statement stmt=null;
		try{
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+db_name,user,pswd);
			  // DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());
			   //con = DriverManager.getConnection("jdbc:oracle:thin:@10.145.1.235:1522:rundb1","TRG2","trg123");


			if(con!= null){
				out.println("Connection Successful");
			}
			else{
				out.println("Connection Failed");
			}
	
		}
		catch(Exception e){
			out.println(e);
		}
%>