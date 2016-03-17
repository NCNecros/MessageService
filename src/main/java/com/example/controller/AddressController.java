package com.example.controller;

import com.example.entity.AddressBook;
import com.example.entity.User;
import com.example.repository.UserRepository;
import com.example.service.AddressBookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.security.Principal;
import java.util.List;

/**
 * Created by Necros on 15.03.2016.
 */
@Controller
@RequestMapping(value = "/addressbook")
public class AddressController {
    @Autowired
    private AddressBookService addressBookService;
    @Autowired
    private UserRepository userRepository;

    @RequestMapping(method = RequestMethod.GET)
    @Secured(value = {"ROLE_ADMIN","ROLE_USER"})
    public String getAddressBook(Model model, Principal principal){
        User user = userRepository.findUserByUsername(principal.getName());
        List<AddressBook> addressBooks = addressBookService.getAddressBooksByOwner(user);
        model.addAttribute("addressBooks",addressBooks);
        return "addressbook";
    }

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    @Secured(value = {"ROLE_ADMIN","ROLE_USER"})
    public String addAddress(@RequestParam("user") String username,
                             @RequestParam("description") String description,
                             HttpServletRequest request,
                             Model model){
        User owner = userRepository.findUserByUsername(request.getUserPrincipal().getName());
        User user = userRepository.findUserByUsername(username);
        boolean addressBookExist = addressBookService.isAddressBookExist(owner, user);

        List<AddressBook> addressBooks = addressBookService.getAddressBooksByOwner(owner);

        model.addAttribute("addressBooks",addressBooks);

        if (user == null){
            model.addAttribute("userError", "Пользователь не найден");
            return "/addressbook";
        }
        if (addressBookExist){
            model.addAttribute("userError", "Пользователь уже есть в адресной книге");
            return "/addressbook";
        }

        AddressBook addressBook = new AddressBook(user, description, owner);
        addressBookService.save(addressBook);
        return "redirect:/addressbook";
    }

    @RequestMapping(value = "/del/{id}", method = RequestMethod.GET)
    public String delAddress(@PathVariable Long id){
        String userName = SecurityContextHolder.getContext().getAuthentication().getName();
        AddressBook addressBookRecord = addressBookService.getAddressBookById(id);
        if (addressBookRecord.getOwner().getUsername().equalsIgnoreCase(userName)){
            addressBookService.delete(addressBookRecord);
        }
        return "redirect:/addressbook";
    }
}
