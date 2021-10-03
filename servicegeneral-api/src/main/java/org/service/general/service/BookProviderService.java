package org.service.general.service;

import org.service.general.entity.BookProviderEntity;
import org.service.general.repository.BookProviderRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BookProviderService {
	
	@Autowired
	private BookProviderRepo bookProviderRepo;

	public boolean getProviderAvailability(
			String day, 
			String month, 
			String year, 
			String serviceId, 
			String providerId) {
		
		BookProviderEntity bpe = bookProviderRepo.findByDayAndMonthAndYearAndServiceIdAndProviderId(
				day, month, year, serviceId, providerId);
		
		 if(null == bpe) {
			 return true;
		 }
		
		 return false;
	}

}
