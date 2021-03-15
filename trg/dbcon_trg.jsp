<%@  page import="java.sql.*"%> 
<%@  page import="oracle.jdbc.driver.OracleDriver"%>

<%Connection conn = null;
try{
    DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());
	//Class.forName("oracle.jdbc.driver.OracleDriver");
    conn = DriverManager.getConnection("jdbc:oracle:thin:@10.145.1.235:1522:rundb1","TRG2","trg123");
}
catch(Exception e){
	out.println(e);
}

%> 


