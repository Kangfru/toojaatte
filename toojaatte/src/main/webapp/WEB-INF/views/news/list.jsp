<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="p" tagdir="/WEB-INF/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">
<head>
<title>Toojaatte::news list</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

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

.news:hover {
	background-color: #eee;
	cursor: pointer;
}

/*오른쪽에 구분선 넣어야함*/
#main.main {
	border-right: 1px black;
	border-color: black;
	border: 2px;
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
  width: 60%;
  border: 1.5px solid #004a99;
  border-right: none;
  padding: 5px;
  height: 36px;
  border-radius: 5px 0 0 5px;
  outline: none;
  color: #9DBFAF;
  float:left;
  font-size: 13px;
  
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


/*Resize the wrap to see the search bar change!*/
/*.wrap{
  width: 30%;
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
}
.search {
  width: 100%;
  position: relative;
  display: flex;
}
@import url(https://fonts.googleapis.com/css?family=Open+Sans);
*/
</style>
<script type="text/javascript">
	$(function() {
		$(".news").click(
				function() {
					var nno = $(this).find("#nno").val();
					//alert(nno);
					location = "view.do?nno=" + nno + "&cnt=1"
							+ "&page=${pageObject.page }"
							+ "&perPageNum=${pageObject.perPageNum}";
				});

		// 페이지 네이션의 클릭 이벤트 처리
		// /WEB-INF/tags에 있는 pagination클래스에있는 active클래스(현재페이지) 제외하고 - 클릭했을때
		$(".pagination > li:not('.active')").click(
				function() {
					// 		alert("페이지 이동 클릭");
					// .data("page") ==> 속성 중에서 data-page 라는 속성의 값을 가져온다.-->page..현재몇패이지인지 정보 들어있음.
					var page = $(this).data("page");
					//alert(page + "-" + typeof page);

					location = "list.do?page=" + page
							+ "&perPageNum=${pageObject.perPageNum}"
							+ "&key=${pageObject.key}"
							+ "&word=${pageObject.word}";
					// a tag의 페이지 이동을 취소 시킨다.???????????
					return false;
				});
		$("li.active").click(function() {
			return false; //현재페이지는 클릭이 안되게 한다.
		});
	});
</script>
</head>
<body onload="document.searchForm.reset();">
	<div class="container">

		<h2> 뉴스</h2>
		<section>
			<article>
				<div class="main" id="main">
					<c:forEach items="${dto }" var="dto">
						<div class=news style="padding: 5px"
							onclick="location.href='view.do';">
							<hr>
							<input id="nno" name="nno" value="${dto.nno }" type="hidden" />
							<div>${dto.press }</div>
							<div><strong>${dto.title }</strong></div>
							<div>${dto.write_date }</div>
						</div>
						<br />
					</c:forEach>
					<!-- 페이지네비-------------------------- -->
					<div id="pageNav" align="center">
						<p:pageNav startPage="${pageObject.startPage }"
							endPage="${pageObject.endPage }"
							totalPage="${pageObject.totalPage }" page="${pageObject.page }"></p:pageNav>
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
				
				<!-- 코스피지수 -->
				<div class="exchange" style="border: medium; border-color: blue;">
					<br> <br>
					<h4>
						<strong>주가 정보</strong>
					</h4>
					<hr />
					<div class="exchange_contents" style="size: 10px;">
						코스피지수 ${kospi[0].open}<br>
						<p class="exc" style = "font-weight: bold;">(
						<fmt:formatNumber value="${kospi[0].open - kospi[1].open}"
							pattern="+0.00;-0.00"></fmt:formatNumber>
						<fmt:formatNumber value="${kospi[0].change}"
							pattern="+0.00%;-0.00%"></fmt:formatNumber>)
						</p>

						<span style="font-size: 16px; padding-bottom: 10px">외국인&nbsp;</span>
						<span class="exc" style="font-size: 16px; font-weight: bold;">
						${stockmain.get(0).get("foreign").getAsString()}
						</span><br>
						<span style="font-size: 16px;">기관&nbsp;</span>
						<span class="exc" style="font-size: 16px; font-weight: bold;">
						${stockmain.get(0).get("institution").getAsString()}
						</span><br>
						<span style="font-size: 16px;">개인&nbsp;</span>
						<span class="exc" style="font-size: 16px; font-weight: bold;">
						${stockmain.get(0).get("person").getAsString()}
						</span><br>
						<span style="font-size: 16px;">프로그램&nbsp;</span>
						<span class="exc" style="font-size: 16px; font-weight: bold;">
						${stockmain.get(0).get("program").getAsString()}
						</span>
					</div>
				</div>
				
				<!-- 투자봇 -->
				<div>
					<h4>
					<br><br>
						<strong>투자봇의 금일 예상 종가</strong>
					</h4>
					<hr />
					<div class="prediction_list"></div>
				</div>
			</nav>
			<!-- ----------------------------------->
		</section>


	</div>
	<!-- 환율 컬러 -->
	<script>
		var exc = document.getElementsByClassName("exc");
		for (var i = 0; i < exc.length; i++) {
			if (exc[i].innerText.indexOf("-") >= 0 ||
					exc[i].innerHTML.indexOf("-") >= 0 ) {
				exc[i].style.color = "#687de3";
			} else {
				exc[i].style.color = "#eb8787";
			}
		}
	</script>
		<script type="text/javascript">
	Number.prototype.format = function(){
	    if(this==0) return 0;
	 
	    var reg = /(^[+-]?\d+)(\d{3})/;
	    var n = (this + '');
	 
	    while (reg.test(n)) n = n.replace(reg, '$1' + ',' + '$2');
	 
	    return n;
	};
	 
	// 문자열 타입에서 쓸 수 있도록 format() 함수 추가
	String.prototype.format = function(){
	    var num = parseFloat(this);
	    if( isNaN(num) ) return "0";
	 
	    return num.format();
	};

		list = document.querySelector(".prediction_list");
		var tag = "";
		$.ajax({
			type : "GET",
			url : "/stock/ml/data",
			success : function(result, status, xhr) {
				for (i = 0; i < result.length; i++) {
					tag += '<p><strong style="color: #7a6b5d;">' + result[i].name+ '</strong>: ' +Math.floor(result[i].prediction).format() + '</p>'
								
				}
				list.innerHTML = tag;
			},
			error : function() {
			}
		})
	</script>
	
</body>
</html>