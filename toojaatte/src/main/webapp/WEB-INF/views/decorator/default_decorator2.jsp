<!-- sitemesh 사용을 위한 설정 파일 -->
<!-- 작성자 : 강동욱 -->
<!-- 작성일 : 2020-02-24 -->
<!-- 최종수정일 : 2020-02-24 -->


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
<!-- Google Fonts -->
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR|Sawarabi+Gothic&display=swap" rel="stylesheet">

<style type="text/css">
body {
	font-size: large;
	font-family: 'Sawarabi Gothic', 'Noto Sans KR', sans-serif;
}

header, footer {
	background: AntiqueWhite;
}

pre {
	background: white;
	border: 0px;
}

/* Remove the navbar's default margin-bottom and rounded borders */
.navbar {
	margin-bottom: 0;
	border-radius: 0;
}

/* Add a gray background color and some padding to the footer */
footer {
	background-color: #f2f2f2;
	padding: 25px;
}

.carousel-inner img {
	width: 100%; /* Set width to 100% */
	margin: auto;
	min-height: 200px;
}

/* Hide the carousel text when the screen is less than 600 pixels wide */
@media ( max-width : 600px) {
	.carousel-caption {
		display: none;
	}
}

article {
	min-height: 795px;
}

#welcome {
	color: grey;
	margin: 0 auto;
}
</style>
<script type="text/javascript">
	$(document).ready(function() {
	});
</script>
<decorator:head/>
</head>
<body>
	<header>
		<nav class="navbar navbar-inverse">
			<div class="container-fluid">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse"
						data-target="#myNavbar">
						<span class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="${absUri }">투자어때</a>
				</div>
				<div class="collapse navbar-collapse" id="myNavbar">
					<ul class="nav navbar-nav">
						<li><a href="${absUri }/notice/list.do">공지사항</a></li>
						<li><a href="${absUri }/board/list.do">게시판</a></li>
						<li><a href="${absUri }/image/list.do">이미지</a></li>
						<li><a href="${absUri }/qna/list.do">qna</a></li>
						<li><a href="${absUri }/message/list.do">메세지</a></li>
						<li><a href="${absUri }/anaboard/list.do">분석게시판</a></li>
						<li><a href="${absUri }/news/list.do">뉴스</a></li>
						<li><a href="${absUri }/stockmain/index.do">주식</a></li>
						<li><a href="${absUri }/marketindex/main.do">시장지표</a></li>
						<c:if test="${!empty login }">
							<c:if test="${login.grade==9 }">
								<li><a href="${absUri }/member/list.do">회원관리</a></li>
							</c:if>
						</c:if>
						<%-- 							<c:if test="${login.gradeNo==9 }"> --%>
						<%-- 							</c:if> --%>
					</ul>
					<ul class="nav navbar-nav navbar-right">
						<c:if test="${empty login }">
							<li><a href="${absUri }/member/writeForm.do">회원가입</a></li>
							<li><a href="${absUri }/member/login.do"><span
									class="glyphicon glyphicon-log-in"></span> Login</a></li>
						</c:if>
						<c:if test="${!empty login }">
							<li id="welcome">${login.nickName}[${login.gradeName }]님,환영합니다</li>
							<li><a href="${absUri }/member/view.do?id=${login.id}">MyPage</a></li>
							<li><a href="${absUri }/member/logout.do"><span
									class="glyphicon glyphicon-log-in"></span> Logout</a></li>
						</c:if>
					</ul>
				</div>
			</div>
		</nav>
	</header>
	<article class="container">
		<decorator:body />
	</article>
	<footer class="container-fluid text-center">
		<p>이 홈페이지의 저작권은 Team Dog Foot에게 있습니다.</p>
		<p>Contact Us : 서울시 구로구 구로중앙로34길 33-4 영림빌딩</p>
	</footer>
</body>
</html>