  <!-- =======================================================
  * Template Name: NewBiz - v2.0.0
  * Template URL: https://bootstrapmade.com/newbiz-bootstrap-business-template/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
  
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator"%>
<!-- taglib, jstl 등은 JSP별로 따로 설정해야한다. -->
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>kangfru::<decorator:title /></title>
<!-- web 라이브러리 : 공통으로 한 번만 해도 됨 : 여기서만 선언해 주면 된다. -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

<!-- jQuery UI : datepicker 등을 이용하기 위해서 css, js 를 추가해줘야함-->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<!-- icons : Awesome 5,4, Bootstrap, Google Icon emm-->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">

  <title>Toojaatte</title>
  <meta content="" name="descriptison">
  <meta content="" name="keywords">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Montserrat:300,400,500,700" rel="stylesheet">

</head>
<style>
/*--------------------------------------------------------------
# General
--------------------------------------------------------------*/
body {
  background: #fff;
  color: #444;
  font-family: "Open Sans", sans-serif;
}

a {
  color: #007bff;
  transition: 0.5s;
}

a:hover, a:active, a:focus {
  color: #0b6bd3;
  outline: none;
  text-decoration: none;
}

p {
  padding: 0;
  margin: 0 0 30px 0;
}

h1, h2, h3, h4, h5, h6 {
  font-family: "Montserrat", sans-serif;
  font-weight: 400;
  margin: 0 0 20px 0;
  padding: 0;
}

/* Back to top button */
.back-to-top {
  position: fixed;
  display: none;
  background: #007bff;
  color: #fff;
  width: 44px;
  height: 44px;
  text-align: center;
  line-height: 1;
  font-size: 16px;
  border-radius: 50%;
  right: 15px;
  bottom: 15px;
  transition: background 0.5s;
  z-index: 11;
}

.back-to-top i {
  padding-top: 12px;
  color: #fff;
}

@media (max-width: 768px) {
  .back-to-top {
    bottom: 15px;
  }
}

/* Prelaoder */
#preloader {
  position: fixed;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  z-index: 9999;
  overflow: hidden;
  background: #fff;
}

#preloader:before {
  content: "";
  position: fixed;
  top: calc(50% - 30px);
  left: calc(50% - 30px);
  border: 6px solid #f2f2f2;
  border-top: 6px solid #007bff;
  border-radius: 50%;
  width: 60px;
  height: 60px;
  -webkit-animation: animate-preloader 1s linear infinite;
  animation: animate-preloader 1s linear infinite;
}

@-webkit-keyframes animate-preloader {
  0% {
    transform: rotate(0deg);
  }
  100% {
    transform: rotate(360deg);
  }
}

@keyframes animate-preloader {
  0% {
    transform: rotate(0deg);
  }
  100% {
    transform: rotate(360deg);
  }
}

/*--------------------------------------------------------------
# Header
--------------------------------------------------------------*/
#header {
  height: 80px;
  transition: all 0.5s;
  z-index: 997;
  transition: all 0.5s;
  padding: 20px 0;
  background: #fff;
  box-shadow: 0px 0px 30px rgba(127, 137, 161, 0.3);
}

#header.header-scrolled, #header.header-pages {
  height: 60px;
  padding: 10px 0;
}

@media (max-width: 991px) {
  #header {
    height: 60px;
    padding: 10px 0;
  }
}

#header .logo h1 {
  font-size: 36px;
  margin: 0;
  padding: 0;
  line-height: 1;
  font-weight: 400;
  letter-spacing: 3px;
  text-transform: uppercase;
}

@media (max-width: 991px) {
  #header .logo h1 {
    font-size: 28px;
    padding: 8px 0;
  }
}

#header .logo h1 a, #header .logo h1 a:hover {
  color: #00366f;
  text-decoration: none;
}

#header .logo img {
  padding: 0;
  margin: 7px 0;
  max-height: 26px;
}

.main-pages {
  margin-top: 60px;
}

