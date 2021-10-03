package org.service.general.controller;

import java.util.List;

import org.service.general.entity.ServiceEntity;
import org.service.general.service.ServicesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/services")
public class ServiceController {
	
	@Autowired
	private ServicesService service;
	
	@GetMapping("/")
	public List<ServiceEntity> getAllServices(){
		
		return service.getAllServices();
	}
	

}
