<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'queryAdmin.jsp' starting page</title>
    
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
		.tabfont01 {	
			font-family: "宋体";
			font-size: 9px;
			color: #555555;
			text-decoration: none;
			text-align: center;
		}
		.font051 {font-family: "宋体";
			font-size: 12px;
			color: #333333;
			text-decoration: none;
			line-height: 20px;
		}
		.font201 {font-family: "宋体";
			font-size: 12px;
			color: #FF0000;
			text-decoration: none;
		}
		.button {
			font-family: "宋体";
			font-size: 14px;
			height: 37px;
		}
		html { overflow-x: auto; overflow-y: auto; border:0;} 
		-->
	</style>
		
	<link href="/crspAdmin/css/css.css" rel="stylesheet" type="text/css" />
	<script type="text/JavaScript">
		
	</script>
	<link href="/crspAdmin/css/style.css" rel="stylesheet" type="text/css" />
	

	<script type="text/javascript" src="/crspAdmin/js/jquery-1.9.1.min.js"></script>
	<script type="text/javascript">
		$("document").ready(function(){
			$(".deleteBtn").click(function(){
				if(confirm("你确定要删除此管理员吗？")){
					$(this).parent().parent().remove();
			        $.post("/crspAdmin/AdminSer",{status:"deleteAdmin",id:$(this).attr("name")});
			    }
			});
		});
	</script>
	
  </head>
  
  <body>
  	<!--
    <form action="/crspAdmin/AdminSer" method="post">
    	登录名：<input type="text" name="user_name" value="${sessionScope.queryAdminName}" />
    	<input type="submit" value="查询" />
    	<input type="hidden" name="status" value="queryAdmin" />
    	
    </form>
    
    <c:if test="${requestScope.admins!=null}">
	    <table border="0" width="500" class="newfont03">
	    	<tr bgcolor="#464646" class="CTitle" >
                <td height="22" colspan="7" align="center" style="font-size:16px">管理员信息列表</td>
            </tr>
	    	<tr bgcolor="#EEEEEE">
	    		<td>序号</td>
	    		<td>编号</td>
	    		<td>登录名</td>
	    		<td>删除</td>
	    	</tr>
	    	
	    	<c:forEach items="${requestScope.admins}" var="admin" varStatus="num">
	    		<tr>
	    			<td>${num.count}</td>
	    			<td>${admin.id}</td>
	    			<td>${admin.user_name}</td>
	    			<td>
	    				<input type="button" value="删除" class="deleteBtn" name="${admin.id}" />
	    			</td>
	    		</tr>
	    	</c:forEach>
	    </table>
	</c:if>
	-->
	
	
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
  		<tr>
			<td height="30">      
			  <table width="100%" border="0" cellspacing="0" cellpadding="0">
		        <tr>
		          <td height="62" background="/crspAdmin/images/nav04.gif">
		            
				   <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
				    <tr>
					  <td width="21"><img src="/crspAdmin/images/ico07.gif" width="20" height="18" /></td>
					  <td width="538">
						<form action="/crspAdmin/AdminSer" method="post">
							查找内容：登录名：
							<input type="text" name="user_name" value="${sessionScope.queryAdminName}" />
							<input name="Submit4" type="submit" class="right-button02" value="查 询" />
							<input type="hidden" name="status" value="queryAdmin" />
						</form>
					  </td>
					   	
				     </tr>
		          	</table>
		          </td>
		        </tr>
		      </table>
		   	</td>
		  </tr>
		  
		  <c:if test="${requestScope.admins!=null}">
		  <tr>
		    <td>
		    <table id="subtree1" style="DISPLAY: " width="100%" border="0" cellspacing="0" cellpadding="0">
		        <tr>
		          <td><table width="500" border="0" cellpadding="0" cellspacing="0">
		          	 
		              <tr>
		                <td height="40" class="font42">
						<table width="500" border="0" cellpadding="4" cellspacing="1" bgcolor="#464646" class="newfont03">
						 <tr class="CTitle" >
		                    	<td height="22" colspan="4" align="center" style="font-size:16px">管理员信息列表</td>
		                  </tr>
		                  <tr bgcolor="#EEEEEE">
				    		<td>序号</td>
				    		<td>编号</td>
				    		<td>登录名</td>
				    		<td>删除</td>
				    	  </tr>
		                  
		                  <c:forEach items="${requestScope.admins}" var="admin" varStatus="num">
		                  	<tr bgcolor="#FFFFFF">
				    			<td>${num.count}</td>
				    			<td>${admin.id}</td>
				    			<td>${admin.user_name}</td>
				    			<td>
				    				<input type="button" value="删除" class="deleteBtn" name="${admin.id}" />
				    			</td>
				    		</tr>
				    	</c:forEach>
		            </table>
		            </td>
		        </tr>
		      </table>
		      </td>
		    </tr>
		 </table>
		 </td>
		</tr>
		</c:if>
	</table>
	
  </body>
</html>

