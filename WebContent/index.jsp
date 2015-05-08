<%@page import="java.net.URLEncoder"%>
<%@page import="org.apache.commons.lang.StringUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
p {color:blue}
body{
background:url(pra960640.jpg); 
background-position:center; 
background-repeat:no-repeat; }
.btn_menu{display:block;width:100%;height:116px;font-size:24px;line-height:58px;color:white;border:none;text-align:center;-moz-border-radius: 16px;-webkit-border-radius:16px;border-radius:16px;  background-color:#219fff;font-size:24px;}
</style>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0">
<meta name="viewport" content="width=device-width, initial-scale=1" />
<script type="text/javascript" src="/js/jquery-1.9.1.min.js"></script>
<link href="/css/base.css" rel="stylesheet" type="text/css" />
<title>资源中心</title>
</head>
<script type="text/javascript">

</script>

<body>

<%
request.setCharacterEncoding("UTF-8");
response.setCharacterEncoding("UTF-8");
String jsp=request.getRequestURI();
String menuSessionId=request.getParameter("menuSessionId");
HttpSession sessions=request.getSession();
String message="";
Object jsessionId=request.getSession().getAttribute("jsessionId");
System.out.println("menuSessionId:"+menuSessionId+"-------------"+"sessionId:"+sessions.getId()+"--userId:"+sessions.getAttribute("userId")+"----jsessionId"+jsessionId);
if(sessions.getId()==null ){  //||sessions.getId()!=menuSessionId
	message="网页已经失效，请重新访问.请获取新的图文消息重新进入.";
}else{
	Object userId=request.getSession().getAttribute("userId");
	
	Object username=request.getSession().getAttribute("username");
	String openId = request.getParameter("openId");
	String url=request.getParameter("url");
	if(StringUtils.isBlank(url)){
		url="tree";
	}
	if("".equals(userId) || userId==null ||sessions.getId()==null || jsessionId==null){
		request.setAttribute("redirectUrl", url);
		//response.sendRedirect("login/login.jsp?redirectUrl="+URLEncoder.encode(url,"UTF-8")+"&openId="+openId);
		request.getRequestDispatcher("login/login.jsp?redirectUrl="+URLEncoder.encode(url,"UTF-8")+"&openId="+openId).forward(request, response);
		
	}else{
		if(url.indexOf("?")>-1){
			if(url.indexOf("rptName")>-1){
				String result = url.substring(url.indexOf("rptName"));
				result = result.substring(0,result.indexOf("&"));
			    String newResult=java.net.URLEncoder.encode(result.split("=")[1], "UTF-8");
			    url=url.replace(result, "rptName="+newResult);
			}
			url+="&userId="+userId.toString()+"&username="+username.toString()+"&openId="+openId;
		}else{
			url+="?userId="+userId.toString()+"&username="+username.toString()+"&openId="+openId;
		}
		System.out.println(url);
		response.sendRedirect(url);
	}
}
%>
</body>

<script type="text/javascript">
	var msg='<%=message%>';
	if(msg!=''){
		//$("#menuMessage").html(msg);
		//$("#content").css("display","block");
		
	}
	

</script>
</html>