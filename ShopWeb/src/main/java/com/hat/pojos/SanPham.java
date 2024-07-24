/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hat.pojos;

import com.fasterxml.jackson.annotation.JsonIgnore;
import java.io.Serializable;
import java.util.Date;
import java.util.Set;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinColumns;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author AnhTuan
 */
@Entity
@Table(name = "san_pham")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "SanPham.findAll", query = "SELECT s FROM SanPham s"),
    @NamedQuery(name = "SanPham.findById", query = "SELECT s FROM SanPham s WHERE s.id = :id"),
    @NamedQuery(name = "SanPham.findByNgayTao", query = "SELECT s FROM SanPham s WHERE s.ngayTao = :ngayTao"),
    @NamedQuery(name = "SanPham.findByActive", query = "SELECT s FROM SanPham s WHERE s.active = :active"),
    @NamedQuery(name = "SanPham.findByTen", query = "SELECT s FROM SanPham s WHERE s.ten = :ten"),
    @NamedQuery(name = "SanPham.findByGhiChu", query = "SELECT s FROM SanPham s WHERE s.ghiChu = :ghiChu"),
    @NamedQuery(name = "SanPham.findByGia", query = "SELECT s FROM SanPham s WHERE s.gia = :gia"),
    @NamedQuery(name = "SanPham.findByHinhAnh", query = "SELECT s FROM SanPham s WHERE s.hinhAnh = :hinhAnh")})
public class SanPham implements Serializable {


    /**
     * @return the file
     */
    public MultipartFile getFile() {
        return file;
    }

    /**
     * @param file the file to set
     */
    public void setFile(MultipartFile file) {
        this.file = file;
    }

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Column(name = "ngay_tao")
    @Temporal(TemporalType.TIMESTAMP)
    private Date ngayTao;
    @Column(name = "active")
    private Boolean active;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "ten")
    private String ten;
    @Size(max = 200)
    @Column(name = "ghi_chu")
    private String ghiChu;
    @Basic(optional = false)
    @NotNull
    @Column(name = "gia")
    private long gia;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 150)
    @Column(name = "hinh_anh")
    private String hinhAnh;
    @JoinColumn(name = "danh_muc_id", referencedColumnName = "id")
    @ManyToOne(optional = false)
    @JsonIgnore
    private DanhMuc danhMucId;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "sanPhamId")
    @JsonIgnore
    private Set<Comment> commentSet;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "sanPham")
    @JsonIgnore
    private Set<OrderDetail> orderDetailSet;

    @Transient
    private MultipartFile file;

    public SanPham() {
    }

    public SanPham(Integer id) {
        this.id = id;
    }

    public SanPham(Integer id, String ten, long gia, String hinhAnh) {
        this.id = id;
        this.ten = ten;
        this.gia = gia;
        this.hinhAnh = hinhAnh;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Date getNgayTao() {
        return ngayTao;
    }

    public void setNgayTao(Date ngayTao) {
        this.ngayTao = ngayTao;
    }

    public Boolean getActive() {
        return active;
    }

    public void setActive(Boolean active) {
        this.active = active;
    }

    public String getTen() {
        return ten;
    }

    public void setTen(String ten) {
        this.ten = ten;
    }

    public String getGhiChu() {
        return ghiChu;
    }

    public void setGhiChu(String ghiChu) {
        this.ghiChu = ghiChu;
    }

    public long getGia() {
        return gia;
    }

    public void setGia(long gia) {
        this.gia = gia;
    }

    public String getHinhAnh() {
        return hinhAnh;
    }

    public void setHinhAnh(String hinhAnh) {
        this.hinhAnh = hinhAnh;
    }

    public DanhMuc getDanhMucId() {
        return danhMucId;
    }

    public void setDanhMucId(DanhMuc danhMucId) {
        this.danhMucId = danhMucId;
    }

    @XmlTransient
    public Set<Comment> getCommentSet() {
        return commentSet;
    }

    public void setCommentSet(Set<Comment> commentSet) {
        this.commentSet = commentSet;
    }

    @XmlTransient
    public Set<OrderDetail> getOrderDetailSet() {
        return orderDetailSet;
    }

    public void setOrderDetailSet(Set<OrderDetail> orderDetailSet) {
        this.orderDetailSet = orderDetailSet;
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
        if (!(object instanceof SanPham)) {
            return false;
        }
        SanPham other = (SanPham) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.hat.pojos.SanPham[ id=" + id + " ]";
    }

}
