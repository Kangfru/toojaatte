<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
<head>
<title>Toojaatte::news view</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 프린트아이콘 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- 댓글아이콘 -->
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<!-- jquery -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- 댓글꾸미기 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style>
* {
	box-sizing: border-box;
}

/* Container for flexboxes */
section {
	display: -webkit-flex;
	display: flex;
}

/* Style the navigation menu 사이드바 */
nav {
	-webkit-flex: 1;
	-ms-flex: 1;
	flex: 1;
	padding: 20px;
}

/* Style the content 메인뉴스*/
article {
	-webkit-flex: 3;
	-ms-flex: 3;
	flex: 3;
	padding: 10px;
	border-right: 1px black;
	border-color: black;
	border: 2px;
}

.comment-wrapper .panel-body {
	max-height: 650px;
	overflow: auto;
}

.comment-wrapper .commentList .media img {
	/*width: 64px;*/
	height: 64px;
	border: 2px solid #e5e7e8;
}

.comment-wrapper .commentList .media {
	border-bottom: 1px dashed #efefef;
	margin-bottom: 25px;
}
.hitNews_contents {
	overflow: hidden;
	text-overflow: ellipsis;
}
.mostViewedTitles{
	font-size: 13px;
	margin: 4px 4px;
	padding-bottom: 5px;
}
.mostSearchedBtn{
  background-color: #004a99;
  border: none;
  color: white;
  padding: 5px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  cursor: pointer;
  border-radius: 12px;
}

.mostSearchedBtn:hover {
	background-color: #2196F3;
	cursor: pointer;
}



.searchTerm {
  width: 80%;
  border: 1.5px solid #004a99;
  border-right: none;
  padding: 5px;
  height: 36px;
  border-radius: 5px 0 0 5px;
  outline: none;
  color: #9DBFAF;
   float:left;
}

.searchTerm:focus{
  color: #00B4CC;
}

.searchButton {
  width: 40px;
  height: 36px;
  border: 1px solid #004a99;
  background: #004a99;
  text-align: center;
  color: #fff;
  border-radius: 0 5px 5px 0;
  cursor: pointer;
  font-size: 20px;
   float:left;
}
/* Responsive layout - makes the menu and the content (inside the section) sit on top of each other instead of next to each other */
@media ( max-width : 600px) {
	section {
		-webkit-flex-direction: column;
		flex-direction: column;
	}
}
</style>
<script type="text/javascript">
//sns 공유하기=================================
function toggleSNSIcon(){
	var s = document.getElementById('snsList');
	if (s.style.display ==='none'){
		s.style.display = "block";
		}else{
			s.style.display = "none";
			}
}

$(window).ready(function(){ 
        $(".snsList li a").click(function(){
            shareAct(this);
        });
});
 
function shareAct(a){
	document.cookie = 'same-site-cookie=foo; SameSite=Lax';
	document.cookie = 'cross-site-cookie=bar; SameSite=None; Secure';
    var snsCode = $(a).attr('id');
    var cUrl = "현재페이지 주소";
    switch(snsCode){
        case"vIconTw":
            //트위터
            cUrl = 'https://twitter.com/intent/tweet?text=페이지제목:&url='+cUrl;
        break;

        case"vIconTg":
            //텔레그램
            cUrl = 'https://telegram.me/share/url?url='+cUrl;
        break;
              
        case"vIconFb":
            //페이스북
            cUrl = 'http://www.facebook.com/sharer/sharer.php?u='+cUrl;
        break;

        case"vIconKs":
            //카카오스토리
            cUrl = 'https://story.kakao.com/share?url='+cUrl;
        break;

        case"vIconNb":
            //네이버블로그
            cUrl = "https://share.naver.com/web/shareView.nhn?url=" + cUrl + "&title=" + "test";
        break;

    }
    window.open(cUrl,'','width=600,height=300,top=100,left=100,scrollbars=yes');
 }
//--------------------