/*--------------------------------------------------------------
# Navigation Menu
--------------------------------------------------------------*/
/* Desktop Navigation */
.main-nav {
  /* Drop Down */
  /* Deep Drop Down */
}

.main-nav, .main-nav * {
  margin: 0;
  padding: 0;
  list-style: none;
}

.main-nav > ul > li {
  position: relative;
  white-space: nowrap;
  float: left;
}

.main-nav a {
  display: block;
  position: relative;
  color: #004289;
  padding: 10px 15px;
  transition: 0.3s;
  font-size: 14px;
  font-family: "Montserrat", sans-serif;
  font-weight: 500;
}

.main-nav a:hover, .main-nav .active > a, .main-nav li:hover > a {
  color: #007bff;
  text-decoration: none;
}

.main-nav .drop-down ul {
  display: block;
  position: absolute;
  left: 0;
  top: calc(100% + 30px);
  z-index: 99;
  opacity: 0;
  visibility: hidden;
  padding: 10px 0;
  background: #fff;
  box-shadow: 0px 0px 30px rgba(127, 137, 161, 0.25);
  transition: ease all 0.3s;
}

.main-nav .drop-down:hover > ul {
  opacity: 1;
  top: 100%;
  visibility: visible;
}

.main-nav .drop-down li {
  min-width: 180px;
  position: relative;
}

.main-nav .drop-down ul a {
  padding: 10px 20px;
  font-size: 13px;
  color: #004289;
}

.main-nav .drop-down ul a:hover, .main-nav .drop-down ul .active > a, .main-nav .drop-down ul li:hover > a {
  color: #007bff;
}

.main-nav .drop-down > a:after {
  content: "\f107";
  font-family: FontAwesome;
  padding-left: 10px;
}

.main-nav .drop-down .drop-down ul {
  top: 0;
  left: calc(100% - 30px);
}

.main-nav .drop-down .drop-down:hover > ul {
  opacity: 1;
  top: 0;
  left: 100%;
}

.main-nav .drop-down .drop-down > a {
  padding-right: 35px;
}

.main-nav .drop-down .drop-down > a:after {
  content: "\f105";
  position: absolute;
  right: 15px;
}

/* Mobile Navigation */
.mobile-nav {
  position: fixed;
  top: 0;
  bottom: 0;
  z-index: 9999;
  overflow-y: auto;
  left: -260px;
  width: 260px;
  padding-top: 18px;
  background: rgba(19, 39, 57, 0.8);
  transition: 0.4s;
}

.mobile-nav * {
  margin: 0;
  padding: 0;
  list-style: none;
}

.mobile-nav a {
  display: block;
  position: relative;
  color: #fff;
  padding: 10px 20px;
  font-weight: 500;
}

.mobile-nav a:hover, .mobile-nav .active > a, .mobile-nav li:hover > a {
  color: #74b5fc;
  text-decoration: none;
}

.mobile-nav .drop-down > a:after {
  content: "\f078";
  font-family: FontAwesome;
  padding-left: 10px;
  position: absolute;
  right: 15px;
}

.mobile-nav .active.drop-down > a:after {
  content: "\f077";
}

.mobile-nav .drop-down > a {
  padding-right: 35px;
}

.mobile-nav .drop-down ul {
  display: none;
  overflow: hidden;
}

.mobile-nav .drop-down li {
  padding-left: 20px;
}

.mobile-nav-toggle {
  position: fixed;
  right: 0;
  top: 0;
  z-index: 9998;
  border: 0;
  background: none;
  font-size: 24px;
  transition: all 0.4s;
  outline: none !important;
  line-height: 1;
  cursor: pointer;
  text-align: right;
}

.mobile-nav-toggle i {
  margin: 18px 18px 0 0;
  color: #004289;
}

.mobile-nav-overly {
  width: 100%;
  height: 100%;
  z-index: 9997;
  top: 0;
  left: 0;
  position: fixed;
  background: rgba(19, 39, 57, 0.8);
  overflow: hidden;
  display: none;
}

.mobile-nav-active {
  overflow: hidden;
}

.mobile-nav-active .mobile-nav {
  left: 0;
}

