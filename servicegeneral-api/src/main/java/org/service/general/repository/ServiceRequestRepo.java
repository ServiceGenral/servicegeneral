package org.service.general.repository;

import java.util.List;

import org.service.general.entity.ServiceRequest;
import org.springframework.stereotype.Repository;
import org.springframework.data.jpa.repository.JpaRepository;

@Repository
public interface ServiceRequestRepo extends JpaRepository<ServiceRequest, Long> {

	public ServiceRequest findByProviderIdAndServiceNameAndDate(String providerId, String serviceName, String date);

	public ServiceRequest findByCustomerIdAndProviderIdAndServiceNameAndDate(String customerId, String providerId,
			String serviceName, String date);

	public List<ServiceRequest> findByStatus(String status);

	public List<ServiceRequest> findByStatusAndCustomerId(String status, String username);

	public List<ServiceRequest> findByStatusAndProviderId(String status, String username);
}
