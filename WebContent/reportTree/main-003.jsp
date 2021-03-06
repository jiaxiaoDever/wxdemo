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
    <meta charset="utf-8">
    <title>Registered.html</title>
    <meta name="description" content="">
    <meta name="keywords" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/skin/default001/css/bootstrap.css">
    <link rel="stylesheet" href="/skin/default001/css/cover.css">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
  <script src="http://cdn.bootcss.com/html5shiv/3.7.0/html5shiv.min.js"></script>
  <script src="http://cdn.bootcss.com/respond.js/1.3.0/respond.min.js"></script>
  <![endif]-->
</head>



<body>
<textarea rows="10" cols="10" style="display: none;" id="tempImg"></textarea>  
<input type="hidden" value="${openId }" id="openId"/>
<%
boolean state=Boolean.valueOf(request.getAttribute("state").toString());
boolean isbanded=true;

%>
<%if(state) {
	isbanded=Boolean.valueOf(request.getAttribute("isbanded").toString());
	String teacherId=request.getAttribute("teacherId").toString();
if(!isbanded){
%>

<!-- 登录界面 -->
<input id="jxId" type="hidden" name="jxId"/>
<input id="jxName" type="hidden" name="jxName"/>
    <div class="container col-xs-12">
	<h4><span id="jxDesc">${jxName }</span>欢迎您!</h4>


        <form>

            <h4>如果您已经注册过，请点击<a href="javascript:btnFun('login')">登录</a></h4>

            <div class="form-group">
                <label for="exampleInputEmail1">
                    <span class="small_star">*</span>
                    您的姓名：</label>
                <input class="form-control" type="text" id="username" name="username" placeholder="">
            </div>

            <div class="form-group">
                <label for="exampleInputEmail1">
                    <span class="small_star">*</span>
                    身份证号码：</label>
                <input type="text" class="form-control" id="identityCard" name="identityCard" placeholder="">
            </div>

            <div class="form-group">
                <label for="exampleInputEmail1">
                    <span class="small_star">*</span>
                    您的性别：</label>
                <select id="sex" class="form-control">
                    <option value="1">男</option>
                    <option value="0">女</option>

                </select>
            </div>

            <div class="form-group">
                <label for="exampleInputFile">
                    <span class="small_star">*</span>
                    您的头像：</label>
				<input type="button" value="test" style="display: none;" value="click me" id="btnUpload" />
                <input type="file" id="uploadFile" name="uploadFile">
                <div id="coachImg"><img src="skin/default001/images/02.jpg" /></div>
                <p class="help-block">图片必须为清晰的正面照，且不能大于5M，背景不限。</p>
				<div><span id="uploadMsg" class="msg" style="display: none;">正在上传…………</span></div>
            </div>



            <h4>合作相关信息</h4>

            <div class="form-group">
                <label for="exampleInputEmail1">
                    <span class="small_star">*</span>
                    所属科目：</label>
                <select class="form-control" id="subject">
                </select>
            </div>
            
            <div class="form-group">
                <label for="exampleInputEmail1">
                    <span class="small_star">*</span>
                    所属网点：</label>
                <select class="form-control" id="branch">
                </select>
            </div>

            <div class="form-group">
                <label for="exampleInputEmail1">
                    <span class="small_star">*</span>
                    准驾车型：</label>
                <select class="form-control" id="carType">
                </select>
            </div>

            <div class="form-group">
                <label for="exampleInputEmail1">
                    <span class="small_star">*</span>
                    教练车型：</label>
                <select class="form-control" id="coachCarType">
                </select>
            </div>

            <div class="form-group">
                <label for="exampleInputEmail1">
                    <span class="small_star">*</span>
                    教练证号：</label>
                <input type="text" class="form-control" id="coachNo" name="coachNo" placeholder="">
            </div>
            
            <div class="form-group">
                <label for="exampleInputEmail1">
                    <span class="small_star">*</span>
                    驾驶证编号：</label>
                <input type="text" class="form-control" id="carNo" name="carNo" placeholder="">
            </div>

            <div class="form-group">
                <label for="exampleInputEmail1">
                    <span class="small_star">*</span>
                    车牌号：</label>
                <input type="text" class="form-control" id="carPno" name="carPno" placeholder="">
            </div>
            
            <div class="form-group">
                <label for="exampleInputEmail1">
                    <span class="small_star">*</span>
                    教练驾龄（月）：</label>
                <input type="text" class="form-control" id="coachDriverYear" name="coachDriverYear" placeholder="">
            </div>

            <div class="form-group">
                <label for="exampleInputEmail1">
                    <span class="small_star">*</span>
                    教练年龄（月）：</label>
                <input type="text" class="form-control" id="coachTeachYear" name="coachTeachYear" placeholder="">
            </div>

           <!--  <div class="form-group">
                <label for="exampleInputEmail1">
                    <span class="small_star">*</span>
                    训练场地址：</label>
                <input type="text" class="form-control" id="Email5" placeholder="">
            </div>

            <div class="form-group">
                <label for="exampleInputEmail1">
                    <span class="small_star">*</span>
                    考场地址：</label>
                <input type="text" class="form-control" id="Email6" placeholder="">
            </div>

            <div class="form-group">
                <label for="exampleInputEmail1">
                    <span class="small_star">*</span>
                    来源渠道：</label>
                <select class="form-control">
                    <option>客服经理</option>
                    <option>渠道经理</option>
                    <option>其他</option>
                </select>
            </div>
 			-->
 			
            <div class="form-group">
                <label for="exampleInputEmail1">
                    <span class="small_star">*</span>
                    招生考试指标（人）：</label>
                <input type="text" class="form-control" id="studentInd" placeholder="">
            </div>

            <div class="form-group">
                <label for="exampleInputEmail1">
                    <span class="small_star">*</span>
                    住址：</label>
                <input type="text" class="form-control"  id="address" placeholder="">
            </div>

            <h4>注册登录信息</h4>

            <div class="form-group">
                <label for="exampleInputEmail1">
                    <span class="small_star">*</span>
                    手机号码：</label>
                <input type="text" class="form-control" id="telphone" name="telphone" placeholder="">
            </div>

            <div class="form-group">
                <label for="exampleInputEmail1">
                    <span class="small_star">*</span>
                    密码：</label>
                <input type="password" class="form-control" id="password" name="password" placeholder="">
            </div>

            <div class="form-group">
                <label for="exampleInputEmail1">
                    <span class="small_star">*</span>
                    确认密码：</label>
                <input type="password" class="form-control" id="res_password" name="res_password" placeholder="">
                <span class="msg" style="display: none;" id="msg"></span>
            </div>

            <div class="checkbox" id="agreeDiv">
                <label>
                    <input type="checkbox" id="agree" checked="checked" name="agree" onclick="checkFun()">
                    点击阅读<a href="#">《37学车教练合约说明》</a>
                </label>
            </div>

            <button type="button" class="btn btn-primary btn-group-justified" id="btnOk">同意并注册</button>
        </form>
    </div>

<div id="LoginForm" style="display:none;height: 100%">
<div class="hint">如果您未注册过，请点击注册<a href="javascript:btnFun('register')" >注册</a></div>
<div class="content">
	<div class="password marT30">
    	<input class="password_input"  name="login_username" id="login_username" type="text" placeholder="请输入姓名" />
    </div>
  <div class="marT30 password_pic">
    	<input class="password_input" name="login_telphone" onkeyup="this.value=this.value.replace(/\D/g,'')" id="login_telphone" type=text  placeholder="请输入手机号码" />
   </div>
   <div class="password marT30">
    	<input class="password_input"  name="login_password" id="login_password" type="text" placeholder="请输入密码" />
    </div>
   <div class="marT30">
   <span id="msg-login" style="display: none;" ></span>
   </div>
   <div class="marT30">
   		<input class="btn_login" type="button" id="btnLogin" value="登录" /> 
   </div>
</div>


</div>
<%}else{%>

<!--对应学员信息 -->
<div id="container" class="container" style="display: none;" >
<!-- 显示分点信息 -->
<div id="areaCode">
<span>我的授课记录</span>	
</div>

<article id="artCourseId" class="tabs">

		<input checked id="one" class="tabinput" name="tabs" type="radio">
	    <label id="one1"  onclick="clickForm('one')" class="selected" for="one">正在进行课时</label>

	    <input id="two" name="tabs" class="tabinput" type="radio" value="Two">
	    <label id="two1" onclick="clickForm('two')"  for="two">历史课时</label>

	    <div class="panels">

		    <div id="currentStudy" class="panel">
		    
		    </div>
		    	
		    <div id="historyStudy" class="panel">
		   
		  </div>

		</div>

    </article>
</div>
	
<%
}
}else{%>
${reason }
<%} %>

