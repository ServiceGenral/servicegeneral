package org.service.general.service;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import org.service.general.entity.Feedback;
import org.service.general.entity.Login;
import org.service.general.entity.User;
import org.service.general.repository.FeedbackRepo;
import org.service.general.repository.UserRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserService {

	@Autowired
	private UserRepo repo;
	
	@Autowired
	private FeedbackRepo feedbackRepo;
	
	public List<User> getUsersFromService(){
		return repo.findAll();
	}

	public User getUserFromService(String username) {
		return repo.findById(username).get();
	}

	public String registerUserFromService(User user) {
		Optional<User> existing = repo.findById(user.getUsername());
		if(!existing.isPresent()) {
			repo.save(user);
			return "Registered";
		} else {
			return "Username not avaiable. Please use a different username: Suggestion: "+user.getUsername()
			+ "-" + Math.abs(user.getLastName().hashCode()/100000);
		}
	}
	

	public User loginInfoFromService(Login login) {
		List<User> loginList = repo.findAll()
				.stream()
				.filter(u ->
					u.getUsername().equals(login.getUsername())
					&&
					u.getPassword().equals(login.getPassword())
					&&
					u.getType().equals(login.getType())
					)
				.collect(Collectors.toList());
				
				if(loginList.size()>0) {
					 return loginList.get(0);
					
				}
				return null;
		}

	public String feedbackInfoFromService(Feedback feedback) {
		feedbackRepo.save(feedback);
		return "Successfully submit feedback";
	}

	public String updateUserInfo(User user) {
		Optional<User> existing = repo.findById(user.getUsername());
		if(existing.isPresent()) {
			if(user.getPassword()=="") {
				user.setPassword(existing.get().getPassword());
			}
			user.setType(existing.get().getType());
			repo.save(user);
			return "Profile information is updated.";
		} else {
			return "Cannot update user information.";
		}
	}
}
