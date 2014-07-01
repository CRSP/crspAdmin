<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'saveDept.jsp' starting page</title>
    
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
			$("#name").blur(function(){
				var name=$(this).val();
				if(name==""){
					$("#nameError").html("院系名称不能为空");
				}else{
					$.post("/crspAdmin/DeptSer",
							{status:"queryDeptName",
							name:name},
							function(data){
								if(data=="true"){
									$("#nameError").html("该院系名称已存在");
								}else{
									$("#nameError").html("此院系名称可以添加");
								}
							});
				}
			});
			$("#submitBtn").click(function(){
				$.post("/crspAdmin/DeptSer",
						{status:"saveDept",
						name:$("#name").val(),
						description:$("#description").val(),
						avatar:$("#avatar").val()},
						function(data){
							if(data=="true"){
								alert("添加成功");
							}else{
								alert("添加失败");
							}
						});
			});
			$("#resetBtn").click(function(){
				$("#name").val("");
				$("#description").val("");
				$("#avatar").val("");
			});
		});
	</script>

  </head>
  
  <body>
  <!--  
           添加院系页面<br/>
    	院系名称：<input type="text" id="name" />
    	<span class="error" id="nameError"></span><br/>
    	
    	院系描述：<textarea rows="6" cols="50" id="description"></textarea><br/>
    	
    	院系图片：<input type="file" id="avatar" /><br/>
    	
    	<input type="button" value="添加" class="submitBtn" />
    -->
    
    <div class="MainDiv">
		<table width="99%" border="0" cellpadding="0" cellspacing="0" class="CContent">
		  <tr>
		      <th class="tablestyle_title" >添加院系</th>
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
						<legend>添加院系</legend>
							  <table border="0" cellpadding="2" cellspacing="1" style="width:100%">
							  	<tr>
							  		<td nowrap align="right" width="11%">院系名称：</td>
							  		<td>
							  			<input type="text" id="name" />
						    			<span class="error" id="nameError"></span>
							  		</td>
							  	</tr>
							  	<tr>
							  		<td nowrap align="right" width="11%">院系描述：</td>
							  		<td>
							  			<textarea rows="10" cols="80" id="description"></textarea>
							  		</td>
							  	</tr>
							  	<tr>
							  		<td nowrap align="right" width="11%">院系图片：</td>
							  		<td>
							  			<input type="file" id="avatar" /><br/>
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
						<input type="button" value="添加" class="button" id="submitBtn" />
						
						<input type="button" value="取消" class="button" id="resetBtn" />
					</TD>
				</TR>
		</TABLE>
		</div>
  </body>
</html>
