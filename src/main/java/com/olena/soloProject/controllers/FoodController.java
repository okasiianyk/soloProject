package com.olena.soloProject.controllers;

import java.io.File;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.olena.soloProject.models.Category;
import com.olena.soloProject.models.Food;
import com.olena.soloProject.services.CategoryService;
import com.olena.soloProject.services.FoodService;

@Controller
public class FoodController {
	@Autowired
	private CategoryService categoryService;
	@Autowired
	private FoodService foodService;
	

	@GetMapping("/category/new")
	public String addCategory( Category category) {
		return "newCategory.jsp";
	}
	
	@PostMapping("/category/new")
	public String postCategory(Category category) {		
		if (  categoryService.getCategories().stream()
				.filter(e -> e.getNameCategory().equals(category.getNameCategory()))
				.findFirst().isPresent())
				 return "redirect:/options";
		
		categoryService.saveCategory(category);
		return "redirect:/options";
	}
	

	@GetMapping("/food/new")
	public String addFood(Food food, Model model) {
		model.addAttribute("categories",categoryService.getCategories());
		
		String path = "src/main/resources/static/images";		 
		File file = new File(path);
		
		model.addAttribute("imgFoods", foodService.listFilesForFolder(file));
		return "newFood.jsp";
	}
	
	@PostMapping("/food/new")
	public String postFood(Food food) {
		if (foodService.getFood().contains(food)) 
			return "redirect:/options";
		foodService.saveFood(food);		
		return "redirect:/options";
	}


}	