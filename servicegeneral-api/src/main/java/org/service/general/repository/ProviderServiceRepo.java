package org.service.general.repository;

import java.util.List;

import org.service.general.entity.ProviderService;
import org.service.general.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ProviderServiceRepo extends JpaRepository<ProviderService, Long>{
	public List<ProviderService> findByUsername(User user);
}
