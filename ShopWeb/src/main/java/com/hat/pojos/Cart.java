/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hat.pojos;

/**
 *
 * @author AnhTuan
 */
public class Cart {

    /**
     * @return the sanPhamId
     */
    public int getSanPhamId() {
        return sanPhamId;
    }

    /**
     * @param sanPhamId the sanPhamId to set
     */
    public void setSanPhamId(int sanPhamId) {
        this.sanPhamId = sanPhamId;
    }

    /**
     * @return the tenSanPham
     */
    public String getTenSanPham() {
        return tenSanPham;
    }

    /**
     * @param tenSanPham the tenSanPham to set
     */
    public void setTenSanPham(String tenSanPham) {
        this.tenSanPham = tenSanPham;
    }

    /**
     * @return the donGia
     */
    public Long getDonGia() {
        return donGia;
    }

    /**
     * @param donGia the donGia to set
     */
    public void setDonGia(Long donGia) {
        this.donGia = donGia;
    }

    /**
     * @return the soLuong
     */
    public int getSoLuong() {
        return soLuong;
    }

    /**
     * @param soLuong the soLuong to set
     */
    public void setSoLuong(int soLuong) {
        this.soLuong = soLuong;
    }
    private int sanPhamId;
    private String tenSanPham;
    private Long donGia;
    private int soLuong;
}
