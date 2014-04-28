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

import com.project.javabean.Order;
import com.project.javabean.OrderDetail;
import com.project.service.OrderService;

/**
 * Servlet implementation class OrderServlet
 */
@WebServlet("/OrderServlet")
public class OrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderServlet() {
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
		int order_id = Integer.parseInt(request.getParameter("order_id"));
		String type = request.getParameter("type");
		
		OrderService service = new OrderService();
	//	HttpSession session = request.getSession();
		try {
			if (type.equals("add")) {
				String orderString = request.getParameter("orderString");
				service.addOrder(orderString);
				response.sendRedirect("orderList.jsp");
			} else if (type.equals("begin_cooking")) {
			//	int order_id = Integer.parseInt(request.getParameter("order_id"));
				Order order = service.getOrderByOrderId(order_id);
				order.setOrder_state(2);
				service.modifyOrderState(order);
				response.sendRedirect("orderList.jsp");
			}else if (type.equals("finish_cooking")) {
			//	int order_id = Integer.parseInt(request.getParameter("order_id"));
				Order order = service.getOrderByOrderId(order_id);
				order.setOrder_state(3);
				service.modifyOrderState(order);
				response.sendRedirect("orderList.jsp");
			}
			else if (type.equals("delete")) {
			//	int order_id = Integer.parseInt(request.getParameter("order_id"));
				service.deleteOrderByOrderId(order_id);
				response.sendRedirect("orderList.jsp");
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
