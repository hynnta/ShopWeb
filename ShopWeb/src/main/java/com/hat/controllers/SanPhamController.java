/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hat.controllers;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.hat.pojos.SanPham;
import com.hat.service.SanPhamService;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author AnhTuan
 */
@Controller

public class SanPhamController {

    @Autowired
    private Cloudinary cloudinary;

    @Autowired
    private SanPhamService sanPhamService;

    @PostMapping("admin/sanpham")
    public String add(Model model, @ModelAttribute(value = "sanPham") SanPham s,
            BindingResult r) {
        if (!r.hasErrors()) {
            if (this.sanPhamService.addSanPham(s) == true) {
                return "redirect:/admin/sanpham";
            }

        }

        return "adminSanPham";
    }
    
    @GetMapping("/sanpham/{sanPhamId}")
    public String detail(Model model, @PathVariable(value = "sanPhamId") int sanPhamId){
        model.addAttribute("sanPham", this.sanPhamService.getSanPhamById(sanPhamId));
        return "chiTietSanPham";
    }
}
