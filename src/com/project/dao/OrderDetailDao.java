package com.project.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.project.javabean.Order;
import com.project.javabean.OrderDetail;
import com.project.util.DBPoolUtil;

public class OrderDetailDao {
	public boolean addOrderDetail(OrderDetail o) throws Exception {
		Connection conn = DBPoolUtil.getConnection();
		String sql = "insert into tb_order_detail(order_id,food_id,order_detail_num) values (?,?,?)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, o.getOrder_id());
		pstmt.setInt(2, o.getFood_id());
		pstmt.setInt(3, o.getOrder_detail_num());
		pstmt.executeUpdate();
		DBPoolUtil.closeConnection(conn);
		return true;
	}
	public List<OrderDetail> listAllOrderDetailsByOrderID(int order_id) throws Exception {
		List<OrderDetail> orderDetails = new ArrayList<OrderDetail>();
		Connection conn = DBPoolUtil.getConnection();
		String sql = "select * from tb_order_detail where order_id="+order_id;
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet result = pstmt.executeQuery(sql);

		while (result.next()) {
			OrderDetail o = new OrderDetail();
			o.setOrder_id(result.getInt("order_id"));
			o.setOrder_detail_num(result.getInt("order_detail_num"));
			o.setFood_id(result.getInt("food_id"));
			orderDetails.add(o);
		}
		DBPoolUtil.closeConnection(conn);
		return orderDetails;
	}
}
