<%-- 
    Document   : sanPhamStats
    Created on : Oct 8, 2022, 4:08:50 PM
    Author     : AnhTuan
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<h1 class="text-center text-danger">Thống Kê Sản Phẩm Theo Danh Mục</h1>

<div>
  <canvas id="myChart"></canvas>
</div>

<table class="table">
    <tr>
        <th>Mã danh mục</th>
        <th>Tên danh mục</th>
        <th>Số lượng sản phẩm</th>
    </tr>
    <c:forEach items="${danhMucStats}" var="d" >
        <tr>
            <td>${d[0]}</td>
            <td>${d[1]}</td>
            <td>${d[2]}</td>
        </tr>
    </c:forEach>
</table>

<script>
    let danhMucLabels = [], danhMucInfo = [];
    <c:forEach items="${danhMucStats}" var="d">
    danhMucLabels.push('${d[1]}')
    danhMucInfo.push(${d[2]})    
    </c:forEach>
    
    window.onload = function () {
        danhMucChart("myChart", danhMucLabels, danhMucInfo)
    }
</script>