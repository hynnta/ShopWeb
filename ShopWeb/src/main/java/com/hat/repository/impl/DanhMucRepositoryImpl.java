/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hat.repository.impl;

import com.hat.pojos.DanhMuc;
import com.hat.repository.DanhMucRepository;
import java.util.List;
import javax.persistence.Query;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author AnhTuan
 */
@Repository
@Transactional
public class DanhMucRepositoryImpl implements DanhMucRepository {

    @Autowired
    private LocalSessionFactoryBean sessionFactory;

    @Override
    public List<DanhMuc> getDanhMuc() {
        Session s = this.sessionFactory.getObject().getCurrentSession();
        Query q = s.createQuery("From DanhMuc");
        
        return q.getResultList();
    }

}
