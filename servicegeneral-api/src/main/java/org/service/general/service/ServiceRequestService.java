package org.service.general.service;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

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

	public List<ServiceRequest> getByStatusAndUserAndType(String status, String username, String type) {
		if("customer".equals(type)) {
			return serviceReqRepo.findByStatusAndCustomerId(status, username);
		} else {
			return serviceReqRepo.findByStatusAndProviderId(status, username);
		}
	}

	public Float getRating(String providerId) {
		
		List<ServiceRequest> requests = serviceReqRepo.findByProviderId(providerId);
		
		requests = requests.stream()
		  					 .filter(request -> request.getRating()!=null)
		  					 .collect(Collectors.toList());
		if(requests.size() ==0) {
			return 0.0f;
		}
		
		Float total = 0f;
		for(ServiceRequest request : requests) {
			
			total = total + request.getRating();
		}
		
		return total/requests.size();
	}

	public void submitRating(Long reqId, Float rating) {
		Optional<ServiceRequest> req = serviceReqRepo.findById(reqId);
		if(req.isPresent()) {
			ServiceRequest sr = req.get();
			sr.setRating(rating);
			serviceReqRepo.save(sr);
		}
	}

}
