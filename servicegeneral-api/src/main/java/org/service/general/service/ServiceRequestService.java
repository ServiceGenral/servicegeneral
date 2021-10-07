package org.service.general.service;

import java.util.List;
import java.util.Optional;

import org.service.general.entity.ServiceRequest;
import org.service.general.repository.ServiceRequestRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ServiceRequestService {
	
	@Autowired 
	private ServiceRequestRepo serviceReqRepo;

	public boolean checkAvailability(String providerId, String serviceName, String date) {
		
		ServiceRequest sr = serviceReqRepo.findByProviderIdAndServiceNameAndDate(providerId, serviceName, date);
	    if(sr == null) {
	    	return true;
	    }
		return false;
	}

	public String createRequest(String customerId, String providerId, String serviceName, String date) {
		ServiceRequest sr = serviceReqRepo.findByCustomerIdAndProviderIdAndServiceNameAndDate(customerId, providerId, serviceName, date);
		if(sr == null) {
			sr = new ServiceRequest();
			sr.setCustomerId(customerId);
			sr.setProviderId(providerId);
			sr.setServiceName(serviceName);
			sr.setDate(date);
			sr.setStatus("PENDING");
			serviceReqRepo.save(sr);
			return "Your request is sent to the serivice provider. Please check the dashboard for request status";
		}
		return "You have already submitted request for this service";
	}

	public List<ServiceRequest> getAllByStatus(String status) {		
		return serviceReqRepo.findByStatus(status);
	}

	public String takeActionOnRequest(Long reqId, String action) {
			
		Optional<ServiceRequest> req = serviceReqRepo.findById(reqId);
		if(req.isPresent()) {
			ServiceRequest sr = req.get();
			sr.setStatus(action);
			serviceReqRepo.save(sr);
			return "Request is "+ action;
		}
		return "Exception while taking action on request";
	}

}
