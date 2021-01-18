package com.olena.soloProject.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.olena.soloProject.models.Category;
import com.olena.soloProject.repositories.CategoryRepository;

@Service
public class CategoryService {
	@Autowired
	private CategoryRepository categoryRepository ;
	
	public CategoryService(CategoryRepository categoryRepository) {
		this.categoryRepository = categoryRepository;
	}

	public Category getCategory(Long id){
		return categoryRepository.findById(id).orElse(null);
	}
	
	public List<Category> getCategories(){
		return categoryRepository.findAll();
	}
	
	public Category saveCategory(Category category) {
		return categoryRepository.save(category);
	}
}
