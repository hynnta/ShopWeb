/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hat.repository.impl;

import com.hat.pojos.Cart;
import com.hat.pojos.OrderDetail;
import com.hat.pojos.SaleOrder;
import com.hat.repository.OrderRepository;
import com.hat.repository.SanPhamRepository;
import com.hat.repository.UserRepository;
import com.hat.utils.Utils;
import java.util.Date;
import java.util.Map;
import javax.persistence.criteria.Order;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author AnhTuan
 */
@Repository
@Transactional
public class OrderRepositoryImpl implements OrderRepository {

    @Autowired
    private UserRepository userRepository;
    @Autowired
    private LocalSessionFactoryBean sessionFactory;
    @Autowired
    private SanPhamRepository sanPhamRepository;

    @Override
    @Transactional(propagation = Propagation.REQUIRED)
    public boolean addReceipt(Map<Integer, Cart> cart) {
        try {
            Session session = this.sessionFactory.getObject().getCurrentSession();

            SaleOrder order = new SaleOrder();
            order.setUserId(this.userRepository.getUserById(0));
            order.setNgayTao(new Date());

            Map<String, String> stats = Utils.cartStats(cart);
            order.setAmount(Long.parseLong(stats.get("amount")));

            session.save(order);

            for (Cart c : cart.values()) {
                OrderDetail d = new OrderDetail();
                d.setOrderId(order);
                d.setSanPham(this.sanPhamRepository.getSanPhamById(c.getSanPhamId()));
                d.setUnitPrice(c.getDonGia());
                d.setNum(c.getSoLuong());

                session.save(d);
            }
            return true;
        } catch (HibernateException ex) {
            ex.printStackTrace();
        }
        return false;
    }

}
