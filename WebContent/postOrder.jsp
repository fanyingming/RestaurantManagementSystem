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
		$(".orderPanel_menu .inter_info button").click(function()
		{
			var strID=$(this).prev().html();
			
			var orderNO=$("#inputOrderNO").val();
			var tableNO=$("#inputTableNO").val();
			$("#orderNO").html(orderNO);
			$("#tableNO").html(tableNO);
			
			var strs = new Array();
			strs = $(this).html().split(" ");
			
			var string="<div class='orderItem'><div class='idtitle' style='display:none;'>"+strID+"</div><div style='width:165px;float:left;'>"+strs[0]+"</div><div class='price' style='width:60px;float:left;'>"+strs[1]+"元</div>";
			string=string+"<div class='number' style='float:left;'>1</div><div style='float:left;'>份</div><button onclick='AddNumber(this)'>+</button><button onclick='MinNumber(this)'>-</button></div>";
			
			$("#showOrder").append(string);	
		});
		$(".orderPanel_menu_wine .inter_info button").click(function()
		{
			var strID=$(this).prev().html();
			var strs = new Array();
			strs = $(this).html().split(" ");
			
			var string="<div class='orderItem'><div class='idtitle' style='display:none;'>"+strID+"</div><div style='width:165px;float:left;'>"+strs[0]+"</div><div class='price' style='width:60px;float:left;'>"+strs[1]+"元</div>";
			string=string+"<div class='number' style='float:left;'>1</div><div style='float:left;'>份</div><button onclick='AddNumber(this)'>+</button><button onclick='MinNumber(this)'>-</button></div>";
			$("#showOrder_wine").append(string);
		});
	
	});
	function postOrderOK()
	{
		totalPrice();
		var ids = new Array();
		var numbers=new Array();
		var totalprice="";
		totalprice=$("#totalprice").html();
		
		var counterID=0;
		var counterNUM=0;
		$(".idtitle").each(function(){
			ids[counterID++]=$(this).html();			
		});
		$(".number").each(function(){
			numbers[counterNUM++]=$(this).html();
		});
		
		var length=ids.length;
		var strReturn="";
		strReturn+=$("#tableNO").html()+";";
		for(var i=0;i<length;i++)
		{
			strReturn+=ids[i]+","+numbers[i]+";";
		}
		strReturn+=totalprice;
		alert(strReturn);
		
	}
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
		$("#showTotalPrice").html("总计:<span id='totalprice'>"+totalPrice+"</span>元");
		
	}
</script>
</head>
<body>
<%
	FoodService foodService=new FoodService();
	List<Food> food_list = foodService.listAllFoods(); 
	List<Food> drink_list = foodService.listAllDrinks(); 
%>
		<jsp:include page="header.jsp" flush="true" />

<div class="body">
<div class="body_bg">
	
	<div style="width:467px;float:left;padding:20px;padding-right:10px;">
		<p style="font-size:20px;font-family:'微软雅黑';margin-top:25px;"> 订单选择区</p>
		<div style="width:100%;float:left;margin-top:5px;background-color:#eeeeff;min-height:550px;padding-top:15px;">
			
			<div class="orderPanel">桌位编号</div>
			<div class="orderPanel_right"><input id="inputTableNO" type="text" /></div>
			<div class="orderPanel">订单菜品</div>
			<div class="orderPanel_menu">
			<%
			if(food_list!=null){
				for(int i=0;i<food_list.size();i++){
					Food food= (Food)food_list.get(i);
			%>
				<div class="inter_info">
					<span style="display:none;"> <%=food.getFood_id() %> </span>
					<button ><%=food.getFood_name() %> <%=food.getFood_price() %> 元</button>
				</div>
			<%}  }%>							
			</div>
			<div style="float:left;width:70px;;">订单酒水</div>
			<div class="orderPanel_menu_wine">
				<%
			if(drink_list!=null){
				for(int i=0;i<drink_list.size();i++){
					Food food= (Food)drink_list.get(i);
					double price = food.getFood_price();
			%>
				<div class="inter_info">
					<span style="display:none;"> <%=food.getFood_id() %> </span>
					<button ><%=food.getFood_name() %> <%=price %> 元</button>
				</div>
			<%}  }%>		
			</div>
		</div>
	</div>
	<div style="width:468px;float:left;padding:20px;padding-left:10px;">
		<p style="font-size:20px;font-family:'微软雅黑';margin-top:25px;"> 订单信息</p>
		<div style="width:100%;float:left;margin-top:5px;background-color:#eeeeff;min-height:550px;padding-top:15px;">
			
			<div class="orderPanel">订单桌号</div>
			<div class="orderPanel_right"><div id="tableNO"></div></div>
			<div class="orderPanel">订单菜品</div>
			<div id="showOrder" style="overflow-y:scroll; float:left;width:390px;height:150px;border:1px solid #D4E7FF;text-align:left;margin-bottom:15px;">
				
			</div>
			<div style="float:left;width:70px;">订单酒水</div>
			<div id="showOrder_wine" style="overflow-y:scroll; float:left;width:390px;height:150px;border:1px solid #D4E7FF;text-align:left;margin-bottom:15px;">
				
				
			</div>
			<div id="showTotalPrice" style="width:100%;text-align:center;height:60px;margin-top:27px;font-size:25px;">
			</div>
			<input type="submit" class="postInfo" style="margin-right:33px;width:160px;margin-top:50px;" onclick="totalPrice();" value="计算总价" />
			<input type="submit" class="postInfo" style="margin-right:33px;width:160px;margin-top:50px;" onclick="postOrderOK();" value="提交订单" />
		</div>
	</div>

	
</div>
</div>
<jsp:include page="footer.jsp" flush="true" />


</body>
</html>
