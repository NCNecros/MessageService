package com.example.entity;


import javax.persistence.*;

/**
 * Created by Necros on 11.03.2016.
 */
@Entity
@Table(
//        uniqueConstraints = @UniqueConstraint(columnNames = {"role","user_username"})
)
public class Userrole {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "USERROLE_ID", unique = true, nullable = false)
    private Integer userroleId;
    @ManyToOne(fetch = FetchType.LAZY)
    private User user;
    @Column(name = "USERROLE",nullable = false, length = 45)
    private String userrole;
    public Userrole(){

    }

    public Userrole(User user, String userrole){
        this.user = user;
        this.userrole = userrole;
    }

    public Integer getUserroleId() {
        return userroleId;
    }

    public void setUserroleId(Integer userroleId) {
        this.userroleId = userroleId;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getUserrole() {
        return userrole;
    }

    public void setUserrole(String userrole) {
        this.userrole = userrole;
    }
}
