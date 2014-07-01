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
    
    <title>My JSP 'saveSchDept.jsp' starting page</title>
    
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
			$(".deptId").change(function(){
				;
				$(".deptId").val();
				$.post("/crspAdmin/SchDeptSer",
							{status:"querySchDept",
							schoolId:$(".schoolId").val(),
							deptId:$(".deptId").val()},
							function(data){
								if(data=="true"){
									$("#nameError").html("该学校已存在此院系");
								}else{
									$("#nameError").html("该学校可以新增此院系");
								}
							});
			});
			$("#submitBtn").click(function(){
				$.post("/crspAdmin/SchDeptSer",
						{status:"saveSchDept",
						schoolId:$(".schoolId").val(),
						deptId:$(".deptId").val()},
						function(data){
							if(data=="true"){
								alert("添加成功");
							}else{
								alert("添加失败");
							}
						});
			});
		});
	</script>

  </head>
  
  <body>
  <!--  
  	<h1>添加学校院系关系页面</h1>
  		选择学校：
    	<select class="schoolId">
    		<c:forEach items="${applicationScope.schools}" var="school">
    			<option value="${school.id}">${school.name}</option>
    		</c:forEach>
    	</select>
    &nbsp&nbsp&nbsp&nbsp
    	选择院系：
    	<select class="deptId">
    		<c:forEach items="${applicationScope.departments}" var="department">
    			<option value="${department.id}">${department.name}</option>
    		</c:forEach>
    	</select>
    &nbsp&nbsp&nbsp&nbsp
    	<input type="button" value="添加" class="submitBtn" />
    &nbsp&nbsp&nbsp&nbsp	
    	<span class="error" id="nameError"></span>
    -->
    
    <div class="MainDiv">
		<table width="99%" border="0" cellpadding="0" cellspacing="0" class="CContent">
		  <tr>
		      <th class="tablestyle_title" >添加院校</th>
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
						<legend>添加院校</legend>
							  <table border="0" cellpadding="2" cellspacing="1" style="width:100%">
							  	<tr>
							  		<td nowrap align="right" width="10%">选择学校：</td>
							  		<td width="15%">
							  			<select class="schoolId">
								    		<c:forEach items="${applicationScope.schools}" var="school">
								    			<option value="${school.id}">${school.name}</option>
								    		</c:forEach>
								    	</select>
							  		</td>
							  		<td nowrap width="10%" align="right">选择院系：</td>
							  		<td width="15%">
							  			<select class="deptId">
								    		<c:forEach items="${applicationScope.departments}" var="department">
								    			<option value="${department.id}">${department.name}</option>
								    		</c:forEach>
								    	</select>
							  		</td>
							  		<td width="40%">
							  			<span class="error" id="nameError"></span>
							  		</td>
							  	</tr>
							  </table>
					  <br />
						</fieldset>			</TD>
				</TR>
				</TABLE>
			 </td>
		  </tr>
				<TR>
					<TD colspan="2" align="center" height="50px">
						<input type="button" value="添加" class="button" id="submitBtn" />
					</TD>
				</TR>
		</TABLE>
	</div>
  </body>
</html>
