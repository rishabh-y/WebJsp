<%@ include file="conn.jsp"%>
<%@ page import="java.util.*"%>
<%@page import="org.json.simple.*"%>
<!DOCTYPE html>
<html>
<head>
  <title></title>

  <script src="https://www.gstatic.com/charts/loader.js"></script>
  
<script>
  var elm;
   google.charts.load('current', {packages: ['corechart']});
   google.charts.setOnLoadCallback(drawChart);
   function drawChart() {
      // Define the chart to be drawn.
      var data = new google.visualization.DataTable();
      data.addColumn('string', 'Element');
      data.addColumn('number', 'Percentage');
       <%
    HashMap<String , Integer > map = new HashMap<String , Integer>();
    String ele=null;
   
    stmt= con.createStatement();
    ResultSet set = stmt.executeQuery("select Name,January from "+ tb_name);
    ResultSetMetaData rsm = (ResultSetMetaData) set.getMetaData();
    while(set.next()){
    int at = Integer.parseInt(set.getString("January"));
    ele = set.getString("Name");
    map.put(ele,at);
}
%>
     
     <%for (String i : map.keySet()) {%>
          var el = "<%=i%>"; 
         data.addRow([el,<%out.print(map.get(i));%>]);
   <%}%>
     
      // Instantiate and draw the chart.
      var chart = new google.visualization.ColumnChart(document.getElementById('myColumnChart'));
       var options ={
     
        title:'Attendance'
      
    };
      chart.draw(data, options);
    }
   
   
 
     
</script>
</head>
<body>
  <h1 id="pt"><%=rsm.getColumnLabel(2)%></h1>
<!--   <p ><%=map%></p>
 -->  
  <div id="myColumnChart" style="width:800px;height: 400px"></div>
</body>
</html>