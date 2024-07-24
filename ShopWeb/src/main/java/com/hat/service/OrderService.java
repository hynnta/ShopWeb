/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.hat.service;

import com.hat.pojos.Cart;
import java.util.Map;

/**
 *
 * @author AnhTuan
 */
public interface OrderService {
    boolean addReceipt(Map<Integer, Cart> cart);
}
