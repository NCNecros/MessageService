package com.example.controller;

import com.example.entity.Message;
import com.example.entity.User;
import com.example.entity.UserRole;
import com.example.repository.MessageRepository;
import com.example.repository.UserRepository;
import com.example.repository.UserRoleRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.LockedException;
import org.springframework.security.authentication.encoding.BasePasswordEncoder;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.servletapi.SecurityContextHolderAwareRequestWrapper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * Created by Necros on 10.03.2016.
 */
@Controller
public class RootController {
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private MessageRepository messageRepository;
    @Autowired
    private UserRoleRepository userRoleRepository;
    @Autowired
    PasswordEncoder passwordEncoder;

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public ModelAndView welcomePage(HttpServletRequest request) {
        if (!(request.isUserInRole("ROLE_ADMIN") || request.isUserInRole("ROLE_USER"))){
            return new ModelAndView("redirect:/login");
        }
        List<Message> messages = messageRepository.findBySender(userRepository.findUserByUsername(request.getUserPrincipal().getName()));

        ModelAndView modelAndView = new ModelAndView("main");
        modelAndView.addObject("messages",messages);
        modelAndView.addObject("message", new Message());
        return modelAndView;
    }

    @RequestMapping(value = "/", method = RequestMethod.POST)
    public String sendMessage(@Valid Message form, BindingResult result, @RequestParam("recipientName")String recipientName, HttpServletRequest request, Map<String, Object> model){
        if (result.hasErrors()){
            return "main";
        }
        User recipient = userRepository.findUserByUsername(recipientName);
        if (recipient == null){
            model.put("recipientError","Такой пользователь не найден");
            return "main";
        }
        User sender = userRepository.findUserByUsername(request.getUserPrincipal().getName());
        form.setSender(sender);
        form.setRecipient(recipient);
        form.setDateTime(new Date(System.currentTimeMillis()));
        messageRepository.save(form);
        return "redirect:/";
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public ModelAndView login(@RequestParam(value = "error", required = false) String error,
                              @RequestParam(value = "logout", required = false) String logout, HttpServletRequest request) {

        ModelAndView model = new ModelAndView();
        if (error != null) {
            model.addObject("error", getErrorMessage(request, "SPRING_SECURITY_LAST_EXCEPTION"));
        }

        if (logout != null) {
            model.addObject("msg", "You've been logged out successfully.");
        }
        model.setViewName("login");

        return model;
    }

    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public ModelAndView getRegisterPage(){
        return new ModelAndView("register").addObject(new User());
    }

    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public String registerUser(@Valid User user, BindingResult result, Map<String,Object> model){
        if (result.hasErrors()){
            return "register";
        }
        if (userRepository.findUserByUsername(user.getUsername())!=null){
            result.addError(new FieldError("user","username","Пользователь уже существует"));
            return "register";
        }

        UserRole role = new UserRole(user,"ROLE_USER");
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        user.setEnabled(true);
        userRepository.save(user);
        userRoleRepository.save(role);
        return "redirect:/login";
    }

    // for 403 access denied page
    @RequestMapping(value = "/403", method = RequestMethod.GET)
    public ModelAndView accesssDenied() {

        ModelAndView model = new ModelAndView();

        // check if user is login
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (!(auth instanceof AnonymousAuthenticationToken)) {
            UserDetails userDetail = (UserDetails) auth.getPrincipal();
            System.out.println(userDetail);

            model.addObject("username", userDetail.getUsername());
        }

        model.setViewName("403error");
        return model;

    }
    // customize the error message
    private String getErrorMessage(HttpServletRequest request, String key) {

        Exception exception = (Exception) request.getSession().getAttribute(key);

        String error = "";
        if (exception instanceof BadCredentialsException) {
            error = "Invalid username and password!";
        } else if (exception instanceof LockedException) {
            error = exception.getMessage();
        } else {
            error = "Invalid username and password!";
        }
        return error;
    }
}
