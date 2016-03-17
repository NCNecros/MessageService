package com.example.repository;

import com.example.entity.Message;
import com.example.entity.User;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * Created by Necros on 14.03.2016.
 */
@Component
public interface MessageRepository extends CrudRepository<Message, Long> {
    List<Message> findBySender(User sender);
    List<Message> findByRecipient(User recipient);
}
