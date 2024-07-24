<%-- 
    Document   : sanPhamThangStats
    Created on : Oct 10, 2022, 10:59:44 AM
    Author     : AnhTuan
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<h1 class="text-center text-danger">Thống Kê Doanh Thu Theo Thời Gian</h1>

<form action="">
    <div class="form-group">
        <label>Từ khóa</label>
        <input type="text" name="kw" class="form-control"/>
    </div>
    <div class="form-group">
        <label>Từ thời điểm</label>
        <input type="date" name="fromDate" class="form-control"/>
    </div>
    <div class="form-group">
        <label>Đến thời điểm</label>
        <input type="date" name="toDate" class="form-control"/>
    </div>
    <br>
    <input type="submit" value="Báo cáo" class="btn btn-primary"/>
</form>

<div>
    <canvas id="myChart"></canvas>
</div>

<table class="table">
    <tr>
        <th>Tháng</th>
        <th>Doanh thu</th>
    </tr>
    <c:forEach items="${sanPhamThangStats}" var="s" >
        <tr>
            <td>${s[0]}/${s[1]}</td>
            <td><fmt:formatNumber value="${s[2]}" maxFractionDigits="3" type="number" /> VNĐ</td>
        </tr>
    </c:forEach>
</table>

<script>
    let sanPhamThangLabels = [], sanPhamThangInfo = [];
    <c:forEach items="${sanPhamThangStats}" var="s">
    sanPhamThangLabels.push('${s[1]}')
    sanPhamThangInfo.push(${s[2]})
    </c:forEach>

    window.onload = function () {
        sanPhamThangChart("myChart", sanPhamThangLabels, sanPhamThangInfo)
    }
</script>
