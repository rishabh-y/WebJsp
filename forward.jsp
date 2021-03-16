<%@ page import="java.io.*,java.sql.*" session="true" %>
<!DOCTYPE html>
<html>
<head>
	<title>Jsp</title>
	<style type="text/css">
		body{
			background-color: #affafa;
		}
		table{
			border: solid 2px black;
			margin:100px auto;
			border-collapse: collapse;

		}
		td,th{
			border: solid 1px black;
			text-align: center;
			width: 100px;
			padding: 2px; 

		}
		td:hover{
			border: solid 2px black;
			font-weight: 900;
			background-color:yellow; 
		}
		a{
			color:black;
			text-decoration: none;
		}
		h1{
			text-align: center;
			text-transform: uppercase;
		}
		
		button{
			width:100px;
			text-align: center;
			display: block;
			margin: auto;
			
			transition: font-size  0.5s;
		}
		button:hover{
			background-color: ;
			
			border: solid 1px black;
			border-radius: 5%;
			font-size: 1.2em;

		}

	</style>
</head>
<body>

	<%	
		String user = request.getParameter("user");
		String pswd = request.getParameter("pswd");
		String db_name = request.getParameter("db_name");
		String tb_name = request.getParameter("tb_name");
		Connection con=null;
		Statement stmt=null;
		try{
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+db_name,user,pswd);
			   // DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());
			   // con = DriverManager.getConnection("jdbc:oracle:thin:@10.145.1.235:1522:rundb1","TRG2","trg123");


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
		int i;

		
		 stmt = con.createStatement();
		 out.println(stmt);
		ResultSet rs = stmt.executeQuery("select * from "+tb_name);
		ResultSetMetaData rsmd = (ResultSetMetaData)rs.getMetaData();
		int colCount = rsmd.getColumnCount();%>
		<h1><%=tb_name%></h1>
		<table><tr>
		<% for(i=1 ; i<= colCount;i++){%>
			
				<th>
					<%=rsmd.getColumnLabel(i)%>
				</th>
			
		<%}	
		rs.close();%>
		</tr>
		<% ResultSet rs1 = stmt.executeQuery("Select * from "+tb_name); %>
		 
		 	<% while(rs1.next()){%>
		 <tr>
		 	<%for(i=1;i<=colCount; i++){%>
		 		<td><%= rs1.getString(i)%></td>
			<% }%>
		 </tr>

		<%} rs1.close();%>
		 </table>
		
		 	<button onclick="document.location='index.html'" >Back</button>
		 	<button onclick="document.location='graph.jsp'" >Show Graph</button>
		 	
		 
		
</body>
</html>