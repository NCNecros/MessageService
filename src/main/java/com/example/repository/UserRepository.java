package com.example.repository;

import com.example.entity.User;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

/**
 * Created by Necros on 10.03.2016.
 */
@Component("userRepository")
public interface UserRepository extends CrudRepository<User, Long> {
    User findUserByUsername(String username);
}
