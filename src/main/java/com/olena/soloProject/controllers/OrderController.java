package com.olena.soloProject.controllers;

import java.text.DecimalFormat;
import java.text.ParseException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.olena.soloProject.models.Cart;
import com.olena.soloProject.models.Food;
import com.olena.soloProject.models.Order;
import com.olena.soloProject.models.User;
import com.olena.soloProject.services.CartService;
import com.olena.soloProject.services.OrderService;
import com.olena.soloProject.services.UserService;

@Controller
public class OrderController {
	@Autowired
	private OrderService orderService;
	@Autowired
	private UserService userService;
	@Autowired
	private CartService cartService ;
	@GetMapping("/orders")
	public String getOrders(HttpSession session, Model model, Cart cart1) {
		Long userId=(Long) session.getAttribute("user_id");
		User currentUser=userService.findUser(userId);
		model.addAttribute("user",currentUser);
		Order currentOrder = currentUser.getOrders().stream()
				.filter(e -> e.isOpen())
				.findAny()
				.orElse(new Order());
		
		//currentUser.getOrders().add(currentOrder);		
		model.addAttribute("currentFoodsInOrder",currentOrder.getFoods());
		model.addAttribute("delivery", currentOrder.getDeliveryInfo());
		model.addAttribute("cart", currentOrder.getCart());
		model.addAttribute("cart1",cart1);
		return "orders.jsp";
	}
	
	@GetMapping("/delete/{id}")
	public String delete(@PathVariable("id") Long id, HttpSession session) {
		Long userId=(Long) session.getAttribute("user_id");
		User currentUser=userService.findUser(userId);
		Order currentOrder = currentUser.getOrders().stream()
				.filter(e -> e.isOpen())
				.findAny()
				.orElse(new Order());
		for(var item:currentOrder.getFoods()) {
			if(id==item.getId()) {
				currentOrder.getFoods().remove(item);
				break;
			}
		}
		orderService.saveOrder(currentOrder);
		return "redirect:/orders";
	}
	
	
	@GetMapping("/update/{id}")
	public String getUpdate(@PathVariable("id") Long id,HttpSession session, Model model) {
		Long userId=(Long) session.getAttribute("user_id");
		User currentUser=userService.findUser(userId);
		model.addAttribute("user",currentUser);
		Order currentOrder = currentUser.getOrders().stream()
				.filter(e -> e.isOpen())
				.findAny()
				.orElse(new Order());
		Food fFood = currentOrder.getFoods().stream()
				.filter(e -> id==e.getId())
				.findAny()
				.orElse(new Food());
		model.addAttribute("currentFood", fFood);
		
		return "update.jsp";
	}
	
	@PostMapping("/update/{id}")
	public String postUpdate(@PathVariable("id") Long id,HttpSession session,Model model, @ModelAttribute("currentFood")Food food) {
		Long userId=(Long) session.getAttribute("user_id");
		User currentUser=userService.findUser(userId);
		Order currentOrder = currentUser.getOrders().stream()
				.filter(e -> e.isOpen())
				.findAny()
				.orElse(new Order());
		for(var item:currentOrder.getFoods()) {
			if(id==item.getId()) {
				item.setAmount(food.getAmount());
				break;
			}
		}
		orderService.saveOrder(currentOrder);
		return "redirect:/orders";
	}

	
	@GetMapping("/cart")
	public String getCart(HttpSession session, Model model) {
		Long userId=(Long) session.getAttribute("user_id");
		User currentUser=userService.findUser(userId);
		model.addAttribute("user",currentUser);
		Order currentOrder = currentUser.getOrders().stream()
				.filter(e -> e.isOpen())
				.findAny()
				.orElse(new Order());
		currentOrder.setOpen(false);
		model.addAttribute("total",currentOrder.getCart().getFinalTotal());
		currentOrder.setOpen(false);
		orderService.saveOrder(currentOrder);
		//currentUser.getOrders().add(currentOrder);		
		//model.addAttribute("currentFoodsInOrder",currentOrder.getFoods());
		//model.addAttribute("delivery", currentOrder.getDeliveryInfo());
		
		return "payment.jsp";
	}
	
	/*@GetMapping("/tips")
		public String getTips(HttpSession session, Model model, Cart cart) {
			return "tips.jsp";
	}*/
	
	@PostMapping("/tips")
	public String postTips(HttpSession session, Model model, Cart cart) {
		Long userId=(Long) session.getAttribute("user_id");
		User currentUser=userService.findUser(userId);
		model.addAttribute("user",currentUser);
		Order currentOrder = currentUser.getOrders().stream()
				.filter(e -> e.isOpen())
				.findAny()
				.orElse(new Order());
		double total2=0;
		for(var item:currentOrder.getFoods()) {
			total2+=item.getPrice()*item.getAmount();
		}
		//cart.setTax(total2*0.0625);
		DecimalFormat ds=new DecimalFormat("0.00");
		String form = ds.format(total2*0.0625);
		double taxValue=0;
		try {
			taxValue = (Double)ds.parse(form);
		} catch (ParseException e1) {
			e1.printStackTrace();
		}
		cart.setTax(taxValue);
		cart.setTotal(total2);
		double delivery2=0;
		if(currentOrder.getDeliveryInfo().isMethodDelivery()==true) {
			delivery2=10.00;
		}
		DecimalFormat df=new DecimalFormat("0.00");
		String formate = df.format(total2+cart.getTips()+cart.getTax()+delivery2); 
		double finalValue=0;
		try {
			finalValue = (Double)df.parse(formate);
		} catch (ParseException e1) {
			e1.printStackTrace();
		}
		cart.setFinalTotal(finalValue);
		cart.setOrder_id(currentOrder);
		cartService.saveCart(cart);
		return "redirect:/orders";
	}
	
}
