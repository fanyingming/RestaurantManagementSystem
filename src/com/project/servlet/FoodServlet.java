package com.project.servlet;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.project.javabean.Food;
import com.project.service.FoodService;
import com.project.util.*;

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
	
		String type = request.getParameter("type");
		String which = request.getParameter("which");
		FoodService service = new FoodService();
	//	HttpSession session = request.getSession();
		try {
			if (type.equals("add")) {
				UploadUtil uploadUtil = new UploadUtil(request);
				String food_name = uploadUtil.getParameter("food_name");
				String food_description = uploadUtil.getParameter("food_description");
				double food_price = Double.parseDouble(uploadUtil.getParameter("food_price"));
				
				BufferedInputStream inputStream = uploadUtil
						.getInputStream("profile");
				String food_image_path = uploadUtil.getFileName("profile");
				String name = "";
				if (inputStream != null && !food_image_path.equals("")) {
					Calendar calendar = Calendar.getInstance();
					name = String.valueOf(calendar.getTimeInMillis())
							+ food_image_path.substring(food_image_path.lastIndexOf("."));
					
					String filepath = request.getRealPath("\\FoodImages")
							+ "\\" + name;
				
					File file = new File(filepath);
					OutputStream outStream = new FileOutputStream(file);
					BufferedOutputStream outputStream = new BufferedOutputStream(
							outStream);
					ImgWriteUtil imgUtil = new ImgWriteUtil();
					imgUtil.writeImg(inputStream, outputStream);
				}
				Food food = new Food();
				food.setFood_description(food_description);
				food.setFood_image_path(name);
				food.setFood_name(food_name);
				food.setFood_price(food_price);
				if (which.equals("food"))
					food.setFood_type(1);
				else
					food.setFood_type(2);
				service.addFood(food);		
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
