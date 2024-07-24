<%-- 
    Document   : adminLeft
    Created on : Oct 8, 2022, 4:00:34 PM
    Author     : AnhTuan
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!-- A vertical navbar -->
<nav class="navbar bg-light">

  <!-- Links -->
  <ul class="navbar-nav">
    <li class="nav-item">
        <a class="nav-link" href="<c:url value="/admin/danhMucStats" />">Thống kê sản phẩm theo danh mục</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="<c:url value="/admin/sanPhamStats" />">Thống kê doanh thu theo từng sản phẩm</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="<c:url value="/admin/sanPhamThangStats" />">Thống kê doanh thu theo thời gian</a>
    </li>
  </ul>

</nav>
