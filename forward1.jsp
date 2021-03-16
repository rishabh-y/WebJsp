<%@ include file="conn.jsp"%>
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
			transition: background  0.3s; 

		}
		td:hover{
			border: solid 2px black;
			font-weight: 900;
			color: white;
			background-color:steelblue; 
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
			
			transition: background  0.5s;
		}
		button:hover{
			background-color:steelblue ;
			
			border: solid 1px black;
			border-radius: 5%;
			

		}
		.myButton2{
			display: inline-block;
			float: right;
		}

.myButton1{
			display: inline-block;
			float: left;
		}
		.newdiv{
			width: 500px;
			margin: auto;
		}
	</style>
</head>
<body>

	<%	
		
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
		 	<div class="newdiv">
		 		<button class="myButton1" onclick="document.location='newGraph.jsp'" >Pie Chart</button>
		 	<button class="myButton2" onclick="document.location='graph.jsp'" >Column Chart</button>
		 	</div>
		 	
		 	
		 
		
</body>
</html>