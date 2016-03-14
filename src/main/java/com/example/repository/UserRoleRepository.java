package com.example.repository;

import com.example.entity.UserRole;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Component;

/**
 * Created by Necros on 14.03.2016.
 */
@Component
public interface UserRoleRepository extends CrudRepository<UserRole, Integer>{

}
