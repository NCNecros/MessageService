package com.example.service;

import com.example.entity.AddressBook;
import com.example.entity.User;
import com.example.repository.AddressBookRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * Created by Necros on 18.03.2016.
 */
@Component
public class AddressBookService {
    @Autowired
    AddressBookRepository addressBookRepository;

    public AddressBook getAddressBookById(Long id){
        return addressBookRepository.findOne(id);
    }

    public List<AddressBook> getAddressBooksByOwner(User owner){
        return addressBookRepository.findByOwner(owner);
    }

    public boolean isAddressBookExist(User owner, User user) {
        return (addressBookRepository.findByOwnerAndUser(owner, user)!=null);
    }

    public void save(AddressBook addressBook) {
        addressBookRepository.save(addressBook);
    }

    public void delete(AddressBook addressBookRecord) {
        addressBookRepository.delete(addressBookRecord);
    }
}
