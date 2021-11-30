package org.service.general.service;



import java.util.Optional;

import org.service.general.entity.PaymentEntity;
import org.service.general.repository.PaymentRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PaymentService {

	@Autowired
	private PaymentRepo paymentrepo;
	
	public String submitPayment(PaymentEntity paymententity) {
		if(null == paymententity.getPaymentId()) {
			paymentrepo.save(paymententity);
			return "Record Submit Successfully";
		}
		
		Optional<PaymentEntity> pay = paymentrepo.findById(paymententity.getPaymentId());
		if(pay.isPresent()) {
			PaymentEntity existing = pay.get();
			existing.setCardName(paymententity.getCardName());
			existing.setCardNumber(paymententity.getCardNumber());
			existing.setCvvNo(paymententity.getCvvNo());
			existing.setExpDt(paymententity.getExpDt());
			paymentrepo.save(existing);
			return "Payment Information is updated";
		}
		return "Record Submit Successfully";
	}

	public PaymentEntity getPayment(String username) {
		return paymentrepo.findByUsername(username);
	}

	public String updatePayment(Long id, PaymentEntity paymententity) {
		Optional<PaymentEntity> pay = paymentrepo.findByPaymentId(id);
		
		if(pay.isPresent()) {
			PaymentEntity existing = pay.get();
			existing.setCardName(paymententity.getCardName());
			existing.setCardNumber(paymententity.getCardNumber());
			existing.setCvvNo(paymententity.getCvvNo());
			existing.setExpDt(paymententity.getExpDt());
			paymentrepo.save(existing);
			return "Payment Information is updated";
		}else {
			return "Payment Information not present";
		}
		
	}

	public String deletePayment(Long id) {
		Optional<PaymentEntity> pay = paymentrepo.findById(id);
		if(pay.isPresent()) {
			
			paymentrepo.deleteById(id);
			return "delete successful";
		}else {
			return "Error";
		}
		
		
	}

	

	

}
