package org.service.general.repository;

import org.service.general.entity.ProviderService;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ProviderServiceRepo extends JpaRepository<ProviderService, Long>{

}
