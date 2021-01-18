package com.olena.soloProject.models;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.CollectionTable;
import javax.persistence.ElementCollection;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.OrderColumn;
import javax.persistence.Table;


@Entity
@Table(name="orders_dt")
public class Order {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;
	
	@ManyToOne(fetch=FetchType.LAZY,cascade=CascadeType.ALL)
	@JoinColumn(name="user_id")
	private User user;
	
	@OneToOne(mappedBy="deliveryOrder",fetch=FetchType.LAZY,cascade=CascadeType.ALL)
	private Delivery deliveryInfo;
	
	//@OneToMany(mappedBy="foodOrder",fetch=FetchType.LAZY,cascade=CascadeType.ALL)
    /*@ElementCollection(targetClass=Food.class)
    @CollectionTable(name = "orders_f", joinColumns = @JoinColumn(name = "id"))
    @OrderColumn
	private List<Food> foods;*/
	
	@OneToOne(mappedBy="order_id",fetch=FetchType.LAZY,cascade=CascadeType.ALL)	
	private Cart cart;
	
	private boolean isOpen;
	
	@ManyToMany(fetch=FetchType.LAZY, cascade=CascadeType.ALL)
	@JoinTable(name="orders_foods",
	joinColumns=@JoinColumn(name="oder_id"),
	inverseJoinColumns=@JoinColumn(name="food_id")
			)
	private List<Food> foods;
	
	public Order() {
		this.isOpen = true;
		this.foods = new ArrayList<Food>();
	}

	public boolean isOpen() {
		return isOpen;
	}

	public void setOpen(boolean isOpen) {
		this.isOpen = isOpen;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Delivery getDeliveryInfo() {
		return deliveryInfo;
	}

	public void setDeliveryInfo(Delivery deliveryInfo) {
		this.deliveryInfo = deliveryInfo;
	}

	public List<Food> getFoods() {
		return foods;
	}

	public void setFoods(List<Food> foods) {
		this.foods = foods;
	}

	public Cart getCart() {
		return cart;
	}

	public void setCart(Cart cart) {
		this.cart = cart;
	}

	
	
}
