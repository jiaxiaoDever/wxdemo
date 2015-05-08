<!DOCTYPE html>
<%@page import="org.apache.tomcat.util.buf.Utf8Encoder"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="org.stan.yxgz.dbc.DBConn"%>    
<%@ page import="java.util.List" %> 
<%@ page import="java.sql.Connection" %>
<%@ page import="org.stan.yxgz.dao.*,org.stan.yxgz.daoimpl.*" %>
<%@ page import="java.util.List,java.util.ArrayList" %>
   
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>业务到达房间情况</title>
<style> 
div
{
text-align:center;
font-size:24px;
border:2px solid #a1a1a1;
padding:10px 40px; 
background:#dddddd;
border-radius:25px;
-moz-border-radius:25px;
}

</style>

</head>
<body>
<%  
	int sum = 0;
	int guhua = 0;
	int kuandai = 0;
	int iptv = 0; 
	String id = request.getParameter("id");
	String house = request.getParameter("house");
	//house = new String(house.getBytes("ISO-8859-1"),"UTF-8");

	String sql = "select distinct b from sz"+id+" order by b desc";
	Connection connection = DBConn.getConnection();
	ResultSet resultSet = null;
	PreparedStatement preparedStatement = null;
	try {
		preparedStatement = connection.prepareStatement(sql);
		//preparedStatement.setString(1, "光大花园");
		resultSet = preparedStatement.executeQuery();
		resultSet.next();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
%>

<h2 align="center"><%=house %> 小区分布情况</h2>
<% while(resultSet.next()){
	%>		
	<div align="center"><a href="http://stan120.duapp.com/cs.jsp?id=<%=id %>&house=<%=house %>&bb=<%=resultSet.getString(1)%>"><%=resultSet.getString(1) %></a></div>

<% }%>

<%   
	if(resultSet != null){
	resultSet.close();	
	}
	if(preparedStatement != null){
	preparedStatement.close();	
	}
	if(connection != null){
	connection.close();
	}
 %>
</body>
</html>