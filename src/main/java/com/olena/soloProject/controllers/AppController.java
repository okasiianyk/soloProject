package com.olena.soloProject.controllers;

import java.io.File;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.ResourceUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.olena.soloProject.models.Category;
import com.olena.soloProject.models.Delivery;
import com.olena.soloProject.models.Food;
import com.olena.soloProject.models.Order;
import com.olena.soloProject.models.User;
import com.olena.soloProject.services.CategoryService;
import com.olena.soloProject.services.DeliveryService;
import com.olena.soloProject.services.FoodService;
import com.olena.soloProject.services.OrderService;
import com.olena.soloProject.services.UserService;

@Controller
public class AppController {
	@Autowired
	private OrderService orderService;
	@Autowired
	private CategoryService categoryService;
	@Autowired
	private FoodService foodService;
	@Autowired
	private DeliveryService deliveryService;
	@Autowired
	private UserService userService;

	
	

	public AppController(OrderService orderService, CategoryService categoryService, FoodService foodService,
			DeliveryService deliveryService, UserService userService) {
		this.orderService = orderService;
		this.categoryService = categoryService;
		this.foodService = foodService;
		this.deliveryService = deliveryService;
		this.userService = userService;
	}

	@GetMapping("/options")
	public String getOptions(HttpSession session, Model model) {
		model.addAttribute("categories", categoryService.getCategories());
		Long userId=(Long) session.getAttribute("user_id");
		User currentUser=userService.findUser(userId);
		model.addAttribute("user",currentUser);
		Order currentOrder = currentUser.getOrders().stream()
				.filter(e -> e.isOpen())
				.findAny()
				.orElse(new Order());
		
		currentUser.getOrders().add(currentOrder);		
		model.addAttribute("currentFoodsInOrder",currentOrder.getFoods());
		model.addAttribute("delivery", currentOrder.getDeliveryInfo());
		return "options.jsp";
	}
	
	
	@GetMapping("/bakery/{id}")
	public String getCakes(HttpSession session, Model model, @PathVariable("id") Long id,
			@ModelAttribute("food") Food food) {
		List<Food> allFood = foodService.getFood()
		  .stream()
		  .filter(e -> (e.getCategory().getId()==id))
		  .collect(Collectors.toList());
			model.addAttribute("cakes",allFood);
		
			//model.addAttribute("cakes", foodService.getFood());
		return "bakery.jsp";
	}

	
	@PostMapping("/addFood/{id}")
	public String postCakes(HttpSession session, 
			@PathVariable("id") Long cakeId, 
			@ModelAttribute("food") Food food
			) {
		Long userId=(Long) session.getAttribute("user_id");
	User currentUser=userService.findUser(userId);
		Order currentOrder = currentUser.getOrders().stream()
				.filter(e -> e.isOpen())
				.findAny()
				.orElse(new Order());
		Food currentFood = foodService.getFoodById(cakeId);
		currentFood.setAmount(food.getAmount());
		for(var item : currentOrder.getFoods()) {
			if(item.getId()==currentFood.getId()) {
				return "redirect:/options";
			}
		}
		currentOrder.getFoods().add(currentFood);
		if(currentOrder.getUser()==null)
			currentOrder.setUser(currentUser);
		if(!currentUser.getOrders().contains(currentOrder))
			currentUser.getOrders().add(currentOrder);
		userService.saveUser(currentUser);
		orderService.saveOrder(currentOrder);
		return "redirect:/options";
	}


	@GetMapping("/delivery")
	public String delivery(Delivery delivery, Model model) {
		return "delivery.jsp";
	}
	
	@PostMapping("/delivery")
	public String postFood(HttpSession session, Model model,@ModelAttribute("delivery") Delivery delivery) {
		Long userId=(Long) session.getAttribute("user_id");
		User currentUser=userService.findUser(userId);
			Order currentOrder = currentUser.getOrders().stream()
					.filter(e -> e.isOpen())
					.findAny()
					.orElse(new Order());
			if(delivery.isMethodDelivery()==true) {
			delivery.setDeliveryPrice(10.00);}
			else {
				delivery.setDeliveryPrice(0.00);
			}
			delivery.setDeliveryOrder(currentOrder);
			deliveryService.saveDelivery(delivery);
			
			currentOrder.setDeliveryInfo(delivery);
			currentOrder.setUser(currentUser);
			currentUser.getOrders().add(currentOrder);
			userService.saveUser(currentUser);
			orderService.saveOrder(currentOrder);
		model.addAttribute("delivery", deliveryService.saveDelivery(delivery));
		return "redirect:/orders";
	}
}
