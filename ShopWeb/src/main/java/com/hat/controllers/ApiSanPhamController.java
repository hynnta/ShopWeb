/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hat.controllers;

import com.hat.pojos.SanPham;
import com.hat.service.SanPhamService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author AnhTuan
 */
@RestController
@RequestMapping("/api")
public class ApiSanPhamController {

    @Autowired
    private SanPhamService sanPhamService;

    @GetMapping("/sanpham")
    public ResponseEntity<List<SanPham>> list() {
        return new ResponseEntity<>(this.sanPhamService.getSanPham(null, 0), HttpStatus.OK);
    }

    @DeleteMapping("/sanpham/{sanPhamId}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void deleteSanPham(@PathVariable(value = "sanPhamId") int id) {
        this.sanPhamService.deleteSanPham(id);
    }
}
