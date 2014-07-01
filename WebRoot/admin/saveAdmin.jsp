<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'saveAdmin.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
		.error{
			color:#ff0000;
		}
	</style>
	
	<script type="text/javascript" src="/crspAdmin/js/jquery-1.9.1.min.js"></script>
	<script type="text/javascript">
		$("document").ready(function(){
			$("#user_name").blur(function(){
				var user_name=$(this).val();
				if(user_name==""){
					$("#UserNameError").html("用户名不能为空");
				}else{
					$.post("/crspAdmin/AdminSer",
						{status:"queryUserName",user_name:user_name},
						function(data){
							if(data=="true"){
								$("#UserNameError").html("该用户已存在");
							}else{
								$("#UserNameError").html("此用户可以注册");
							}
						});
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
			$(".submitBtn").click(function(){
				$.post("/crspAdmin/AdminSer",
						{status:"saveAdmin",
						user_name:$("#user_name").val(),
						user_pwd:$("#user_pwd1").val(),
						user_pwd2:$("#user_pwd2").val()},
						function(data){
							if(data=="true"){
								alert("添加成功");
							}else{
								alert("添加失败");
							}
						});
			});
			$(".resetBtn").click(function(){
				$("#user_name").val("");
				$("#user_pwd1").val("");
				$("#user_pwd2").val("");
			});
		});
	</script>
  
  </head>
  
  <body>
  <!--
    	添加管理员<br/>
    	
  		登录名：<input type="text" name="user_name" id="user_name" />
  		<span class="error" id="UserNameError"></span><br/>
  		
  		密码：<input type="password" name="user_pwd" id="user_pwd1" />
  		<span class="error" id="UserPwdError1"></span><br/>
  		
  		确认密码：<input type="password" name="user_pwd2" id="user_pwd2" />
  		<span class="error" id="UserPwdError2"></span><br/>
  		
  		<input type="button" value="提交" class="submitBtn" />
  		<input type="reset" value="重置" />
  	-->
  		
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
			  <tr>
			    <td width="45" valign="top"><img src="/crspAdmin/user2/images/register_03.gif" width="45" height="386" /></td>
			    <td width="623" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
			      <tr>
			        <td><img src="/crspAdmin/user2/images/register_04.gif" width="623" height="135" /></td>
			      </tr>
			    </table>
			      <table width="100%" border="0" cellspacing="0" cellpadding="0">
			        <tr>
			          <td background="/crspAdmin/user2/images/register_28.gif">
			            <table width="100%" height="158" border="0" cellpadding="0" cellspacing="0">
			              <tr>
			                <td align="center"><table width="272" border="0" cellspacing="0" cellpadding="0">
			                  <tr>
			                    <td width="123" height="25" align="left"><img src="/crspAdmin/user2/images/register_10.gif" width="79" height="17" /></td>
			                    <td width="268" align="left">
						        	<input type="text" name="user_name" id="user_name" /><br/>
			  						<span class="error" id="UserNameError"></span>
			                    </td>
			                  </tr>
			                  <tr>
			                    <td height="25" align="left"><img src="/crspAdmin/user2/images/register_15.gif" width="79" height="17" /></td>
			                    <td align="left">
			                    	<input type="password" name="user_pwd" id="user_pwd1" /><br/>
  									<span class="error" id="UserPwdError1"></span>
  								</td>
			                  </tr>
			                  <tr>
			                    <td height="25" align="left"><img src="/crspAdmin/user2/images/register_17.gif" width="76" height="19" /></td>
			                    <td align="left">
			                    	<input type="password" name="user_pwd2" id="user_pwd2" /><br/>
						  			<span class="error" id="UserPwdError2"></span>
						  		</td>
			                  </tr>
			                </table></td>
			                <td width="232" align="right" valign="top"><img src="/crspAdmin/user2/images/register_08.gif" width="232" height="172" /></td>
			                </tr>
			            </table>
			                    <table width="623" height="41" border="0" cellpadding="0" cellspacing="0">
			                      <tr align="center">
						<td width="201">&nbsp;</td>
			                        <td width="107"><input type="image" src="/crspAdmin/user2/images/register_22.gif" width="82" height="23" class="submitBtn"  /></td>
			                        <td width="62"><input  type="image" src="/crspAdmin/user2/images/rr_24.gif" width="62" height="23" class="resetBtn" /></td>
						<td width="201">&nbsp;</td>
			                      </tr>
			                    </table>
			          </td>
			        </tr>
			      </table>
			      <table width="100%" border="0" cellspacing="0" cellpadding="0">
			        <tr>
			          <td width="9"><img src="/crspAdmin/user2/images/register_31.gif" width="9" height="44" /></td>
			          <td background="/crspAdmin/user2/images/register_32.gif">&nbsp;</td>
			          <td width="11"><img src="/crspAdmin/user2/images/register_34.gif" width="11" height="44" /></td>
			        </tr>
			      </table>
			      <table width="100%" border="0" cellspacing="0" cellpadding="0">
			        <tr>
			          <td>&nbsp;</td>
			        </tr>
			      </table>
			      <table width="100%" border="0" cellspacing="0" cellpadding="0">
			        <tr>
			          <td>&nbsp;</td>
			        </tr>
			      </table></td>
			    <td class="bg">&nbsp;</td>
			  </tr>
			</table>
			<iframe id="ifr" name="ifr" style="display:none" ></iframe>
  </body>
</html>