.mobile-nav-active .mobile-nav-toggle i {
  color: #fff;
}

/*--------------------------------------------------------------
# Intro Section
--------------------------------------------------------------*/
#intro {
  width: 100%;
  position: relative;
  background: url("../img/intro-bg.png") center bottom no-repeat;
  background-size: cover;
  padding: 200px 0 120px 0;
}

@media (max-width: 991px) {
  #intro {
    padding: 140px 0 60px 0;
  }
}

@media (max-width: 574px) {
  #intro {
    padding: 100px 0 20px 0;
  }
}

#intro .intro-img {
  width: 50%;
  float: right;
}

@media (max-width: 991px) {
  #intro .intro-img {
    width: 80%;
    float: none;
    margin: 0 auto 25px auto;
  }
}

#intro .intro-info {
  width: 50%;
  float: left;
}

@media (max-width: 991px) {
  #intro .intro-info {
    width: 80%;
    float: none;
    margin: auto;
    text-align: center;
  }
}

@media (max-width: 767px) {
  #intro .intro-info {
    width: 100%;
  }
}

#intro .intro-info h2 {
  color: #fff;
  margin-bottom: 40px;
  font-size: 48px;
  font-weight: 700;
}

#intro .intro-info h2 span {
  color: #74b5fc;
  text-decoration: underline;
}

@media (max-width: 767px) {
  #intro .intro-info h2 {
    font-size: 34px;
    margin-bottom: 30px;
  }
}

#intro .intro-info .btn-get-started, #intro .intro-info .btn-services {
  font-family: "Montserrat", sans-serif;
  font-size: 14px;
  font-weight: 600;
  letter-spacing: 1px;
  display: inline-block;
  padding: 10px 32px;
  border-radius: 50px;
  transition: 0.5s;
  margin: 0 20px 20px 0;
  color: #fff;
}

#intro .intro-info .btn-get-started {
  background: #007bff;
  border: 2px solid #007bff;
  color: #fff;
}

#intro .intro-info .btn-get-started:hover {
  background: none;
  border-color: #fff;
  color: #fff;
}

#intro .intro-info .btn-services {
  border: 2px solid #fff;
}

#intro .intro-info .btn-services:hover {
  background: #007bff;
  border-color: #007bff;
  color: #fff;
}

/*--------------------------------------------------------------
# Sections
--------------------------------------------------------------*/
/* Sections Header
--------------------------------*/
.section-header h3 {
  font-size: 36px;
  color: #283d50;
  text-align: center;
  font-weight: 500;
  position: relative;
}

.section-header p {
  text-align: center;
  margin: auto;
  font-size: 15px;
  padding-bottom: 60px;
  color: #556877;
  width: 50%;
}

@media (max-width: 767px) {
  .section-header p {
    width: 100%;
  }
}

/* Section with background
--------------------------------*/
.section-bg {
  background: #ecf5ff;
}


/*--------------------------------------------------------------
# Footer
--------------------------------------------------------------*/
#footer {
  background: #004a99;
  padding: 0 0 30px 0;
  color: #eee;
  font-size: 14px;
}

#footer .footer-top {
  background: #004a99;
  padding: 60px 0 30px 0;
}

#footer .footer-top .footer-info {
  margin-bottom: 30px;
}

#footer .footer-top .footer-info h3 {
  font-size: 34px;
  margin: 0 0 20px 0;
  padding: 2px 0 2px 0;
  line-height: 1;
  font-family: "Montserrat", sans-serif;
  color: #fff;
  font-weight: 400;
  letter-spacing: 3px;
  text-transform: uppercase;
}

#footer .footer-top .footer-info p {
  font-size: 13px;
  line-height: 24px;
  margin-bottom: 0;
  font-family: "Montserrat", sans-serif;
  color: #ecf5ff;
}

#footer .footer-top .social-links a {
  font-size: 18px;
  display: inline-block;
  background: #007bff;
  color: #fff;
  line-height: 1;
  padding: 8px 0;
  margin-right: 4px;
  border-radius: 50%;
  text-align: center;
  width: 36px;
  height: 36px;
  transition: 0.3s;
}

