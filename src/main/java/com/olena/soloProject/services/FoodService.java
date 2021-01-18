package com.olena.soloProject.services;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.olena.soloProject.models.Food;
import com.olena.soloProject.models.Order;
import com.olena.soloProject.repositories.FoodRepository;

@Service
public class FoodService {
	@Autowired
	public FoodRepository foodRepository;

	public List<Food> getFood(){
		return foodRepository.findAll();
	}
	public FoodService(FoodRepository foodRepository) {
		this.foodRepository = foodRepository;
	}
	
	public Food getFoodById(Long id) {
		return foodRepository.findById(id).orElse(null);
	}
	
	
	public Food saveFood(Food food) {
		return foodRepository.save(food);

	}
	
	public List<String> listFilesForFolder(final File folder) {
		List<String>imgs=new ArrayList<String>();
	    for (final File fileEntry : folder.listFiles()) {
	        if (fileEntry.isDirectory()) {
	            listFilesForFolder(fileEntry);
	        } else {
	            imgs.add(fileEntry.getName());
	        }
	    }
	    return imgs;
	}
	
	public void deleteFood(Food food) {
		foodRepository.delete(food);
	}
}
