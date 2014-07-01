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
    
    <title>My JSP 'School.jsp' starting page</title>
    
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
					$("#nameError").html("学校名不能为空");
				}else{
					$.post("/crspAdmin/SchoolSer",
							{status:"querySchoolName",
							name:name},
							function(data){
								if(data=="true"){
									$("#nameError").html("该学校已存在");
								}else{
									$("#nameError").html("此学校可以添加");
								}
							});
				}
			});
			/*$(".submitBtn").click(function(){
				$.post("/crspAdmin/SchoolSer",
						{status:"saveSchool",
						name:$("#name").val(),
						provinceId:$("#provinceId").val(),
						description:$("#description").val(),
						avatar:$("#avatar").val()},
						function(data){
							if(data=="true"){
								alert("添加成功");
							}else{
								alert("添加失败");
							}
						});
			});*/
		});
	</script>
	<script type="text/javascript">  
            function tosubmit(){   
                var filename = document.getElementById('fileid').value;   
                if(filename =='' || filename == null){   
                    alert("请先选择要上传的文件");   
                }else{   
                    window.document.form1.submit();   
                }   
            }   
    </script>

  </head>
  
  <body>
  <!--  
    <h1>添加学校页面</h1>
    	<form action="/crspAdmin/UploadSer" method="post" name="form1" enctype="multipart/form-data" >
    		<input type="hidden" name="status" value="saveSchool" />
    		学校名称：<input type="text" id="name" name="name" />
    		<span class="error" id="nameError"></span><br/>
    		所在省份：
    		<select id="provinceId" name="provinceId">
    			<c:forEach items="${applicationScope.provinces}" var="province">
    				<option value="${province.id}">${province.name}</option>
    			</c:forEach>
    		</select><br/>
    		学校描述：<textarea rows="6" cols="50" id="description" name="description"></textarea><br/>
    		  
                               选择要上传的图片:   
             <input type="file" id="fileid" name="filename"/> <br/> 
             <input type="submit" value="添加" /> 
        </form>
  -->
    <form action="/crspAdmin/UploadSer" method="post" name="form1" enctype="multipart/form-data" >
    	<div class="MainDiv">
		<table width="99%" border="0" cellpadding="0" cellspacing="0" class="CContent">
		  <tr>
		      <th class="tablestyle_title" >添加高校</th>
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
						<legend>添加高校</legend>
							  <table border="0" cellpadding="2" cellspacing="1" style="width:100%">
							  	<tr>
							  		<td nowrap align="right" width="11%">学校名称：</td>
							  		<td>
							  			<input type="text" id="name" name="name" />
						    			<span class="error" id="nameError"></span>
							  		</td>
							  		<td>
							  			<input type="hidden" name="status" value="saveSchool" />
							  		</td>
							  	</tr>
							  	<tr>
							  		<td nowrap align="right" width="11%">所在省份：</td>
							  		<td>
							  			<select id="provinceId" name="provinceId">
							    			<c:forEach items="${applicationScope.provinces}" var="province">
							    				<option value="${province.id}">${province.name}</option>
							    			</c:forEach>
							    		</select>
							  		</td>
							  	</tr>
							  	<tr>
							  		<td nowrap align="right" width="11%">学校描述：</td>
							  		<td>
							  			<textarea rows="10" cols="80" id="description" name="description"></textarea>
							  		</td>
							  	</tr>
							  	<tr>
							  		<td nowrap align="right" width="11%"> 学校图片：</td>
							  		<td>
							  			<input type="file" id="fileid" name="filename"/>
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
						<input type="submit" value="添加" class="button" />
						
						<input type="reset" value="取消" class="button" />
					</TD>
				</TR>
		</TABLE>
		</div>
	</form>
  </body>
</html>
