<!DOCTYPE html>
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

table
  {
  margin: auto;
  border-collapse:collapse;
 
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
	String bb = request.getParameter("bb");
	//house = new String(house.getBytes("ISO-8859-1"),"UTF-8");
	//bb = new String(bb.getBytes("ISO-8859-1"),"UTF-8");

	String sql = "select * from sz"+id+" where b=? order by c asc,d asc,e asc";
	Connection connection = DBConn.getConnection();
	ResultSet resultSet = null;
	PreparedStatement preparedStatement = null;
	try {
		preparedStatement = connection.prepareStatement(sql);
		preparedStatement.setString(1, bb);
		resultSet = preparedStatement.executeQuery();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}

/*     DGdaoImpl dImpl = new DGdaoImpl();
    List<DataDetail> list = new ArrayList<DataDetail>();
    list = dImpl.getdetail(id); 
    out.println("----"+list); */
%>
<table border="1" >
<tr>
<th colspan="12" align="center">业务到达情况表</th>
</tr>
<tr>
	<td>序列号</td>
	<td>建筑群名称</td>
	<td>建筑物名称</td>
	<td>单元</td>
	<td>层</td>
	<td>序号</td>
	<td>有无电信业务</td>
	<td>固话</td>
	<td>宽带</td>
	<td>IPTV</td>
	<td>带宽</td>
	<td>接入</td>
</tr>
<% while(resultSet.next()){
	sum++;
	if(resultSet.getString(7).equals("有")){
		guhua++;		
	}if(resultSet.getString(8).equals("有")){
		kuandai++;
	}if(resultSet.getString(9).equals("有")){		
		iptv++;
	}	
%>
<tr align="center">
	<td><%=sum %></td>
	<td><%=resultSet.getString(1)%></td>
	<td><%=resultSet.getString(2)%></td>
	<td><%=resultSet.getString(3)%></td>
	<td><%=resultSet.getString(4)%></td>
	<td><%=resultSet.getString(5)%></td>
	<td><%=resultSet.getString(6)%></td>
	<td><%=resultSet.getString(7)%></td>
	<td><%=resultSet.getString(8)%></td>
	<td><%=resultSet.getString(9)%></td>
	<td><%=resultSet.getString(10)%></td>
	<td><%=resultSet.getString(11)%></td>
</tr>
<% } %>  

<div ><a href="http://stan120.duapp.com/drawing.jsp?house=<%=house %>&sum=<%=sum %>&gh=<%=guhua %>&kd=<%=kuandai %>&tv=<%=iptv %>"><%="业务房间覆盖数 柱状图（点击查看）" %></a></div>
</table>

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