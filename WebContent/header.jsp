<%@ page language="java" import="java.util.*,com.project.javabean.*,com.project.util.*,
com.project.service.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div style="width:100%;">
		<div class="head" style="height:125px;padding-bottom:0px;">
			<div style="width:47%;float:left;margin-left:3%;">
				<a href="index.jsp" class="nameLogo">小楼听雨<span style="font-size:20px;">餐饮管理系统</span></a>
			</div>
			<div style="width:50%;float:left;">
				<%
				if(session.getAttribute("user")!=null){
				User user=(User)session.getAttribute("user");
				String user_position;
				switch(user.getUser_type())
				{
					case 1:user_position = "管理员";break;
					case 2:user_position = "餐厅经理";break;
					case 3:user_position = "服务员";break;
					case 4:user_position = "厨师";break;
					default:user_position= "unknown";break;
				}
			%>
			<span style="float:right;">欢迎 <%=user.getUser_name()%>, 您的职位是 <%=user_position %>&nbsp;[<a href="UserServlet?type=exit" id="exit-button">退出</a>]</span>   
			<% }%>

			</div>
			<div class="menu">
				<a onclick="nihao(this)" class="x " href="table.jsp">开台管理</a>
				<a onclick="nihao(this)" class="x " href="menuList.jsp">菜谱管理</a>
				<a onclick="nihao(this)" class="x " href="drinkList.jsp">酒水管理</a>
				<a onclick="nihao(this)" class="x " href="orderList.jsp">下单管理</a>
				<a onclick="nihao(this)" class="x " href="postOrder.jsp">订单提交</a>
				<a onclick="nihao(this)" class="x " href="financeManage.jsp">财务管理</a>
				<a onclick="nihao(this)" class="x " href="userManage.jsp">系统管理</a>
				
			</div>
		</div>
	</div>
</body>
</html>

	
