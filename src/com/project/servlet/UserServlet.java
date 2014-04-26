package com.project.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.project.javabean.User;
import com.project.service.UserService;

/**
 * Servlet implementation class UserServlet
 */
@WebServlet("/UserServlet")
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		response.setCharacterEncoding("utf-8");
		//public use info.
		
		String type = request.getParameter("type");
		
		UserService service = new UserService();
		HttpSession session = request.getSession();
		try {
			if (type.equals("login")) {
				String user_name = request.getParameter("user_name");
				String user_pass = request.getParameter("user_pass");
				User u = new User();
				u.setUser_name(user_name);
				u.setUser_pass(user_pass);
				if (service.isExist(u)) {
					int user_id = service.getUserIdByUserName(user_name);
					u.setUser_id(user_id);
					User user = service.getUserByUserId(user_id);
					u.setUser_type(user.getUser_type());
					session.setAttribute("user", u);
					//jump to different page based on different user type.
					String jump_url="";
					switch(user.getUser_type())
					{
					case 1:jump_url="userManage.jsp";break;
					case 2:jump_url="menuList.jsp";break;
					case 3:jump_url="postOrder.jsp";break;
					case 4:jump_url="orderList.jsp";break;
					default:jump_url="error.jsp";break;
					}
					request.getRequestDispatcher(jump_url).forward(request,
							response);
				   } else {
					request.setAttribute("result", "用户名或密码不存在");
					request.getRequestDispatcher("login.jsp").forward(request,
							response);
				   }
				
			}//Administrator add user.
			else if (type.equals("add")) {
				String user_name = request.getParameter("user_name");
				String user_pass = request.getParameter("user_pass");
				int user_type = Integer.parseInt(request.getParameter("user_type"));
				
				User u = new User();
				u.setUser_name(user_name);
				u.setUser_pass(user_pass);
				u.setUser_type(user_type);
				service.addUser(u);
				response.sendRedirect("userManage.jsp");
			} 
			else if (type.equals("delete")) {
				int user_id = Integer.parseInt(request.getParameter("user_id"));
				service.deleteUserByUid(user_id);
				response.sendRedirect("userManage.jsp");
			}
			else if (type.equals("exit")) {
				session.invalidate();
				request.getRequestDispatcher("login.jsp").forward(request,
						response);
			} 
			else {
				response.sendRedirect("error.jsp");
				}
			
		} catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect("error.jsp");
		}
	}

}
