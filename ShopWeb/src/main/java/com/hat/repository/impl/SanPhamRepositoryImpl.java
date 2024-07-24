/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hat.repository.impl;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.hat.pojos.Comment;
import com.hat.pojos.SanPham;
import com.hat.repository.SanPhamRepository;
import com.hat.repository.UserRepository;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import javax.persistence.Query;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.context.annotation.PropertySources;
import org.springframework.core.env.Environment;

import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author AnhTuan
 */
@Repository
@PropertySource("classpath:databases.properties")
@Transactional
public class SanPhamRepositoryImpl implements SanPhamRepository {

    @Autowired
    private LocalSessionFactoryBean sessionFactory;
    @Autowired
    private Environment env;
    @Autowired
    private Cloudinary cloudinary;
    @Autowired
    private UserRepository userRepository;

    @Override
    public List<SanPham> getSanPham(Map<String, String> params, int page) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder b = session.getCriteriaBuilder();
        CriteriaQuery<SanPham> q = b.createQuery(SanPham.class);
        Root root = q.from(SanPham.class);
        q.select(root);

        if (params != null) {
            List<Predicate> predicates = new ArrayList<>();
            String kw = params.get("kw");
            if (kw != null && !kw.isEmpty()) {
                Predicate p = b.like(root.get("ten").as(String.class), String.format("%%%s%%", kw));
                predicates.add(p);
            }

//            String fp = params.get("fromPrice");
//            if (fp != null) {
//                Predicate p = b.greaterThanOrEqualTo(root.get("gia").as(Long.class), Long.parseLong(fp));
//                predicates.add(p);
//            }
//
//            String tp = params.get("toPrice");
//            if (tp != null) {
//                Predicate p = b.lessThanOrEqualTo(root.get("gia").as(Long.class), Long.parseLong(tp));
//                predicates.add(p);
//            }

            String danhMucId = params.get("danhMucId");
            if (danhMucId != null) {
                Predicate p = b.equal(root.get("danhMucId"), Integer.parseInt(danhMucId));
                predicates.add(p);
            }

            q.where(predicates.toArray(Predicate[]::new));
        }

        Query query = session.createQuery(q);
        if (page > 0) {
            int size = Integer.parseInt(env.getProperty("page.size").toString());
            int start = (page - 1) * size;
            query.setFirstResult(start);
            query.setMaxResults(size);

        }

        return query.getResultList();
    }

    @Override
    public boolean addSanPham(SanPham sanPham) {
        Session session = this.sessionFactory.getObject().getCurrentSession();

        try {
            session.save(sanPham);
            return true;
        } catch (Exception ex) {
            ex.printStackTrace();
            return false;
        }
    }

    @Override
    public int countSanPham() {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        org.hibernate.query.Query q = session.createQuery("SELECT COUNT(*) FROM SanPham");

        return Integer.parseInt(q.getSingleResult().toString());
    }
    
    @Override
    public SanPham getSanPhamById(int productId) {
       Session session = this.sessionFactory.getObject().getCurrentSession();
       return session.get(SanPham.class, productId);
    }

    @Override
    public boolean deleteSanPham(int id) {
        Session session = this.sessionFactory.getObject().getCurrentSession();

        try {
            SanPham s = session.get(SanPham.class, id);
            session.delete(s);
            return true;
        } catch (Exception ex) {
            ex.printStackTrace();
            return false;
        }
    }
    
    @Override
    public List<Comment> getComments(int sanPhamId) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder b = session.getCriteriaBuilder();
        CriteriaQuery<Comment> q = b.createQuery(Comment.class);
        Root root = q.from(Comment.class);
        q.select(root);
        
        q.where(b.equal(root.get("sanPhamId"), sanPhamId));
        
        org.hibernate.query.Query query = session.createQuery(q);
        return query.getResultList();
    }
    
    @Override
    public Comment addComment(String content, int sanPhamId) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        Comment c = new Comment();
        c.setContent(content);
        c.setSanPhamId(this.getSanPhamById(sanPhamId));
        
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        c.setUserId(this.userRepository.getUserByUsername(authentication.getName()));
        
        session.save(c);
        
        return c;
    }
   
}
