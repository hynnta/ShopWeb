/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hat.pojos;

import java.io.Serializable;
import java.util.Set;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author AnhTuan
 */
@Entity
@Table(name = "danh_muc")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "DanhMuc.findAll", query = "SELECT d FROM DanhMuc d"),
    @NamedQuery(name = "DanhMuc.findById", query = "SELECT d FROM DanhMuc d WHERE d.id = :id"),
    @NamedQuery(name = "DanhMuc.findByTen", query = "SELECT d FROM DanhMuc d WHERE d.ten = :ten")})
public class DanhMuc implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "ten")
    private String ten;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "danhMucId")
    private Set<SanPham> sanPhamSet;

    public DanhMuc() {
    }

    public DanhMuc(Integer id) {
        this.id = id;
    }

    public DanhMuc(Integer id, String ten) {
        this.id = id;
        this.ten = ten;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTen() {
        return ten;
    }

    public void setTen(String ten) {
        this.ten = ten;
    }

    @XmlTransient
    public Set<SanPham> getSanPhamSet() {
        return sanPhamSet;
    }

    public void setSanPhamSet(Set<SanPham> sanPhamSet) {
        this.sanPhamSet = sanPhamSet;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof DanhMuc)) {
            return false;
        }
        DanhMuc other = (DanhMuc) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.hat.pojos.DanhMuc[ id=" + id + " ]";
    }
    
}
