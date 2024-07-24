<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<div class="container">
    <c:if test="${sanPham.size()==0}">
        <p><em>KHÔNG CÓ SẢN PHẨM NÀO !!!</em></p>
    </c:if>
    <div class="row">
        <c:forEach items="${sanPham}" var="s" >
            <div class="col-md-3 col-xs-12" style="padding:10px;">
                <div class="card">
                    
                    <a href="<c:url value="/sanpham/${s.id}" />" ><img class="card-img-top" src="${s.hinhAnh}" alt="Card image"></a>
                    <div class="card-body">
                        <a href="<c:url value="/sanpham/${s.id}" />" class="btn btn-outline-secondary" ><h4 class="card-title">${s.ten}</h4></a>
                        <p class="card-text"><fmt:formatNumber value="${s.gia}" maxFractionDigits="3" type="number" /> VNĐ </p>
                        <a href="<c:url value="/sanpham/${s.id}" />" class="btn btn-secondary">Xem chi tiết</a>
                        <sec:authorize access="isAuthenticated()">
                            <a class="btn btn-outline-danger" onclick="addToCart(${s.id}, '${s.ten}', ${s.gia})" >Đặt Hàng</a>
                        </sec:authorize>
                    </div>
                   
                </div>
            </div>
        </c:forEach>
    </div>
</div>
<ul class="pagination">
    <c:forEach begin="1" end="${Math.ceil(sanPhamCounter/pageSize)}" var="i">
        <c:url value="/" var="c">
            <c:param value="${i}" name="page"  />
        </c:url>
        <li class="page-item"><a class="page-link" href="${c}">${i}</a></li>
   </c:forEach>
</ul>

<script src="<c:url value="/js/main.js" />"></script>


