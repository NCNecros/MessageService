package com.example.controller;

import com.example.entity.User;
import com.example.entity.Userrole;
import com.example.repository.UserRepository;
import com.example.repository.UserRoleRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Necros on 15.03.2016.
 */
@Controller
@RequestMapping(value = "/user")
public class UserController {
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private UserRoleRepository roleRepository;
    @Autowired
    BCryptPasswordEncoder passwordEncoder;

    @RequestMapping(method = RequestMethod.GET)
    public String getUsers(Model model){
        String username = (String) SecurityContextHolder.getContext().getAuthentication().getName();
        User currentUser = userRepository.findUserByUsername(username);
        Iterable<User> users = userRepository.findAll();
        Map<String, List<Userrole>> usernameUserroleMap = new HashMap<>();
        for (User user : users){
            usernameUserroleMap.put(user.getUsername(),roleRepository.findByUser(user));
        }
        model.addAttribute("users",users);
        model.addAttribute("usersRoles", usernameUserroleMap);
        return "users";
    }

    @RequestMapping(value = "password/change",method = RequestMethod.POST)
    @ResponseBody
    public String changePassword(@RequestParam("oldPassword") String oldPassword,
                                 @RequestParam("newPassword") String newPassword){

        String username = (String) SecurityContextHolder.getContext().getAuthentication().getName();
        User currentUser = userRepository.findUserByUsername(username);

        if (passwordEncoder.matches(oldPassword,currentUser.getPassword())){
            currentUser.setPassword(passwordEncoder.encode(newPassword));
            userRepository.save(currentUser);
            return "1";
        }else {
            return "Старый пароль не подходит";
        }
    }

}
