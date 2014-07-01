<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'querySchool.jsp' starting page</title>
    
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
		.provinceId{
			display:none;
		}
	</style>
	<script type="text/javascript" src="/crspAdmin/js/jquery-1.9.1.min.js"></script>
	<script type="text/javascript">
		$("document").ready(function(){
			var provinceId=null;
			var provinceName=null;
			$(".updateBtn").click(function(){
				var provinceTd=$(this).parent().prev().prev().prev().prev().prev();
				var nameTd=$(this).parent().prev().prev().prev().prev();
				var descriptionTd=$(this).parent().prev().prev().prev();
				var avatarTd=$(this).parent().prev().prev();
				if($(this).val()=="更新"){
					$(this).val("确认");
					provinceTd.children(".provinceId").css("display","block");
					nameTd.html("<input type='text' size='6' value=" + nameTd.html() + " />");
					descriptionTd.html("<textarea rows='6' cols='50' >" + descriptionTd.children().val() + "</textarea>");
					//avatarTd.html("<input type='text' size='6' value=" + avatarTd.html() + " />");
					provinceTd.children(".provinceName").html("");
					
					provinceId=provinceTd.children(".provinceId").children('option:selected').val();
					provinceName=provinceTd.children(".provinceId").children('option:selected').html();
					$(".provinceId").change(function(){
						provinceId=$(this).children('option:selected').val();
						provinceName=$(this).children('option:selected').html();
					});
				}else{
					$(this).val("更新");
					provinceTd.children(".provinceId").css("display","none");
					provinceTd.children(".provinceName").html(provinceName);
					descriptionTd.html("<input type='text' size='20' value=" + descriptionTd.children().val() + " disabled />");
					nameTd.html(nameTd.children().val());
					//avatarTd.html(avatarTd.children().val());
					//发送一个异步请求，让后台与前台同步
					$.post("/crspAdmin/SchoolSer",{
						status:"updateSchool",
						id:$(this).attr("name"),
						provinceId:provinceId,
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
					$.post("/crspAdmin/SchoolSer",{status:"deleteSchool",id:$(this).attr("name")});
				}
			});
			$(".currentPage").change(function(){
				var currentPage=$(this).val();
				window.open("/crspAdmin/SchoolSer?status=splitPage&currentPage=" + currentPage,"_self");
			});
			$("img").click(function(){
				$(this).parent().find("div").show();
			});
			$("input[name='filename']").change(function(e){
				var files=e.target.files;
				$(this).closest("form").data("file",files[0]);
			});
			$("input[name='uploadBtn']").click(function(){
				 var filename =$(this).closest("form").find("input[name='filename']").val();
				 var _this=$(this);   
                if(filename =='' || filename == null){   
                    alert("请先选择要上传的文件");   
                }else{
                	 var id =$(this).closest("form").find("input[name='id']").val();
                	 var status =$(this).closest("form").find("input[name='status']").val();
                	 var formData=new FormData();
                	 formData.append("file",$(this).closest("form").data("file"));
                	 formData.append("id",id);
                	 formData.append("status",status);
                	 $.ajax({
                		type:"POST",
                		url:"/crspAdmin/UploadSer",
                		data:formData,
                		contentType:false,
                		processData:false,
                		success:function(msg){
                			$(_this).closest("td").find("img").attr("src",msg);
                			$(_this).closest("td").find("div").css("display","none");
                		}
                	});
                }
			});
		});
	</script>
	
	<style type="text/css">
		.uploadAvatar{
			display:none;
		}
	</style>
	
  </head>
  
  <body>
  <!--  
    <form action="/crspAdmin/SchoolSer" method="post">
    	学校名：<input type="text" name="name" value="${sessionScope.querySchoolName}" />
    	<input type="submit" value="查询" />
    	<span>每页显示数量</span>
	   	<input type="text" size="1" name="schoolSize" value="${applicationScope.schoolSize}" />
    	<input type="hidden" name="status" value="querySchool" />
    </form>
    
    <c:if test="${requestScope.schools!=null}">
	    <table border="1" >
	    	<tr>
	    		<td>序号</td>
	    		<td>学校编号</td>
	    		<td>所在省份</td>
	    		<td>学校名称</td>
	    		<td>学校描述</td>
	    		<td>学校图片</td>
	    		<td>资源数量</td>
	    		<td>更新</td>
	    		<td>删除</td>
	    	</tr>
	    	
	    	<c:forEach items="${requestScope.schools}" var="school" varStatus="num">
	    		<tr>
	    			<td>${num.count}</td>
	    			<td>${school.id}</td>
	    			<td>
	    				<span class="provinceName">${school.province.name}</span>
	    				<select class="provinceId">
    						<c:forEach items="${applicationScope.provinces}" var="province">
    							<c:choose>
    								<c:when test="${province.id==school.province.id}">
    									<option value="${province.id}" selected="selected">${province.name}</option>
    								</c:when>
    								<c:otherwise>
    									<option value="${province.id}">${province.name}</option>
    								</c:otherwise>
    							</c:choose>
    						</c:forEach>
    					</select>
	    			</td>
	    			<td>${school.name}</td>
	    			<td>
	    				<input type="text" size="20" value="${school.description}" disabled />
	    			</td>
	    			<td>
	    					<img src="/crspAdmin/avatar/${school.avatar}"  height="50px" width="50px"/>
	    					<div class="uploadAvatar">
	    						<form>
							    	<input type="hidden" name="id" value="${school.id}" />
							    	<input type="hidden" name="status" value="updateAvatar" />
							    	选择要替换的图片:   
							        <input type="file" name="filename" multiple="multiple"/> 
							        <input type="button" name="uploadBtn" value="上传" /> 
							    </form>
	    					</div>
	    			</td>
	    			<td>${school.resource_count}</td>
	    			<td>
	    				<input type="button" value="更新" class="updateBtn" name="${school.id}" />
	    			</td>
	    			<td>
	    				<input type="button" value="删除" class="deleteBtn" name="${school.id}" />
	    			</td>
	    		</tr>
	    	</c:forEach>
	    </table>
	    <a href="/crspAdmin/SchoolSer?status=splitPage&currentPage=1">首页</a>
	  	<c:choose>
	  		<c:when test="${sessionScope.currentPage==1}">
	  			上一页
	  		</c:when>
	  		<c:otherwise>
	  			<a href="/crspAdmin/SchoolSer?status=splitPage&currentPage=${sessionScope.currentPage-1}">
	  			上一页</a>
	  		</c:otherwise>
	  	</c:choose>
	  	<c:choose>
	  		<c:when test="${sessionScope.currentPage==sessionScope.countPage}">
	  			下一页
	  		</c:when>
	  		<c:otherwise>
	  			<a href="/crspAdmin/SchoolSer?status=splitPage&currentPage=${sessionScope.currentPage+1}">
	  			下一页</a>
	  		</c:otherwise>
	  	</c:choose>
	   	<a href="/crspAdmin/SchoolSer?status=splitPage&currentPage=${sessionScope.countPage}">
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
					    <form action="/crspAdmin/SchoolSer" method="post">
					    	查找内容：学校名
					    	<input type="text" name="name" value="${sessionScope.querySchoolName}" />
					    	<input name="Submit4" type="submit" class="right-button02" value="查询" />
					    	<span>每页显示数量</span>
						   	<input type="text" size="1" name="schoolSize" value="${applicationScope.schoolSize}" />
					    	<input type="hidden" name="status" value="querySchool" />
					    </form>
					  </td>
					   	
				     </tr>
		          	</table>
		          </td>
		        </tr>
		      </table>
		   	</td>
		  </tr>
		  
		  <c:if test="${requestScope.schools!=null}">
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
		                    	<td height="22" colspan="10" align="center" style="font-size:16px">高校信息列表</td>
		                  </tr>
				    	  <tr bgcolor="#EEEEEE">
				    		<td>序号</td>
				    		<td>学校编号</td>
				    		<td>所在省份</td>
				    		<td>学校名称</td>
				    		<td>学校描述</td>
				    		<td>学校图片</td>
				    		<td>资源数量</td>
				    		<td>更新</td>
				    		<td>删除</td>
				    	  </tr>
		                  
				    	<c:forEach items="${requestScope.schools}" var="school" varStatus="num">
				    		<tr bgcolor="#FFFFFF">
				    			<td>${num.count}</td>
				    			<td>${school.id}</td>
				    			<td>
				    				<span class="provinceName">${school.province.name}</span>
				    				<select class="provinceId">
			    						<c:forEach items="${applicationScope.provinces}" var="province">
			    							<c:choose>
			    								<c:when test="${province.id==school.province.id}">
			    									<option value="${province.id}" selected="selected">${province.name}</option>
			    								</c:when>
			    								<c:otherwise>
			    									<option value="${province.id}">${province.name}</option>
			    								</c:otherwise>
			    							</c:choose>
			    						</c:forEach>
			    					</select>
				    			</td>
				    			<td>${school.name}</td>
				    			<td>
				    				<input type="text" size="20" value="${school.description}" disabled />
				    			</td>
				    			<td>
				    					<img src="/crspAdmin/avatar/${school.avatar}"  height="50px" width="50px"/>
				    					<div class="uploadAvatar">
				    						<form>
										    	<input type="hidden" name="id" value="${school.id}" />
										    	<input type="hidden" name="status" value="updateAvatar" />
										    	选择要替换的图片:   
										        <input type="file" name="filename" multiple="multiple"/> 
										        <input type="button" name="uploadBtn" value="上传" /> 
										    </form>
				    					</div>
				    			</td>
				    			<td>${school.resource_count}</td>
				    			<td>
				    				<input type="button" value="更新" class="updateBtn" name="${school.id}" />
				    			</td>
				    			<td>
				    				<input type="button" value="删除" class="deleteBtn" name="${school.id}" />
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
				<a href="/crspAdmin/SchoolSer?status=splitPage&currentPage=1">首页</a>
				<span>|</span>
			  	<c:choose>
			  		<c:when test="${sessionScope.currentPage==1}">
			  			上一页
			  		</c:when>
			  		<c:otherwise>
			  			<a href="/crspAdmin/SchoolSer?status=splitPage&currentPage=${sessionScope.currentPage-1}">
			  			上一页</a>
			  		</c:otherwise>
			  	</c:choose>
			  	<span>|</span>
			  	<c:choose>
			  		<c:when test="${sessionScope.currentPage==sessionScope.countPage}">
			  			下一页
			  		</c:when>
			  		<c:otherwise>
			  			<a href="/crspAdmin/SchoolSer?status=splitPage&currentPage=${sessionScope.currentPage+1}">
			  			下一页</a>
			  		</c:otherwise>
			  	</c:choose>
			  	<span>|</span>
			   	<a href="/crspAdmin/SchoolSer?status=splitPage&currentPage=${sessionScope.countPage}">
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
