package org.service.general.entity;

import java.io.Serializable;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EntityListeners;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.envers.Audited;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

@Entity
@Table(name="service")
@Audited
@EntityListeners(AuditingEntityListener.class)
public class ServiceEntity implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="service_id")
	private Long serviceId;
	
	@Column
	private String serviceName;

	
//	@OneToMany(mappedBy = "serviceId")
//	Set<ProviderService> services;
//	
	
	public Long getServiceId() {
		return serviceId;
	}

	public void setServiceId(Long serviceId) {
		this.serviceId = serviceId;
	}

	public String getServiceName() {
		return serviceName;
	}

	public void setServiceName(String serviceName) {
		this.serviceName = serviceName;
	}

//	public Set<ProviderService> getServices() {
//		return services;
//	}
//
//	public void setServices(Set<ProviderService> services) {
//		this.services = services;
//	}
	
	
	
	
	
}
