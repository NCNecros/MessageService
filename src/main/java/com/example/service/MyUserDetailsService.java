package com.example.service;

import com.example.entity.User;
import com.example.entity.Userrole;
import com.example.repository.UserRepository;
import com.example.repository.UserRoleRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * Created by Necros on 11.03.2016.
 */
@Service("userDetailsService")
public class MyUserDetailsService implements UserDetailsService {

    @Autowired
    UserRepository userRepository;
    @Autowired
    UserRoleRepository userRoleRepository;

    @Transactional(readOnly = true)
    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        User user = userRepository.findUserByUsername(username);
        List<Userrole> userroles = userRoleRepository.findByUser(user);
        List<GrantedAuthority> authorities = buildUserAuthority(new HashSet<>(userroles));

        return buildUserForAuthentification(user, authorities);
    }

    private UserDetails buildUserForAuthentification(User user, List<GrantedAuthority> authorities) {
        return new org.springframework.security.core.userdetails.User(user.getUsername(), user.getPassword(),user.getEnabled(),true,true,true,authorities);
    }


    private List<GrantedAuthority> buildUserAuthority(Set<Userrole> userroles) {
        Set<GrantedAuthority> setAuth = new HashSet<>();

        for (Userrole userrole : userroles) {
            setAuth.add(new SimpleGrantedAuthority(userrole.getUserrole()));
        }
        List<GrantedAuthority> result = new ArrayList<>(setAuth);
        return result;
    }
}