#footer .footer-top .social-links a:hover {
  background: #0067d5;
  color: #fff;
}

#footer .footer-top h4 {
  font-size: 14px;
  font-weight: bold;
  color: #fff;
  text-transform: uppercase;
  position: relative;
  padding-bottom: 10px;
}

#footer .footer-top .footer-links {
  margin-bottom: 30px;
}

#footer .footer-top .footer-links ul {
  list-style: none;
  padding: 0;
  margin: 0;
}

#footer .footer-top .footer-links ul li {
  padding: 8px 0;
}

#footer .footer-top .footer-links ul li:first-child {
  padding-top: 0;
}

#footer .footer-top .footer-links ul a {
  color: #ecf5ff;
}

#footer .footer-top .footer-links ul a:hover {
  color: #74b5fc;
}

#footer .footer-top .footer-contact {
  margin-bottom: 30px;
}

#footer .footer-top .footer-contact p {
  line-height: 26px;
}

#footer .footer-top .footer-newsletter {
  margin-bottom: 30px;
}

#footer .footer-top .footer-newsletter input[type="email"] {
  border: 0;
  padding: 6px 8px;
  width: 65%;
}

#footer .footer-top .footer-newsletter input[type="submit"] {
  background: #007bff;
  border: 0;
  width: 35%;
  padding: 6px 0;
  text-align: center;
  color: #fff;
  transition: 0.3s;
  cursor: pointer;
}

#footer .footer-top .footer-newsletter input[type="submit"]:hover {
  background: #0062cc;
}

#footer .copyright {
  text-align: center;
  padding-top: 30px;
}

#footer .credits {
  text-align: center;
  font-size: 13px;
  color: #f1f7ff;
}

#footer .credits a {
  color: #bfddfe;
}

#footer .credits a:hover {
  color: #f1f7ff;
}

</style>

