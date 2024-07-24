/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hat.repository;

import com.hat.pojos.User;

/**
 *
 * @author AnhTuan
 */
public interface UserRepository {
    User getUserByUsername(String username);
    boolean addUser(User user);
    User getUserById (int userId);
}
