<%-- 
Document   : login
Created on : Sep 28, 2022, 1:18:14 AM
Author     : AnhTuan
--%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link rel="stylesheet" href="<c:url value ="/css/style.css"/>" />
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:if test="${errMsg != null}">
    <div class="alert alert-danger">
        ${errMsg}
    </div>
</c:if>


<div class="container register">
    <div class="row">
        <div class="col-md-3 register-left">
            <img src="https://image.ibb.co/n7oTvU/logo_white.png" alt=""/>
            <h3>Welcome</h3>
            <p>You are 30 seconds away from earning your own money!</p>
            <input type="submit" name="" value="Login"/><br/>
        </div>
        <div class="col-md-9 register-right">
            <ul class="nav nav-tabs nav-justified" id="myTab" role="tablist">
                <li class="nav-item">
                    <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">User</a>
                </li>
            </ul>
            <div class="tab-content" id="myTabContent">
                <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                    <h3 class="register-heading">Apply as a User</h3>
                    <c:url value="/register" var="action"/>
                    <form:form method="post" action="${action}" enctype="multipart/form-data" modelAttribute="user">
                        <div class="row register-form">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <input type="text" id="firstName" path="firstName" class="form-control" placeholder="First Name *" value="" />
                                </div>
                                <div class="form-group">
                                    <input type="text" id="lastName" path="lastName" class="form-control" placeholder="Last Name *" value="" />
                                </div>
                                <div class="form-group">
                                    <input type="password" id="password" path="password" class="form-control" placeholder="Password *" value="" />
                                </div>
                                <div class="form-group">
                                    <input type="password" id="confirmPassword" path="confirmPassword" class="form-control"  placeholder="Confirm Password *" value="" />
                                </div>
                                <div class="form-group">
                                    <form:select path="gender" class="form-select" id="gioiTinh">
                                        <option value="nam">Nam</option>
                                        <option value="nu">Nữ</option>
                                    </form:select>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <input type="text" id="email" path="email" class="form-control" placeholder="Your Email *" value="" />
                                </div>
                                <div class="form-group">
                                    <input type="tel" id="phone" path="phone" minlength="10" maxlength="10" name="txtEmpPhone" class="form-control" placeholder="Your Phone *" value="" />
                                </div>
                                <div class="form-group">
                                    <input type="text" id="username" path="username" class="form-control" placeholder="Username *" value="" />
                                </div>
                                <div class="form-group">
                                    <input type="file" id="file" path="file" class="form-control" value="" />
                                </div>
                                <input id="submit" type="submit" value="Register" class="btn btn-danger"/>
                            </div>
                        </div>
                    </form:form>
                </div>

            </div>
        </div>
    </div>

</div>


<script src="<c:url value="/js/main.js" />"></script>

