<%@page import="org.stan.yxgz.service.InterfaceService"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.util.*" %>
<%@page import="java.text.*" %>
<%@page import="org.stan.yxgz.pojo.*" %>
<%@page import="org.stan.yxgz.service.*" %>
<%@page import="org.apache.commons.lang.StringUtils"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta content="width=device-width,user-scalable=no;initial-scale=1, minimum-scale=1.0, maximum-scale=1.0" name="viewport">
<script type="text/javascript" src="/js/jquery-1.9.1.min.js"></script>
<title>main-001</title>
<link href="/css/base.css" rel="stylesheet" type="text/css" />
<!-- 下拉框 -->
<link rel="stylesheet" type="text/css" href="/css/style.css" />
</head>
<style type="text/css">
.continer b{padding-left:20px}
.continer p{padding-left:20px}
table{
	width:100%;
	border-collapse: collapse;  
    border-bottom-style: solid;  
    border-bottom-width: 2px;  
    border-bottom-color: #000000;  
	padding-bottom:10px;
}
td{
	 width:100%;
	 padding-top:15px;
	 border-bottom: 2px solid #000000;  }
tr{
	margin-bottom:10px;
	}
a{color:black}
</style>
<body>

<%
request.setCharacterEncoding("UTF-8");
response.setCharacterEncoding("UTF-8");
HttpSession sessions=request.getSession();
String openId = request.getParameter("openId");
Object userId=request.getSession().getAttribute("userId");
boolean falg=false;  //默认需要认证，如果绑定过就不需要绑定了
boolean state=true;  //默认访问请求地址返回成功
Map<String,Object> result=null;
String subjectId="";
String subjectName="";
System.out.println("userId:"+userId+"=====:openId:"+openId+"==========");
if(!("".equals(userId) || userId==null)){    //用户已经登陆过
	result = (Map<String,Object>)request.getSession().getAttribute("data");  //绑定或登录成功
	System.out.print(result.get("banded"));
	falg=Boolean.valueOf(result.get("banded").toString());
	//subjectId=request.getAttribute("subjectId").toString();
	subjectId=result.get("subjectId").toString();
	state=Boolean.valueOf(result.get("state").toString());
}else{
	//先判断是否绑定
	result = InterfaceService.isLogin(openId);
	state=Boolean.valueOf(result.get("state").toString());
	System.out.println("=======isSuccess"+state);
	if(state){//返回数据成功
		falg=Boolean.valueOf(result.get("banded").toString());
		if(falg){  //已绑定
			System.out.println("=======是否已经绑定"+falg);
			request.getSession().setAttribute("userId", result.get("userId"));
			request.getSession().setAttribute("data", result);
			//request.setAttribute("data", result);
			request.setAttribute("banded",result.get("banded"));
			subjectId=result.get("subjectId").toString();
			userId=result.get("userId");
			subjectName=result.get("subjectName").toString();
			
		}else{  //未绑定
			
		}
	}else{
		String reason=result.get("reason").toString();
		
	}
	
}

String [] subs=InterfaceService.getSubjectArray();
//科目二数据
List<CoachCourse> coachListSecond=null;
List<CoachCourse> coachListThird=null;
int index=0;
System.out.println("falg=====:"+falg);
if(falg){
	for(String s:subs){
		if(s.equals(subjectId)){   //当前用户的科目信息
			if(index==0)
				coachListSecond = (List<CoachCourse>)result.get("data");
			else
				coachListThird = (List<CoachCourse>)result.get("data");
		}else{
			if(index==0)
				coachListSecond=InterfaceService.getCoachCourseById(userId+"",s);
			else
				coachListThird=InterfaceService.getCoachCourseById(userId+"",s);
			
		}
		index++;
	}
}
	

%>

<%if(!falg || !state) {%>
<!-- 登录界面 -->
<div id="LoginForm" style="height: 100%">
<iframe name="login_Iframe" id="login_Iframe" onload="getMains()" src="/login/login.jsp" scrolling="yes" allowtransparency="true" style="background-color:transparent;overflow:hidden;width:100%;height: 100%" frameborder="0" ></iframe>
</div>
<%} %>
<!-- 记录登录参数 -->
<form id="inputForm" action="../login" method="post" target="_self">
<input type="hidden" name="userId" id="userId" value="<%=userId%>"/>
<input type="hidden" name="username" id="username"/>
<input type="hidden" name="userno" id="userno"/>
<input type="hidden" name="telphone" id="telphone"/>
<input type="hidden" name="openId" id="openId" value="<%=openId%>"/>
<input type="hidden" name="subject" id="subject" value="<%=subjectId%>"/>
<input id="openId" type="hidden" name="openId"  value="sub"/>
</form>
<%if(falg){ %>
<div id="container" class="container" style="display: none;">
<!-- 显示分点信息 -->
<div id="areaCode">
<b><%=subjectName %></b>	
</div>
<!-- 显示科目信息 -->

 <article id="subjectId" class="tabs">

		<input checked id="one" name="tabs" type="radio">
	    <label lang="<%=subs[0] %>" for="one">科目二</label>

	    <input id="two" name="tabs" type="radio" value="Two">
	    <label lang="<%=subs[1] %>" for="two">科目三</label>

	    <div class="panels">

		    <div class="panel">
		    	
		    	<h2>科目二教练&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;共<%=coachListSecond.size() %>名</h2>
		    	
		    	<div style="float:left;">
					<img width="100px" height="120px" src="<%=cc.getCoach().getPicUrl() %>>"/>
					</div>
					<div class="continer">
					<b>姓名：</b><br/>
					<p style="white-space:normal;word-break:break-all;overflow:hidden">简介：<%=cc.getCoach().getDes() %></p>
					</div></br></br>
					<!--考试信息 -->
					
					<div>
					<table border="0">
					
					<tr>
					<td><img src="/afficheIco.gif" width="40px" height="40px"/><a href="/reportTree/conform-001.jsp?name=<%=cc.getCoach().getName() %>&coachId=<%=cc.getCoach().getId()%>&openId=<%=openId%>">【<%=d.getDay() %>】&nbsp;&nbsp;上午还剩空位<%=d.getCanBookNumOfam() %>下午还剩空位<%=d.getCanBookNumOfpm() %></a></td>
					</tr>
					
					</table>
					</div>
		    
		    	
		    	
		    </div>

		    <div class="panel">
		    <h2>科目三教练&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;共名</h2>
		    	
		    	<div style="float:left;">
					<img width="100px" height="120px" src="<%=cc.getCoach().getPicUrl() %>>"/>
					</div>
					<div class="continer">
					<b>姓名：</b><br/>
					<p style="white-space:normal;word-break:break-all;overflow:hidden">简介：</p>
					</div></br></br>
					<!--考试信息 -->
					
					<div>
					<table border="0">
					
					
					<tr>
					<td><img src="/afficheIco.gif" width="40px" height="40px"/><a href="/reportTree/conform-001.jsp?name=<%=cc.getCoach().getName() %>&coachId=<%=cc.getCoach().getId()%>&openId=<%=openId%>&day=<%=d.getDay() %>">【<%=d.getDay() %>】&nbsp;&nbsp;上午还剩空位<%=d.getCanBookNumOfam() %>下午还剩空位<%=d.getCanBookNumOfpm() %></a></td>
					</tr>
							
					
					</table>
					</div>
		    	
		    	
		    	
		    	
		    	

		  

		</div>

    </article>
</div>


</body>

<script type="text/javascript">
var w = document.documentElement.clientWidth;
var h = document.documentElement.clientHeight;

$("#subjectId").css("max-width",w+"px");
var subject = $("#subject").val();
if(subject=='<%=subs[0]%>'){
	$("#one").attr("checked",true);
	$("#two").removeAttr("checked");
}else{
	$("#one").removeAttr("checked");
	$("#two").attr("checked",true);
}
var state='<%=state%>';
//alert(state);
if(!state){  //返回失败
	 var fromlineError = window.frames["login_Iframe"].document.getElementById('msg');
	 fromlineError.style.color="red";
	 fromlineError.innerHTML='<%=result.get("reason").toString()%>';
}
var falg='<%=falg%>';
if(falg){
	$("#container").css("display","block");
}else{
	$("#LoginForm").css("display","block");
	$("#container").css("display","none");
}

/**
 * 验证表单
 */
function validateAndSubmitForm(username,userno,telphone){
    var fromlineError = window.frames["login_Iframe"].document.getElementById('msg');
    if (username == '' || userno == '' || telphone == '') {
    	fromlineError.style.color="red";
        fromlineError.innerHTML="用户信息不能为空.";
        return false;
    }else{
    	var res =/^1\d{10}$/;
    	if(!res.test(telphone)){
    		fromlineError.style.color="red";
            fromlineError.innerHTML="电话号码格式不正确.";
            return ;
    	}
    	$("#username").val(username);
    	$("#userno").val(userno);
    	$("#telphone").val(telphone);
    	
    	$("#inputForm").submit();	
    	/* $.post("../login", {
 		   username:username,
 		   txtPassword:userno,
 		   telphone:telphone,
 		   type:'001'
 		   },
 		   function(data){
 			   var msg=data.msg;  
 			   if(msg=='true'){  //绑定成功
 				 window.frames["login_Iframe"].document.getElementById('userId').value=data.userId;
 				 window.frames["login_Iframe"].document.getElementById('region').value=data.region;
 				 var json=data.data;
 				
   				
 			   }else{
 				 var json=data.data;
 				 var ifm=window.frames["login_Iframe"].document;
 				 ifm.getElementById("username").focus();
 				 var message="";
 				 if(json=='2222'){  //请求webservice失败
 					message="请求webservice失败";
 				}else if(json=='00002'){  //
 					message="用户名或者密码不正确";
 				}else if(json=='00003') { 
 					message="用户名无效";
 				}else
 					message="网络连接失败";
 				 
 				  fromlineError.style.color="red";
 				  fromlineError.innerHTML=message;
 				  return;
 			   }
 		},'json'); */
    	
    }
}

	
</script>

</html>
