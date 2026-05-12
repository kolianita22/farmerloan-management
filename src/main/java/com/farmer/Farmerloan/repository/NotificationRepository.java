package com.farmer.Farmerloan.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.farmer.Farmerloan.model.Notification;

public interface NotificationRepository extends JpaRepository<Notification, Long>{
	 List<Notification> findTop5ByOrderByCreatedAtDesc();

	    long countByIsReadFalse();

}
