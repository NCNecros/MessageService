package com.example.entity;

import org.hibernate.validator.constraints.NotEmpty;

import javax.persistence.*;
import java.util.Date;

/**
 * Created by Necros on 14.03.2016.
 */
@Entity
public class Message {
    @Column
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "sender", nullable = false)
    private User sender;
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "recipient", nullable = false)
    private User recipient;
    @Column(nullable = false)
    @NotEmpty(message = "Тема не может быть пустая")
    private String title;
    @Column(nullable = false, length = 1000)
    @NotEmpty(message = "Текст не может быть пустым")
    private String text;
    @Column(name = "date_time",nullable = false)
    private Date dateTime;

    public Message() {
    }

    public Message(User sender, User recipient, String text, Date dateTime) {
        this.sender = sender;
        this.recipient = recipient;
        this.text = text;
        this.dateTime = dateTime;
    }

    public Date getDateTime() {
        return dateTime;
    }

    public void setDateTime(Date dateTime) {
        this.dateTime = dateTime;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public User getRecipient() {
        return recipient;
    }

    public void setRecipient(User recipient) {
        this.recipient = recipient;
    }

    public User getSender() {
        return sender;
    }

    public void setSender(User sender) {
        this.sender = sender;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }
}
