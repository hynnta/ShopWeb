<%-- 
    Document   : header
    Created on : Sep 24, 2022, 2:07:54 PM
    Author     : AnhTuan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<nav class="navbar navbar-expand-lg bg-dark navbar-light d-none d-lg-block" id="templatemo_nav_top">
        <div class="container text-light">
            <div class="w-100 d-flex justify-content-lg-between">
                <div>
                    <i class="fa fa-envelope mx-2"></i>
                    <a class="navbar-sm-brand text-light text-decoration-none" href="mailto:1951052223tuan@ou.edu.vn">1951052223tuan@ou.edu.vn</a>
                    <i class="fa fa-phone mx-2"></i>
                    <a class="navbar-sm-brand text-light text-decoration-none" href="tel:0394 2222 4">0394 2222 4</a>
                </div>
                <div>
                    <a class="text-light" href="https://www.facebook.com/hyatuan" target="_blank" title="Huỳnh Anh Tuấn" rel="sponsored"><i class="fab fa-facebook-f fa-sm fa-fw me-2"></i></a>
                    <a class="text-light" href="https://www.instagram.com/_hynta_/" target="_blank" title="Huỳnh Anh Tuấn"><i class="fab fa-instagram fa-sm fa-fw me-2"></i></a>
                    <a class="text-light" href="https://twitter.com/" target="_blank" title="Huỳnh Anh Tuấn"><i class="fab fa-twitter fa-sm fa-fw me-2"></i></a>
                    <a class="text-light" href="https://www.linkedin.com/" target="_blank" title="Huỳnh Anh Tuấn"><i class="fab fa-linkedin fa-sm fa-fw"></i></a>
                </div>
            </div>
        </div>
    </nav>

<nav class="navbar navbar-expand-sm navbar-dark bg-dark">
    <div class="container-fluid">
        <c:if test="${pageContext.request.userPrincipal.name == null}">
            <div class="dropdown">
                <button class="bg-dark btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-haspopup="true">
                    HAT Concept
                </button>
                <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
                    <li class="nav-item">
                        <a style="color:highlight" class="nav-link fa fa-home" href="<c:url value="/"/>">Trang Chủ</a>
                    </li>
                    <li><hr class="dropdown-divider"></li>
                    <li><a class="dropdown-item fa fa-sign-in" href="<c:url value="/login"/>"> Đăng Nhập</a></li>
                    <li><a class="dropdown-item fa fa-user-plus" href="<c:url value="/register"/>"> Đăng Ký</a></li>

                </ul>
            </div>
        </c:if>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#mynavbar">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="mynavbar">
            <ul class="navbar-nav me-auto">





                <<c:if test="${pageContext.request.userPrincipal.name!=null}">
                    <div class="dropdown">
                        <button class="bg-dark btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-haspopup="true">
                            HAT Concept
                        </button>
                        <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
                            <li class="nav-item">
                                <a style="color:highlight" class="nav-link fa fa-home" href="<c:url value="/"/>"> Trang Chủ</a>
                            </li>
                            <li><a href="<c:url value="/cart"/>" class="nav-link text-success fas fa-cart-plus"> Giỏ Hàng</a></li>
                            <li><hr class="dropdown-divider"></li>
                            <li><a class="nav-link text-success fa fa-sign-out" href="<c:url value="/logout"/>"> Đăng xuất</a></li>


                        </ul>
                    </div>

                    
                        <a class="nav-link text-success" href="<c:url value="/admin/sanpham"/>">
                            <i title="Quản Lý Sản Phẩm" class="fa fa-user" aria-hidden="true">${pageContext.request.userPrincipal.name}</i>
                        </a>



                    </c:if>

                    <c:forEach items="${danhMuc}" var="d">
                        <c:url value="/" var="dUrl">
                            <c:param name="danhMucId" value="${d.id}" />
                        </c:url>

                    <li class="nav-item">
                        <a class="nav-link" href="${dUrl}">${d.ten}</a>
                    </li>
                </c:forEach>   

            </ul>

            <sec:authorize access="isAuthenticated()">
                <a href="<c:url value="/cart"/>" class="nav-link text-success">
                    <i class="fas fa-cart-plus" ></i>
                    <div class="badge badge-danger" id="cartCounter">${cartCounter}</div>
                </a>
            </sec:authorize>
            
            <c:url value="/" var="action" />
            <form method="get" action="${action}" class="d-flex">
                <input class="form-control me-2" type="text" name="kw" placeholder="Search">
                <button type="submit" class="btn btn-primary" type="button">Search</button>
            </form>
        </div>
    </div>
</nav>