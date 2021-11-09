package org.service.general.repository;

import org.service.general.entity.ServiceEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ServiceRepo extends JpaRepository<ServiceEntity, Long>{

	ServiceEntity findByServiceName(String serviceType);
	
	
}
