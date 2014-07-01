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
    
    <title>My JSP 'querySchDept.jsp' starting page</title>
    
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

  <style type="text/css">
		.schoolId{
			display:none;
		}
		.departmentId{
			display:none;
		}
	</style>
	<script type="text/javascript" src="/crspAdmin/js/jquery-1.9.1.min.js"></script>
	<script type="text/javascript">
		$("document").ready(function(){
			var schoolId=null;
			var schoolName=null;
			var departmentId=null;
			var departmentName=null;
			$(".updateBtn").click(function(){
				var schoolTd=$(this).parent().prev().prev();
				var departmentTd=$(this).parent().prev();
				if($(this).val()=="更新"){
					$(this).val("确认");
					schoolTd.children(".schoolId").css("display","block");
					departmentTd.children(".departmentId").css("display","block");
					schoolTd.children(".schoolName").html("");
					departmentTd.children(".departmentName").html("");
					
					schoolId=schoolTd.children(".schoolId").children('option:selected').val();
					schoolName=schoolTd.children(".schoolId").children('option:selected').html();
					$(".schoolId").change(function(){
						schoolId=$(this).children('option:selected').val();
						schoolName=$(this).children('option:selected').html();
					});
					
					departmentId=departmentTd.children(".departmentId").children('option:selected').val();
					departmentName=departmentTd.children(".departmentId").children('option:selected').html();
					$(".departmentId").change(function(){
						departmentId=$(this).children('option:selected').val();
						departmentName=$(this).children('option:selected').html();
					});
				}else{
					$(this).val("更新");
					schoolTd.children(".schoolId").css("display","none");
					departmentTd.children(".departmentId").css("display","none");
					schoolTd.children(".schoolName").html(schoolName);
					departmentTd.children(".departmentName").html(departmentName);
					//发送一个异步请求，让后台与前台同步
					$.post("/crspAdmin/SchDeptSer",{
						status:"updateSchDept",
						id:$(this).attr("name"),
						schoolId:schoolId,
						departmentId:departmentId});
				}
			});
			$(".deleteBtn").click(function(){
				if(confirm("你确定要删除此学校院系关系吗？")){
					$(this).parent().parent().remove();
					//发送一个删除请求给Ser
					$.post("/crspAdmin/SchDeptSer",{status:"deleteSchDept",id:$(this).attr("name")});
				}
			});
			$(".currentPage").change(function(){
				var currentPage=$(this).val();
				window.open("/crspAdmin/SchDeptSer?status=splitPage&currentPage=" + currentPage,"_self");
			});
		});
	</script>
	
  </head>
  
  <body>
  <!--  
    <form action="/crspAdmin/SchDeptSer" method="post">
    	学校名：<input type="text" name="schoolName" value="${sessionScope.querySchDeptName}" />
    	<input type="submit" value="查询" />
    	<span>每页显示数量</span>
	   	<input type="text" size="1" name="schDeptSize" value="${applicationScope.schDeptSize}" />
    	<input type="hidden" name="status" value="querySchDeptName" />
    </form>
    
    <c:if test="${requestScope.schDepts!=null}">
	    <table border="1" width="500">
	    	<tr>
	    		<td>序号</td>
	    		<td>学校号</td>
	    		<td>院系名</td>
	    		<td>更新</td>
	    		<td>删除</td>
	    	</tr>
	    	
	    	<c:forEach items="${requestScope.schDepts}" var="schDept" varStatus="num">
	    		<tr>
	    			<td>${num.count}</td>
	    			<td>
	    				<span class="schoolName">${schDept.school.name}</span>
	    				<select class="schoolId">
    						<c:forEach items="${applicationScope.schools}" var="school">
    							<c:choose>
    								<c:when test="${school.id==schDept.school.id}">
    									<option value="${school.id}" selected="selected">${school.name}</option>
    								</c:when>
    								<c:otherwise>
    									<option value="${school.id}">${school.name}</option>
    								</c:otherwise>
    							</c:choose>
    						</c:forEach>
    					</select>
	    			</td>
	    			<td>
	    				<span class="departmentName">${schDept.department.name}</span>
	    				<select class="departmentId">
    						<c:forEach items="${applicationScope.departments}" var="department">
    							<c:choose>
    								<c:when test="${department.id==schDept.department.id}">
    									<option value="${department.id}" selected="selected">${department.name}</option>
    								</c:when>
    								<c:otherwise>
    									<option value="${department.id}">${department.name}</option>
    								</c:otherwise>
    							</c:choose>
    						</c:forEach>
    					</select>
	    			</td>
	    			<td>
	    				<input type="button" value="更新" class="updateBtn" name="${schDept.id}" />
	    			</td>
	    			<td>
	    				<input type="button" value="删除" class="deleteBtn" name="${schDept.id}" />
	    			</td>
	    		</tr>
	    	</c:forEach>
	    </table>
	    <a href="/crspAdmin/SchDeptSer?status=splitPage&currentPage=1">首页</a>
	  	<c:choose>
	  		<c:when test="${sessionScope.currentPage==1}">
	  			上一页
	  		</c:when>
	  		<c:otherwise>
	  			<a href="/crspAdmin/SchDeptSer?status=splitPage&currentPage=${sessionScope.currentPage-1}">
	  			上一页</a>
	  		</c:otherwise>
	  	</c:choose>
	  	<c:choose>
	  		<c:when test="${sessionScope.currentPage==sessionScope.countPage}">
	  			下一页
	  		</c:when>
	  		<c:otherwise>
	  			<a href="/crspAdmin/SchDeptSer?status=splitPage&currentPage=${sessionScope.currentPage+1}">
	  			下一页</a>
	  		</c:otherwise>
	  	</c:choose>
	   	<a href="/crspAdmin/SchDeptSer?status=splitPage&currentPage=${sessionScope.countPage}">
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
					    <form action="/crspAdmin/SchDeptSer" method="post">
					    	查找内容：学校名
					    	<input type="text" name="schoolName" value="${sessionScope.querySchDeptName}" />
					    	<input name="Submit4" type="submit" class="right-button02" value="查询" />
					    	<span>每页显示数量</span>
						   	<input type="text" size="1" name="schDeptSize" value="${applicationScope.schDeptSize}" />
					    	<input type="hidden" name="status" value="querySchDeptName" />
					    </form>
					  </td>
					   	
				     </tr>
		          	</table>
		          </td>
		        </tr>
		      </table>
		   	</td>
		  </tr>
		  
		  <c:if test="${requestScope.schDepts!=null}">
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
		                    	<td height="22" colspan="10" align="center" style="font-size:16px">院校信息列表</td>
		                  </tr>
				    	  <tr bgcolor="#EEEEEE">
				    		<td>序号</td>
				    		<td>学校号</td>
				    		<td>院系名</td>
				    		<td>更新</td>
				    		<td>删除</td>
				    	  </tr>
		                  
				    	<c:forEach items="${requestScope.schDepts}" var="schDept" varStatus="num">
			    		<tr bgcolor="#FFFFFF">
			    			<td>${num.count}</td>
			    			<td>
			    				<span class="schoolName">${schDept.school.name}</span>
			    				<select class="schoolId">
		    						<c:forEach items="${applicationScope.schools}" var="school">
		    							<c:choose>
		    								<c:when test="${school.id==schDept.school.id}">
		    									<option value="${school.id}" selected="selected">${school.name}</option>
		    								</c:when>
		    								<c:otherwise>
		    									<option value="${school.id}">${school.name}</option>
		    								</c:otherwise>
		    							</c:choose>
		    						</c:forEach>
		    					</select>
			    			</td>
			    			<td>
			    				<span class="departmentName">${schDept.department.name}</span>
			    				<select class="departmentId">
		    						<c:forEach items="${applicationScope.departments}" var="department">
		    							<c:choose>
		    								<c:when test="${department.id==schDept.department.id}">
		    									<option value="${department.id}" selected="selected">${department.name}</option>
		    								</c:when>
		    								<c:otherwise>
		    									<option value="${department.id}">${department.name}</option>
		    								</c:otherwise>
		    							</c:choose>
		    						</c:forEach>
		    					</select>
			    			</td>
			    			<td>
			    				<input type="button" value="更新" class="updateBtn" name="${schDept.id}" />
			    			</td>
			    			<td>
			    				<input type="button" value="删除" class="deleteBtn" name="${schDept.id}" />
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
				<a href="/crspAdmin/SchDeptSer?status=splitPage&currentPage=1">首页</a>
				<span>|</span>
			  	<c:choose>
			  		<c:when test="${sessionScope.currentPage==1}">
			  			上一页
			  		</c:when>
			  		<c:otherwise>
			  			<a href="/crspAdmin/SchDeptSer?status=splitPage&currentPage=${sessionScope.currentPage-1}">
			  			上一页</a>
			  		</c:otherwise>
			  	</c:choose>
			  	<span>|</span>
			  	<c:choose>
			  		<c:when test="${sessionScope.currentPage==sessionScope.countPage}">
			  			下一页
			  		</c:when>
			  		<c:otherwise>
			  			<a href="/crspAdmin/SchDeptSer?status=splitPage&currentPage=${sessionScope.currentPage+1}">
			  			下一页</a>
			  		</c:otherwise>
			  	</c:choose>
			  	<span>|</span>
			   	<a href="/crspAdmin/SchDeptSer?status=splitPage&currentPage=${sessionScope.countPage}">
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
