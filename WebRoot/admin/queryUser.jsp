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
    
    <title>My JSP 'queryUser.jsp' starting page</title>
    
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
			$(".update").click(function(){
				var pointsTd=$(this).parent().prev();
				if($(this).val()=="更新"){
					$(this).val("确认");
					pointsTd.html("<input type='text' value=" + pointsTd.html() + " />");
				}else{
					$(this).val("更新");
					pointsTd.html(pointsTd.children().val());
					//发送一个异步请求，让后台与前台同步
					$.post("/crspAdmin/UserSer",{
						status:"updatePoints",
						id:$(this).attr("name"),
						points:pointsTd.html()});
				}
			});
			
			$(".currentPage").change(function(){
				var currentPage=$(this).val();
				window.open("/crspAdmin/UserSer?status=splitPage&currentPage=" + currentPage,"_self");
			});
		});
	</script>

  </head>
  
  <body>
  <!--
    <form action="/crspAdmin/UserSer" method="post">
    	登录名：<input type="text" name="user_id" value="${sessionScope.queryUserId}" />
    	<input type="submit" value="查询" />
    	<span>每页显示数量</span>
	   	<input type="text" size="1" name="userSize" value="${applicationScope.userSize}" />
    	<input type="hidden" name="status" value="queryUser" />
    </form>
    
    <c:if test="${requestScope.users!=null}">
	    <table border="1">
	    	<tr>
	    		<td>编号</td>
	    		<td>主键</td>
	    		<td>所在学校</td>
	    		<td>所属院系</td>
	    		<td>登录账号</td>
	    		<td>用户昵称</td>
	    		<td>用户头像</td>
	    		<td>用户积分</td>
	    		<td>积分操作</td>
	    		<td>电子邮箱</td>
	    	</tr>
	    	
	    	<c:forEach items="${requestScope.users}" var="user" varStatus="num">
	    		<tr>
	    			<td>${num.count}</td>
	    			<td>${user.id}</td>
	    			<td>${user.school.name}</td>
	    			<td>${user.department.name}</td>
	    			<td>${user.user_id}</td>
	    			<td>${user.user_name}</td>
	    			<td>
	    				<img src="/avatars/user_avatar/${user.avatar}" />
	    			</td>
	    			<td>${user.points}</td>
	    			<td>
	    				<input type="button" value="更新" class="update" name="${user.id}" />
	    			</td>
	    			<td>${user.email}</td>
	    			
	    		</tr>
	    	</c:forEach>
	    </table>
	    <a href="/crspAdmin/UserSer?status=splitPage&currentPage=1">首页</a>
	  	<c:choose>
	  		<c:when test="${sessionScope.currentPage==1}">
	  			上一页
	  		</c:when>
	  		<c:otherwise>
	  			<a href="/crspAdmin/UserSer?status=splitPage&currentPage=${sessionScope.currentPage-1}">
	  			上一页</a>
	  		</c:otherwise>
	  	</c:choose>
	  	<c:choose>
	  		<c:when test="${sessionScope.currentPage==sessionScope.countPage}">
	  			下一页
	  		</c:when>
	  		<c:otherwise>
	  			<a href="/crspAdmin/UserSer?status=splitPage&currentPage=${sessionScope.currentPage+1}">
	  			下一页</a>
	  		</c:otherwise>
	  	</c:choose>
	   	<a href="/crspAdmin/UserSer?status=splitPage&currentPage=${sessionScope.countPage}">
	   	尾页</a>
	   	
	   	<select class="currentPage">
	   		<c:forEach begin="1" end="${sessionScope.countPage}" step="1" var="num">
	   			<c:choose>
	   				<c:when test="${sessionScope.currentPage==num}">
	   					<option value="${num}" selected="selected">${num}</option>
	   				</c:when>
	   				<c:otherwise>
	   					<option value="${num}" >${num}</option>
	   				</c:otherwise>
	   			</c:choose>
	   		</c:forEach>
	   	</select>
	   	
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
						<form action="/crspAdmin/UserSer" method="post">
					    	查找内容：登录名
					    	<input type="text" name="user_id" value="${sessionScope.queryUserId}" />
					    	<input name="Submit4" type="submit" class="right-button02" value="查 询" />
					    	<span>每页显示数量</span>
						   	<input type="text" size="1" name="userSize" value="${applicationScope.userSize}" />
					    	<input type="hidden" name="status" value="queryUser" />
					    </form>
					  </td>
					   	
				     </tr>
		          	</table>
		          </td>
		        </tr>
		      </table>
		   	</td>
		  </tr>
		  
		  <c:if test="${requestScope.users!=null}">
		  <tr>
		    <td>
		    <table id="subtree1" style="DISPLAY: " width="100%" border="0" cellspacing="0" cellpadding="0">
		        <tr>
		          <td>
		            <table width="100%" border="0" cellpadding="0" cellspacing="0">
		              <tr>
		                <td height="40" class="font42">
						<table width="100%" border="0" cellpadding="4" cellspacing="1" bgcolor="#464646" class="newfont03">
						 <tr class="CTitle" >
		                    	<td height="22" colspan="10" align="center" style="font-size:16px">用户信息列表</td>
		                  </tr>
				    	  <tr bgcolor="#EEEEEE">
				    		<td>编号</td>
				    		<td>主键</td>
				    		<td>所在学校</td>
				    		<td>所属院系</td>
				    		<td>登录账号</td>
				    		<td>用户昵称</td>
				    		<td>用户头像</td>
				    		<td>用户积分</td>
				    		<td>积分操作</td>
				    		<td>电子邮箱</td>
				    	  </tr>
		                  
		                  <c:forEach items="${requestScope.users}" var="user" varStatus="num">
				    		<tr bgcolor="#FFFFFF">
				    			<td>${num.count}</td>
				    			<td>${user.id}</td>
				    			<td>${user.school.name}</td>
				    			<td>${user.department.name}</td>
				    			<td>${user.user_id}</td>
				    			<td>${user.user_name}</td>
				    			<td>
				    				<img src="/CRSP/views/avatars/${user.avatar}" height="60" width="60" />
				    			</td>
				    			<td>${user.points}</td>
				    			<td>
				    				<input type="button" value="更新" class="update" name="${user.id}" />
				    			</td>
				    			<td>${user.email}</td>
				    			
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
		<tr>
			<td>
				<span>[</span>
				<a href="/crspAdmin/UserSer?status=splitPage&currentPage=1">首页</a>
				<span>|</span>
				  	<c:choose>
				  		<c:when test="${sessionScope.currentPage==1}">
				  			上一页
				  		</c:when>
				  		<c:otherwise>
				  			<a href="/crspAdmin/UserSer?status=splitPage&currentPage=${sessionScope.currentPage-1}">
				  			上一页</a>
				  		</c:otherwise>
				  	</c:choose>
				  	<span>|</span>
				  	<c:choose>
				  		<c:when test="${sessionScope.currentPage==sessionScope.countPage}">
				  			下一页
				  		</c:when>
				  		<c:otherwise>
				  			<a href="/crspAdmin/UserSer?status=splitPage&currentPage=${sessionScope.currentPage+1}">
				  			下一页</a>
				  		</c:otherwise>
				  	</c:choose>
				  	<span>|</span>
				   	<a href="/crspAdmin/UserSer?status=splitPage&currentPage=${sessionScope.countPage}">
				   	尾页</a>
				   	<span>]</span>
			   		<span>转至：</span>
				   	
				   	<select class="currentPage">
				   		<c:forEach begin="1" end="${sessionScope.countPage}" step="1" var="num">
				   			<c:choose>
				   				<c:when test="${sessionScope.currentPage==num}">
				   					<option value="${num}" selected="selected">${num}</option>
				   				</c:when>
				   				<c:otherwise>
				   					<option value="${num}" >${num}</option>
				   				</c:otherwise>
				   			</c:choose>
				   		</c:forEach>
				   	</select>
			</td>
		</tr>
		</c:if>
	</table>
	
  </body>
</html>
