package org.service.general.entity;

import java.io.Serializable;
import java.time.LocalDate;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EntityListeners;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.envers.Audited;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

@Entity
@Table(name="service_request")
@Audited
@EntityListeners(AuditingEntityListener.class)
public class ServiceRequest implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1575675675767L;

	@Id
	@Column(name="service_req_id")
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long serviceRequestId;
	
	@Column(name = "customer_id")
	private String customerId;
	
	@Column(name = "provider_id")
	private String providerId;
	
	@Column(name = "service_name")
	private String serviceName;
	
	@Column(name = "service_date")
	private String date;
	
	@Column(name = "service_req_status")
	private String status;
	
	@Column(name = "rating")
	private Float rating;
		

	public Long getServiceRequestId() {
		return serviceRequestId;
	}

	public void setServiceRequestId(Long serviceRequestId) {
		this.serviceRequestId = serviceRequestId;
	}

	public String getCustomerId() {
		return customerId;
	}

	public void setCustomerId(String customerId) {
		this.customerId = customerId;
	}

	public String getProviderId() {
		return providerId;
	}

	public void setProviderId(String providerId) {
		this.providerId = providerId;
	}

	public String getServiceName() {
		return serviceName;
	}

	public void setServiceName(String serviceName) {
		this.serviceName = serviceName;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Float getRating() {
		return rating;
	}

	public void setRating(Float rating) {
		this.rating = rating;
	}
	
	
	
	
}
