package com.olena.soloProject.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.olena.soloProject.models.Order;
import com.olena.soloProject.repositories.OrderRepository;

@Service
public class OrderService {
	@Autowired
	private OrderRepository orderRepository;

	public OrderService(OrderRepository orderRepository) {
		this.orderRepository = orderRepository;
	}
	
	public List<Order> getOrders(){
		return orderRepository.findAll();
	}
	
	public Order getOrderById(Long id) {
		return orderRepository.findById(id).orElse(null);
	}
	
	public Order saveOrder(Order order) {
		return orderRepository.save(order);
	}
	
	
}
