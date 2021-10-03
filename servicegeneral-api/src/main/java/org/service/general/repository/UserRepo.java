package org.service.general.repository;

import org.service.general.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UserRepo extends JpaRepository<User, String>{

	public User findByFirstNameAndLastName(String firstName, String lastName);
}


