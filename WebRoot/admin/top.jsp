<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'top.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

	<style type="text/css">
		
		body {
			margin-left: 0px;
			margin-top: 0px;
			margin-right: 0px;
			margin-bottom: 0px;
		}
	</style>
	<link href="/crspAdmin/css/css.css" rel="stylesheet" type="text/css" />
  </head>
  
  <body>
  	<!--
    	您好，${sessionScope.loginAdmin.user_name}！欢迎来到高校资源管理后台,
    	<a href="/crspAdmin/AdminSer?status=loginOut" target="_parent">退出</a>，
    	<a href="/crspAdmin/admin/changePwd.jsp" target="right">修改密码</a>
    -->
    	
    	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		  <tr>
		    <td height="59" background="/crspAdmin/images/top.gif">
		    <table width="99%" border="0" cellspacing="0" cellpadding="0">
		      <tr>
		        <td width="1%"><img src="/crspAdmin/images/logo.jpg" width="557" height="59" border="0" /></td>
		        <td width="64%" align="right" style="font-size:12px;vertical-align:bottom;">欢迎进入后台</td>
		      </tr>
		    </table>
		    </td>
		  </tr>
		</table>
  </body>
</html>
