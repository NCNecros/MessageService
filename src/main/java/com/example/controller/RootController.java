package com.example.controller;

import com.example.entity.User;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.LockedException;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.servletapi.SecurityContextHolderAwareRequestWrapper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.util.List;
import java.util.Map;

/**
 * Created by Necros on 10.03.2016.
 */
@Controller
public class RootController {
    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String welcomePage(HttpServletRequest request) {
        if (!(request.isUserInRole("ROLE_ADMIN") || request.isUserInRole("ROLE_USER"))){
            return "redirect:/login";
        }
        return "main";
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
        }else {
            return "redirect:/login";
        }
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
