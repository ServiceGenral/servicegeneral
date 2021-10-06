package org.service.general.repository;

import org.service.general.entity.ServiceMetaData;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ServiceMetadataRepo extends JpaRepository<ServiceMetaData, String>{

	ServiceMetaData findByServiceTitle(String fullServiceName);

}
