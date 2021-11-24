package org.service.general.repository;



import java.util.Optional;

import org.service.general.entity.PaymentEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface PaymentRepo extends JpaRepository<PaymentEntity, Long> {

	PaymentEntity findByUsername(String username);

	Optional<PaymentEntity> findByPaymentId(Long id);

	void deleteByPaymentId(Long id);
	

}
