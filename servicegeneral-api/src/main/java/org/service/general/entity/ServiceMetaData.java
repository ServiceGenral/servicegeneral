package org.service.general.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="service_metadata")
public class ServiceMetaData {

	@Id
	@Column
	private String serviceName;

	@Column
	private String serviceTitle;

	@Column
	private String serviceImgURL;

	public String getServiceName() {
		return serviceName;
	}

	public void setServiceName(String serviceName) {
		this.serviceName = serviceName;
	}

	public String getServiceTitle() {
		return serviceTitle;
	}

	public void setServiceTitle(String serviceTitle) {
		this.serviceTitle = serviceTitle;
	}

	public String getServiceImgURL() {
		return serviceImgURL;
	}

	public void setServiceImgURL(String serviceImgURL) {
		this.serviceImgURL = serviceImgURL;
	}


}
