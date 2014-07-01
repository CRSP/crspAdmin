<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>管理员登录页面</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
	<style type="text/css">
		<!--
		body {
			margin-left: 0px;
			margin-top: 0px;
			margin-right: 0px;
			margin-bottom: 0px;
		}
		-->
	</style>
	<link href="css/css.css" rel="stylesheet" type="text/css" />
	
  </head>
  
  <body>
  
  	<table width="100%" border="0" cellspacing="0" cellpadding="0">
  		<tr>
    		<td height="147" background="images/top02.gif"><img src="images/top03.gif" width="776" height="147" /></td>
 		 </tr>
	</table>
	<table width="562" border="0" align="center" cellpadding="0" cellspacing="0" class="right-table03">
	  <tr>
	    <td width="221"><table width="95%" border="0" cellpadding="0" cellspacing="0" class="login-text01">
	      
	      <tr>
	        <td><table width="100%" border="0" cellpadding="0" cellspacing="0" class="login-text01">
	          <tr>
	            <td align="center"><img src="images/ico13.gif" width="107" height="97" /></td>
	          </tr>
	          <tr>
	            <td height="40" align="center">&nbsp;</td>
	          </tr>
	          
	        </table></td>
	        <td><img src="images/line01.gif" width="5" height="292" /></td>
	      </tr>
	    </table></td>
	    <td>
	    	<form action="/crspAdmin/AdminSer" method="post">
		    <table width="100%" border="0" cellspacing="0" cellpadding="0">
		      <tr>
		        <td width="31%" height="35" class="login-text02">用户名称：<br /></td>
		        <td width="69%"><input name="user_name" type="text" size="30" /></td>
		      </tr>
		      <tr>
		        <td height="35" class="login-text02">密　码：<br /></td>
		        <td><input name="user_pwd" type="password" size="31" /></td>
		      </tr>
		      
		      <tr>
		        <td height="35"></td>
		        <td>${requestScope.error}</td>
		      </tr>
		      <tr>
		        <td height="35">&nbsp;</td>
		        <td><input name="Submit2" type="submit" class="right-button01" value="确认登陆" />
		          <input name="Submit232" type="reset" class="right-button02" value="重 置" /></td>
		      </tr>
		      <tr>
		      	<td><input type="hidden" name="status" value="loginAdmin" /></td>
		      </tr>
		    </table>
		    </form>
	    </td>
	  </tr>
	</table>
  
  </body>
</html>