</body>

<script src="/skin/default001/js/jquery.min.js"></script>
<script src="/skin/default001/js/bootstrap.min.js"></script>
<script src="/skin/default001/js/holder.js"></script>

<script type="text/javascript">
var w = document.documentElement.clientWidth;
var h = document.documentElement.clientHeight;
$("#one1").css("width",(w/2-5)*0.9+"px");
$("#two1").css("width",(w/2-5)*0.9+"px");
function IdentityCodeValid(code) { 
    var city={11:"北京",12:"天津",13:"河北",14:"山西",15:"内蒙古",21:"辽宁",22:"吉林",23:"黑龙江 ",31:"上海",32:"江苏",33:"浙江",34:"安徽",35:"福建",36:"江西",37:"山东",41:"河南",42:"湖北 ",43:"湖南",44:"广东",45:"广西",46:"海南",50:"重庆",51:"四川",52:"贵州",53:"云南",54:"西藏 ",61:"陕西",62:"甘肃",63:"青海",64:"宁夏",65:"新疆",71:"台湾",81:"香港",82:"澳门",91:"国外 "};
    var tip = "";
    var pass= true;
    
    if(!code || !/^\d{6}(18|19|20)?\d{2}(0[1-9]|1[12])(0[1-9]|[12]\d|3[01])\d{3}(\d|X)$/i.test(code)){
        tip = "请核对你的身份证号码.身份证号格式错误";
        pass = false;
    }
    
   else if(!city[code.substr(0,2)]){
        tip = "地址编码错误";
        pass = false;
    }
    else{
        //18位身份证需要验证最后一位校验位
        if(code.length == 18){
            code = code.split('');
            //∑(ai×Wi)(mod 11)
            //加权因子
            var factor = [ 7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2 ];
            //校验位
            var parity = [ 1, 0, 'X', 9, 8, 7, 6, 5, 4, 3, 2 ];
            var sum = 0;
            var ai = 0;
            var wi = 0;
            for (var i = 0; i < 17; i++)
            {
                ai = code[i];
                wi = factor[i];
                sum += ai * wi;
            }
            var last = parity[sum % 11];
            if(parity[sum % 11] != code[17]){
                tip = "身份证校验位错误";
                pass =false;
            }
        }
    }
    if(!pass){
    	$("#identityCard").focus();
    	$("#msg").css("display","block");
		$("#msg").html(tip);
    }
    return pass;
}

