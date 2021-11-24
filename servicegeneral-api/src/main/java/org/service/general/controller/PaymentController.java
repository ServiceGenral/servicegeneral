package org.service.general.controller;



import org.service.general.entity.PaymentEntity;
import org.service.general.service.PaymentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@CrossOrigin(origins = {"http://127.0.0.1:9090","http://127.0.0.1:8080", "http://127.0.0.1"})
@RequestMapping("/payment")
public class PaymentController {
	
	@Autowired
	private PaymentService paymentservice;
	
	@PostMapping
	public String submitPayment(@RequestBody PaymentEntity paymententity) {
		
		String message = paymentservice.submitPayment(paymententity);
		
		return message;
	}
	
	@PostMapping("/update/{id}")
	public String updatePayment(@PathVariable Long id, @RequestBody PaymentEntity paymententity) {
		String message = paymentservice.updatePayment(id, paymententity);
		return message;
	}
	
	@GetMapping("/{username}")
	public PaymentEntity getPayment(@PathVariable String username){
				
		return paymentservice.getPayment(username);
		
	}
	
	@PostMapping("/delete/{id}")
	public String deletePayment(@PathVariable Long id) {
		
		return paymentservice.deletePayment(id);
	}

}
