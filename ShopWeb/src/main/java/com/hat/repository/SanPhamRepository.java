/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.hat.repository;

import com.hat.pojos.Comment;
import com.hat.pojos.SanPham;
import java.util.List;
import java.util.Map;

/**
 *
 * @author AnhTuan
 */
public interface SanPhamRepository {

    List<SanPham> getSanPham(Map<String, String> params, int page);

    int countSanPham();

    boolean addSanPham(SanPham sanPham);

    boolean deleteSanPham(int id);

    SanPham getSanPhamById(int sanPhamId);

    List<Comment> getComments(int sanPhamId);
    
    Comment addComment(String content, int sanPhamId);

}
