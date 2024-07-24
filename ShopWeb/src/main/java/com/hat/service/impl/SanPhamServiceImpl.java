/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hat.service.impl;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.hat.pojos.Comment;
import com.hat.pojos.SanPham;
import com.hat.repository.SanPhamRepository;
import com.hat.service.SanPhamService;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author AnhTuan
 */
@Service
public class SanPhamServiceImpl implements SanPhamService {

    @Autowired
    private SanPhamRepository sanPhamRepository;
    @Autowired
    private Cloudinary cloudinary;

    @Override
    public List<SanPham> getSanPham(Map<String, String> params, int page) {
        return this.sanPhamRepository.getSanPham(params, page);
    }

    @Override
    public boolean addSanPham(SanPham sanPham) {

        try {
            Map r = this.cloudinary.uploader().upload(sanPham.getFile().getBytes(),
                    ObjectUtils.asMap("resource_type", "auto"));
            sanPham.setHinhAnh((String) r.get("secure_url"));
            return this.sanPhamRepository.addSanPham(sanPham);
        } catch (IOException ex) {
            System.out.println(ex.getMessage());
        }
        return false;
    }

    @Override
    public int countSanPham() {
        return this.sanPhamRepository.countSanPham();
    }

    @Override
    public boolean deleteSanPham(int id) {
        return this.sanPhamRepository.deleteSanPham(id);
    }

    @Override
    public SanPham getSanPhamById(int sanPhamId) {
        return this.sanPhamRepository.getSanPhamById(sanPhamId);
    }

    @Override
    public List<Comment> getComments(int sanPhamId) {
        return this.sanPhamRepository.getComments(sanPhamId);
    }
    
    @Override
    public Comment addComment(String content, int sanPhamId) {
        return this.sanPhamRepository.addComment(content, sanPhamId);
    }
}
