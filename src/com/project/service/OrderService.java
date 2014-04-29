package com.project.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.project.dao.OrderDao;
import com.project.dao.FoodDao;
import com.project.javabean.Order;
import com.project.javabean.User;
import com.project.dao.OrderDetailDao;
import com.project.javabean.OrderDetail;

public class OrderService {
	OrderDao orderDao = new OrderDao();
	OrderDetailDao orderDetailDao = new OrderDetailDao();
	FoodDao foodDao = new FoodDao();
	
	public boolean addOrder(String orderString) throws Exception {
		
		Order order = new Order();
		order.setOrder_state(-1);
		Date now = new Date();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		String nowTime = df.format(now);
		order.setOrder_date(nowTime);
		orderDao.addOrder(order);
		List<OrderDetail> orderDetails = new ArrayList<OrderDetail>();
		//parse orderString to orderDetail list here.
		String strings[] = orderString.split(";");
		for( int i=1;i<strings.length;i++ ){
			OrderDetail orderDetail = new OrderDetail();
			String food_string[] = strings[i].split(",");
			orderDetail.setFood_id(Integer.parseInt(food_string[0]));
			orderDetail.setOrder_detail_num((Integer.parseInt(food_string[1])));
			orderDetails.add(orderDetail);
		}
		double price = 0;
		int order_id = orderDao.getOrderIdByOrder(order);
		for( int i=0;i<orderDetails.size();i++ ){
			OrderDetail orderDetail = orderDetails.get(i);
			orderDetail.setOrder_id(order_id);
			orderDetailDao.addOrderDetail(orderDetail);
			int food_id =  orderDetail.getFood_id();
			int food_num= orderDetail.getOrder_detail_num();
			double food_price = foodDao.getFoodPriceByFoodId(food_id);
			 price += food_num*food_price;
		}
		order.setOrder_id(order_id);
		order.setOrder_price(price);
		orderDao.modifyOrderPrice(order);
		order.setOrder_state(1);
		orderDao.modifyOrderState(order);
		return true;
	}
	
	public List<Order> listAllOrders() throws Exception {
		return orderDao.listAllOrders();
	}
	
	public List<OrderDetail> listAllOrderDetailsByOrderId(int order_id) throws Exception {
		return orderDetailDao.listAllOrderDetailsByOrderID(order_id);
	}
	
	public boolean deleteOrderByOrderId(int order_id) throws Exception {
		return orderDao.deleteOrderByOrderId(order_id);
	}
	
	public boolean modifyOrderState(Order o ) throws Exception {
		return orderDao.modifyOrderState(o);
	}
	
	public Order getOrderByOrderId(int order_id)throws Exception{
		return orderDao.getOrderByOrderId(order_id);
	}

}
