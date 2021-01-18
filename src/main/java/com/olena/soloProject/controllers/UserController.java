package com.olena.soloProject.controllers;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.olena.soloProject.models.Position;
import com.olena.soloProject.models.User;
import com.olena.soloProject.services.UserService;
import com.olena.soloProject.validations.UserValidator;



@Controller
public class UserController {
	@Autowired
	private UserService userService;
	@Autowired
	private UserValidator userValidator;
	
	@RequestMapping("/start")
	private String main(@ModelAttribute("user") User user) {
		return "index.jsp";
	}
	
	@RequestMapping("/")
	private String index() {
		return "redirect:/start";
	}
	
	@PostMapping("/userLogin")
	public String userLogin(HttpSession session, @RequestParam("loginEmail") String email, @RequestParam("loginPassword") String password, RedirectAttributes redirectAttrs) {
		if(!this.userService.checkUser(email, password)) {
			redirectAttrs.addFlashAttribute("loginError", "Invalid Credentials");
			return "redirect:/";
		}
		User user = this.userService.findByEmail(email);
		session.setAttribute("user_id", user.getId());
		return "redirect:/options";
	}
	
	@GetMapping("/userLogout")
	public String userLogout(HttpSession session) {
		session.invalidate();
		return "redirect:/start";
	}
	
	@PostMapping("/registration")
	public String getRegister(@Valid @ModelAttribute("user") User user, BindingResult result, HttpSession session) {
		List<User> users=userService.allUsers();
		if(users.isEmpty()|| users==null) {
			user.setUserPosition(Position.admin);
		}else {
			user.setUserPosition(Position.user);
		}
		userValidator.getValidation(user, result);
		if(result.hasErrors()) {
			return "index.jsp";
		} 
		User tempUser = userService.getUserRegistration(user);
		session.setAttribute("user_id", tempUser.getId());
		return "redirect:/options";		
		
	}
	

}