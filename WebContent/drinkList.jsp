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
<script type="text/javascript" src="jquery.min.js"></script>
<link type="text/css" href="style-1.css" rel="stylesheet" />
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
			//$(this).parent().parent().next().next().show();
		});

	
	});
	
	function addMember()
	{
		
	
		var str1="<ul class='table interleaved_0' style='margin:auto; width:786px;'>";
		var str2="<li class='t1' style='width:130px;'><input type='text' /></li>";
		var str3="<li class='t2' style='width:130px;'><select><option value ='baijiu'>白酒</option><option value ='pijiu'>啤酒</option><option value ='饮料'>饮料</option></select></li>";
		var str4="<li class='t3' style='width:130px;'><input type='text' /></li>";
		var str5="<li class='t4' style='width:130px;'><input type='text' /></li>";
		var str6="<li class='t5' style='width:130px;'></li>";
		var str7="<li class='t6' style='width:130px;'><button>保存</button></li>";
		var str8="</ul>";
		$("#contentArea").append(str1+str2+str3+str4+str5+str6+str7+str8);
	}
</script>
</head>
<body>
<%
	FoodService foodService=new FoodService();
	List<Food> list = foodService.listAllDrinks(); 
%>
	
	<jsp:include page="header.jsp" flush="true" />
<div class="body">
<div class="body_bg">
	<div style="float:none;margin-left:105px;width:100px;height:40px;margin-top:30px;margin-bottom:5px;">
		<button style="width:100%;height:100%;" onclick="addMember();">+添加酒水</button>
	</div>
	<div id="contentArea">
		<ul class="table title" style="margin:auto; width:786px	;">
			<li class="t1" style="width:130px;">编号</li>
			<li class="t2" style="width:130px;">类型</li>
			<li class="t3" style="width:130px;">名称</li>
			<li class="t4" style="width:130px;">价格</li>
			<li class="t5" style="width:130px;">详细信息</li>
			<li class="t6" style="width:130px;">删除</li>

		</ul>
		<%
		if(list!=null){
			for(int i=0;i<list.size();i++){
				Food food= (Food)list.get(i);
		%>
		<ul class="table interleaved_0" style="margin:auto;width:786px	;">
				<li class="t1" style="width:130px;"><%=food.getFood_id()%></li>
				<li class="t2" style="width:130px;">白酒</li>
				<li class="t3" style="width:130px;"><%=food.getFood_name()%></li>
				<li class="t4" style="width:130px;"><%=food.getFood_price() %></li>
				<li class="t5" style="width:130px;"><a href="#">查看</a></li>

				<li class="t6" style="width:130px;"><button>删除</button></li>
				
		</ul>	
		<div style="margin:auto; width:786px;border:1px solid #3388FF;height:180px;display:none;">
			<div style="width:180px;float:left;height:180px;">
				<img style="width:180px;height:180px;" src="image/nlsegt.jpg" />
			</div>
			<div style="float:left;height:140px;width:546px;padding:30px;">
				<%=food.getFood_description()%>	
			</div>
		</div>	
		<%}  }%>		
			
	</div>
</div>
</div>
<jsp:include page="footer.jsp" flush="true" />


</body>
</html>
