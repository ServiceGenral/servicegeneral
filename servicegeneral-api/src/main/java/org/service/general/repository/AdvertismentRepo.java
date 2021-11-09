package org.service.general.repository;

import java.util.List;

import org.service.general.entity.AdvertisementRequest;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface AdvertismentRepo  extends CrudRepository<AdvertisementRequest, Long>{

	List<AdvertisementRequest> findAll();
}
