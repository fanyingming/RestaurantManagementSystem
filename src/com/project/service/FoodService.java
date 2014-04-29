package com.project.service;

import java.util.List;

import com.project.dao.FoodDao;
import com.project.javabean.Food;

public class FoodService {
	
	FoodDao dao = new FoodDao();

	public boolean addFood(Food u) throws Exception {
	
		return dao.addFood(u);

	}
	
	public double getFoodPriceByFoodId(int food_id) throws Exception {
		return dao.getFoodPriceByFoodId(food_id);
	}
	public Food getFoodByFoodId(int food_id) throws Exception {
		return dao.getFoodByFoodId(food_id);
	}
	public boolean deleteFoodByFoodId(int food_id) throws Exception {
		return dao.deleteFoodByFoodId(food_id);
	}


	public List<Food> listAllFoods() throws Exception {
		return dao.listAllFoodsByFoodType(1);
	}
	
	public List<Food> listAllDrinks() throws Exception {
		return dao.listAllFoodsByFoodType(2);
	}

	public int getFoodTotalNum() throws Exception {
		return dao.getFoodTotalNum();
	}

}
