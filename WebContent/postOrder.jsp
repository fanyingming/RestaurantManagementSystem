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
		$(".orderPanel_menu .inter_info button").click(function()
		{
		
			var orderNO=$("#inputOrderNO").val();
			var tableNO=$("#inputTableNO").val();
			$("#orderNO").html(orderNO);
			$("#tableNO").html(tableNO);
			
			var strs = new Array();
			strs = $(this).html().split(" ");
			
			
			var string="<div class='orderItem'><div style='width:165px;float:left;'>"+strs[0]+"</div><div class='price' style='width:60px;float:left;'>"+strs[1]+"元</div>";
			string=string+"<div class='number' style='float:left;'>1</div><div style='float:left;'>份</div><button onclick='AddNumber(this)'>+</button><button onclick='MinNumber(this)'>-</button></div>";
			
			$("#showOrder").append(string);	
		});
		$(".orderPanel_menu_wine .inter_info button").click(function()
		{
			var strs = new Array();
			strs = $(this).html().split(" ");
			
			var string="<div class='orderItem'><div style='width:165px;float:left;'>"+strs[0]+"</div><div class='price' style='width:60px;float:left;'>"+strs[1]+"元</div>";
			string=string+"<div class='number' style='float:left;'>1</div><div style='float:left;'>份</div><button onclick='AddNumber(this)'>+</button><button onclick='MinNumber(this)'>-</button></div>";
			$("#showOrder_wine").append(string);
		});
	
	});
	function AddNumber(id)
	{
		var pointer=$(id).prev().prev();
		var string=pointer.html();
		string=parseInt(string)+1;
		pointer.html(string);
		
	}
	function MinNumber(id)
	{
		
		var pointer=$(id).prev().prev().prev();
		var string=pointer.html();
		
		if(parseInt(string)>0)
		{	
			string=parseInt(string)-1;
			pointer.html(string);
		}
		if(parseInt(string)==0)
		{
			$(id).parent().remove();
		}
	}
	function totalPrice()
	{
		var totalPrice=0;
		$(".price").each(function()
		{
			var price=parseInt($(this).html());
			price=price*parseInt($(this).next().html());
			totalPrice=totalPrice+price;
		});
		$("#showTotalPrice").html("总计:"+totalPrice+"元");
		
	}
</script>
</head>
<body>
		<jsp:include page="header.jsp" flush="true" />
		 	<div class="menu">
				<a onclick="nihao(this)" class="x " href="index.jsp">开台管理</a>
				<a onclick="nihao(this)" class="x " href="menuList.jsp">菜谱管理</a>
				<a onclick="nihao(this)" class="x " href="wineList.jsp">酒水管理</a>
				<a onclick="nihao(this)" class="x " href="orderList.jsp">下单管理</a>
				<a onclick="nihao(this)" class="x select" href="postOrder.jsp">订单提交</a>
				<a onclick="nihao(this)" class="x " href="financeManage.jsp">财务管理</a>
				<a onclick="nihao(this)" class="x " href="systemManage.jsp">系统管理</a>
				
			</div>
		</div>
<div class="body">
<div class="body_bg">
	
	<div style="width:467px;float:left;padding:20px;padding-right:10px;">
		<p style="font-size:20px;font-family:'微软雅黑';margin-top:25px;"> 订单选择区</p>
		<div style="width:100%;float:left;margin-top:5px;background-color:#eeeeff;min-height:550px;padding-top:15px;">
			<div class="orderPanel">订单编号</div>
			<div class="orderPanel_right"><input id="inputOrderNO" type="text" /></div>
			<div class="orderPanel">桌位编号</div>
			<div class="orderPanel_right"><input id="inputTableNO" type="text" /></div>
			<div class="orderPanel">订单菜品</div>
			<div class="orderPanel_menu">
				<div class="inter_info">
					<button >锅包肉 28 元</button>
				
				</div>
				<div class="inter_info">
					<button >红沙狮子头 23 元</button>
				
				</div>
				<div class="inter_info">
					<button >地三鲜 14 元</button>
				
				</div>
				<div class="inter_info">
					<button >麻婆豆腐 11 元</button>
				
				</div><div class="inter_info">
					<button >糖醋里脊 48 元</button>
				
				</div>
				<div class="inter_info">
					<button >宫保鸡丁 26 元</button>
				
				</div>
				<div class="inter_info">
					<button >酸菜鱼 32 元</button>
				
				</div>
				

			</div>
			<div style="float:left;width:70px;;">订单酒水</div>
			<div class="orderPanel_menu_wine">
				<div class="inter_info">
					<button>青岛啤酒 5 元</button>
				</div>
				<div class="inter_info">
					<button>哈尔滨啤酒 6 元</button>
				
				</div>
				<div class="inter_info">
					<button>泸州老窖 838 元</button>
				
				</div>
				<div class="inter_info">
					<button>茅台 1168 元</button>
				
				</div>
				<div class="inter_info">
					<button>牛拉山二锅头 44 元</button>
				
				</div>
				<div class="inter_info">
					<button>芬达 3 元</button>
				
				</div>
				<div class="inter_info">
					<button>可口可乐 3 元</button>
				
				</div>
				<div class="inter_info">
					<button>矿泉水 1 元</button>
				</div>
			</div>
		</div>
	</div>
	<div style="width:468px;float:left;padding:20px;padding-left:10px;">
		<p style="font-size:20px;font-family:'微软雅黑';margin-top:25px;"> 订单信息</p>
		<div style="width:100%;float:left;margin-top:5px;background-color:#eeeeff;min-height:550px;padding-top:15px;">
			<div class="orderPanel">订单编号</div>
			<div class="orderPanel_right"><div id="orderNO"></div></div>
			<div class="orderPanel">订单桌号</div>
			<div class="orderPanel_right"><div id="tableNO"></div></div>
			<div class="orderPanel">订单菜品</div>
			<div id="showOrder" style="overflow-y:scroll; float:left;width:390px;height:150px;border:1px solid #D4E7FF;text-align:left;margin-bottom:15px;">
				
			</div>
			<div style="float:left;width:70px;">订单酒水</div>
			<div id="showOrder_wine" style="overflow-y:scroll; float:left;width:390px;height:150px;border:1px solid #D4E7FF;text-align:left;margin-bottom:15px;">
				
				
			</div>
			<div id="showTotalPrice" style="width:150px;float:left;height:60px;margin-top:27px;font-size:25px;">
			</div>
			<input type="submit" class="postInfo" style="margin-right:63px;" onclick="totalPrice();" value="确认订单" />
		</div>
	</div>

	
</div>
</div>
<jsp:include page="footer.jsp" flush="true" />


</body>
</html>