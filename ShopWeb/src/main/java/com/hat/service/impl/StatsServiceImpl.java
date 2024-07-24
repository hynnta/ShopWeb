/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hat.service.impl;

import com.hat.repository.StatsRepository;
import com.hat.service.StatsService;
import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author AnhTuan
 */
@Service
public class StatsServiceImpl implements StatsService{

    @Autowired
    private StatsRepository statsRepository;
    
    @Override
    public List<Object[]> danhMucStats() {
        return this.statsRepository.danhMucStats();
    }

    @Override
    public List<Object[]> sanPhamStats(String kw, Date fromDate, Date toDate) {
        return this.statsRepository.sanPhamStats(kw, fromDate, toDate);
    }

    @Override
    public List<Object[]> sanPhamThangStats(String kw, Date fromDate, Date toDate) {
        return this.statsRepository.sanPhamThangStats(kw, fromDate, toDate);
    }
    
}
