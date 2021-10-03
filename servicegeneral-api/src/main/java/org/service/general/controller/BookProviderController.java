package org.service.general.controller;

import java.util.List;

import org.service.general.service.BookProviderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/request")
public class BookProviderController {
	
	@Autowired
	private BookProviderService bookProviderService;
	
	@GetMapping("/availability/{day}/{month}/{year}/{serviceId}/{providerId}")
	public boolean getProviderAvailability(
			@PathVariable String day, 
			@PathVariable String month,
			@PathVariable String year,
			@PathVariable String serviceId,
			@PathVariable String providerId){
		return bookProviderService.getProviderAvailability(day, month, year, serviceId, providerId);
		
	}

}
