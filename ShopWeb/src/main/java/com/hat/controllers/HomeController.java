/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hat.controllers;


import com.hat.pojos.Cart;
import com.hat.pojos.SanPham;
import com.hat.service.DanhMucService;
import com.hat.service.SanPhamService;
import com.hat.utils.Utils;
import java.util.Map;
import java.util.stream.Collectors;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Controller;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.model;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author AnhTuan
 */
@Controller
@ControllerAdvice
public class HomeController {

    @Autowired
    private DanhMucService danhMucService;
    @Autowired
    private SanPhamService sanPhamService;
    @Autowired
    private Environment env;

    @ModelAttribute
    public void commonAttr(Model model, HttpSession session) {

        model.addAttribute("danhMuc", this.danhMucService.getDanhMuc());
        model.addAttribute("cartCounter", Utils.countCart((Map<Integer, Cart>) session.getAttribute("cart")));
    }
    @RequestMapping("/homepage")
    public String Home(){
        return "homePage";
    }

    @RequestMapping("/")
    public String index(Model model, @RequestParam Map<String, String> params) {

        int page = Integer.parseInt(params.getOrDefault("page", "1"));
        model.addAttribute("sanPham", this.sanPhamService.getSanPham(params, page));
        model.addAttribute("sanPhamCounter", this.sanPhamService.countSanPham());
        model.addAttribute("pageSize", Integer.parseInt(env.getProperty("page.size")));
        return "index";
    }

}
