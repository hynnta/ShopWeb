<%-- 
    Document   : adminFooter
    Created on : Oct 8, 2022, 3:49:35 PM
    Author     : AnhTuan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!-- Remove the container if you want to extend the Footer to full width. -->
<div class="container my-5">

  <footer class="text-white text-center text-lg-start bg-dark">
    <!-- Grid container -->
    <div class="container p-4">
      <!--Grid row-->
      <div class="row mt-4">
        <!--Grid column-->
        <div class="col-lg-4 col-md-12 mb-4 mb-md-0">
          <h5 class="text-success"><span class="text-white">About HAT</span> Concept</h5>

          <p>
            At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium
            voluptatum deleniti atque corrupti.
          </p>

          <p>
            Blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas
            molestias.
          </p>

          <div class="mt-4">
            <!-- Facebook -->
            <a type="button" class="btn btn-floating btn-light btn-lg" title="Huỳnh Anh Tuấn" target="_blank" href="https://www.facebook.com/hyatuan"><i class="fab fa-facebook-f"></i></a>
            <!-- Dribbble -->
            <a type="button" class="btn btn-floating btn-light btn-lg" title="Huỳnh Anh Tuấn" target="_blank" href="https://www.tiktok.com/@hyatuan"><i class="fab fa-tiktok"></i></a>
            <!-- Twitter -->
            <a type="button" class="btn btn-floating btn-light btn-lg" title="Huỳnh Anh Tuấn" target="_blank" href="https://twitter.com/?lang=vi"><i class="fab fa-twitter"></i></a>
            <!-- Google + -->
            <a type="button" class="btn btn-floating btn-light btn-lg" title="Huỳnh Anh Tuấn" target="_blank" href="https://www.google.com/"><i class="fab fa-google-plus-g"></i></a>
            <!-- Linkedin -->   
          </div>
        </div>
        <!--Grid column-->

        <!--Grid column-->
        <div class="col-lg-4 col-md-6 mb-4 mb-md-0">
          <div class="form-outline form-white mb-4">
              <input placeholder="Email address" type="email" id="email" class="form-control" />
              
            </div>
          <div class="col-auto">
            <!-- Submit button -->
            <button type="submit" class="btn btn-outline-light mb-4">
              Subscribe
            </button>
          </div>

          <ul class="fa-ul" style="margin-left: 1.65em;">
            <li class="mb-3">
              <span class="fa-li"><i class="fas fa-home"></i></span><span class="ms-2">TP.HCM</span>
            </li>
            <li class="mb-3">
              <span class="fa-li"><i class="fas fa-envelope"></i></span><span class="ms-2">1951052223tuan@ou.edu.vn</span>
            </li>
            <li class="mb-3">
              <span class="fa-li"><i class="fas fa-phone"></i></span><span class="ms-2">+ 84 3949 2222 4</span>
            </li>
          </ul>
        </div>
        <!--Grid column-->

        <!--Grid column-->
        <div class="col-lg-4 col-md-6 mb-4 mb-md-0">
          <h5 class="text-uppercase mb-4">Opening hours</h5>

          <table class="table text-center text-white">
            <tbody class="fw-normal">
              <tr>
                <td>Mon - Thu:</td>
                <td>8am - 9pm</td>
              </tr>
              
              <tr>
                <td>Fri - Sat:</td>
                <td>8am - 1am</td>
              </tr>
              <tr>
                <td>Sunday:</td>
                <td>9am - 10pm</td>
              </tr>
            </tbody>
          </table>
        </div>
        <!--Grid column-->
      </div>
      <!--Grid row-->
    </div>
    <!-- Grid container -->

    <!-- Copyright -->
    <div class="text-center p-3" style="background-color: rgba(0, 0, 0, 0.2);">
      © 2020 Copyright:
      <a class="text-white">Huỳnh Anh Tuấn</a>
    </div>
    <!-- Copyright -->
  </footer>

</div>
<!-- End of .container -->
