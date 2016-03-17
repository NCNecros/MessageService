package com.example.entity;


import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

/**
 * Created by Necros on 10.03.2016.
 */
@Entity
@Table(name = "USERS")
public class User {
    @Column(name = "FIRSTNAME", nullable = false)
    @NotEmpty(message = "Имя не может быть пустым")
    private String firstName;
    @Column(name = "LASTNAME", nullable = false)
    @NotEmpty(message = "Фамилия не может быть пустой")
    private String lastName;
    @Column(name = "SURNAME", nullable = true)
    private String surName;
    @Id
    @NotEmpty(message = "Имя пользователя не может быть пустым")
    @Column(name = "USERNAME", unique = true, nullable = false, length = 45)
    private String username;
    @Column(name = "PASSWORD", nullable = false, length = 60)
    @NotEmpty(message = "Пароль не может быть пустым")
    private String password;
    @Column(name = "EMAIL", nullable = false, length = 255)
    @NotEmpty
    @Email(message = "Неправильный формат email")
    private String email;
    @Column(name = "ENABLED", nullable = false)
    private boolean enabled;

    public User() {
    }

    public User(String username, String password, boolean enabled) {
        this.username = username;
        this.password = password;
        this.enabled = enabled;
    }

    public User(String username, String password, boolean enabled, Set<Userrole> userrole) {
        this.username = username;
        this.password = password;
        this.enabled = enabled;
    }

    public String getFio() {
        return lastName + " ." + firstName.substring(0, 1) + (surName.isEmpty() ? "" : " ." + surName.substring(0, 1));
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public boolean getEnabled() {
        return enabled;
    }

    public void setEnabled(boolean enabled) {
        this.enabled = enabled;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getSurName() {
        return surName;
    }

    public void setSurName(String surname) {
        this.surName = surname;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

}
