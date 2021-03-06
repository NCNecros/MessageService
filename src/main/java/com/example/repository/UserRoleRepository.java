package com.example.repository;

import com.example.entity.User;
import com.example.entity.Userrole;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * Created by Necros on 14.03.2016.
 */
@Component
public interface UserRoleRepository extends CrudRepository<Userrole, Integer>{

    List<Userrole> findByUser(User user);

}
