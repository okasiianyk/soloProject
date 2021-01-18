package com.olena.soloProject.models;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="deliveries_dt")
public class Delivery {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;
	@OneToOne(fetch=FetchType.LAZY,cascade=CascadeType.ALL)
	private Order deliveryOrder;
	private boolean methodDelivery;
	private String street;
	private String city;
	private String state;
	private int postalCode;
	private String country;
	private double deliveryPrice;
	private String phone;
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Order getDeliveryOrder() {
		return deliveryOrder;
	}
	public void setDeliveryOrder(Order deliveryOrder) {
		this.deliveryOrder = deliveryOrder;
	}
	public boolean isMethodDelivery() {
		return methodDelivery;
	}
	public void setMethodDelivery(boolean methodDelivery) {
		this.methodDelivery = methodDelivery;
	}
	public String getStreet() {
		return street;
	}
	public void setStreet(String street) {
		this.street = street;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public int getPostalCode() {
		return postalCode;
	}
	public void setPostalCode(int postalCode) {
		this.postalCode = postalCode;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public double getDeliveryPrice() {
		return deliveryPrice;
	}
	public void setDeliveryPrice(double deliveryPrice) {
		this.deliveryPrice = deliveryPrice;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}

	
}
