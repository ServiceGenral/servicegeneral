package org.service.general.service;

import java.util.List;

import org.service.general.entity.ServiceEntity;
import org.service.general.repository.ServiceRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ServicesService {
	
	@Autowired
	private ServiceRepo repo;
	
	public List<ServiceEntity> getAllServices(){
		
		return repo.findAll();
		
	}

}
