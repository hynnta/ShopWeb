/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hat.repository.impl;

import com.hat.pojos.DanhMuc;
import com.hat.pojos.OrderDetail;
import com.hat.pojos.SaleOrder;
import com.hat.pojos.SanPham;
import com.hat.repository.StatsRepository;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import org.hibernate.Session;
import org.hibernate.query.Query;
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
public class StatsRepositoryImpl implements StatsRepository {

    @Autowired
    private LocalSessionFactoryBean sessionFactory;

    @Override
    public List<Object[]> danhMucStats() {
        Session session = this.sessionFactory.getObject().getCurrentSession();

        CriteriaBuilder b = session.getCriteriaBuilder();
        CriteriaQuery<Object[]> q = b.createQuery(Object[].class);

        Root rootS = q.from(SanPham.class);
        Root rootD = q.from(DanhMuc.class);

        q.where(b.equal(rootS.get("danhMucId"), rootD.get("id")));

        q.multiselect(rootD.get("id"), rootD.get("ten"), b.count(rootS.get("id")));

        q.groupBy(rootD.get("id"));

        Query query = session.createQuery(q);
        return query.getResultList();
    }

    @Override
    public List<Object[]> sanPhamStats(String kw, Date fromDate, Date toDate) {
        Session session = this.sessionFactory.getObject().getCurrentSession();

        CriteriaBuilder b = session.getCriteriaBuilder();
        CriteriaQuery<Object[]> q = b.createQuery(Object[].class);

        Root rootS = q.from(SanPham.class);
        Root rootO = q.from(SaleOrder.class);
        Root rootD = q.from(OrderDetail.class);

        List<Predicate> predicates = new ArrayList<>();
        predicates.add(b.equal(rootD.get("sanPham"), rootS.get("id")));
        predicates.add(b.equal(rootD.get("orderId"), rootO.get("id")));

        q.multiselect(rootS.get("id"), rootS.get("ten"),
                b.sum(b.prod(rootD.get("unitPrice"), rootD.get("num"))));

        if (kw != null && !kw.isEmpty()) {
            predicates.add(b.like(rootS.get("ten"), String.format("%%%s%%", kw)));
        }
        if (fromDate != null) {
            predicates.add(b.greaterThanOrEqualTo(rootO.get("ngayTao"), fromDate));
        }
        if (toDate != null) {
            predicates.add(b.lessThanOrEqualTo(rootO.get("ngayTao"), toDate));
        }

        q.where(predicates.toArray(new Predicate[]{}));
        q.groupBy(rootS.get("id"));

        Query query = session.createQuery(q);
        return query.getResultList();
    }

    @Override
    public List<Object[]> sanPhamThangStats(String kw, Date fromDate, Date toDate) {
        Session session = this.sessionFactory.getObject().getCurrentSession();

        CriteriaBuilder b = session.getCriteriaBuilder();
        CriteriaQuery<Object[]> q = b.createQuery(Object[].class);

        Root rootS = q.from(SanPham.class);
        Root rootO = q.from(SaleOrder.class);
        Root rootD = q.from(OrderDetail.class);

        List<Predicate> predicates = new ArrayList<>();
        predicates.add(b.equal(rootD.get("sanPham"), rootS.get("id")));
        predicates.add(b.equal(rootD.get("orderId"), rootO.get("id")));

        q.multiselect(b.function("MONTH", Integer.class, rootO.get("ngayTao")),
                b.function("YEAR", Integer.class, rootO.get("ngayTao")),
                b.sum(b.prod(rootD.get("unitPrice"), rootD.get("num"))));

        if (kw != null && !kw.isEmpty()) {
            predicates.add(b.like(rootS.get("ten"), String.format("%%%s%%", kw)));
        }
        if (fromDate != null) {
            predicates.add(b.greaterThanOrEqualTo(rootO.get("ngayTao"), fromDate));
        }
        if (toDate != null) {
            predicates.add(b.lessThanOrEqualTo(rootO.get("ngayTao"), toDate));
        }

        q.where(predicates.toArray(new Predicate[]{}));
        q.groupBy(b.function("MONTH", Integer.class, rootO.get("ngayTao")),
                b.function("YEAR", Integer.class, rootO.get("ngayTao")));

        Query query = session.createQuery(q);
        return query.getResultList();
    }

}
