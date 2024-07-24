<%-- 
    Document   : chiTietSanPham
    Created on : Oct 2, 2022, 1:20:21 AM
    Author     : AnhTuan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<h1 class="text-center text-muted">CLOTHING DETAILS</h1>

<div class="container mt-5 mb-5">
    <div class="row d-flex justify-content-center">
        <div class="col-md-10">
            <div class="card">
                <div class="row">
                    <div class="col-md-6">
                        <div class="images p-4">
                            <div class="text-center p-4"> <img id="main-image" src="${sanPham.hinhAnh}" alt="${sanPham.ten}" width="250" /> </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="product p-4">
                            <div class="d-flex justify-content-between align-items-center">
                                <a class="d-flex align-items-center btn" href="<c:url value="/"/>"> <i class="fa fa-long-arrow-left"></i> <span class="ml-1"> Back</span> </a> 
                                <sec:authorize access="isAuthenticated()">
                                <a href="<c:url value="/cart"/>" >
                                    <i class="btn fa fa-shopping-cart text-muted"></i>
                                </a>
                                </sec:authorize>
                            </div>
                            <div class="mt-4 mb-3"> <span class="text-uppercase text-muted brand">HAT Concept</span>
                                <h5 class="text-uppercase">${sanPham.ten}</h5>

                                <div class="ml-2"> <small class="dis-price"><fmt:formatNumber value="${sanPham.gia}" maxFractionDigits="3" type="number" /> VNĐ </small> </div>

                            </div>
                            <p class="about"> ${sanPham.ghiChu} </p>
                            <div class="sizes mt-5">
                                <h6 class="text-uppercase">Size</h6> <label class="radio"> <input type="radio" name="size" value="S" checked> <span>S</span> </label> <label class="radio"> <input type="radio" name="size" value="M"> <span>M</span> </label> <label class="radio"> <input type="radio" name="size" value="L"> <span>L</span> </label> <label class="radio"> <input type="radio" name="size" value="XL"> <span>XL</span> </label> <label class="radio"> <input type="radio" name="size" value="XXL"> <span>XXL</span> </label>
                            </div>
                            <sec:authorize access="isAuthenticated()">
                            <div class="cart mt-4 align-items-center"> <button class="btn btn-danger text-uppercase mr-2 px-4" onclick="addToCart(${sanPham.id}, '${sanPham.ten}', ${sanPham.gia})" >Add to cart</button> <i class="fa fa-heart text-muted"></i> <i class="fa fa-share-alt text-muted"></i> </div>
                            </sec:authorize>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<c:url value="/api/sanpham/${sanPham.id}/comments" var="endpoint" />

<sec:authorize access="!isAuthenticated()">
    <strong>Vui Lòng <a href="<c:url value="/login" />">Đăng Nhập</a> Để Bình Luận!!!</strong>
</sec:authorize>
<sec:authorize access="isAuthenticated()">
    <div class="row d-flex justify-content-center">
        <div class="col-md-8 col-lg-6">
            <div class="card shadow-0 border" style="background-color: #f0f2f5;">
                <div class="card-body p-4">
                    <div class="form-outline mb-4">
                        <input type="text" id="contentId" class="form-control" placeholder="Nhập nội dung ...." />
                        <button class="btn form-label" onclick="addComment('${endpoint}', ${sanPham.id})" for="addANote">+ Thêm Bình Luận</button>
                    </div>
                    <div id="comments" class="card mb-4">
                        <div class="card-body">
                            <p></p>
                            <i></i>
                            <div class="d-flex justify-content-between">
                                <div class="d-flex flex-row align-items-center">
                                    
                                    <p class="small mb-0 ms-2"></p>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
</sec:authorize>




<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.4/moment.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.4/moment-with-locales.min.js"></script>
<script src="<c:url value="/js/main.js" />"></script>
<script>

                            window.onload = function () {
                                loadComments('${endpoint}');
                            }
</script>