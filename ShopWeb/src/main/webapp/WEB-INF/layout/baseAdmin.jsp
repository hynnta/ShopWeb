<%-- 
    Document   : baseAdmin
    Created on : Oct 8, 2022, 3:44:59 PM
    Author     : AnhTuan
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>
            <tiles:insertAttribute name="title" />
        </title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.14.0/css/all.css">
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    </head>
    <body>
        <h1 class="text-center text-info">Trang Báo Cáo Thống Kê</h1>
        <div class="container">
            <div class="row">
                <div class="col-md-4 col-xs-12 bg-light ">
                    <tiles:insertAttribute name="left" />
                </div>
                <div class="col-md-8 col-xs-12">
                    <tiles:insertAttribute name="content" />
                </div>
            </div>
            <tiles:insertAttribute name="footer" />
        </div>
            <script src="<c:url value="/js/stats.js" />"></script>
    </body>
</html>