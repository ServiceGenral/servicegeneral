package org.service.general.repository;

import org.service.general.entity.Feedback;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Component;




@Component
public interface FeedbackRepo extends JpaRepository<Feedback, String>{

	
}

