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
function addMember()
{
	var str0="<form action='UserServlet?type=add' method='post'>"
	var str1="<ul class='table interleaved_0' style='margin:auto; width:786px;'>";
	var str2="<li class='t1' style='width:156px;'></li>";
	var str3="<li class='t2' style='width:156px;'><select name='user_type'><option value ='3'>服务员</option><option value ='4'>厨师</option><option value ='2'>经理</option><option value ='1'>管理员</option></select></li>";
	var str4="<li class='t3' style='width:156px;'><input  name='user_name' type='text' /></li>";
	var str5="<li class='t3' style='width:156px;'><input name ='user_pass' type='text' /></li>";
	var str6="<li class='t5' style='width:156px;'><input type='submit' value='添加'/></li>";
	var str7="</ul></form>";

	$("#contentArea").append(str0+str1+str2+str3+str4+str5+str6+str7);
}

</script>
</head>
<body>
<%
	UserService userService=new UserService();
	List<User> list = userService.listAllUsers(); 
%>
	<jsp:include page="header.jsp" flush="true" />
	
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
		<%
         	if(list!=null){
        			for(int i=0;i<list.size();i++){
        				User user= (User)list.get(i);
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
		<ul class="table interleaved_0" style="margin:auto; width:786px;">
				<li class="t1" style="width:156px;"><%=user.getUser_id() %></li>
				<li class="t2" style="width:156px;"><%=user_position %></li>
				<li class="t3" style="width:156px;"><%=user.getUser_name() %></li>
				<li class="t3" style="width:156px;"><%=user.getUser_pass() %></li>
				<li class="t5" style="width:156px;"><a href="UserServlet?type=delete&&user_id=<%=user.getUser_id()%>">删除</a></li>
		</ul>	
		<%} } %>	
			
			
	</div>

</div>
</div>
<jsp:include page="footer.jsp" flush="true" />

</body>
</html>
