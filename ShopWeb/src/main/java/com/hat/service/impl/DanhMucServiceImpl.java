/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hat.service.impl;

import com.hat.pojos.DanhMuc;
import com.hat.repository.DanhMucRepository;
import com.hat.service.DanhMucService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author AnhTuan
 */
@Service
public class DanhMucServiceImpl implements DanhMucService {
    @Autowired
    private DanhMucRepository danhMucRepository;
    @Override
    public List<DanhMuc> getDanhMuc() {
        return this.danhMucRepository.getDanhMuc();
    }

    

}
