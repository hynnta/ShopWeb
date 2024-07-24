<%-- 
    Document   : cart
    Created on : Oct 6, 2022, 3:45:16 PM
    Author     : AnhTuan
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<h1 class="text-center text-muted">CART</h1>

<c:if test="${carts == null}" >
    <h4 class="text-center text-danger">Không có sản phẩm nào trong giỏ</h4>
</c:if>

<c:if test="${carts != null}" >
    <table class="table">
        <tr>
            <th>Mã sản phẩm</th>
            <th>Tên sản phẩm</th>
            <th>Đơn giá</th>
            <th>Số lượng</th>
            <th></th>
        </tr>
        <c:forEach items="${carts}" var="c" >
            <tr>
                <td>${c.sanPhamId}</td>
                <td>${c.tenSanPham}</td>
                <td><fmt:formatNumber value="${c.donGia}" maxFractionDigits="3" type="number" /> VNĐ </td>
                <td>
                    <div class="form-group">
                        <input type="number" onblur="updateCart(this, ${c.sanPhamId})" value="${c.soLuong}" class="form-control" />
                    </div>
                </td>
                <td>
                    <input type="button" onclick="deleteCart(${c.sanPhamId})" value="Xóa" class="btn btn-danger"/>
                </td>
            </tr>
        </c:forEach>
    </table>
    <div>
        <h5 class="text-info">Tổng tiền hóa đơn: <span id="amountCart"><fmt:formatNumber value="${cartStats.amount}" maxFractionDigits="3" type="number" /></span> VNĐ</h5>
    </div>
    <input onclick="pay()" type="button" value="Thanh Toán" class="btn btn-danger" />
    <br><br>
</c:if> 

<script src="<c:url value="/js/main.js" />"></script>
