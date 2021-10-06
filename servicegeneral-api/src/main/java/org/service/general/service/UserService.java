package org.service.general.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.Random;

import org.service.general.entity.Feedback;
import org.service.general.entity.Login;
import org.service.general.entity.ProviderService;
import org.service.general.entity.ServiceEntity;
import org.service.general.entity.ServiceMetaData;
import org.service.general.entity.User;
import org.service.general.repository.FeedbackRepo;
import org.service.general.repository.ProviderServiceRepo;
import org.service.general.repository.ServiceMetadataRepo;
import org.service.general.repository.ServiceRepo;
import org.service.general.repository.UserRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class UserService {

	@Autowired
	private UserRepo repo;
	
	@Autowired
	private ProviderServiceRepo providerServiceRepo;
	
	@Autowired
	private ServiceRepo serviceRepo;
	
	@Autowired
	private ServiceMetadataRepo metadataRepo;
	
	@Autowired
	private FeedbackRepo feedbackRepo;
	
	private Random random = new Random();
	
	public List<User> getUsersFromService(){
		return repo.findAll();
	}

	public User getUserFromService(String username) {
		return repo.findById(username).get();
	}

	public String registerUserFromService(User user) {
		Optional<User> existing = repo.findById(user.getUsername());
		if(!existing.isPresent()) {
			
			//String fullServiceName = user.getServiceType();	
			
			//System.out.print("%%%%%%%%%%%%%%%%%%");
			//System.out.print(user.getServiceType());
			
			//ServiceMetaData serviceMetadata = metadataRepo.findByServiceTitle(fullServiceName);
			
			//System.out.print("%%%%%%%%%%%%%%%%%%");
			//System.out.print(serviceMetadata);
			
			//user.setServiceType(serviceMetadata.getServiceName());
			repo.save(user);
			
			ProviderService ps = new ProviderService();
			ps.setUsername(user);
			
			ServiceEntity service = serviceRepo.findByServiceName(user.getServiceType());
			ps.setServiceId(service);
			providerServiceRepo.save(ps);
			
			return "Registration is completed. Please login now.";
		} else {
			return "Oops. This username is already taken. Here is a suggestion: " + user.getUsername() + (random.nextInt(900) + 100);
		}
	}
	

	public User loginInfoFromService(Login login) {
		
		Optional<User> existing = repo.findById(login.getUsername());
		
		if(existing.isPresent()) {
			System.out.println("*********************************************************************");
			if(existing.get().getPassword().equals(login.getPassword()) && existing.get().getType().equals(login.getType())) {
				User userJson = new User(existing.get().getUsername(),existing.get().getFirstName(), existing.get().getLastName(), existing.get().getEmail(),
						null, existing.get().getAddress(), existing.get().getPhoneNumber(), existing.get().getType(), existing.get().getServiceType(), 
						null,null,null);
				return userJson;
			}
		}
/*		List<User> loginList = repo.findAll()
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
*/				return null;
		
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
	
	public String deleteUserInfo(String username) {
		if(repo.findById(username).isPresent()) {
			List<ProviderService> provideService = providerServiceRepo.findByUsername(repo.findById(username).get());
			provideService.stream()
			.forEach(s -> {
				providerServiceRepo.deleteById(s.getId());
			});
			repo.deleteById(username.trim());
			return "Deleted Successfully";
		}
		else
		{
			return "Account is not present";
		}
		
	}
	
	public List<User> getServiceProviderByServiceName(String serviceName){
			List<User> users = repo.findByServiceTypeAndType(serviceName, "provider");
			users.stream().forEach(user -> {
				user.setServices(null);
			});
			System.out.print(users.size());
		return users;
	}
	
	
	
	
	
	
	
	
	
		
}
