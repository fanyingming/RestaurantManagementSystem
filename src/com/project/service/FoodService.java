package com.project.service;

import java.sql.SQLException;
import java.util.List;

import com.project.dao.FoodDao;
import com.project.javabean.Food;

public class FoodService {
	
	FoodDao dao = new FoodDao();

	public boolean addFood(Food u) throws Exception {
	
		return dao.addFood(u);

	}


	public boolean deleteFoodByFoodId(int food_id) throws Exception {
		return dao.deleteFoodByFoodId(food_id);
	}


	public List<Food> listAllFoods() throws Exception {
		return dao.listAllFoods();
	}

	public int getFoodTotalNum() throws Exception {
		return dao.getFoodTotalNum();
	}

}
