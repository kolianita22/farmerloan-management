package com.farmer.Farmerloan.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.farmer.Farmerloan.model.Notification;
import com.farmer.Farmerloan.repository.NotificationRepository;

@Service
public class NotificationService {
	@Autowired
    private NotificationRepository repo;

    public void addNotification(String message, String type) {
        Notification n = new Notification();
        n.setMessage(message);
        n.setType(type);
        n.setRead(false);
        repo.save(n);
    }

    public List<Notification> getLatest() {
        return repo.findTop5ByOrderByCreatedAtDesc();
    }

    public long getUnreadCount() {
        return repo.countByIsReadFalse();
    }

}
