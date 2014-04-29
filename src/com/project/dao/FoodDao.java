package com.project.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.project.javabean.Food;
import com.project.javabean.User;
import com.project.util.DBPoolUtil;

public class FoodDao {
	
	public boolean addFood(Food f) throws Exception {
		Connection conn = DBPoolUtil.getConnection();
		String sql = "insert into tb_food(food_name,food_description,food_image_path,food_type,food_price) values (?,?,?,?,?)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, f.getFood_name());
		pstmt.setString(2, f.getFood_description());
		pstmt.setString(3, f.getFood_image_path());
		pstmt.setInt(4, f.getFood_type());
		pstmt.setDouble(5, f.getFood_price());
		pstmt.executeUpdate();
		DBPoolUtil.closeConnection(conn);
		return true;
	}
	
	public int getFoodTotalNum() throws Exception {
		int num = 0;
		Connection conn = DBPoolUtil.getConnection();
		String sql = "select * from tb_food ";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet result = pstmt.executeQuery(sql);
		if (result.next()) {
			result.last();
			num = result.getRow();
		} else {
			num = 0;
		}
		DBPoolUtil.closeConnection(conn);
		return num;
	}
	
	public List<Food> listAllFoodsByFoodType(int food_type) throws Exception {
		List<Food> foods = new ArrayList<Food>();
		Connection conn = DBPoolUtil.getConnection();
		String sql = "select * from tb_food where food_type="+food_type;
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet result = pstmt.executeQuery(sql);

		while (result.next()) {
			Food f = new Food();
			f.setFood_id(result.getInt("food_id"));
			f.setFood_name(result.getString("food_name"));
			f.setFood_description(result.getString("food_description"));
			f.setFood_image_path(result.getString("food_image_path"));
			f.setFood_type(result.getInt("food_type"));
			f.setFood_price(result.getInt("food_price"));
			foods.add(f);
		}
		DBPoolUtil.closeConnection(conn);
		return foods;
	}
	
	public boolean deleteFoodByFoodId(int food_id) throws Exception {
		Connection conn = DBPoolUtil.getConnection();
		String sql = "delete from tb_food where food_id=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, food_id);
		pstmt.executeUpdate();
		DBPoolUtil.closeConnection(conn);
		return true;
	}
	public double getFoodPriceByFoodId(int food_id) throws Exception {
		double food_price=0;
		Connection conn = DBPoolUtil.getConnection();
		String sql = "select * from tb_food where food_id=" + food_id;
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet result = pstmt.executeQuery(sql);
		if (result.next()) {
			food_price = result.getDouble("food_price");
		}
		DBPoolUtil.closeConnection(conn);
		return food_price;
	}
}
