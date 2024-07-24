/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hat.controllers;

import com.hat.pojos.SanPham;
import com.hat.service.SanPhamService;
import com.hat.service.StatsService;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author AnhTuan
 */
@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private SanPhamService sanPhamService;
    @Autowired
    private StatsService statsService;

    @GetMapping("/sanpham")
    public String quanLySanPham(Model model) {
        model.addAttribute("sanPham", new SanPham());
        return "adminSanPham";
    }

    @GetMapping("/danhMucStats")
    public String danhMucStats(Model model) {
        model.addAttribute("danhMucStats", this.statsService.danhMucStats());
        return "danhMucStats";
    }
    
    @GetMapping("/sanPhamStats")
    public String sanPhamStats(Model model, @RequestParam(required = false) Map<String, String> params) throws ParseException {
        SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd");
        String kw = params.getOrDefault("kw", null);
        
        Date fromDate = null, toDate = null;
        try {
            String from = params.getOrDefault("fromDate", null);
            if (from != null) {
                fromDate = f.parse(from);
            }

            String to = params.getOrDefault("toDate", null);
            if (to != null) {
                toDate = f.parse(to);
            }

        } catch (ParseException ex) {
            ex.printStackTrace();
        }
        
        model.addAttribute("sanPhamStats", this.statsService.sanPhamStats(kw, fromDate, toDate));
        return "sanPhamStats";
    }
    
    @GetMapping("/sanPhamThangStats")
    public String sanPhamThangStats(Model model, @RequestParam(required = false) Map<String, String> params) throws ParseException {
        
        SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd");
        String kw = params.getOrDefault("kw", null);
        
        Date fromDate = null, toDate = null;
        try {
            String from = params.getOrDefault("fromDate", null);
            if (from != null) {
                fromDate = f.parse(from);
            }

            String to = params.getOrDefault("toDate", null);
            if (to != null) {
                toDate = f.parse(to);
            }

        } catch (ParseException ex) {
            ex.printStackTrace();
        }
        
        model.addAttribute("sanPhamThangStats", this.statsService.sanPhamThangStats(null, null, null));
        return "sanPhamThangStats";
    }
}

