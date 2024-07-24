/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hat.controllers;

import com.hat.utils.Utils;
import com.hat.pojos.Cart;
import com.hat.service.OrderService;

import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author AnhTuan
 */
@RestController
@RequestMapping("/api")
public class ApiCartController {
    
    @Autowired
    private OrderService orderService;

    @PostMapping("/cart")
    public int addToCart(@RequestBody Cart params, HttpSession session) {
        Map<Integer, Cart> cart = (Map<Integer, Cart>) session.getAttribute("cart");
        if (cart == null) {
            cart = new HashMap<>();
        }

        int sanPhamId = params.getSanPhamId();
        if (cart.containsKey(sanPhamId) == true) {
            Cart c = cart.get(sanPhamId);
            c.setSoLuong(c.getSoLuong() + 1);
        } else {
            cart.put(sanPhamId, params);
        }
        session.setAttribute("cart", cart);

        return Utils.countCart(cart);
    }

    @PutMapping("/cart")
    public ResponseEntity<Map<String, String>> updateCartItem(@RequestBody Cart params, HttpSession session) {
        Map<Integer, Cart> cart = (Map<Integer, Cart>) session.getAttribute("cart");
        if (cart == null) {
            cart = new HashMap<>();
        }

        int sanPhamId = params.getSanPhamId();
        if (cart.containsKey(sanPhamId) == true) {
            Cart c = cart.get(sanPhamId);
            c.setSoLuong(params.getSoLuong());
        }

        session.setAttribute("cart", cart);

        return new ResponseEntity<>(Utils.cartStats(cart), HttpStatus.OK);
    }
    
    @DeleteMapping("/cart/{sanPhamId}")
    public ResponseEntity<Map<String, String>> deleteCartItem(@PathVariable(value = "sanPhamId") int sanPhamId, HttpSession session) {
        Map<Integer, Cart> cart = (Map<Integer, Cart>) session.getAttribute("cart");
        if (cart != null && cart.containsKey(sanPhamId)) {
            cart.remove(sanPhamId);
            
            session.setAttribute("cart", cart);
        }
        
         return new ResponseEntity<>(Utils.cartStats(cart), HttpStatus.OK);
    }
    
    @PostMapping("/pay")
    public HttpStatus pay(HttpSession session) {
        if (this.orderService.addReceipt((Map<Integer, Cart>) session.getAttribute("cart")) == true){
            session.removeAttribute("cart");
            return HttpStatus.OK;
        }
        return HttpStatus.BAD_REQUEST;
    }
    
}