<script type="text/javascript">
/**
* Template Name: NewBiz - v2.0.0
* Template URL: https://bootstrapmade.com/newbiz-bootstrap-business-template/
* Author: BootstrapMade.com
* License: https://bootstrapmade.com/license/
*/
(function($) {
  "use strict";

  // Preloader (if the #preloader div exists)
  $(window).on('load', function() {
    if ($('#preloader').length) {
      $('#preloader').delay(100).fadeOut('slow', function() {
        $(this).remove();
      });
    }
  });

  // Back to top button
  $(window).scroll(function() {
    if ($(this).scrollTop() > 100) {
      $('.back-to-top').fadeIn('slow');
    } else {
      $('.back-to-top').fadeOut('slow');
    }
  });
  $('.back-to-top').click(function() {
    $('html, body').animate({
      scrollTop: 0
    }, 1500, 'easeInOutExpo');
    return false;
  });

  // Initiate the wowjs animation library
  new WOW().init();

  // Header scroll class
  $(window).scroll(function() {
    if ($(this).scrollTop() > 100) {
      $('#header').addClass('header-scrolled');
    } else {
      $('#header').removeClass('header-scrolled');
    }
  });

  if ($(window).scrollTop() > 100) {
    $('#header').addClass('header-scrolled');
  }

  // Smooth scroll for the navigation and links with .scrollto classes
  $('.main-nav a, .mobile-nav a, .scrollto').on('click', function() {
    if (location.pathname.replace(/^\//, '') == this.pathname.replace(/^\//, '') && location.hostname == this.hostname) {
      var target = $(this.hash);
      if (target.length) {
        var top_space = 0;

        if ($('#header').length) {
          top_space = $('#header').outerHeight();

          if (!$('#header').hasClass('header-scrolled')) {
            top_space = top_space - 20;
          }
        }

        $('html, body').animate({
          scrollTop: target.offset().top - top_space
        }, 1500, 'easeInOutExpo');

        if ($(this).parents('.main-nav, .mobile-nav').length) {
          $('.main-nav .active, .mobile-nav .active').removeClass('active');
          $(this).closest('li').addClass('active');
        }

        if ($('body').hasClass('mobile-nav-active')) {
          $('body').removeClass('mobile-nav-active');
          $('.mobile-nav-toggle i').toggleClass('fa-times fa-bars');
          $('.mobile-nav-overly').fadeOut();
        }
        return false;
      }
    }
  });

  // Navigation active state on scroll
  var nav_sections = $('section');
  var main_nav = $('.main-nav, .mobile-nav');
  var main_nav_height = $('#header').outerHeight();

  $(window).on('scroll', function() {
    var cur_pos = $(this).scrollTop();

    nav_sections.each(function() {
      var top = $(this).offset().top - main_nav_height,
        bottom = top + $(this).outerHeight();

      if (cur_pos >= top && cur_pos <= bottom) {
        main_nav.find('li').removeClass('active');
        main_nav.find('a[href="#' + $(this).attr('id') + '"]').parent('li').addClass('active');
      }
    });
  });

  // jQuery counterUp (used in Whu Us section)
  $('[data-toggle="counter-up"]').counterUp({
    delay: 10,
    time: 1000
  });


  // Initiate venobox (lightbox feature used in portofilo)
  $(document).ready(function() {
    $('.venobox').venobox();
  });

  // Testimonials carousel (uses the Owl Carousel library)
  $(".testimonials-carousel").owlCarousel({
    autoplay: true,
    dots: true,
    loop: true,
    items: 1
  });

});
</script>
<body>

  <!-- ======= Header ======= -->
  <header id="header" class="fixed-top">
    <div class="container">

      <div class="logo float-left">
        <!-- Uncomment below if you prefer to use an text logo -->
        <!-- <h1 class="text-light"><a href="#header"><span>NewBiz</span></a></h1> -->
        <a href="#intro" class="scrollto"></a>
      </div>

      <nav class="main-nav float-right d-none d-lg-block">
        <ul>
          <li class="active"><a href="#intro">TOOJAATTE</a></li>
			<li><a href="${absUri }/news/list.do">뉴스</a></li>
			<li><a href="${absUri }/stockmain/index.do">주식</a></li>
			<li><a href="${absUri }/vm/view.do">가상화폐</a></li>
			<li><a href="${absUri }/anaboard/list.do">투자게시판</a></li>
			<li><a href="${absUri }/marketindex/main.do">시장지표</a></li>
      <!--     <li><a href="#about">About Us</a></li>
          <li><a href="#services">Services</a></li>
          <li><a href="#portfolio">Portfolio</a></li>
          <li><a href="#team">Team</a></li> -->
          <li class="drop-down"><a href="">Drop Down</a>
            <ul>
              <li><a href="#">Drop Down 1</a></li>
              <li class="drop-down"><a href="#">Drop Down 2</a>
                <ul>
                  <li><a href="#">Deep Drop Down 1</a></li>
                  <li><a href="#">Deep Drop Down 2</a></li>
                  <li><a href="#">Deep Drop Down 3</a></li>
                  <li><a href="#">Deep Drop Down 4</a></li>
                  <li><a href="#">Deep Drop Down 5</a></li>
                </ul>
              </li>
              <li><a href="#">Drop Down 3</a></li>
              <li><a href="#">Drop Down 4</a></li>
              <li><a href="#">Drop Down 5</a></li>
            </ul>
          </li>
          <li><a href="#contact">Contact Us</a></li>
        </ul>
      </nav><!-- .main-nav -->

    </div>
  </header><!-- #header -->


<article class="container">
		<decorator:body />
	</article>
  <!-- ======= Footer ======= -->
  <footer id="footer">
    <div class="footer-top">
      <div class="container">
        <div class="row">
               <div class="copyright">
       		 &copy; Copyright <strong>TOOJAATTE</strong>. All Rights Reserved<br>
         	서울시 구로구 구로중앙로34길 33-4 영림빌딩
      </div>
      </div>
      </div>
    </div>
  </footer>
  <!-- End Footer -->

  <a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>

</body>

</html>