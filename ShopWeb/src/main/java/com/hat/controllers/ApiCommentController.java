/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hat.controllers;

import com.hat.pojos.Comment;
import com.hat.service.SanPhamService;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author AnhTuan
 */
@RestController
@RequestMapping("/api")
public class ApiCommentController {
    @Autowired
    private SanPhamService sanPhamService;
    
    @GetMapping("/sanpham/{sanPhamId}/comments")
    public ResponseEntity<List<Comment>> getComments(@PathVariable(value = "sanPhamId") int id) {
        
        return new ResponseEntity<>(this.sanPhamService.getComments(id), HttpStatus.OK);
    }
    
    @PostMapping(path = "/sanpham/{sanPhamId}/comments", produces = {
        MediaType.APPLICATION_JSON_VALUE
    })
    public ResponseEntity<Comment> addComment(@RequestBody Map<String, String> params) {
        String content = params.get("content");
        int sanPhamId = Integer.parseInt(params.get("sanPhamId"));
        
        Comment c = this.sanPhamService.addComment(content, sanPhamId);
        
        return new ResponseEntity<>(c, HttpStatus.CREATED);
    }
}
