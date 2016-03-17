package com.example.service;

import com.example.entity.Message;
import com.example.entity.User;
import com.example.repository.MessageRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * Created by Necros on 18.03.2016.
 */
@Component
public class MessageService {

    @Autowired
    private MessageRepository messageRepository;

    public List<Message> getMessagesBySender(User sender) {
        return messageRepository.findBySender(sender);
    }

    public List<Message> getMessagesByRecipient(User recipient) {
        return messageRepository.findByRecipient(recipient);
    }

    public Message getMessageById(Long id) {
        return messageRepository.findOne(id);
    }

    public void deleteMessage(Message message) {
        messageRepository.delete(message);
    }

    public void save(Message form) {
        messageRepository.save(form);
    }
}
