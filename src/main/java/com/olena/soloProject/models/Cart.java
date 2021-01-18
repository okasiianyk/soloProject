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
@Table(name="carts_dt")
public class Cart {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;
	@OneToOne(fetch=FetchType.LAZY,cascade=CascadeType.ALL)
	private Order order_id;	
	private double tips;
	private double tax;
	private double total;
	private double finalTotal;
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Order getOrder_id() {
		return order_id;
	}
	public void setOrder_id(Order order_id) {
		this.order_id = order_id;
	}
	public double getTips() {
		return tips;
	}
	public void setTips(double tips) {
		this.tips = tips;
	}
	public double getTax() {
		return tax;
	}
	public void setTax(double tax) {
		this.tax = tax;
	}
	public double getTotal() {
		return total;
	}
	public void setTotal(double total) {
		this.total = total;
	}
	public double getFinalTotal() {
		return finalTotal;
	}
	public void setFinalTotal(double finalTotal) {
		this.finalTotal = finalTotal;
	}
	
}
