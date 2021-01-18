package com.olena.soloProject.services;

import java.util.List;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.olena.soloProject.models.User;
import com.olena.soloProject.repositories.UserRepository;

@Service
public class UserService {
	@Autowired
	private UserRepository userRepository;
	
	public List<User> allUsers(){
		return userRepository.findAll();
	}
	
	public User findUser(Long id) {
		return userRepository.findById(id).orElse(null);
		
	}
	
	public User getUserRegistration(User user) {
		String hash = BCrypt.hashpw(user.getPassword(), BCrypt.gensalt());
		user.setPassword(hash);
		return userRepository.save(user);
	}
	
	public User saveUser(User user) {
		return userRepository.save(user);
	}
	public User findByEmail(String email) {
		return userRepository.findByEmail(email);
	}
	
	public boolean checkUser(String email, String password) {
		User user = userRepository.findByEmail(email);
		if(user == null) {
			return false;
		}
		return BCrypt.checkpw(password, user.getPassword());
	}
	
}

