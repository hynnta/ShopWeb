<%-- 
    Document   : adminSanPham
    Created on : Sep 24, 2022, 4:03:56 PM
    Author     : AnhTuan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>



<h1 class="text-center text-muted">MANAGE CLOTHING</h1>

<button class="btn btn-primary" id="loading">
    <span class="spinner-border spinner-border-sm"></span>
    Loading..
</button>

<c:url value="/admin/sanpham" var="action" />
<form:form method="post" action="${action}" 
           modelAttribute="sanPham" enctype="multipart/form-data" >

    <div class="form-floating mb-3 mt-3">
        <form:input class="form-control" path="ten" id="ten" placeholder="tên" />
        <label for="ten">Clothing Name</label>
        <form:errors path="ten" element="div" cssClass="invalid-feedback" />
    </div>

    <div class="form-floating mt-3 mb-3">
        <form:input class="form-control" path="gia" id="gia" placeholder="giá" />
        <label for="gia">Price</label>
        <form:errors path="gia" element="div" cssClass="invalid-feedback" />
    </div>

    <div class="form-floating mb-3 mt-3">
        <form:input class="form-control" path="ghiChu" id="ghiChu" placeholder="Ghi Chú" />
        <label for="ten">Description</label>
        <form:errors path="ghiChu" element="div" cssClass="invalid-feedback" />
    </div>

    <div class="form-floating">
        <form:select path="danhMucId" class="form-select" id="cate" name="cate">
            <c:forEach items="${danhMuc}" var="c">
                <option value="${c.id}">${c.ten}</option>
            </c:forEach>
        </form:select>
        <label for="cate" class="form-label">Type Clothing</label>
    </div>

    <div class="form-group">
        <label for="file">Photo</label>
        <form:input type="file" id="file" path="file" class="form-control"/>
    </div>

    <div class="form-floating">
        <br>
        <input type="submit" value="Add Clothing" class="btn btn-primary" />
    </div>
</form:form>

<table class="table table-hover">
    <tr>
        <th>ID</th>
        <th>Photos</th>
        <th>Name</th>
        <th>Price</th>
        <th>Description</th>
        <th></th>
    </tr>
    <tbody id="adminSanPham">

    </tbody>
</table>

<script src="<c:url value="/js/sanPham.js" />"></script>
<script>
    <c:url value="/api/sanpham" var="n" />
    window.onload = function () {
        getSanPham('${n}');
    }
</script>