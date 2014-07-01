<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>点击按钮后，文本框变为Select下拉列表框</title>
<script type="text/javascript">
function showSelect(){
	var _t = document.getElementById('t');
	var _s = document.getElementById('sel');
	if( _t.style.display == ''){
		_t.style.display = 'none';
	}
	else{
		_t.style.display = '';
	}
   if ( _s.style.display == 'none' ){
		_s.style.display = '';
	}
	else{
		_s.style.display = 'none';
	}
}
</script>
</head>
<body>
<input type="text" name="t" id="t" value="ASP">   
<select name="sel" id="sel" style="display:none">
<option value="0">ASP</option>
<option value="1">ASP.NET</option>
<option value="2">PHP</option>
<option value="3">JAVA</option>
</select>
<input type="submit" name="Submit" onclick="showSelect()" value="你擅长的" />
</body>
</html>
