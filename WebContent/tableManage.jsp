<%@ page language="java"  pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>小楼听雨餐饮管理系统</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link type="text/css" href="style-1.css" rel="stylesheet" />
<script type="text/javascript" src="jquery.min.js"></script>
</head>
<body>
	<jsp:include page="header.jsp" flush="true" />
		 	
<div class="body">
<div class="body_bg">

	<div style="margin-top:30px;">
		<ul class="table title" style="margin:auto; width:786px;">
			<li class="t1" style="width:130px;">桌位编号</li>
			<li class="t2" style="width:130px;">餐桌型号</li>
			<li class="t3" style="width:130px;">负责人</li>
			<li class="t4" style="width:130px;">桌位状态</li>

			<li class="t5" style="width:130px;">修改状态</li>
			<li class="t6" style="width:130px;">删除桌位</li>

		</ul>
		<ul class="table interleaved_0" style="margin:auto; width:786px;">
				<li class="t1" style="width:130px;">1</li>
				<li class="t2" style="width:130px;">8人桌</li>
				<li class="t3" style="width:130px;">李晓华</li>
				<li class="t4" style="width:130px;">空闲</li>
				
				<li class="t5" style="width:130px;"><button>占用</button><button>空闲</button></li>
				<li class="t5" style="width:130px;"><button>删除</button></li>
				
		</ul>	
			
			
			
	</div>
</div>
</div>
<jsp:include page="footer.jsp" flush="true" />

</body>
</html>
