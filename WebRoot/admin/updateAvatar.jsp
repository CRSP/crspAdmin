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
    
    <title>My JSP 'upload.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

	<script type="text/javascript">  
            function tosubmit(){   
                var filename = document.getElementById('fileid').value;   
                if(filename =='' || filename == null){   
                    alert("请先选择要上传的文件");   
                }else{   
                    window.document.form1.submit();
                    window.close();   
                }   
            }   
    </script>
	
  </head>
  
  <body>
    <form action="/crspAdmin//UploadSer" name="form1" method="post" enctype="multipart/form-data">
    	<input type="hidden" name="id" value="${param.id}" />
    	<input type="hidden" name="status" value="updateAvatar" />
    	选择要上传的图片:   
        <input type="file" id="fileid" name="filename"/> 
        <input type="button" value="上传" onclick="tosubmit()" /> 
    </form>
  </body>
</html>
