package org.service.general.service;

import java.util.List;

import org.service.general.entity.ServiceEntity;
import org.service.general.entity.ServiceMetaData;
import org.service.general.repository.ServiceMetadataRepo;
import org.service.general.repository.ServiceRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ServicesService {
	
	@Autowired
	private ServiceRepo repo;
	
	@Autowired
	private ServiceMetadataRepo metadataRepo;
	
	public List<ServiceEntity> getAllServices(){
		
		return repo.findAll();
		
	}

	public List<ServiceMetaData> getServicesMetaData() {
		
		return metadataRepo.findAll();
	}

}
