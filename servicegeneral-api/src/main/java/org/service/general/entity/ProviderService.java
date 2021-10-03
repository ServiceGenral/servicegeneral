package org.service.general.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EntityListeners;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.envers.Audited;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

@Entity
@Table(name="service_provider")
@Audited
@EntityListeners(AuditingEntityListener.class)
public class ProviderService implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@Column
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@ManyToOne
	@JoinColumn(name = "username")
	private User username;
	
	@ManyToOne
	@JoinColumn(name = "service_id")
	private ServiceEntity serviceId;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public User getUsername() {
		return username;
	}

	public void setUsername(User username) {
		this.username = username;
	}

	public ServiceEntity getServiceId() {
		return serviceId;
	}

	public void setServiceId(ServiceEntity serviceId) {
		this.serviceId = serviceId;
	}
	
	
	
	
	
	
	
	
	
	
}
