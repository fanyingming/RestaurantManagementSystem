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
<script type="text/javascript">
	$(document).ready(function()
	{
		var isShow=true;
		$(".t5 a").click(function()
		{
			if(isShow)
			{
				$(this).parent().parent().next().show();
				isShow=false;
			}
			else
			{
				$(this).parent().parent().next().hide();
				isShow=true;
			}
		});

	
	});
</script>
</head>
<body>
		<jsp:include page="header.jsp" flush="true" />
		 	<div class="menu">
				<a onclick="nihao(this)" class="x " href="index.jsp">开台管理</a>
				<a onclick="nihao(this)" class="x select" href="menuList.jsp">菜谱管理</a>
				<a onclick="nihao(this)" class="x " href="wineList.jsp">酒水管理</a>
				<a onclick="nihao(this)" class="x " href="orderList.jsp">下单管理</a>
				<a onclick="nihao(this)" class="x " href="postOrder.jsp">订单提交</a>
				<a onclick="nihao(this)" class="x " href="financeManage.jsp">财务管理</a>
				<a onclick="nihao(this)" class="x " href="systemManage.jsp">系统管理</a>
				
			</div>
		</div>
	</div>
<div class="body">
<div class="body_bg">

	<div style="margin-top:30px;">
		<ul class="table title" style="margin:auto; width:786px;">
			<li class="t1" style="width:130px;">菜谱编号</li>
			<li class="t2" style="width:130px;">菜名</li>
			<li class="t3" style="width:130px;">厨师</li>
			<li class="t4" style="width:130px;">价格</li>
			<li class="t5" style="width:130px;">详细信息</li>
			<li class="t6" style="width:130px;">删除菜品</li>

		</ul>
		<ul class="table interleaved_0" style="margin:auto; width:786px;">
				<li class="t1" style="width:130px;">1</li>
				<li class="t2" style="width:130px;">猪肉炖粉条</li>
				<li class="t3" style="width:130px;">李达华</li>
				<li class="t4" style="width:130px;">998</li>
				<li class="t5" style="width:130px;"><a href="#">查看</a></li>
				<li class="t6" style="width:130px;"><button>删除</button></li>
		</ul>	
		<div style="margin:auto; width:786px;border:1px solid #3388FF;height:180px;display:none;">
			<div style="width:180px;float:left;height:180px;">
				<img style="width:180px;height:180px;" src="image/zrdft.jpg" />
			</div>
			<div style="float:left;height:140px;width:546px;padding:30px;">
				该菜为四川菜也是东北菜，发源于四川，在唐朝期间薛仁贵非常喜欢四川菜，薛仁贵被政府发配到东北后，他也把四川菜带来东北，并根据当地的风格将其发展成了东北菜系： 东北菜 - 东北菜包括辽宁、 黑龙江和吉林三省的菜肴。 它亦是我国历史悠久、富有特色的地方风味菜肴，自古就闻名全国。
			</div>
		</div>
			
			
	</div>
</div>
</div>
<jsp:include page="footer.jsp" flush="true" />


</body>
</html>
