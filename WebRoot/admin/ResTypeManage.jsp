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
    
    <title>My JSP 'ResTypeManage.jsp' starting page</title>
    
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
					$("#nameError").html("资源类型名不能为空");
				}else{
					$.post("/crspAdmin/ResTypeSer",
							{status:"queryResType",
							name:name},
							function(data){
								if(data=="true"){
									$("#nameError").html("该资源类型名已存在");
								}else{
									$("#nameError").html("此资源类型名可以添加");
								}
							});
				}
			});
			$("#submitBtn").click(function(){
				$.post("/crspAdmin/ResTypeSer",
						{status:"saveResType",
						name:$("#name").val()},
						function(data){
							if(data=="true"){
								alert("添加成功");
							}else{
								alert("添加失败");
							}
						});
			});
			$(".updateBtn").click(function(){
				var nameTd=$(this).parent().prev();
				if($(this).val()=="更新"){
					$(this).val("确认");
					nameTd.html("<input type='text' value=" + nameTd.html() + " />");
				}else{
					$(this).val("更新");
					nameTd.html(nameTd.children().val());
					//发送一个异步请求，让后台与前台同步
					$.post("/crspAdmin/ResTypeSer",{
						status:"updateResType",
						id:$(this).attr("name"),
						name:nameTd.html()});
				}
			});
			$(".deleteBtn").click(function(){
				if(confirm("你确定要删除此资源类型吗？")){
					$(this).parent().parent().remove();
					//发送一个删除请求给Ser
					$.post("/crspAdmin/ResTypeSer",{status:"deleteResType",id:$(this).attr("name")});
				}
			});
			$("#resetBtn").click(function(){
				$("#name").val("");
			});
		});
	</script>

  </head>
  
  <body>
  <!--  
  	<h1>增加资源类型</h1>
   		 资源类型名：<input type="text" id="name" />
   		 <span class="error" id="nameError"></span><br/>
   		 <input type="button" value="添加" class="submitBtn" />
   		 
    <h1>查询资源类型</h1>
   		 <form action="/crspAdmin/ResTypeSer" method="post">
    		 资源类型名：<input type="text" name="name" value="${sessionScope.queryResTypeName}" />
    		<input type="submit" value="查询" />
    		<input type="hidden" name="status" value="queryResTypeName" />
   	 	</form>
   	 	
   	 	<c:if test="${requestScope.resTypes!=null}">
	    <table border="1">
	    	<tr>
	    		<td>序号</td>
	    		<td>资源类型编号</td>
	    		<td>资源类型名</td>
	    		<td>更新</td>
	    		<td>删除</td>
	    	</tr>
	    	
	    	<c:forEach items="${requestScope.resTypes}" var="resType" varStatus="num">
	    		<tr>
	    			<td>${num.count}</td>
	    			<td>${resType.id}</td>
	    			<td>${resType.name}</td>
	    			<td>
	    				<input type="button" value="更新" class="updateBtn" name="${resType.id}" />
	    			</td>
	    			<td>
	    				<input type="button" value="删除" class="deleteBtn" name="${resType.id}" />
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
					    <form action="/crspAdmin/ResTypeSer" method="post">
				    		 查找内容：资源类型名
				    		 <input type="text" name="name" value="${sessionScope.queryResTypeName}" />
				    		<input name="Submit4" class="right-button02" type="submit" value="查询" />
				    		<input type="hidden" name="status" value="queryResTypeName" />
				   	 	</form>
					  </td>
					   	
				     </tr>
		          	</table>
		          </td>
		        </tr>
		      </table>
		   	</td>
		  </tr>
		  
		  <c:if test="${requestScope.resTypes!=null}">
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
		                    	<td height="22" colspan="10" align="center" style="font-size:16px">资源类型列表</td>
		                  </tr>
				    	  <tr bgcolor="#EEEEEE">
				    		<td>序号</td>
				    		<td>资源类型编号</td>
				    		<td>资源类型名</td>
				    		<td>更新</td>
				    		<td>删除</td>
				    	  </tr>
				    	
				    	  <c:forEach items="${requestScope.resTypes}" var="resType" varStatus="num">
				    		<tr bgcolor="#FFFFFF">
				    			<td>${num.count}</td>
				    			<td>${resType.id}</td>
				    			<td>${resType.name}</td>
				    			<td>
				    				<input type="button" value="更新" class="updateBtn" name="${resType.id}" />
				    			</td>
				    			<td>
				    				<input type="button" value="删除" class="deleteBtn" name="${resType.id}" />
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
	
	<div class="MainDiv">
		<table width="99%" border="0" cellpadding="0" cellspacing="0" class="CContent">
		  <tr>
		      <th class="tablestyle_title" >添加资源类型</th>
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
						<legend>添加资源类型</legend>
							  <table border="0" cellpadding="2" cellspacing="1" style="width:100%">
							  	<tr>
							  		<td nowrap align="right" width="11%">资源类型名：</td>
							  		<td>
							  			<input type="text" id="name" />
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
						
						<input type="button" value="取消" class="button" id="resetBtn" />
					</TD>
				</TR>
		</TABLE>
	</div>
	
  </body>
</html>
