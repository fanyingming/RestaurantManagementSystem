package com.project.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.project.javabean.Food;
import com.project.service.FoodService;

/**
 * Servlet implementation class FoodServlet
 */
@WebServlet("/FoodServlet")
public class FoodServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FoodServlet() {
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
		String food_name = request.getParameter("food_name");
		String food_description = request.getParameter("food_description");
		String food_image_path = request.getParameter("food_image_path");
		double food_price = Double.parseDouble(request.getParameter("food_price"));
		String type = request.getParameter("type");
		
		FoodService service = new FoodService();
	//	HttpSession session = request.getSession();
		try {
			if (type.equals("addFood")) {
				
			
				response.sendRedirect("menuList.jsp");
			} 
			else if (type.equals("delete")) {
			//	int user_id = Integer.parseInt(request.getParameter("user_id"));
			//	service.deleteUserByUid(user_id);
			//	response.sendRedirect("userManage.jsp");
			}
			else if (type.equals("exit")) {
			//	session.invalidate();
			//	request.getRequestDispatcher("login.jsp").forward(request,
			//			response);
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
