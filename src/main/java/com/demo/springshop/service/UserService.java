package com.demo.springshop.service;

import com.demo.springshop.dto.UserDTO;
import com.demo.springshop.entities.User;
import org.springframework.security.core.userdetails.UserDetailsService;

import java.util.List;

public interface UserService extends UserDetailsService {

    boolean save(UserDTO userDTO);
    void save(User user);
    List<UserDTO> getAll();

    User findByName(String name);
    void updateProfile(UserDTO userDTO);
}
