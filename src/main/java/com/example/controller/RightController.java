package com.example.controller;

import com.example.entity.User;
import com.example.entity.Userrole;
import com.example.repository.UserRepository;
import com.example.repository.UserRoleRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

/**
 * Created by Necros on 18.03.2016.
 */
@Controller
@RequestMapping("/rights")
public class RightController {
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private UserRoleRepository userRoleRepository;

    @RequestMapping(value = "/add/{username}",method = RequestMethod.GET)
    public String addAdminRigths(@PathVariable("username") String username){
        User user = userRepository.findUserByUsername(username);
        Userrole userrole = new Userrole(user,"ROLE_ADMIN");
        userRoleRepository.save(userrole);
        return "redirect:/user";
    }

    @RequestMapping(value = "/del/{username}", method = RequestMethod.GET)
    public String delAdminRights(@PathVariable("username") String username){
        User user = userRepository.findUserByUsername(username);
        List<Userrole> userroleList = userRoleRepository.findByUser(user);
        for (Userrole userrole: userroleList){
            if (userrole.getUserrole().equals("ROLE_ADMIN")){userRoleRepository.delete(userrole);}
        }
        return "redirect:/user";
    }
}
