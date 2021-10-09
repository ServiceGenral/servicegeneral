package org.service.general.controller;

import java.util.List;

import org.service.general.entity.ServiceRequest;
import org.service.general.service.ServiceRequestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;




@RestController
@CrossOrigin(origins = {"http://127.0.0.1:9090","http://127.0.0.1:8080", "http://127.0.0.1"})
@RequestMapping("service/request")
public class ServiceRequestController {

	@Autowired
	private ServiceRequestService serviceReq;

	@GetMapping("/appointments/{status}/{username}/{type}")
	public List<ServiceRequest> getByStatusAndUserAndType(@PathVariable String status, @PathVariable String username, @PathVariable String type){
		return serviceReq.getByStatusAndUserAndType(status, username, type);
	}
	
	@GetMapping("/{status}")
	public List<ServiceRequest> getAllByStatus(@PathVariable String status){
		return serviceReq.getAllByStatus(status);
	}
	
	@GetMapping("/{providerId}/{serviceName}/{date}")
	public boolean checkAvailability(
			
			@PathVariable String providerId, 
			@PathVariable String serviceName, 
			@PathVariable String date) {
		
		return serviceReq.checkAvailability(providerId,serviceName,date);
	}
	
	
	@PostMapping("/{customerId}/{providerId}/{serviceName}/{date}")
	public String createRequest(
			@PathVariable String customerId, 
			@PathVariable String providerId, 
			@PathVariable String serviceName, 
			@PathVariable String date) {	
		
		return serviceReq.createRequest(customerId, providerId, serviceName, date);
		
	}	
	
	@PostMapping("/{reqId}/{action}")
	public String takeActionOnRequest(
			@PathVariable Long reqId,  
			@PathVariable String action) {	
		return serviceReq.takeActionOnRequest(reqId, action);
	}
	
}
