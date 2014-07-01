<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title></title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
		body {
			margin-left: 0px;
			margin-top: 0px;
			margin-right: 0px;
			margin-bottom: 0px;
			background-image: url(/crspAdmin/images/left.gif);
		}
	</style>
	<link href="/crspAdmin/css/css.css" rel="stylesheet" type="text/css" />
	
  </head>
  
  <SCRIPT language=JavaScript>
	function tupian(idt){
	    var nametu="xiaotu"+idt;
	    var tp = document.getElementById(nametu);
	    tp.src="/crspAdmin/images/ico05.gif";//图片ico04为白色的正方形
		
		for(var i=1;i<30;i++)
		{
		  
		  var nametu2="xiaotu"+i;
		  if(i!=idt*1)
		  {
		    var tp2=document.getElementById('xiaotu'+i);
			if(tp2!=undefined)
		    {tp2.src="/crspAdmin/images/ico06.gif";}//图片ico06为蓝色的正方形
		  }
		}
	}
	
	function list(idstr){
		var name1="subtree"+idstr;
		var name2="img"+idstr;
		var objectobj=document.all(name1);
		var imgobj=document.all(name2);
		
		
		//alert(imgobj);
		
		if(objectobj.style.display=="none"){
			for(i=1;i<10;i++){
				var name3="img"+i;
				var name="subtree"+i;
				var o=document.all(name);
				if(o!=undefined){
					o.style.display="none";
					var image=document.all(name3);
					//alert(image);
					image.src="/crspAdmin/images/ico04.gif";
				}
			}
			objectobj.style.display="";
			imgobj.src="/crspAdmin/images/ico03.gif";
		}
		else{
			objectobj.style.display="none";
			imgobj.src="/crspAdmin/images/ico04.gif";
		}
	}
	</SCRIPT>
  
  <body>
  	<!--
    <ul>
    	<li><a href="/crspAdmin/admin/saveAdmin.jsp" target="right">添加管理员</a></li>
    	<li><a href="/crspAdmin/admin/queryAdmin.jsp" target="right">查询管理员信息</a></li>
    	<li><a href="/crspAdmin/admin/queryUser.jsp" target="right">查询用户信息</a></li>
    	<li><a href="/crspAdmin/admin/saveDept.jsp" target="right">添加院系</a></li>
    	<li><a href="/crspAdmin/admin/queryDept.jsp" target="right">查询院系</a></li>
    	<li><a href="/crspAdmin/admin/saveSchool.jsp" target="right">添加学校</a></li>
    	<li><a href="/crspAdmin/admin/querySchool.jsp" target="right">查询学校</a></li>
    	<li><a href="/crspAdmin/admin/saveSchDept.jsp" target="right">添加学校院系</a></li>
    	<li><a href="/crspAdmin/admin/querySchDept.jsp" target="right">查询学校院系</a></li>
    	<li><a href="/crspAdmin/admin/queryRecord.jsp" target="right">查询记录</a></li>
    	<li><a href="/crspAdmin/admin/ResTypeManage.jsp" target="right">资源类型管理</a></li>
    	<li><a href="/crspAdmin/admin/queryRes.jsp" target="right">查询资源</a></li>
    	<li><a href="/crspAdmin/admin/checkRes.jsp" target="right">审核资源</a></li>
    	<li><a href="/crspAdmin/admin/queryComment.jsp" target="right">查询评论</a></li>
    </ul>
    -->
    
    <table width="198" border="0" cellpadding="0" cellspacing="0" class="left-table01">
	  <tr>
	    <TD>
			<table width="100%" border="0" cellpadding="0" cellspacing="0">
			  <tr>
				<td width="207" height="55" background="/crspAdmin/images/nav01.gif">
					<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
					  <tr>
						<td width="25%" rowspan="2"><img src="/crspAdmin/images/ico02.gif" width="35" height="35" /></td>
						<td width="35%" height="22" class="left-font01">您好，<span class="left-font02">${sessionScope.loginAdmin.user_name}</span></td>
						<td width="30%"></td>
					  </tr>
					  <tr>
					  	<td width="50%" height="22" class="left-font01">
							[<a href="/crspAdmin/admin/changePwd.jsp" target="mainFrame" class="left-font01">修改密码</a>]</td>
						<td width="50%" height="22" class="left-font01">
							[<a href="/crspAdmin/AdminSer?status=loginOut" target="_parent" class="left-font01">退出</a>]</td>
					  </tr>
					</table>
				</td>
			  </tr>
			</table>
			
	
	
			<!--  用户管理开始    -->
			<TABLE width="100%" border="0" cellpadding="0" cellspacing="0" class="left-table03">
	          <tr>
	            <td height="29">
					<table width="85%" border="0" align="center" cellpadding="0" cellspacing="0">
						<tr>
							<td width="8%"><img name="img8" id="img8" src="/crspAdmin/images/ico04.gif" width="8" height="11" /></td>
							<td width="92%">
									<a href="javascript:" target="mainFrame" class="left-font03" onClick="list('8');" >用户管理</a></td>
						</tr>
					</table>
				</td>
	          </tr>		  
	        </TABLE>
			<table id="subtree8" style="DISPLAY: none" width="80%" border="0" align="center" cellpadding="0" 
					cellspacing="0" class="left-table02">
					<tr>
					  <td width="9%" height="20" ><img id="xiaotu20" src="/crspAdmin/images/ico06.gif" width="8" height="12" /></td>
					  <td width="91%"><a href="/crspAdmin/admin/queryUser.jsp" target="mainFrame" class="left-font03" onClick="tupian('20');">查询用户信息</a></td>
					</tr>
	      </table>
			<!--  用户管理结束    -->
	
			
	
			<!--  院系管理开始    -->
			<TABLE width="100%" border="0" cellpadding="0" cellspacing="0" class="left-table03">
	          <tr>
	            <td height="29">
					<table width="85%" border="0" align="center" cellpadding="0" cellspacing="0">
						<tr>
							<td width="8%"><img name="img7" id="img7" src="/crspAdmin/images/ico04.gif" width="8" height="11" /></td>
							<td width="92%">
									<a href="javascript:" target="mainFrame" class="left-font03" onClick="list('7');" >院系管理</a></td>
						</tr>
					</table>
				</td>
	          </tr>		  
	        </TABLE>
			<table id="subtree7" style="DISPLAY: none" width="80%" border="0" align="center" cellpadding="0" 
					cellspacing="0" class="left-table02">
					<tr>
					  <td width="9%" height="20" ><img id="xiaotu17" src="/crspAdmin/images/ico06.gif" width="8" height="12" /></td>
					  <td width="91%">
							<a href="/crspAdmin/admin/saveDept.jsp" target="mainFrame" class="left-font03" onClick="tupian('17');">添加院系</a></td>
					</tr>
					<tr>
					  <td width="9%" height="20" ><img id="xiaotu18" src="/crspAdmin/images/ico06.gif" width="8" height="12" /></td>
					  <td width="91%">
						<a href="/crspAdmin/admin/queryDept.jsp" target="mainFrame" class="left-font03" onClick="tupian('18');">查询院系</a></td>
					</tr>
	      </table>
			<!--  院系管理结束    -->
	
	
			<!--  学校管理开始    -->
	        <TABLE width="100%" border="0" cellpadding="0" cellspacing="0" class="left-table03">
	          <tr>
	            <td height="29">
					<table width="85%" border="0" align="center" cellpadding="0" cellspacing="0">
						<tr>
							<td width="8%"><img name="img1" id="img1" src="/crspAdmin/images/ico04.gif" width="8" height="11" /></td>
							<td width="92%">
									<a href="javascript:" target="mainFrame" class="left-font03" onClick="list('1');" >学校管理</a></td>
						</tr>
					</table>
				</td>
	          </tr>		  
	        </TABLE>
			<table id="subtree1" style="DISPLAY: none" width="80%" border="0" align="center" cellpadding="0" 
					cellspacing="0" class="left-table02">
					<tr>
					  <td width="9%" height="20" ><img id="xiaotu1" src="/crspAdmin/images/ico06.gif" width="8" height="12" /></td>
					  <td width="91%"><a href="/crspAdmin/admin/saveSchool.jsp" target="mainFrame" class="left-font03" onClick="tupian('1');">添加学校</a></td>
					</tr>
					<tr>
					  <td width="9%" height="20" ><img id="xiaotu4" src="/crspAdmin/images/ico06.gif" width="8" height="12" /></td>
					  <td width="91%"><a href="/crspAdmin/admin/querySchool.jsp" target="mainFrame" class="left-font03" onClick="tupian('4');">查询学校信息</a></td>
					</tr>
	      </table>
			<!--  学校管理结束    -->
	
		  <!--  院校管理开始    -->
		  <table width="100%" border="0" cellpadding="0" cellspacing="0" class="left-table03">
	          <tr>
	            <td height="29"><table width="85%" border="0" align="center" cellpadding="0" cellspacing="0">
	                <tr>
	                  <td width="8%" height="12"><img name="img2" id="img2" src="/crspAdmin/images/ico04.gif" width="8" height="11" /></td>
	                  <td width="92%"><a href="javascript:" target="mainFrame" class="left-font03" onClick="list('2');" >院校管理</a></td>
	                </tr>
	            </table></td>
	          </tr>
	      </table>
		  
		  <table id="subtree2" style="DISPLAY: none" width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="left-table02">
	        
			<tr>
	          <td width="9%" height="20" ><img id="xiaotu6" src="/crspAdmin/images/ico06.gif" width="8" height="12" /></td>
	          <td width="91%"><a href="/crspAdmin/admin/saveSchDept.jsp" target="mainFrame" class="left-font03" onClick="tupian('6');">添加学校院系</a></td>
	        </tr>
	        <tr>
	          <td width="9%" height="20" ><img id="xiaotu7" src="/crspAdmin/images/ico06.gif" width="8" height="12" /></td>
	          <td width="91%"><a href="/crspAdmin/admin/querySchDept.jsp" target="mainFrame" class="left-font03" onClick="tupian('7');">查询学校院系</a></td>
	        </tr>
	      </table>
		  <!--  院校管理结束    -->
	
		  <!--  记录管理开始    -->
		  <table width="100%" border="0" cellpadding="0" cellspacing="0" class="left-table03">
	          <tr>
	            <td height="29"><table width="85%" border="0" align="center" cellpadding="0" cellspacing="0">
	                <tr>
	                  <td width="8%" height="12"><img name="img3" id="img3" src="/crspAdmin/images/ico04.gif" width="8" height="11" /></td>
	                  <td width="92%"><a href="javascript:" target="mainFrame" class="left-font03" onClick="list('3');" >记录管理</a></td>
	                </tr>
	            </table></td>
	          </tr>
	      </table>
		  
		  <table id="subtree3" style="DISPLAY: none" width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="left-table02">
	        <tr>
	          <td width="9%" height="20" ><img id="xiaotu9" src="/crspAdmin/images/ico06.gif" width="8" height="12" /></td>
	          <td width="91%"><a href="/crspAdmin/admin/queryRecord.jsp" target="mainFrame" class="left-font03" onClick="tupian('9');">查询记录</a></td>
	        </tr>
	      </table>
		  <!--  记录管理结束    -->
	
		   <!--  资源管理开始    -->
		   <table width="100%" border="0" cellpadding="0" cellspacing="0" class="left-table03">
	          <tr>
	            <td height="29"><table width="85%" border="0" align="center" cellpadding="0" cellspacing="0">
	                <tr>
	                  <td width="8%" height="12"><img name="img4" id="img4" src="/crspAdmin/images/ico04.gif" width="8" height="11" /></td>
	                  <td width="92%"><a href="javascript:" target="mainFrame" class="left-font03" onClick="list('4');" >资源管理</a></td>
	                </tr>
	            </table></td>
	          </tr>
	      </table>
		  
		  <table id="subtree4" style="DISPLAY: none" width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="left-table02">
			<tr>
	          <td width="9%" height="20" ><img id="xiaotu10" src="/crspAdmin/images/ico06.gif" width="8" height="12" /></td>
	          <td width="91%"><a href="/crspAdmin/admin/ResTypeManage.jsp" target="mainFrame" class="left-font03" onClick="tupian('10');">资源类型添加/查询</a></td>
	        </tr>
		  	<tr>
	          <td width="9%" height="20" ><img id="xiaotu11" src="/crspAdmin/images/ico06.gif" width="8" height="12" /></td>
	          <td width="91%"><a href="/crspAdmin/admin/queryRes.jsp" target="mainFrame" class="left-font03" onClick="tupian('11');">查询资源</a></td>
	        </tr>
	        <tr>
	          <td width="9%" height="20" ><img id="xiaotu12" src="/crspAdmin/images/ico06.gif" width="8" height="12" /></td>
	          <td width="91%"><a href="/crspAdmin/admin/checkRes.jsp" target="mainFrame" class="left-font03" onClick="tupian('12');">审核资源</a></td>
	        </tr>
	        <tr>
	          <td width="9%" height="20" ><img id="xiaotu13" src="/crspAdmin/images/ico06.gif" width="8" height="12" /></td>
	          <td width="91%"><a href="/crspAdmin/admin/queryComment.jsp" target="mainFrame" class="left-font03" onClick="tupian('13');">查询评论</a></td>
	        </tr>
	        <tr>
	          <td width="9%" height="20" ><img id="xiaotu14" src="/crspAdmin/images/ico06.gif" width="8" height="12" /></td>
	          <td width="91%"><a href="/crspAdmin/admin/queryMock.jsp" target="mainFrame" class="left-font03" onClick="tupian('14');">举报信息</a></td>
	        </tr>
	        
	      </table>
	
	      <!--  资源管理结束    -->
	
		  <!-- 系统管理开始 -->
	      <table width="100%" border="0" cellpadding="0" cellspacing="0" class="left-table03">
	          <tr>
	            <td height="29"><table width="85%" border="0" align="center" cellpadding="0" cellspacing="0">
	                <tr>
	                  <td width="8%"><img name="img5" id="img5" src="/crspAdmin/images/ico04.gif" width="8" height="11" /></td>
	                  <td width="92%"><a href="javascript:" target="mainFrame" class="left-font03" onClick="list('5');">系统管理</a></td>
	                </tr>
	            </table></td>
	          </tr>
	      </table>
	
		  <table id="subtree5" style="DISPLAY: none" width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="left-table02">
	        <tr>
	          <td width="9%" height="20"><img id="xiaotu15" src="/crspAdmin/images/ico06.gif" width="8" height="12" /></td>
	          <td width="91%"><a href="/crspAdmin/admin/saveAdmin.jsp" target="mainFrame" class="left-font03" onClick="tupian('15');">添加管理员</a></td>
	        </tr>
	        <tr>
	          <td height="20"><img id="xiaotu16" src="/crspAdmin/images/ico06.gif" width="8" height="12" /></td>
	          <td><a href="/crspAdmin/admin/queryAdmin.jsp" target="mainFrame" class="left-font03" onClick="tupian('16');">查询管理员信息</a></td>
	        </tr>
	      </table>
		  <!-- 系统管理结束-->
	
		  </TD>
	  </tr>
	  
	</table>
  </body>
</html>
