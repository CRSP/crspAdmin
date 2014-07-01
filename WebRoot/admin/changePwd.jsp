<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'updateAdmin.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
	<link rel="stylesheet" rev="stylesheet" href="/crspAdmin/css/style.css" type="text/css" media="all" />
	
	<style type="text/css">
		.error{
			color:#ff0000;
		}
	</style>
	
	<script type="text/javascript" src="/crspAdmin/js/jquery-1.9.1.min.js"></script>
	<script type="text/javascript">
		$("document").ready(function(){
			$("#user_pwd").blur(function(){
				if($(this).val()==""){
					$("#UserPwdError").html("密码不能为空");
				}else{
					$("#UserPwdError").html("");
				}
			});
			$("#user_pwd1").blur(function(){
				if($(this).val()==""){
					$("#UserPwdError1").html("密码不能为空");
				}else{
					$("#UserPwdError1").html("");
				}
			});
			$("#user_pwd2").blur(function(){
				if($("#user_pwd1").val()==$(this).val()){
					$("#UserPwdError2").html("");
				}else{
					$("#UserPwdError2").html("两次输入的密码不一致");
				}
			});
			$("#submitBtn").click(function(){
				$.post("/crspAdmin/AdminSer",
						{status:"changePwd",
						user_pwd:$("#user_pwd").val(),
						user_pwd1:$("#user_pwd1").val(),
						user_pwd2:$("#user_pwd2").val()},
						function(data){
							if(data=="true"){
								alert("修改成功");
							}else{
								alert("修改失败");
							}
						});
			});
			$("#resetBtn").click(function(){
				$("#user_pwd").val("");
				$("#user_pwd1").val("");
				$("#user_pwd2").val("");
			});
		});
	</script>

  </head>
  
  <body>
  <!--  
	  	修改密码页面<br/>
	  	
	  	旧密码：<input type="password" name="user_pwd" id="user_pwd" />
	  	<span class="error" id="UserPwdError"></span><br/>
	  	
	  	新密码：<input type="password" name="user_pwd1" id="user_pwd1" />
	  	<span class="error" id="UserPwdError1"></span><br/>
	  	
	  	确认新密码：<input type="password" name="user_pwd2" id="user_pwd2" />
	  	<span class="error" id="UserPwdError2"></span><br/>
	  	
	  	<input type="button" value="确认" class="submitBtn" />
	  	<input type="reset" value="重置" />
	-->
	
	<div class="MainDiv">
		<table width="99%" border="0" cellpadding="0" cellspacing="0" class="CContent">
		  <tr>
		      <th class="tablestyle_title" >修改密码</th>
		  </tr>
		  <tr>
		    <td class="CPanel">
				
				<table border="0" cellpadding="0" cellspacing="0" style="width:100%">
				<tr><td align="left">
					<input type="button" name="Submit2" value="返回" class="button" onclick="window.history.go(-1);"/>
				</td></tr>
				<TR>
					<TD width="100%">
						<fieldset style="height:100%;">
						<legend>修改密码</legend>
							  <table border="0" cellpadding="2" cellspacing="1" style="width:100%">
							  	<tr>
							  		<td nowrap align="right" width="11%">旧密码：</td>
							  		<td>
							  			<input type="password" name="user_pwd" id="user_pwd" />
						  				<span class="error" id="UserPwdError"></span>
							  		</td>
							  	</tr>
							  	<tr>
							  		<td nowrap align="right" width="11%">新密码：</td>
							  		<td>
							  			<input type="password" name="user_pwd1" id="user_pwd1" />
						  				<span class="error" id="UserPwdError1"></span>
							  		</td>
							  	</tr>
							  	<tr>
							  		<td nowrap align="right" width="11%">确认新密码：</td>
							  		<td>
							  			<input type="password" name="user_pwd2" id="user_pwd2" />
						  				<span class="error" id="UserPwdError2"></span>
							  		</td>
							  	</tr>
							  </table>
					  <br/>
						</fieldset>			</TD>
				</TR>
				</TABLE>
			 </td>
		  </tr>
				<TR>
					<TD colspan="2" align="center" height="50px">
						<input type="button" value="确认" class="button" id="submitBtn" />
						
						<input type="button" value="重置" class="button" id="resetBtn" />
					</TD>
				</TR>
		</TABLE>
		</div>
  </body>
</html>
