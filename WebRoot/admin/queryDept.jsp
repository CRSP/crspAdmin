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
    
    <title>My JSP 'queryDept.jsp' starting page</title>
    
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
			$(".updateBtn").click(function(){
				var nameTd=$(this).parent().prev().prev().prev();
				var descriptionTd=$(this).parent().prev().prev();
				//var avatarTd=$(this).parent().prev().prev();
				if($(this).val()=="更新"){
					$(this).val("确认");
					nameTd.html("<input type='text' value=" + nameTd.html() + " />");
					descriptionTd.html("<textarea rows='6' cols='50' >" + descriptionTd.children().val() + "</textarea>");
					//avatarTd.html("<input type='text' value=" + avatarTd.html() + " />");
				}else{
					$(this).val("更新");
					nameTd.html(nameTd.children().val());
					descriptionTd.html("<input type='text' size='20' value=" + descriptionTd.children().val() + " disabled />");
					//avatarTd.html(avatarTd.children().val());
					//发送一个异步请求，让后台与前台同步
					$.post("/crspAdmin/DeptSer",{
						status:"updateDept",
						id:$(this).attr("name"),
						name:nameTd.html(),
						description:descriptionTd.children().val()
						//avatar:avatarTd.html()
						});
				}
			});
			$(".deleteBtn").click(function(){
				if(confirm("你确定要删除此院系吗？")){
					$(this).parent().parent().remove();
					//发送一个删除请求给Ser
					$.post("/crspAdmin/DeptSer",{status:"deleteDept",id:$(this).attr("name")});
				}
			});
		});
	</script>
	
  </head>
  
  <body>
  <!--  
    <form action="/crspAdmin/DeptSer" method="post">
    	院系名称：<input type="text" name="name" value="${sessionScope.queryDeptName}" />
    	<input type="submit" value="查询" />
    	<input type="hidden" name="status" value="queryDept" />
    </form>
    
    <c:if test="${requestScope.departments!=null}">
	    <table border="1">
	    	<tr>
	    		<td>序号</td>
	    		<td>院系编号</td>
	    		<td>院系名称</td>
	    		<td>院系描述</td>
	    		<td>资源数量</td>
	    		<td>更新</td>
	    		<td>删除</td>
	    	</tr>
	    	
	    	<c:forEach items="${requestScope.departments}" var="department" varStatus="num">
	    		<tr>
	    			<td>${num.count}</td>
	    			<td>${department.id}</td>
	    			<td>${department.name}</td>
	    			<td>
	    				<input type="text" size="20" value="${department.description}" disabled />
	    			</td>
	    			<td>${department.resource_count}</td>
	    			<td>
	    				<input type="button" value="更新" class="updateBtn" name="${department.id}" />
	    			</td>
	    			<td>
	    				<input type="button" value="删除" class="deleteBtn" name="${department.id}" />
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
					    <form action="/crspAdmin/DeptSer" method="post">
					    	查找内容：院系名称
					    	<input type="text" name="name" value="${sessionScope.queryDeptName}" />
					    	<input name="Submit4" class="right-button02" type="submit" value="查询" />
					    	<input type="hidden" name="status" value="queryDept" />
					    </form>
					  </td>
					   	
				     </tr>
		          	</table>
		          </td>
		        </tr>
		      </table>
		   	</td>
		  </tr>
		  
		  <c:if test="${requestScope.departments!=null}">
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
		                    	<td height="22" colspan="10" align="center" style="font-size:16px">院系信息列表</td>
		                  </tr>
				    	  <tr bgcolor="#EEEEEE">
				    		<td>序号</td>
				    		<td>院系编号</td>
				    		<td>院系名称</td>
				    		<td>院系描述</td>
				    		<td>资源数量</td>
				    		<td>更新</td>
				    		<td>删除</td>
				    	  </tr>
		                  
				    	<c:forEach items="${requestScope.departments}" var="department" varStatus="num">
				    		<tr bgcolor="#FFFFFF">
				    			<td>${num.count}</td>
				    			<td>${department.id}</td>
				    			<td>${department.name}</td>
				    			<td>
				    				<input type="text" size="20" value="${department.description}" disabled />
				    			</td>
				    			<td>${department.resource_count}</td>
				    			<td>
				    				<input type="button" value="更新" class="updateBtn" name="${department.id}" />
				    			</td>
				    			<td>
				    				<input type="button" value="删除" class="deleteBtn" name="${department.id}" />
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
