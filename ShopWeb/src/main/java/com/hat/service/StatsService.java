/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.hat.service;

import java.util.Date;
import java.util.List;

/**
 *
 * @author AnhTuan
 */
public interface StatsService {
    List<Object[]> danhMucStats();
    List<Object[]> sanPhamStats(String kw, Date fromDate, Date toDate);
    List<Object[]> sanPhamThangStats(String kw, Date fromDate, Date toDate);
}
