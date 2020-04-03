
<!-- =======================================================
  * Template Name: NewBiz - v2.0.0
  * Template URL: https://bootstrapmade.com/newbiz-bootstrap-business-template/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== --> 

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="decorator"
	uri="http://www.opensymphony.com/sitemesh/decorator"%>
<!-- taglib, jstl 등은 JSP별로 따로 설정해야한다. -->
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>투자어때::<decorator:title /></title>
<!-- web 라이브러리 : 공통으로 한 번만 해도 됨 : 여기서만 선언해 주면 된다. -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

<!-- jQuery UI : datepicker 등을 이용하기 위해서 css, js 를 추가해줘야함-->
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- <script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script> -->

<!-- icons : Awesome 5,4, Bootstrap, Google Icon emm-->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">

<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Montserrat:300,400,500,700"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR|Sawarabi+Gothic&display=swap" rel="stylesheet">

<decorator:head />

<style>
/*--------------------------------------------------------------
# General
--------------------------------------------------------------*/
body {
	font-size: medium;
	font-family: 'Sawarabi Gothic', 'Noto Sans KR', sans-serif;
}
article {
	min-height: 795px;
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

@media ( max-width : 991px) {
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

@media ( max-width : 991px) {
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

.main-nav, .main-nav * {
	margin: 0;
	padding: 0;
	list-style: none;
}

.main-nav > ul > li {
	position: relative;
	white-space: nowrap;
	float: left;
	color: #004289;
	font-size: 14px;
	font-family: "Montserrat", sans-serif;
	font-weight: 500;
}
.main-nav-right{
	float: right;
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

.main-nav a:hover, .main-nav .active>a, .main-nav li:hover>a {
	color: #007bff;
	text-decoration: none;
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

#footer .footer-top h4 {
	font-size: 14px;
	font-weight: bold;
	color: #fff;
	text-transform: uppercase;
	position: relative;
	padding-bottom: 10px;
}

#footer .copyright {
	text-align: center;
	padding-top: 30px;
}

</style>
</head>
<body>

	<!-- ======= Header ======= -->
	<header id="header" class="fixed-top">
		<div class="container">

			<div class="logo float-left">
				<a href="/main/index.do"></a>
			</div>

			<nav class="main-nav">
				<ul>
					<li class="active"><a href="${absUri }/main/index.do">TOOJAATTE</a></li>
					<li><a href="${absUri }/news/list.do">뉴스</a></li>
					<li><a href="${absUri }/stockmain/index.do">주식</a></li>
					<li><a href="${absUri }/vm/view.do">가상화폐</a></li>
					<li><a href="${absUri }/anaboard/list.do">투자게시판</a></li>
					<li><a href="${absUri }/marketindex/main.do">시장지표</a></li>
				</ul>
				<ul class="main-nav-right">
						<c:if test="${empty login }">
							<li><a href="${absUri }/member/signIn.do">회원가입</a></li>
							<li><a href="${absUri }/member/login.do"><span
									class="glyphicon glyphicon-log-in"></span> Login</a></li>
						</c:if>
						<c:if test="${!empty login }">
							<li class="active"><a>${login.nickName}[${login.gradeName }]님,환영합니다</a></li>
							<li><a href="${absUri }/member/logout.do"><span
									class="glyphicon glyphicon-log-in"></span> Logout</a></li>
						</c:if>
					</ul>
			</nav>
			<!-- .main-nav -->
		</div>
	</header>
	<!-- #header -->


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
</body>

</html>