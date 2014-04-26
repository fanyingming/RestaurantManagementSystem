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
function addMember()
{
	var str1="<ul class='table interleaved_0' style='margin:auto; width:786px;'>";
	var str2="<li class='t1' style='width:156px;'><input type='text' /></li>";
	var str3="<li class='t2' style='width:156px;'><select><option value ='waiter'>服务员</option><option value ='cook'>厨师</option><option value ='manager'>经理</option><option value ='admin'>管理员</option></select></li>";
	var str4="<li class='t3' style='width:156px;'><input type='text' /></li>";
	var str5="<li class='t3' style='width:156px;'><input type='text' /></li>";
	var str6="<li class='t5' style='width:156px;'><button>删除</button><button>保存</button></li>";
	var str7="</ul>";

	$("#contentArea").append(str1+str2+str3+str4+str5+str6+str7);
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
				<a onclick="nihao(this)" class="x " href="postOrder.jsp">订单提交</a>
				<a onclick="nihao(this)" class="x " href="financeManage.jsp">财务管理</a>
				<a onclick="nihao(this)" class="x select" href="systemManage.jsp">系统管理</a>
				
			</div>
		</div>
	</div>
<div class="body">
<div class="body_bg">
	<div style="float:none;margin-left:105px;width:100px;height:40px;margin-top:30px;margin-bottom:5px;">
		<button style="width:100%;height:100%;" onclick="addMember();">+添加角色</button>
	</div>
	<div id="contentArea">
		<ul class="table title" style="margin:auto; width:786px;">
			<li class="t1" style="width:156px;">编号</li>
			<li class="t2" style="width:156px;">角色</li>
			<li class="t3" style="width:156px;">用户名</li>
			<li class="t4" style="width:156px;">密码</li>
			<li class="t5" style="width:156px;">操作</li>

		</ul>
		<ul class="table interleaved_0" style="margin:auto; width:786px;">
				<li class="t1" style="width:156px;">1</li>
				<li class="t2" style="width:156px;">厨师</li>
				<li class="t3" style="width:156px;">wang</li>
				<li class="t3" style="width:156px;">123456</li>
				<li class="t5" style="width:156px;"><button>删除</button></li>
		</ul>	
			
			
			
	</div>

</div>
</div>
<jsp:include page="footer.jsp" flush="true" />

</body>
</html>
