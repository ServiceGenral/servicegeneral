package org.service.general.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("service/request")
public class ServiceRequestController {

	
	
	@GetMapping("/{customerId}/{providerId}/{serviceName}/{date}")
	public boolean checkAvailability(
			@PathVariable Long customerId, 
			@PathVariable Long providerId, 
			@PathVariable String serviceName, 
			@PathVariable String date) {
		
		return false;
	}
	
	
	@PostMapping("/{customerId}/{providerId}/{serviceName}/{date}")
	public String createRequest(
			@PathVariable Long customerId, 
			@PathVariable Long providerId, 
			@PathVariable String serviceName, 
			@PathVariable String date) {	
		
		return "";
		
	}	
	
	@PostMapping("/{reqId}/{action}")
	public String takeActionOnRequest(
			@PathVariable Long reqId,  
			@PathVariable String action) {	
		return "";
	}	
	
	@PostMapping("/{reqId}")
	public String deleteRequest(
			@PathVariable Long reqId) {	
		
		return "";
	}	
	
	
	
	
}
