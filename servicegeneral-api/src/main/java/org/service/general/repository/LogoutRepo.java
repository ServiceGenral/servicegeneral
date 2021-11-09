package org.service.general.repository;

import org.service.general.entity.Logout;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface LogoutRepo extends JpaRepository<Logout, Long>{

}


