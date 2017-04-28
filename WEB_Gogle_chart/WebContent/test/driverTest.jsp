<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
	Connection con = null;
	try{
		String url = "jdbc:mysql://localhost:3306/book_ex";
		String uid = "user1";
		String pwd = "user1";
		String driver="com.mysql.jdbc.Driver";
		Class.forName(driver);
		con=DriverManager.getConnection(url,uid,pwd);
			out.println("재대로 연결되었습니다");
	} catch(Exception e){
		e.printStackTrace();
		out.println("연결에 실패하였습니다.");
	}
	
%>