</script>
</head>
<body>
	<div class="contaner">

		<h2>뉴스</h2>

		<!-- 메인뉴스---------------------------- -->
		<section>
			<article>
				<div class="newsView">
					<div class="titleSection" style="padding: 5px">
						<div>${dto.press }</div>
						<div><h2>${dto.title }</h2></div>
						<div style="float: left;">${dto.write_date }</div>
						<div style="float: left;">조회수 ${dto.hit }&nbsp;</div>
						<div style="float: left;"><i class='far fa-comment-dots' style='font-size:20px'><p class=rep_cnt_main>&nbsp;&nbsp;</p></i></div>
						<div class="print" onclick="window.print()" style="float: left;"><i class="fa fa-print" style="font-size:20px">&nbsp;</i></div>
						<div class="shareIcon" style="float: left;"><i onclick="toggleSNSIcon();" class='fas fa-share-square' style='font-size:20px'></i>
						<ul id="snsList" class="snsList" style="display: none;">
						    <li>SNS 공유하기</li>
						    <!-- sns사진넣기---------------------------------------------------------- -->
						    <li><a href="#" id="vIconTw" onclick="return false;"><i class="vIconTw">ㅇㅇㅇ</i></a></li>
						    <li><a href="#" id="vIconTg" onclick="return false;"><i class="vIconTg">ㅇㅇㅇ</i></a></li>
						    <li><a href="#" id="vIconFb" onclick="return false;"><i class="vIconFb">ㅇ</i></a></li>
						    <li><a href="#" id="vIconKs" onclick="return false;"><i class="vIconKs">ㅇ</i></a></li>
						    <li><a href="#" id="vIconNb" onclick="return false;"><i class="vIconNb">ㅇ</i></a></li>
						</ul>
						</div>
					</div>
					<hr>
					<div class="bodySection">
						<div>${dto.content }</div>	
					</div>
				</div>
				<!--댓글 ---------------------------------------------------- -->
		<div class="row bootstrap snippets">
			 <div>
			 <div class="comment-wrapper">
					<div class="panel panel-info">
						<div class="panel-heading"> ${dto.rep_cnt}</div>
						<div class="panel-body">
							<!-- 댓글달기 ------------------------------>
							<form name="commentInsertForm">
								<input type="hidden" name="id" value="${login.id}" /> 
								<input
									type="hidden" name="nno" value="${dto.nno}" />
								<textarea class="form-control" id="content" name="content"
									placeholder="write a comment..." rows="3"></textarea>
								<br>
								<button type="button" id="commentBtn"
									class="btn btn-info pull-right" name="commentInsertBtn">Post</button>
								<button type="button" id="signinBtn"
									class="btn btn-info pull-right" name="signinBtn" style="display: none;">Sign-in</button>
								<div class="clearfix"></div>
							</form>
								<script>
								var id = null;
								id = "${login.id}";
								if (!id){
									  document.getElementById("commentBtn").style.display = "none";
									  document.getElementById("content").placeholder = "Sign-in to write a comment...";
									  //document.getElementById("content").readOnly = true;
									  document.getElementById("signinBtn").style.display = "block";
									  document.getElementById("signinBtn").onclick = 
										function(){
										  //다른컨트롤러로 보내고싶으면 앞에 슬래쉬/붙여야 한다. /가 루트를 의미.
										  //붙이지 않으면 /board/login/login.do 이주소를 찾아서 에러난다. 
											location.replace("/member/login.do");
									 		 }
									document.getElementById("content").onclick = function(){
										  //다른컨트롤러로 보내고싶으면 앞에 슬래쉬/붙여야 한다. /가 루트를 의미.
										  //붙이지 않으면 /board/login/login.do 이주소를 찾아서 에러난다. 
									location.replace("/member/login.do");
										   }
									}
								</script>
							<hr>
					</div>
				<!-- 댓글리스트------------------------------- -->
				<div class="container">
					<div class="commentList">
					</div>
				</div>
				</div>
			</div>
		</div>
	</div>
</article>
			
			
					<!--사이드바 -------------------------------->
			<nav>
				<!--뉴스검색 -------------------------------->
				<div class="newsB">
					<h4><strong>뉴스 검색</strong></h4>
					<div class="search">
						<form action="list.do" class="searchForm" id="searchForm" name="searchForm">
							<input type="text" name="word" id="newsSearchWord" class="searchTerm" 
								placeholder="검색어를 입력하세요."
								value="${param.word }" tabindex="0">
							<button class="searchButton"><i class="fa fa-search"></i></button>
							<script>
								//검색후 검색어 초기화되게 해야함==========================================
								function clearInput() {
									$("#searchForm").submint();
									$('#newsSearchWord').val("");
									document.getElementById("newsSearchWord").value = null;
								}
							</script>
						</form>
					</div>
					<!-- 인기키워드-------------------------------------------------- -->
					<script type="text/javascript">
						$(function(){
							$(".pop").click(function(){
								var word = $(this).text();
								//해쉬태그# 제거
								var word = word.substr(1);
								//alert(word);
								location = "list.do?word="+word;});
							})
					</script>
					<div class="hashtag">
					<br><br><br>
						<h4><strong>인기키워드</strong></h4>
						<c:forEach items="${mostSearched }" var="mostSearched">
							<span class="pop"><button class="mostSearchedBtn">#${mostSearched.word}</button></span>
						</c:forEach>
					</div>
				</div>

				<!-- 조회수높은뉴스 -->
				<div class="hitNews">
				<br><br>
					<h4><strong>많이본 뉴스</strong></h4>
					<div class="hitNews_contents">
						<c:forEach items="${mostViewed }" var="mostViewed">
							<!-- 글자수 길이 자르기 -->
							<c:choose>
							<c:when test="${fn:length(mostViewed.title)>23}">
								<div class="mostViewedTitles">
								<a href="view.do?nno=${mostViewed.nno}&cnt=1">
									<c:out value="${fn:substring(mostViewed.title,0,23)}"/>...
								</a>
								</div>
							</c:when>
							<c:otherwise>
								<div class="mostViewedTitles">
								<a href="view.do?nno=${mostViewed.nno}&cnt=1">
										${mostViewed.title}</a>
								</div>
							</c:otherwise>
							</c:choose>
						</c:forEach>
					</div>
				</div>

			</nav>			
			<!-- ----------------------------------->
		</section>		
	</div>
	
	<!-- 댓글 아작스처리 파일 include : script이기떄문에 head나 body 안에 include해야됨 -->
	<%@ include file="comment.jsp" %>
</body>
</html>