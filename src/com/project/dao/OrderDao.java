package com.project.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.project.javabean.Order;
import com.project.javabean.User;
import com.project.util.DBPoolUtil;

public class OrderDao {
	
	public boolean addOrder(Order o) throws Exception {
		Connection conn = DBPoolUtil.getConnection();
		String sql = "insert into tb_order(order_state,order_date) values (?,?)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, o.getOrder_state());
		
		pstmt.setString(2,o.getOrder_date() );
		pstmt.executeUpdate();
		DBPoolUtil.closeConnection(conn);
		return true;
	}
	public int getOrderIdByOrder(Order o) throws Exception {
		int order_id=-1;
		Connection conn = DBPoolUtil.getConnection();
		String sql = "select * from tb_order where order_date='" + o.getOrder_date()+
				"' and order_state="+o.getOrder_state();
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet result = pstmt.executeQuery(sql);
		if (result.next()) {
			order_id=result.getInt("order_id");
		}
		DBPoolUtil.closeConnection(conn);
		return order_id;
	}
	public Order getOrderByOrderId(int order_id) throws Exception {
		Order o = new Order();
		Connection conn = DBPoolUtil.getConnection();
		String sql = "select * from tb_order where order_id=" + order_id;
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet result = pstmt.executeQuery(sql);
		if (result.next()) {
			o.setOrder_id(order_id);
			o.setOrder_date(result.getString("order_date"));
			o.setOrder_price(result.getDouble("order_price"));
			o.setOrder_state(result.getInt("order_state"));
		}
		DBPoolUtil.closeConnection(conn);
		return o;
	}
	public List<Order> listAllOrders() throws Exception {
		List<Order> orders = new ArrayList<Order>();
		Connection conn = DBPoolUtil.getConnection();
		String sql = "select * from tb_order";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet result = pstmt.executeQuery(sql);

		while (result.next()) {
			Order o = new Order();
			o.setOrder_id(result.getInt("order_id"));
			o.setOrder_date(result.getString("order_date"));
			o.setOrder_state(result.getInt("order_state"));
			o.setOrder_price(result.getDouble("order_price"));
			orders.add(o);
		}
		DBPoolUtil.closeConnection(conn);
		return orders;
	}
	
	public boolean deleteOrderByOrderId(int order_id) throws Exception {
		Connection conn = DBPoolUtil.getConnection();
		String sql = "delete from tb_order where order_id=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, order_id);
		pstmt.executeUpdate();
		DBPoolUtil.closeConnection(conn);
		return true;
	}
	public boolean modifyOrderState(Order o) throws Exception {
		Connection conn = DBPoolUtil.getConnection();
		String sql = "update tb_order set order_state=? where order_id=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, o.getOrder_state());
		pstmt.setInt(2, o.getOrder_id());
		
		pstmt.executeUpdate();
		DBPoolUtil.closeConnection(conn);
		return true;
	}
	public boolean modifyOrderPrice(Order o) throws Exception {
		Connection conn = DBPoolUtil.getConnection();
		String sql = "update tb_order set order_price=? where order_id=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setDouble(1, o.getOrder_price());
		pstmt.setInt(2, o.getOrder_id());
		
		pstmt.executeUpdate();
		DBPoolUtil.closeConnection(conn);
		return true;
	}
}
