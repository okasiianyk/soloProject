package com.olena.soloProject.models;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="categories_dt")
public class Category {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;
	@OneToMany(mappedBy="category", fetch=FetchType.LAZY)
	private List<Food> foodCategory;
	private String nameCategory;
	private String imgCategory;
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public List<Food> getFoodCategory() {
		return foodCategory;
	}
	public void setFoodCategory(List<Food> foodCategory) {
		this.foodCategory = foodCategory;
	}
	public String getNameCategory() {
		return nameCategory;
	}
	public void setNameCategory(String nameCategory) {
		this.nameCategory = nameCategory;
	}
	public String getImgCategory() {
		return imgCategory;
	}
	public void setImgCategory(String imgCategory) {
		this.imgCategory = imgCategory;
	}
	
	
}
