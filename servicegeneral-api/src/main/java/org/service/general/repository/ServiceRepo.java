package org.service.general.repository;

import org.service.general.entity.Service;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ServiceRepo extends JpaRepository<Service, Long>{

	Service findByServiceName(String serviceType);

}
