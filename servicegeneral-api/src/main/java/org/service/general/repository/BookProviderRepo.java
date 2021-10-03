package org.service.general.repository;

import org.service.general.entity.BookProviderEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BookProviderRepo extends JpaRepository<BookProviderEntity, Long>{
	
	public BookProviderEntity findByDayAndMonthAndYearAndServiceIdAndProviderId(
			String day, String month, String year, String serviceId, String providerId);
	

}
