<%-- 
    Document   : Register
    Created on : Sep 30, 2022, 11:47:28 AM
    Author     : AnhTuan
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="<c:url value ="/css/style.css"/>" />
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


<h1 class="text-center text-danger">ĐĂNG KÝ</h1>

<c:if test="${errMsg != null}">
    <div class="alert alert-danger">
    ${errMsg}
</div>
</c:if>

<c:url value="/register" var="action"/>
<form:form method="post" action="${action}" enctype="multipart/form-data" modelAttribute="user">
    <div class="form-group">
        <label for="firstName">First name</label>
    <form:input type="text" id="firstName" path="firstName" class="form-control"/>
</div>
<div class="form-group">
    <label for="lastName">Last name</label>
    <form:input type="text" id="lastName" path="lastName" class="form-control"/>
</div>
<div class="form-group">
    <label for="email">Email</label>
    <form:input type="text" id="email" path="email" class="form-control"/>
</div>
<div class="form-group">
    <label for="phone">Phone</label>
    <form:input type="tel" id="phone" path="phone" class="form-control"/>
</div>
<label for="gioiTinh">Gender</label>
    <form:select path="gender" class="form-select" id="gioiTinh">
        <option value="nam">Nam</option>
        <option value="nu">Nữ</option>
    </form:select>
    <div class="form-group">
        <label for="username">Username</label>
    <form:input type="text" id="username" path="username" class="form-control"/>
</div>
<div class="form-group">
    <label for="password">Password</label>
    <form:input type="password" id="password" path="password" class="form-control"/>
</div>
<div class="form-group">
    <label for="confirmPassword">Confirm password</label>
    <form:input type="password" id="confirmPassword" path="confirmPassword" class="form-control"/>
</div>
<div class="form-group">
    <label for="avatar">Avatar</label>
    <form:input type="file" id="file" path="file" class="form-control"/>
</div>
<div class="d-flex mb-5 mt-4 align-items-center">

    <div class="form-check mb-0">
        <input class="form-check-input me-2" type="checkbox" value="" id="password" name="password" />
        <label class="form-check-label" for="password">
            <span class="caption">Creating an account means you're okay with our <a href="#">Terms and Conditions</a> and our <a href="#">Privacy Policy</a>.</span>
        </label>
    </div>
</div>

<div class="form-group">
    <input id="submit" type="submit" value="Register" class="btn btn-danger"/>
</div>
</form:form>

<script src="<c:url value="/js/main.js" />"></script>