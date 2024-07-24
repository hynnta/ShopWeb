/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.hat.service;

import com.hat.pojos.User;
import org.springframework.security.core.userdetails.UserDetailsService;

/**
 *
 * @author AnhTuan
 */
public interface UserService extends UserDetailsService{
    User getUserByUsername(String username);
     boolean addUser(User user);
     User getUserById (int id);
}
