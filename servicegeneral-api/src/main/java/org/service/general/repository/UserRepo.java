package org.service.general.repository;

import java.util.List;

import org.service.general.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface UserRepo extends JpaRepository<User, String>{

	public User findByFirstNameAndLastName(String firstName, String lastName);

	public List<User> findByServiceTypeAndType(String serviceType, String type);
	
	public List<User> findByType(String type);
	
	@Query("select u.serviceType from User u where u.username=:username")
	public String getServiceTypeByUsername(@Param(value = "username") String username);
	
}