window.onload = function(){
	 var input = document.getElementById("uploadFile");
	 var result= document.getElementById("coachImg");
	 if ( typeof(FileReader) === 'undefined' ){
	         //result.innerHTML = "抱歉，你的浏览器不支持 FileReader，请使用现代浏览器操作！";
	         //input.setAttribute( 'disabled','disabled' );
	         alert("浏览器不支持上传");
	 } else {
	         input.addEventListener( 'change',readFile,false );}
	}
	function readFile(){
		    $("#uploadMsg").css("display","block");
	        var file = this.files[0];
	        var result= document.getElementById("coachImg");
	        var temp=document.getElementById("tempImg");
	//这里我们判断下类型如果不是图片就返回 去掉就可以上传任意文件 
	        if(!/image\/\w+/.test(file.type)){ 
	                alert("请确保文件为图像类型");
	                return false;
	        }
	        var reader = new FileReader();
	        reader.readAsDataURL(file);
	        reader.onload = function(e){
	        	    temp.innerHTML = this.result;  //this is base64 type
	                result.innerHTML = '<img id="coachImg" style=\"width:100px\" src="'+this.result+'" alt=""/>';
	                $("#uploadMsg").css("display","none"); 
	    	        //alert((file.size/1024)/1024+"M");
	        }
	        
	}

	function validata(){
		var img=$("#tempImg").text();
		var username=$("#username").val();
		var identityCard=$("#identityCard").val();
		var carNo=$("#carNo").val();
		var carPno=$("#carPno").val();
		var telphone=$("#telphone").val();
		var password=$("#password").val();
		var res_password=$("#res_password").val();
		var coachNo=$("#coachNo").val();
		var coachDriverYear=$("#coachDriverYear").val();
		var coachTeachYear=$("#coachTeachYear").val();
		//var address=$("#address").val();
		var studentInd=$("#studentInd").val();
		var address=$("#address").val();
		var state=true;
		if(username=='' || identityCard=='' || img=='' || telphone=='' || password=='' || res_password=='' || coachNo=='' ||coachDriverYear=='' || studentInd=='' || coachTeachYear==''|| carNo=='' || carPno==''){
			$("#msg").css("display","block");
			$("#msg").html("信息不齐全，请输入完整.");
			//alert("信息不齐全，请输入完整.");
			state=false;
		}else{
			
			var falg= IdentityCodeValid(identityCard);
			if(!falg){
			state=false;
			}else if(password!=res_password){
				$("#msg").css("display","block");
				$("#msg").html("密码输入不一致.");
				state=false;
			}
		}
		return state;
	}

	function loadHtml(id,json,state){
		var forOption = function(o){
			var urlstr = "";
			for(var i=0;i<o.length;i++){
				try{
					if(typeof o[i]["id"] != "undefined"){
						//String opt = o[i]["branchAddress"]!="undefined"?"lang=\""+o[i]["branchAddress"]+"\"":" ";
						//String opt ="sssssdddddd ";
						if(state==0)
							urlstr+="<option value=\""+o[i]["id"]+"\">"+o[i]["name"]+"</option>";
						else
							urlstr+="<option lang=\""+o[i]["branchAddress"]+"\" value=\""+o[i]["id"]+"\">"+o[i]["name"]+"</option>";
					}
					
				}catch(e){}
				
				}
			return urlstr;
		};
		$("#"+id).append(forOption(json));
	}
	function checkFun(){
		var agree=$("#agree").attr("checked");
		
		//var agree= $("[name='checkbox']").attr("checked");
		if(agree){
			$("#btnOk").attr("disable",false);
		}else{
			$("#btnOk").attr("disable",true);
		}
	}
	
	function clickForm(id){
		if(id=='one'){
				$("#two1").removeAttr("class");
				$("#one1").attr("class","selected");
				$("#currentStudy").css("display","block");
				$("#historyStudy").css("display","none");
		}else{
				$("#one1").removeAttr("class");
				$("#two1").attr("class","selected");
				$("#secondSub").css("display","none");
				$("#historyStudy").css("display","block");
			
			}
	}
	function btnFun(id){
		if(id=='login'){
			$("#RegisterForm").css("display","none");
			$("#LoginForm").css("display","block");
		}else{
			$("#RegisterForm").css("display","block");
			$("#LoginForm").css("display","none");
		}
	}
	$(document).ready( function(){
		//load data
		var state='<%=state%>';
		var isbanded='<%=isbanded%>';
		if(state=='true' && isbanded=='false'){
		 $.post("../mainCoach", {
		   type:"common",
		   openId:$("#openId").val()
		   },
		   function(data){
			   var state=data.state;
			   if(state){
				    loadHtml("carType",data.carType,0);
					loadHtml("coachCarType",data.coachCarType,0);
					//loadHtml("channel",data.channel);
					loadHtml("branch",data.branch,1); 
					loadHtml("subject",data.subject,0);
					$("#jxDesc").html(data.jxName);
					$("#jxId").val(data.jxId);
					$("#jxName").val(data.jxName);
			   }
			   
		},'json'); 	
			
		}else if(isbanded=='true' && state=='true'){  
				$("#container").css("display","block");
				
				
				//var json=[{"coach":{"branchId":"网点编号","branchName":"网点名称","checkNum":"教练被浏览数","count":"","des":"","duteAge":"教龄N月","id":"教练编号","isHost":"false","jxId":"驾校编号","jxName":"驾校名称","likeNum":"","name":"cd名称","picUrl":"教练头像地址","score":"评分","scoreNum":"点评数","sex":"性别"},"courseDays":[{"canBookNum":"现在剩余可以预约人数","canBookNumOfam":"上午剩余可预约人数","canBookNumOfpm":"下午剩余可预约人数","courseofam":[],"courseofpm":[],"day":"课程日期","subjectId":"科目编号","subjectName":"科目名称","totalNum":"当天可接纳总人数","totalNumOfam":"上午可接纳总人数","totalNumOfpm":"下午可接纳总人数"},{"canBookNum":"现在剩余可以预约人数","canBookNumOfam":"上午剩余可预约人数","canBookNumOfpm":"下午剩余可预约人数","courseofam":[],"courseofpm":[],"day":"课程日期","subjectId":"科目编号","subjectName":"科目名称","totalNum":"当天可接纳总人数","totalNumOfam":"上午可接纳总人数","totalNumOfpm":"下午可接纳总人数"}]},{"coach":{"branchId":"网点编号","branchName":"网点名称","checkNum":"教练被浏览数","count":"","des":"","duteAge":"教龄N月","id":"教练编号","isHost":"false","jxId":"驾校编号","jxName":"驾校名称","likeNum":"","name":"教练名称","picUrl":"教练头像地址","score":"评分","scoreNum":"点评数","sex":"性别"},"courseDays":[{"canBookNum":"现在剩余可以预约人数","canBookNumOfam":"上午剩余可预约人数","canBookNumOfpm":"下午剩余可预约人数","courseofam":[],"courseofpm":[],"day":"课程日期","subjectId":"科目编号","subjectName":"科目名称","totalNum":"当天可接纳总人数","totalNumOfam":"上午可接纳总人数","totalNumOfpm":"下午可接纳总人数"},{"canBookNum":"现在剩余可以预约人数","canBookNumOfam":"上午剩余可预约人数","canBookNumOfpm":"下午剩余可预约人数","courseofam":[],"courseofpm":[],"day":"课程日期","subjectId":"科目编号","subjectName":"科目名称","totalNum":"当天可接纳总人数","totalNumOfam":"上午可接纳总人数","totalNumOfpm":"下午可接纳总人数"}]}];
			    var json=${data};
				var jsons=${datas};
				var text="<div style=\"padding:5px 0 5px -5px\">"+'${text}'+"</div>";
				var texts="<div style=\"padding:5px 0 5px -5px\">"+'${texts}'+"</div>";
				init(json,text,'current');
				init(jsons,texts,'history');
						
				
			
		}
		
		$('#btnLogin').bind('click', function(event){
		        validateAndSubmitForm();
		});
		 
		$("#agree").bind("click",function(event){
			 var checked = $("#agree:checked");
			 $("#btnOk").removeAttr("disabled");
			 if(checked&&checked.length>0){  //1 is checked 0 is unchecked
				 
			 }else{
				 $("#btnOk").attr("disabled",'false');
			 }
		});
		$("#btnOk").bind("click",function(event){

		    //var state=validata();
			var state=true;
			if(state==true){

				var username=$("#username").val();
				var carNo=$("#carNo").val();
				var carPno=$("#carPno").val();
				var identityCard=$("#identityCard").val();
				var telphone=$("#telphone").val();
				var password=$("#password").val();
				var coachNo=$("#coachNo").val();
				var coachDriverYear=$("#coachDriverYear").val();
				var coachTeachYear=$("#coachTeachYear").val();
				var studentInd=$("#studentInd").val();
				var address=$("#address").val();
				var branchId=$("#branch").val();
				var branchName=$("#branch option:selected").text();
				var carTypeId=$("#carType").val();
				var carTypeName=$("#carType option:selected").text();
				var coachCarTypeId=$("#coachCarType").val();
				var coachCarTypeName=$("#coachCarType option:selected").text();
				var sex=$("#sex").val();
				var subjectId=$("#subject").val();
				var subjectName=$("#subject option:selected").text();
				var branchAddress=$('#branch option:selected').attr("lang");
				$("#msg").css("display","none");
				var base64=$("#tempImg").html().substring(23);
				
				$.post("../mainCoach", {
					   base64 :base64,
					   identityCard:identityCard,
					   username:username,
					   telphone:telphone,
					   password:password,
					   branchAddress:branchAddress,
					   sex:sex,
					   carNo:carNo,
					   carPno:carPno,
					   subjectId:subjectId,
					   subjectName:subjectName,
					   coachNo:coachNo,
					   coachDriverYear:coachDriverYear,
					   coachTeachYear:coachTeachYear,
					   studentInd:studentInd,
					   address:address,
					   branchId:branchId,
					   branchName:branchName,
					   carTypeId:carTypeId,
					   carTypeName:carTypeName,
					   coachCarTypeId:coachCarTypeId,
					   coachCarTypeName:coachCarTypeName,
					   jxName:$("#jxName").val(),
					   jxId:$("#jxId").val(),
					   type:"resgister",
					   openId:'${openId}'
					   },
					   function(data){
						   alert(data.state);
						   var json=data.data;
						   var jsons=data.datas;
						   var text="<div style=\"padding:5px 0 5px -5px\">"+'我们的工作人员将尽快对您提交的信息进行审核，将在一个工作日之内完成审核，期待您再次访问本系统将得到答复'+"</div>";
						   var texts="<div style=\"padding:5px 0 5px -5px\">"+'我们的工作人员将尽快对您提交的信息进行审核，将在一个工作日之内完成审核，期待您再次访问本系统将得到答复'+"</div>";
						   init(json,text,'current');
						   init(jsons,texts,'history');
						   //$("#container").css("display","block");
						   
					},'json');
			}else{
				return;
			} 
		});
		
	});
	
	
	
	/**
	* 验证表单
	*/
	function validateAndSubmitForm(){
	   var username = $("#login_username").val();
	   var password = $("#login_password").val();
	   var telphone = $("#login_telphone").val();
	   var fromlineError = $("#msg-login");
	   if (username == '' || password == '' || telphone == '') {
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
	   	
	   	
	   	
	   	$.post("../mainCoach", {
			   username:username,
			   password:password,
			   telphone:telphone,
			   openId:'${openId}',
			   type:'login'
			   },
			   function(data){
				  	var state=data.state;
				  	if(state==true){
				  		$("#container").css("display","block");
				  		$("#LoginForm").css("display","none");
				  		var json=data.data;
						var jsons=data.datas;
						var text="<div style=\"padding:5px 0 5px -5px\">"+data.text+"</div>";
						var texts="<div style=\"padding:5px 0 5px -5px\">"+data.texts+"</div>";
						init(json,text,'current');
						init(jsons,texts,'history');
				  	}else{
				  		var fromlineError = $("#msg-login");
			  			fromlineError.css("display","block");
			  			fromlineError.css("color","red");
			  			fromlineError.html(data.reason);
					 
				   }
			},'json');
	   	
	   	
	   	
	   //	$("#inputForm").submit();
	   	
	   }
	}
	
	function init(json,text,state){  //text汇总信息
		var texts=text;	
		var varCoachId="";
		var forTree = function(o){
				
				for(var i=0;i<o.length;i++){
					var urlstr = "";
					try{
						if(typeof o[i]["dataLine"] != "undefined"){
							var time=o[i]["dataLine"]+o[i]["areaCode"];
							urlstr="<div><span style=\"padding-bottom:5px;\">"+time+"</span></div><div id=\"dataDetail\"><table>";
						}else{
							//var start=o[i]["start"];
							//var end=o[i]["end"];
							var dataTime=o[i]["dataTime"];
							urlstr="<tr><td>"+dataTime+"</td><td>"+o[i]["students"]+"</td></tr>";
						}
						texts+=urlstr;
						if(o[i]["dataList"] != null){
							forTree(o[i]["dataList"]);
						}
						
					}catch(e){}
					
					}
				texts += "</table></div>";
				return texts;
			};
			if(state=='current')
				document.getElementById("currentStudy").innerHTML = forTree(json);
			else
				document.getElementById("historyStudy").innerHTML = forTree(json);
		}
		
	
	
	
</script>

</html>


