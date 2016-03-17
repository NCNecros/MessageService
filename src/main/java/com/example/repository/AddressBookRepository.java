package com.example.repository;

import com.example.entity.AddressBook;
import com.example.entity.User;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * Created by Necros on 14.03.2016.
 */
@Component
public interface AddressBookRepository extends CrudRepository<AddressBook, Long>{
    List<AddressBook> findByOwner(User owner);
    AddressBook findByOwnerAndUser(User owner, User user);
}
