<!DOCTYPE html>
<%@page import="java.text.NumberFormat"%>
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
<title>业务房间覆盖数 柱状图</title>
<script src="amcharts.js" type="text/javascript"></script>

<%  
	String house = request.getParameter("house");
	//house = new String(house.getBytes("ISO-8859-1"),"UTF-8");
	String aa = request.getParameter("sum");
	int sum = Integer.parseInt(aa);
	String bb = request.getParameter("gh");
	int gh = Integer.parseInt(bb);
	String cc = request.getParameter("kd");
	int kd = Integer.parseInt(cc);
	String dd = request.getParameter("tv");
	int tv = Integer.parseInt(dd);
	
	out.println("总房间数："+sum+"<br/>");
	out.println("固话产品房间数："+gh+"<br/>");
	out.println("宽带产品房间数："+kd+"<br/>");
	out.println("IPTV产品房间数："+tv+"<br/>");
%>

 
</head>
<body>
<h3 align="center"><%=house %> 业务房间覆盖数</h3>
    <div id="chartContainer" style="width: 800px; height: 400px;"></div>
    
    <script type="text/javascript">
    var chartData = [{ buss: "总房间数", num: <%=sum %> },
                { buss: "固话产品房间数", num: <%=gh %> },
                { buss: "宽带产品房间数", num: <%=kd %> },
                { buss: "IPTV产品房间数", num: <%=tv %> }]; 
    </script>
    
    <script type="text/javascript">
    
    var chart = new AmCharts.AmSerialChart();
    chart.dataProvider = chartData;
    chart.categoryField = "buss";
    chart.angle = 30;
    chart.depth3D = 15;
    
    var graph = new AmCharts.AmGraph();
    graph.valueField = "num";
    graph.type = "column";
    graph.lineAlpha = 0;
    graph.fillAlphas = 0.8;
    chart.addGraph(graph);
    
    chart.write("chartContainer");    
      
    </script>

</body>
</html>