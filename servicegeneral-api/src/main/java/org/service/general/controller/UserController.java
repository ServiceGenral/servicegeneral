package org.service.general.controller;

import java.util.List;

import javax.ws.rs.Consumes;
import javax.ws.rs.OPTIONS;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import org.service.general.entity.Feedback;
import org.service.general.entity.Login;
import org.service.general.entity.User;
import org.service.general.repository.UserRepo;
import org.service.general.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/user")
@CrossOrigin(origins = {"http://127.0.0.1:9090","http://127.0.0.1:8080"})
public class UserController {

	@Autowired
	private UserService service;
	
	@Autowired
	private UserRepo repo;
	
	@GetMapping
	public List<User> getAllUsers(){
		return service.getUsersFromService();
	}
	
	@GetMapping("/{username}")
	public User getUser(@PathVariable String username) {
		return service.getUserFromService(username);
	}
	
	@PostMapping
	@Produces(MediaType.TEXT_PLAIN)
	public String registerUser(@RequestBody User user) {
		System.out.println("Inside register");
		return service.registerUserFromService(user);
	}
	
	@PostMapping("/login")
	public User userLoginInfo(@RequestBody Login login) {
		return service.loginInfoFromService(login);
	}
	
	@PostMapping("/feedback")
	public String userfeedbackInfo(@RequestBody Feedback feedback) {
		return service.feedbackInfoFromService(feedback);
	}
	
	@GetMapping("/{firstName}/{lastName}")
	public User getUserByFL(@PathVariable String firstName,@PathVariable String lastName ) {
		return repo.findByFirstNameAndLastName(firstName, lastName);
	}
}
