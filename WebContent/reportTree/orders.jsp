<%@page import="org.stan.yxgz.service.InterfaceService"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.util.*" %>
<%@page import="java.text.*" %>
<%@page import="org.stan.yxgz.pojo.*" %>
<%@page import="org.apache.commons.lang.StringUtils"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta content="width=device-width,user-scalable=no;initial-scale=1, minimum-scale=1.0, maximum-scale=1.0" name="viewport">
<script type="text/javascript" src="/js/jquery-1.9.1.min.js"></script>
<title>我的预约</title>
<link href="/css/base.css" rel="stylesheet" type="text/css" />


</head>
<style type="text/css">
*{ margin:0; padding:0; list-style:none;}
body{ font-size:12px;}
a{color:black}
#menu{ overflow:hidden;/*  margin:10px auto; */border:1px solid #FDFDFD;}
#menu #nav {display:block;width:100%;padding:0;margin:0;list-style:none;}
#menu #nav li {float:left;width:240px;border-bottom: 1px solid #BEC2C1;}
#menu #nav li a {display:block;line-height:27px;text-decoration:none;padding:0 0 0 5px; text-align:center; color:#333;}
#menu_con{ width:500px; height:100%; border-top:none}

#evalMenu{ overflow:hidden;/*  margin:10px auto; */border:1px solid #FDFDFD;}
#evalMenu #evalNav {display:block;width:100%;padding:0;margin:0;list-style:none;}
#evalMenu #evalNav li {float:left;width:240px;border-bottom: 1px solid #BEC2C1;}
#evalMenu #evalNav li a {display:block;line-height:27px;text-decoration:none;padding:0 0 0 5px; text-align:center; color:#333;}
#evalMenu_con{ width:500px; height:100%; border-top:none}
.evalTag{ padding:15px; overflow:hidden;margin-top:80px}
.tag{ padding:15px; /* overflow:hidden; */margin-top:50px}
.selected{/* background:#C5A069; color:#fff; */ border-bottom: 5px solid #3016F3;}
/* table{width:100%} */
table th{padding:2px}
.formItemDiff {  
    width: 20px;  
    height: 20px;  
    background-image:url(/image/diff.png);
    background-position: 0px -575px;  
    float: left;  
   /*  margin-top: 15px;  */ 
} 
.pItemDiff{  
    width: 20px;  
    height: 20px;  
    background-image:url(/image/diff.png);
    background-position: 0px -575px;  
    float: left;  
} 
.tItemDiff{  
    width: 20px;  
    height: 20px;  
    background-image:url(/image/diff.png);
    background-position: 0px -575px;  
    float: left;  
} 
.ctItemDiff{  
    width: 20px;  
    height: 20px;  
    background-image:url(/image/diff.png);
    background-position: 0px -575px;  
    float: left;  
} 
.caItemDiff{  
    width: 20px;  
    height: 20px;  
    background-image:url(/image/diff.png);
    background-position: 0px -575px;  
    float: left;  
} 
.ctemDiff{  
    width: 20px;  
    height: 20px;  
    background-image:url(/image/diff.png);
    background-position: 0px -575px;  
    float: left;  
} 
</style>

<body>
<%
String openId=request.getParameter("openId");
Map<String,Object> map=InterfaceService.getUserId(openId);
boolean state=Boolean.valueOf(map.get("state").toString());
boolean banded=Boolean.valueOf(map.get("isbanded").toString());
System.out.println(state+"----------"+banded);
%>
<%if(state && !banded){ %>
<div id="LoginForm">

<header>
	<div class="logoBox">
    	<img height="60" src="../image/logo.png" />
        <span class="logotext">广东数据超市</span>
    </div>
</header>
<!-- <div id="jx_banner">
<div class="row">
<div class="logo"></div>
<h1 class="welcome">程通驾校欢迎您</h1></div></div> -->

<form id="inputForm" action="../login" method="post" target="_self">
<input type="hidden" name="userId" id="userId"/>
<input type="hidden" name="type" id="type" value="mine"/>
<input type="hidden"  name="openId" id="openId" value="<%=openId%>"/>
<div class="content">
	<div class="password marT30">
    	<input class="password_input"  name="username" id="username" type="text" placeholder="请输入姓名" />
    </div>
    <div class="password marT30">
    	<input class="password_input"  name="userno" id="userno" type="text" placeholder="请输入卡号" />
    </div>
  <div class="marT30 password_pic">
    	<input class="password_input" name="telphone" onkeyup="this.value=this.value.replace(/\D/g,'')" id="telphone" type=text  placeholder="请输入手机号码" />
   </div>
   <div class="marT30">
   <span id="msg" style="display: none;" ></span>
   </div>
   <div class="marT30">
   		<input class="btn_login" type="button" id="btnLogin" value="登录" /> 
   </div>
</div>
</form>


</div>
<%} %>

<div id="myContainer">
<div style="background-color: #69C578">
<span id="username"></span>
<span id="subjectName"></span>
</div>
<!--代码部分begin-->
<div id="menu">
<!--tag标题-->
    <ul id="nav">
        <li><a href="#" class="selected">正在进行的课时(<span id="currentTotal"></span>)</a></li>
        <li><a href="#" class="">历史课程(<span id="historyTotal"></span>)</a></li>
    </ul>
<!--二级菜单-->
    <div id="menu_con">
        <div class="tag" style="display:block">
            	<table id="currentTab">
            	<tr id="currentTr">
            	<th>练车时间</th>
            	<th>时间段</th>
            	<th>状态</th>
            	<th>操作</th>
            	</tr>
            	</table>
         </div> 
        <div class="tag" style="display:none">
            	<table id="historyTab">
            	<tr id="historyTr">
            	<th>练车时间</th>
            	<th>时间段</th>
            	<th>状态</th>
            	<th>操作</th>
            	</tr>
            	
            	</table>
         </div> 
	</div>
</div>
</div>





<input type="hidden" id="courseId" name="courseId"/>
<div id="evalContainer" style="display: none" >

<div style="background-color: #69C578">
<span>chendan</span>
<span>《Second Subject》</span>
</div>
<!--代码部分begin-->
<div id="evalMenu">
<!--tag标题-->
    <ul id="evalNav">
        <li><a href="#" class="selected">学校评价</a></li>
        <li><a href="#" class="">教练评价</a></li>
    </ul>
<!--二级菜单-->
    <div id="evalMenu_con">
        <div class="evalTag" style="display:block">
        <table>
        <tr>
        <td><span>场地环境：</span></td>
        <td>
          <span id="formItemDiff1" class="formItemDiff formItemDiffFirst" style="background-position: 0px -575px;"></span>
          <span id="formItemDiff2" class="formItemDiff" style="background-position: 0px -575px;"></span><!-- 0px -575px false 0px -555px true -->
          <span id="formItemDiff3" class="formItemDiff" style="background-position: 0px -575px;"></span>
          <span id="formItemDiff4" class="formItemDiff" style="background-position: 0px -575px;"></span>
          <span id="formItemDiff5" class="formItemDiff" style="background-position: 0px -575px;"></span>
         <p id="sArearPointP" style="float: left; margin-left: 20px; background-position: 0px -575px;">满分：5</p>分
        </td>
        </tr>
        <tr>
        <td>工作人员态度：</td>
        <td>
          <span id="pItemDiff1" class="pItemDiff pItemDiffFirst" style="background-position: 0px -575px;"></span>
          <span id="pItemDiff2" class="pItemDiff" style="background-position: 0px -575px;"></span><!-- 0px -575px false 0px -555px true -->
          <span id="pItemDiff3" class="pItemDiff" style="background-position: 0px -575px;"></span>
          <span id="pItemDiff4" class="pItemDiff" style="background-position: 0px -575px;"></span>
          <span id="pItemDiff5" class="pItemDiff" style="background-position: 0px -575px;"></span>
         <p id="pPointP" style="float: left; margin-left: 20px; background-position: 0px -575px;">满分：5</p>分
         </td>
        </tr>
        <tr>
        <td>总体满意度：</td>
        <td>
          <span id="tItemDiff1" class="tItemDiff pItemDiffFirst" style="background-position: 0px -575px;"></span>
          <span id="tItemDiff2" class="tItemDiff" style="background-position: 0px -575px;"></span><!-- 0px -575px false 0px -555px true -->
          <span id="tItemDiff3" class="tItemDiff" style="background-position: 0px -575px;"></span>
          <span id="tItemDiff4" class="tItemDiff" style="background-position: 0px -575px;"></span>
          <span id="tItemDiff5" class="tItemDiff" style="background-position: 0px -575px;"></span>
         <p id="tPointP" style="float: left; margin-left: 20px; background-position: 0px -575px;">满分：5</p>分	
        </td>
        </tr>
        </table>
        </br></br>
         <span>您的意见与建议*</span> 	
         <textarea rows="5" cols="20" id="context">
         </textarea></br>
         <input type="button" value="提交" name="btnOk" onclick="btnOk('school')"/>
         </div> 
        <div class="evalTag" style="display:none">
          <table>
        <tr>
        <td><span>教学方式：</span></td>
        <td>
          <span id="ctItemDiff1" class="ctItemDiff formItemDiffFirst" style="background-position: 0px -575px;"></span>
          <span id="ctItemDiff2" class="ctItemDiff" style="background-position: 0px -575px;"></span><!-- 0px -575px false 0px -555px true -->
          <span id="ctItemDiff3" class="ctItemDiff" style="background-position: 0px -575px;"></span>
          <span id="ctItemDiff4" class="ctItemDiff" style="background-position: 0px -575px;"></span>
          <span id="ctItemDiff5" class="ctItemDiff" style="background-position: 0px -575px;"></span>
         <p id="ctArearPointP" style="float: left; margin-left: 20px; background-position: 0px -575px;">满分：5</p>分
        </td>
        </tr>
        <tr>
        <td>教练态度：</td>
        <td>
          <span id="caItemDiff1" class="caItemDiff pItemDiffFirst" style="background-position: 0px -575px;"></span>
          <span id="caItemDiff2" class="caItemDiff" style="background-position: 0px -575px;"></span><!-- 0px -575px false 0px -555px true -->
          <span id="caItemDiff3" class="caItemDiff" style="background-position: 0px -575px;"></span>
          <span id="caItemDiff4" class="caItemDiff" style="background-position: 0px -575px;"></span>
          <span id="caItemDiff5" class="caItemDiff" style="background-position: 0px -575px;"></span>
         <p id="caPointP" style="float: left; margin-left: 20px; background-position: 0px -575px;">满分：5</p>分
        </td>
        </tr>
        <tr>
        <td>总体满意度：</td>
        <td>
          <span id="ctemDiff1" class="ctemDiff pItemDiffFirst" style="background-position: 0px -575px;"></span>
          <span id="ctemDiff2" class="ctemDiff" style="background-position: 0px -575px;"></span><!-- 0px -575px false 0px -555px true -->
          <span id="ctemDiff3" class="ctemDiff" style="background-position: 0px -575px;"></span>
          <span id="ctemDiff4" class="ctemDiff" style="background-position: 0px -575px;"></span>
          <span id="ctemDiff5" class="ctemDiff" style="background-position: 0px -575px;"></span>
         <p id="cttPointP" style="float: left; margin-left: 20px; background-position: 0px -575px;">满分：5</p>分	
        </td>
        </tr>
        </table> 
        </br></br>
         <span>您的意见与建议*</span> 	
         <textarea rows="5" cols="20" id="context">
         </textarea></br>
         <input type="button" value="提交" name="btnOk" onclick="btnOk('coach')"/> 	
         </div> 
	</div>
</div>


</div>
</body>

<script type="text/javascript">
var w = document.documentElement.clientWidth;
var h = document.documentElement.clientHeight;
$("#myContainer").css("width",w+"px");
$("#myContainer").find("table").css("width",(w-10)+"px");
$("#myContainer").find("li").css("width",(w/2-5)+"px");
$("#evalContainer").find("li").css("width",(w/2-10)+"px");
function init(json,type){
var texts="";
if(type=='current'){
	//texts="<tr id=\"currentTr\"><th>课程名称</th><th>练车时间</th><th>时间段</th><th>状态</th><th>操作</th></tr>";
}
else{
	//texts="<tr id=\"historyTr\"><th>课程名称</th><th>练车时间</th><th>时间段</th><th>状态</th><th>操作</th></tr>";
}
var len=0;
var forTree = function(o){
	len=o.length;
		for(var i=0;i<o.length;i++){
			if(i==0){
				$("#username").html(o[i]["userName"]);
				$("#subjectName").html("<"+o[i]["subjectName"]+">");
			}
			var urlstr = "";
			try{
				var courseId=o[i]["userCourseId"];
				if(type=='current'){
					
					var opt="<a href=\"javascript:cancelCourse('"+courseId+"')\">取消</a>";
					if(o[i]["courseStateCode"]=='YQX'){
						opt="";
					}
					urlstr+="<tr><td colspan=\"4\" style=\"color:rgb(14, 23, 245)\">"+o[i]["courseName"]+"</td></tr>";
					urlstr+="<tr lang=\""+courseId+"\"><td>"+o[i]["time"]+"</td><td>"+o[i]["hourArear"]+"</td><td>"+o[i]["courseState"]+"</td><td>"+opt+"</td></tr>";
				}else{
					urlstr+="<tr><td colspan=\"4\" style=\"color:rgb(14, 23, 245)\">"+o[i]["courseName"]+"</td></tr>";
					urlstr+="<tr lang=\""+courseId+"\"><td>"+o[i]["time"]+"</td><td>"+o[i]["hourArear"]+"</td><td>"+o[i]["courseState"]+"</td><td><a id=\"evalute"+courseId+"\" href=\"javascript:evalute('"+courseId+"')\">评价</a></td></tr>";
				}
				texts+=urlstr;
			}catch(e){}
			
			}
		return texts;
	};
	if(type=='current'){
		$("#currentTr").after(forTree(json,'current'));
		$("#currentTotal").html(len);
	}
	else{
		$("#historyTr").after(forTree(json,'history'));
		$("#historyTotal").html(len);
	}
}

//load my orders
$(document).ready( function(){
	var state='<%=state%>';
	var banded='<%=banded%>';
	if(state=='true' && banded=='true'){
	$.post("../main", {
		   type:'mine',
		   openId:'<%=openId%>'
		   },
		   function(data){
			   var state=data.state;
			   if(state){
				   var json=data.dataS0A;
				   var jsonh=data.dataS0X;
				   init(json,'current');
				   init(jsonh,'history');
			   }
			   
		},'json');
	}else{
		$("#myContainer").css("display","none");
	}
	
	$('#btnLogin').bind('click', function(event){
        validateAndSubmitForm();
    });
})

$(".formItemDiff").hover(function() {  
                        $(this).css("background-position", "0px -555px");  
                        $(this).prevAll().css("background-position", "0px -555px");  
                        $(this).nextAll().css("background-position", "0px -575px");  
                        $("#sArearPointP").html(($(this).prevAll().length)+1);  
                    });  
$(".pItemDiff").hover(function() {  
    $(this).css("background-position", "0px -555px");  
    $(this).prevAll().css("background-position", "0px -555px");  
    $(this).nextAll().css("background-position", "0px -575px");  
    $("#pPointP").html(($(this).prevAll().length)+1);  
}); 
$(".tItemDiff").hover(function() {  
    $(this).css("background-position", "0px -555px");  
    $(this).prevAll().css("background-position", "0px -555px");  
    $(this).nextAll().css("background-position", "0px -575px");  
    $("#tPointP").html(($(this).prevAll().length)+1);  
}); 




$(".ctItemDiff").hover(function() {  
    $(this).css("background-position", "0px -555px");  
    $(this).prevAll().css("background-position", "0px -555px");  
    $(this).nextAll().css("background-position", "0px -575px");  
    $("#ctArearPointP").html(($(this).prevAll().length)+1);  
});
$(".caItemDiff").hover(function() {  
    $(this).css("background-position", "0px -555px");  
    $(this).prevAll().css("background-position", "0px -555px");  
    $(this).nextAll().css("background-position", "0px -575px");  
    $("#caPointP").html(($(this).prevAll().length)+1);  
});
$(".ctemDiff").hover(function() {  
    $(this).css("background-position", "0px -555px");  
    $(this).prevAll().css("background-position", "0px -555px");  
    $(this).nextAll().css("background-position", "0px -575px");  
    $("#cttPointP").html(($(this).prevAll().length)+1);  
});

function clearCalutate(){
	for(var i=0;i<5;i++){
		$("#ctemDiff"+(i+1)).css("background-position", "0px -575px");  
		$("#cttPointP").html("满分：5");
		$("#caItemDiff"+(i+1)).css("background-position", "0px -575px");  
		$("#caPointP").html("满分：5");
		$("#ctItemDifff"+(i+1)).css("background-position", "0px -575px");  
		$("#ctArearPointPP").html("满分：5");
		$("#tItemDiff"+(i+1)).css("background-position", "0px -575px");  
		$("#tPointP").html("满分：5");
		$("#pItemDiff"+(i+1)).css("background-position", "0px -575px");  
		$("#pPointP").html("满分：5");
		$("#formItemDiff"+(i+1)).css("background-position", "0px -575px");  
		$("#sArearPointP").html("满分：5");
	}
}
function cancelCourse(courseId){
	$.post("../main", {
		   type:'cancel',
		   openId:'<%=openId%>',
		   courseId:courseId
		   },
		   function(data){
			   var state=data.state;
			   if(state){
				   $("#currentTr").siblings().remove();
				   $("#historyTr").siblings().remove();
				   
				   var json=data.dataS0A;
				   var jsonh=data.dataS0X;
				   init(json,'current');
				   init(jsonh,'history');
			   }
			   alert(data.reason);
			   
		},'json');
}
function evalute(courseId){  
	$("#courseId").val(courseId);
	$("#myContainer").css("display","none");
	$("#evalContainer").css("display","block");
}
function btnOk(type){
	var courseId=$("#courseId").val();
	if(type=='school'){
		alert("此功能还在开发中！敬请期待.");
	}else{
		$.post("../main", {
			   type:'evalute',
			   openId:'<%=openId%>',
			   courseId:courseId,
			   desc:$("#context").val(),
			   param1:$("#ctArearPointP").val(),
			   param2:$("#caPointP").val(),
			   param3:$("#cttPointP").val()
			   },
			   function(data){
				   var state=data.state;
				   
				   alert(data.reason);
				   
			},'json');
	}
	$("#evalute"+courseId).prev("td").html("已评价");
	$("#evalute"+courseId).attr('disabled',"true");
	clearCalutate();
	$("#myContainer").css("display","block");
	$("#evalContainer").css("display","none");
}
var tabs=function(){
    function tag(name,elem){
        return (elem||document).getElementsByTagName(name);
    }
    //获得相应ID的元素
    function id(name){
        return document.getElementById(name);
    }
    function first(elem){
        elem=elem.firstChild;
        return elem&&elem.nodeType==1? elem:next(elem);
    }
    function next(elem){
        do{
            elem=elem.nextSibling;  
        }while(
            elem&&elem.nodeType!=1  
        )
        return elem;
    }
    return {
        set:function(elemId,tabId){
            var elem=tag("li",id(elemId));
            var tabs=tag("div",id(tabId));
            var listNum=elem.length;
            var tabNum=tabs.length;
           // console.log(tabId);
            //console.log(tabs);
            for(var i=0;i<listNum;i++){
                    elem[i].onclick=(function(i){
                        return function(){
                        	console.log("tabNum"+tabNum);
                            for(var j=0;j<tabNum;j++){
                                if(i==j){
                                    tabs[j].style.display="block";
                                    //alert(elem[j].firstChild);
                                    elem[j].firstChild.className="selected";
                                }
                                else{
                                    tabs[j].style.display="none";
                                    elem[j].firstChild.className="";
                                }
                            }
                        }
                    })(i)
            }
        }
    }
}();
tabs.set("nav","menu_con");//我的预约
tabs.set("evalNav","evalMenu_con");//评价



/**
* 验证表单
*/
function validateAndSubmitForm(){
   var username = $("#username").val();
   var userno = $("#userno").val();
   var telphone = $("#telphone").val();
   var fromlineError = $("#msg");
   if (username == '' || userno == '' || telphone == '') {
	   fromlineError.css("display","block");
	   fromlineError.css("color","red");
       fromlineError.html("用户信息不能为空.");
       return false;
   }else{
   	var res =/^1\d{10}$/;
   	if(!res.test(telphone)){
   		fromlineError.css("display","block");
   		   fromlineError.css("color","red");
           fromlineError.html("电话号码格式不正确.");
           return ;
   	}
   	fromlineError.css("display","none");
   	
   	
   	
   	$.post("../login", {
		   username:$("#username").val(),
		   userno:$("#userno").val(),
		   telphone:$("#telphone").val(),
		   openId:$("#openId").val(),
		   type:'mine'
		   },
		   function(data){
			  	var state=data.state;
			  	if(state==true){
			  		$("#myContainer").css("display","block");
			  		$("#LoginForm").css("display","none");
			  		$("#userId").val(data.userId);
				    var json=data.dataS0A;
				    var jsonh=data.dataS0X;
				    init(json,'current');
				    init(jsonh,'history');
				   
			  	}else{
			  		var fromlineError = $("#msg");
			  		
		  			fromlineError.css("display","block");
		  			var fromlineError =$("#msg");
		  			fromlineError.css("color","red");
		  			fromlineError.html('${reason}');
				 
			   }
		},'json');
   	
   	
   	
   }
}
</script>
</html>
