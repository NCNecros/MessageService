package com.example.entity;

import javax.persistence.*;

/**
 * Created by Necros on 14.03.2016.
 */
@Entity(name = "address_book")
public class AddressBook {
    @Id
    @GeneratedValue
    @Column
    private Long id;
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_t",unique = true)
    private User user;
    @Column
    private String description;
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "owner")
    private User owner;

    public AddressBook(User user, String description, User owner) {
        this.user = user;
        this.description = description;
        this.owner = owner;
    }

    public AddressBook() {
    }

    public User getOwner() {
        return owner;
    }

    public void setOwner(User owner) {
        this.owner = owner;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }
}
