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
    
    <title>My JSP 'queryMock.jsp' starting page</title>
    
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
			$(".currentPage").change(function(){
				var currentPage=$(this).val();
				window.open("/crspAdmin/MockSer?status=splitPage&currentPage=" + currentPage,"_self");
			});
			$(".freezeBtn").click(function(){
				if(confirm("你确定要冻结此资源吗？")){
					$(".status").val("freezeRes");
					$(".mock_status").val("1");
					$(".res_status").val("3");
					$(this).closest("form").submit();
				}
			});
			$(".repealBtn").click(function(){
				if(confirm("你确定要撤销此举报信息吗？")){
					$(".status").val("repealMock");
					$(".mock_status").val("2");
					$(this).closest("form").submit();
				}
			});
			$(".downloadBtn").click(function(){
				$(".status").val("downloadRes");
				$(this).closest("form").submit();
			});
		});
	</script>
  </head>
  
  <body>
  <!--  
    <form action="/crspAdmin/MockSer" method="post">
    	资源名称：<input type="text" name="mockResName" value="${sessionScope.queryMockResName}" />
    	<input type="submit" value="查询" />
    	<span>每页显示数量</span>
	   	<input type="text" size="1" name="mockResSize" value="${applicationScope.mockResSize}" />
    	<input type="hidden" name="status" value="queryMock" />
    </form>
    
    <c:if test="${requestScope.mocks!=null}">
	    <table border="1">
	    	<tr>
	    		<td>序号</td>
	    		<td>举报人账号</td>
	    		<td>举报人姓名</td>
	    		<td>被举报资源名</td>
	    		<td>资源所属用户</td>
	    		<td>举报信息</td>
	    		<td>举报审核</td>
	    	</tr>
	    	
	    	<c:forEach items="${requestScope.mocks}" var="mock" varStatus="num">
	    		<tr>
	    			<td>${num.count}</td>
	    			<td>${mock.user.user_id}</td>
	    			<td>${mock.user.user_name}</td>
	    			<td>${mock.resource.name}</td>
	    			<td>${mock.resource.userId.user_name}</td>
	    			<td>${mock.content}</td>
	    			<td>
	    				<form action="/crspAdmin/MockSer" method="post">
	    					<input type="button" value="下载" class="downloadBtn" />
	    					<input type="hidden" name="path" value="${mock.resource.feature.path}" />
	    				|
	    					<input type="hidden" name="status" class="status" />
	    					<input type="hidden" name="id" value="${mock.id}" />
	    					<input type="hidden" name="res_id" value="${mock.resource.id}" />
	    					<input type="hidden" name="mock_status" class="mock_status" />
	    					<input type="hidden" name="res_status" class="res_status" />
	    					<input type="button" value="冻结" class="freezeBtn" />
	    				|
	    					<input type="button" value="撤销" class="repealBtn" />
	    				</form>
	    			</td>
	    		</tr>
	    	</c:forEach>
	    </table>
	    <a href="/crspAdmin/MockSer?status=splitPage&currentPage=1">首页</a>
	  	<c:choose>
	  		<c:when test="${sessionScope.currentPage==1}">
	  			上一页
	  		</c:when>
	  		<c:otherwise>
	  			<a href="/crspAdmin/MockSer?status=splitPage&currentPage=${sessionScope.currentPage-1}">
	  			上一页</a>
	  		</c:otherwise>
	  	</c:choose>
	  	<c:choose>
	  		<c:when test="${sessionScope.currentPage==sessionScope.countPage}">
	  			下一页
	  		</c:when>
	  		<c:otherwise>
	  			<a href="/crspAdmin/MockSer?status=splitPage&currentPage=${sessionScope.currentPage+1}">
	  			下一页</a>
	  		</c:otherwise>
	  	</c:choose>
	   	<a href="/crspAdmin/MockSer?status=splitPage&currentPage=${sessionScope.countPage}">
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
					    <form action="/crspAdmin/MockSer" method="post">
					    	查找内容：资源名称
					    	<input type="text" name="mockResName" value="${sessionScope.queryMockResName}" />
					    	<input name="Submit4" type="submit" class="right-button02" value="查询" />
					    	<span>每页显示数量</span>
						   	<input type="text" size="1" name="mockResSize" value="${applicationScope.mockResSize}" />
					    	<input type="hidden" name="status" value="queryMock" />
					    </form>
					  </td>
					   	
				     </tr>
		          	</table>
		          </td>
		        </tr>
		      </table>
		   	</td>
		  </tr>
		  
		  <c:if test="${requestScope.mocks!=null}">
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
		                    	<td height="22" colspan="10" align="center" style="font-size:16px">举报信息列表</td>
		                  </tr>
				    	  <tr bgcolor="#EEEEEE">
				    		<td>序号</td>
				    		<td>举报人账号</td>
				    		<td>举报人姓名</td>
				    		<td>被举报资源名</td>
				    		<td>资源所属用户</td>
				    		<td>举报信息</td>
				    		<td>举报审核</td>
				    	</tr>
				    	
				    	<c:forEach items="${requestScope.mocks}" var="mock" varStatus="num">
				    		<tr bgcolor="#FFFFFF">
				    			<td>${num.count}</td>
				    			<td>${mock.user.user_id}</td>
				    			<td>${mock.user.user_name}</td>
				    			<td>${mock.resource.name}</td>
				    			<td>${mock.resource.userId.user_name}</td>
				    			<td>${mock.content}</td>
				    			<td>
				    				<form action="/crspAdmin/MockSer" method="post">
				    					<input type="button" value="下载" class="downloadBtn" />
				    					<input type="hidden" name="path" value="${mock.resource.feature.path}" />
				    				|
				    					<input type="hidden" name="status" class="status" />
				    					<input type="hidden" name="id" value="${mock.id}" />
				    					<input type="hidden" name="res_id" value="${mock.resource.id}" />
				    					<input type="hidden" name="mock_status" class="mock_status" />
				    					<input type="hidden" name="res_status" class="res_status" />
				    					<input type="button" value="冻结" class="freezeBtn" />
				    				|
				    					<input type="button" value="撤销" class="repealBtn" />
				    				</form>
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
		<tr>
			<td>
				<span>[</span>
				<a href="/crspAdmin/MockSer?status=splitPage&currentPage=1">首页</a>
				<span>|</span>
			  	<c:choose>
			  		<c:when test="${sessionScope.currentPage==1}">
			  			上一页
			  		</c:when>
			  		<c:otherwise>
			  			<a href="/crspAdmin/MockSer?status=splitPage&currentPage=${sessionScope.currentPage-1}">
			  			上一页</a>
			  		</c:otherwise>
			  	</c:choose>
			  	<span>|</span>
			  	<c:choose>
			  		<c:when test="${sessionScope.currentPage==sessionScope.countPage}">
			  			下一页
			  		</c:when>
			  		<c:otherwise>
			  			<a href="/crspAdmin/MockSer?status=splitPage&currentPage=${sessionScope.currentPage+1}">
			  			下一页</a>
			  		</c:otherwise>
			  	</c:choose>
			  	<span>|</span>
			   	<a href="/crspAdmin/MockSer?status=splitPage&currentPage=${sessionScope.countPage}">
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
