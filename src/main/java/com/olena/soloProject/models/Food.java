package com.olena.soloProject.models;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="foods_dt")
public class Food {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;
	
	//@ManyToOne(fetch=FetchType.LAZY, cascade=CascadeType.ALL)
	//@JoinColumn(name="foodOrder")
	//	private Order foodOrder;
	
	private String foodName;
	private int amount;
	private double price;
	private String description;
	private String imgFood;
	@ManyToOne(fetch=FetchType.LAZY, cascade=CascadeType.ALL)
	@JoinColumn(name="categoryFood_id")
	private Category category;
	@ManyToMany(fetch=FetchType.LAZY, cascade=CascadeType.ALL)
	@JoinTable(name="orders_foods",
	joinColumns=@JoinColumn(name="food_id"),
	inverseJoinColumns=@JoinColumn(name="oder_id")
			)
	private List<Order> mtmOrders;
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	
	public String getFoodName() {
		return foodName;
	}
	public void setFoodName(String foodName) {
		this.foodName = foodName;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getImgFood() {
		return imgFood;
	}
	public void setImgFood(String imgFood) {
		this.imgFood = imgFood;
	}
	public Category getCategory() {
		return category;
	}
	public void setCategory(Category category) {
		this.category = category;
	}
	public List<Order> getMtmOrders() {
		return mtmOrders;
	}
	public void setMtmOrders(List<Order> mtmOrders) {
		this.mtmOrders = mtmOrders;
	}
	
	
}
