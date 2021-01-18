package com.olena.soloProject.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.olena.soloProject.models.Delivery;
import com.olena.soloProject.repositories.DeliveryRepository;

@Service
public class DeliveryService {
	@Autowired
	private DeliveryRepository deliveryRepository;

	public DeliveryService(DeliveryRepository deliveryRepository) {
		this.deliveryRepository = deliveryRepository;
	}
	
	public Delivery saveDelivery(Delivery delivery) {
		return deliveryRepository.save(delivery);
	}
	
}
