package org.service.general.controller;

import java.util.List;

import org.service.general.entity.AdvertisementRequest;
import org.service.general.entity.User;
import org.service.general.repository.AdvertismentRepo;
import org.service.general.repository.UserRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@CrossOrigin(origins = {"http://127.0.0.1:9090","http://127.0.0.1:8080", "http://127.0.0.1"})
@RequestMapping("/advertisment")
public class AdvertisementController {

	@Autowired
	private AdvertismentRepo repo;
	
	@Autowired
	private UserRepo urRepo;
	
	
	@PostMapping
	public String submitAdvertismentRequest(@RequestBody AdvertisementRequest request) {
	    String serviceName = urRepo.getServiceTypeByUsername(request.getUsername());
	
	    request.setServiceName(serviceName);
	 
	    
		repo.save(request);
		return "Advertisement request submitted";
	}
	
	@GetMapping
	List<AdvertisementRequest> getAllRequests(){
		return repo.findAll();
	}
	
	
}