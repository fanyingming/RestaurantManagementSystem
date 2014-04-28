<%@ page language="java" import="java.util.*,com.project.javabean.*,com.project.util.*,
com.project.service.*" pageEncoding="utf-8"%>
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
	
		$(".t3 a").click(function()
		{
		
			$(this).parent().parent().next().show();
			//$(this).parent().parent().next().next().show();
		});
		$(".t4 a").click(function()
		{
			$(this).parent().parent().next().show();
		//	$(this).parent().parent().next().next().show();
		});
		$(".shouqiBtn").click(function()
		{
			$(this).parent().parent().hide();
		});
	
	});
	
</script>
</head>
<body>
<%
	OrderService orderService=new OrderService();
	List<Order> list = orderService.listAllOrders(); 
%>
		<jsp:include page="header.jsp" flush="true" />
		 
<div class="body">
<div class="body_bg">

	<div style="margin-top:30px;">
		<ul class="table title" style="margin:auto; width:930px	;">
			<li class="t1" style="width:110px;">订单编号</li>
			<li class="t2" style="width:110px;">订单桌位</li>
			<li class="t3" style="width:110px;">订单菜品</li>
			<li class="t5" style="width:110px;">订单价格</li>
			<li class="t6" style="width:110px;">订单状态</li>
			<li class="t7" style="width:150px;">状态设置</li>
			<li class="t8" style="width:110px;">删除</li>

		</ul>
		<%
		if(list!=null){
			for(int i=0;i<list.size();i++){
				Order order= (Order)list.get(i);
				String order_state;
				switch(order.getOrder_state()){
				case 1:order_state="还未下锅";break;
				case 2:order_state="正在准备";break;
				case 3:order_state="制作完成";break;
				default:order_state="unknown";break;
				}
		%>
		<ul class="table interleaved_0" style="margin:auto;width:930px	;">
				<li class="t1" style="width:110px;"><%=order.getOrder_id() %></li>
				<li class="t2" style="width:110px;">2号桌</li>
				<li class="t3" style="width:110px;"><a href="#">查看菜品</a></li>
				<li class="t5" style="width:110px;"><a href=""><%=order.getOrder_price() %></a></li>	
				<li class="t6" style="width:110px;"><%=order_state %></li>				
				<li class="t7" style="width:150px;">
				<%
					if(order_state.equals("还未下锅")){
				%>
					<a href="orderServlet?type=begin_cooking&&order_id=<%=order.getOrder_id() %>">开始准备</a>
					<%}else if(order_state.equals("正在准备")) {%>
					<a href="orderServlet?type=finish_cooking&&order_id=<%=order.getOrder_id() %>">准备完成</a>
					<%} %>
				</li>
				<li class="t8" style="width:110px;">
					<a href="orderServlet?type=delete&&order_id=<%=order.getOrder_id() %>">删除</a>
				</li>
				
		</ul>	
		<div style="display:none;">
			<div class="orderDetail" style="margin-left:35px;border-right:1px solid #99aaff;margin-bottom:20px;">
				<p><div class="dishName">锅包肉</div><span> 1</span><span>份</span></p>
				<p><div class="dishName">红烧狮子头</div><span> 1</span><span>份</span></p>
				<p><div class="dishName">酸辣白菜</div><span> 1</span><span>份</span></p>
				<p><div class="dishName">油焖茄子</div><span> 1</span><span>份</span></p>
				<p><div class="dishName">清蒸鲈鱼</div><span> 1</span><span>份</span></p>
				<p><div class="dishName">宫保鸡丁</div><span> 1</span><span>份</span></p>
			</div>
			<div class="orderDetail" style="margin-bottom:20px;">
				<p><div class="dishName">青岛啤酒</div><span> 10</span><span>瓶</span></p>
				<p><div class="dishName">牛栏山二锅头</div><span> 5</span><span>瓶</span></p>
				<p><div class="dishName">芬达</div><span> 1</span><span>瓶</span></p>
				<p><div class="dishName">酸梅汤</div><span> 1</span><span>瓶</span></p>
			</div>
			<div style="width:38px;height:180px;float:left;">
				<button class="shouqiBtn" style="height:60px;margin:0px;margin-top:120px;">收起</button>
			</div>
		</div>
			<%}  }%>		
		
	</div>
</div>
</div>
<jsp:include page="footer.jsp" flush="true" />


</body>
</html>
