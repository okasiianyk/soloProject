package com.olena.soloProject.validations;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;

import com.olena.soloProject.models.User;
import com.olena.soloProject.repositories.UserRepository;


@Component
public class UserValidator {
	@Autowired
	private UserRepository userRepository;
	
	public boolean supports(Class<?> clazz) {
		return User.class.equals(clazz);
	}

	public void getValidation(Object obj, Errors errors) {
	        User user = (User) obj;
	        if(!user.getPassword().equals(user.getConfPassword())) {
	        	errors.rejectValue("password", "match", "Password doesn't match!");
	        }
	        if(this.userRepository.existsByEmail(user.getEmail())) {
	        	errors.rejectValue("email", "Unique", "Email is already taken, try again!");
	        }  
	    }
}
