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
<script typpe="text/javascript">
$(document).ready(function(){
	var total=0;
	$(".interleaved_0 .t3").each(function()
	{
		total+=parseInt($(this).html());
	});
	$("#total").html(total);
});
</script>
</head>
<body>
<%
	OrderService orderService=new OrderService();
	FoodService foodService=new FoodService();
	
	List<Order> list = orderService.listAllOrders(); 
%>
	<jsp:include page="header.jsp" flush="true" />
	
<div class="body">
<div class="body_bg">

	<div style="margin-top:30px;">
		<ul class="table title" style="margin:auto; width:786px;">
			<li class="t1" style="width:195px;">编号</li>
			<li class="t2" style="width:195px;">时间</li>
			<li class="t3" style="width:195px;">金额</li>
			<li class="t4" style="width:195px;">删除记录</li>

		</ul>
		<%
		if(list!=null){
			for(int i=0;i<list.size();i++){
				Order order= (Order)list.get(i);
		%>
		<ul class="table interleaved_0" style="margin:auto; width:786px;">
				<li class="t1" style="width:195px;"><%=order.getOrder_id() %></li>
				<li class="t2" style="width:195px;"><%=order.getOrder_date() %></li>
				<li class="t3" style="width:195px;"><%=order.getOrder_price() %> 元</li>
				<li class="t4" style="width:195px;"><a href="OrderServlet?type=delete&&order_id=<%=order.getOrder_id()%>&&which=finance">删除</a></li>
		</ul>	
		<%}} %>	
		<div style="text-align:right;font-size:32px;font-family:'微软雅黑';padding-right:100px;">
		共收入：<span id="total"></span>.0元
		</div>	
			
	</div>
</div>
</div>
<jsp:include page="footer.jsp" flush="true" />

</body>
</html>
