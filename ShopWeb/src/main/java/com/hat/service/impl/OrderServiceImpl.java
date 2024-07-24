/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hat.service.impl;

import com.hat.pojos.Cart;
import com.hat.repository.OrderRepository;
import com.hat.service.OrderService;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author AnhTuan
 */
@Service
public class OrderServiceImpl implements OrderService{
    
    @Autowired
    private OrderRepository orderRepository;
    
    @Override
    public boolean addReceipt(Map<Integer, Cart> cart) {
        if (cart != null)
            return this.orderRepository.addReceipt(cart);
        
        return false;
    }
    
}
