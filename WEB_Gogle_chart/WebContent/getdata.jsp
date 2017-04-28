<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="org.json.JSONObject"%>

<%
	Connection con= null;
	String url = "jdbc:mysql://localhost:3306/book_ex";
	String uid = "user1";
	String pwd = "user1";
	String driver = "com.mysql.jdbc.Driver";
	try{
		Class.forName(driver).newInstance();
		con =
		DriverManager.getConnection(url,uid,pwd);
		
		ResultSet rs = null;
		List empdatails = new LinkedList();
		JSONObject responseObj = new JSONObject();
		String query = "SELECT id,name from employee";
		PreparedStatement pstm = con.prepareStatement(query);
		
		rs = pstm.executeQuery();
		JSONObject empObj = null;
		
		while(rs.next()) {
			String name = rs.getString("name");
			int empid = rs.getInt("id");
			empObj = new JSONObject();
			empObj.put("name", name);
			empObj.put("empid", empid);
			empdatails.add(empObj);
		}
		responseObj.put("empdetails", empdatails);
		out.print(responseObj.toString());
	}
		catch(Exception e){
			e.printStackTrace();
		}
%>