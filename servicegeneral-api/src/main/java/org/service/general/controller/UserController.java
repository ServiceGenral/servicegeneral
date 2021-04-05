package org.service.general.controller;

import java.util.List;

import org.service.general.entity.Login;
import org.service.general.entity.User;
import org.service.general.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/user")
public class UserController {

	@Autowired
	private UserService service;
	
	@GetMapping
	public List<User> getAllUsers(){
		return service.getUsersFromService();
	}
	
	@GetMapping("/{username}")
	public User getUser(@PathVariable String username) {
		return service.getUserFromService(username);
	}
	
	@PostMapping
	public String registerUser(@RequestBody User user) {
		return service.registerUserFromService(user);
	}
	
	@PostMapping("/login")
	public String userLoginInfo(@RequestBody Login login) {
		return service.loginInfoFromService(login);
	}
	
	
}
