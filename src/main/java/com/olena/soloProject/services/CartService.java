package com.olena.soloProject.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.olena.soloProject.models.Cart;
import com.olena.soloProject.repositories.CartRepository;

@Service
public class CartService {
	@Autowired
	private CartRepository cartRepository ;
	
	public CartService(CartRepository cartRepository) {
		this.cartRepository = cartRepository;
	}

	public Cart getCart(Long id){
		return cartRepository.findById(id).orElse(null);
	}
	
	
	public Cart saveCart(Cart cart) {
		return cartRepository.save(cart);
	}
}
