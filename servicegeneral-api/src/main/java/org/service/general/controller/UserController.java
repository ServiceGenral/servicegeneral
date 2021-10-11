package org.service.general.controller;

import java.util.List;

import javax.transaction.Transactional;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import org.service.general.entity.Feedback;
import org.service.general.entity.Login;
import org.service.general.entity.User;
import org.service.general.repository.FeedbackRepo;
import org.service.general.repository.UserRepo;
import org.service.general.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/user")
@CrossOrigin(origins = {"http://127.0.0.1:9090","http://127.0.0.1:8080", "http://127.0.0.1"})
public class UserController {

	@Autowired
	private UserService service;
	
	@Autowired
	private UserRepo repo;
	
	@Autowired
	private FeedbackRepo feeedbackRepo;
	
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

	@PostMapping(value="/update")
	@Produces(MediaType.TEXT_PLAIN)
	public String updateUser(@RequestBody User user) {
		System.out.println("Inside register");
		return service.updateUserInfo(user);
	}
	
	@PostMapping("/login")
	public User userLoginInfo(@RequestBody Login login) {
		return service.loginInfoFromService(login);
	}
	
	@GetMapping("/feedback/{name}")
	public Feedback userfeedbackInfo(@PathVariable String name) {
		return feeedbackRepo.findByName(name);
	}
	
	@PostMapping("/feedback")
	public Feedback userfeedbackInfo(@RequestBody Feedback feedback) {
		return service.feedbackInfoFromService(feedback);
	}

	@PostMapping("/update/feedback/{name}")
	public Feedback updatefeedbackByName(@PathVariable String name,  @RequestBody Feedback feedback) {
		if(feeedbackRepo.findByName(name)!=null) {
			//update existing feedback
			Feedback feedbackExisting = feeedbackRepo.findByName(name);
			feedbackExisting.setMessage(feedback.getMessage());
			feeedbackRepo.save(feedbackExisting);
			return feedbackExisting;
		}
		else {
			//if null create new feedback
			return userfeedbackInfo(feedback);
		}
	}
	
	@PostMapping("/delete/feedback/{name}")
	@Transactional
	public String deletefeedbackByName(@PathVariable String name) {
		feeedbackRepo.deleteByName(name);
		return "Deleted feedback";
	}
	
	@GetMapping("/{firstName}/{lastName}")
	public User getUserByFL(@PathVariable String firstName,@PathVariable String lastName ) {
		return repo.findByFirstNameAndLastName(firstName, lastName);
	}
	@PostMapping("/delete/{username}")
	public String deleteUserInfo(@PathVariable String username) {
		return service.deleteUserInfo(username);
	}
}
