/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hat.controllers;

import com.hat.pojos.Cart;
import com.hat.service.OrderService;
import java.util.Map;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author AnhTuan
 */
//@RestController
//@RequestMapping("/api")
//public class ApiReceiptController {
//    
//    @Autowired
//    private OrderService orderService;
//    
//    @PostMapping("/pay")
//    public HttpStatus pay(HttpSession session) {
//       
//        if (this.orderService.addReceipt((Map<Integer, Cart>) session.getAttribute("cart")) == true)
//        
//            session.removeAttribute("cart");
//            return HttpStatus.OK;
//        
//        return HttpStatus.BAD_REQUEST;
//    }
//}
