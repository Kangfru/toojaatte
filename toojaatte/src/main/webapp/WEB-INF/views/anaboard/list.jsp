<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- 페이지처리 태그 등록 -->
<%@ taglib prefix="p" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>분석게시판</title>
<style type="text/css">
.dataRow:hover {
	background: #eee;
	cursor: pointer;
}
</style>
<script type="text/javascript">
	$(function() {
		$(".dataRow").click(function() {
			//글번호 찾기 - 클릭한 것(this) 안에 글번호 클래스 객체(td)안에 글자(text)
			var no = $(this).find(".no").text();
			//글보기로 이동 - 글번호를 붙여서
			location = "view.do?no="+ no
							+ "&page=${pageObject.page}" 
							+ "&perPageNum=${pageObject.perPageNum}"
							+ "&key=${pageObject.key}"
							+ "&word=${pageObject.word}"
							+ "&gradeType=${pageObject.gradeType}"
							+ "&headerType=${pageObject.headerType}"
							+ "&orderType=${pageObject.orderType}";
		});

		// 페이지 네이션의 클릭 이벤트 처리
		$(".pagination > li:not('.active')").click(
				function() {
					// 		alert("페이지 이동 클릭");
					// .data("page") ==> 속성 중에서 data-page 라는 속성의 값을 가져온다.
					var page = $(this).data("page");
// 					alert(page + "-" + typeof page);

					location = "list.do?page=" + page
							+ "&perPageNum=${pageObject.perPageNum}"
							+ "&key=${pageObject.key}"
							+ "&word=${pageObject.word}"
							+ "&gradeType=${pageObject.gradeType}"
							+ "&headerType=${pageObject.headerType}"
							+ "&orderType=${pageObject.orderType}";
					// a tag의 페이지 이동을 취소 시킨다.
					return false;
				});
		//현재 페이지는 클릭이 안되게 처리
		$("li.active").click(function() {
			return false;
		});

		$("#keyWordTractBtn").click(function(){
			location = "tract.do";
		}); 
	});
</script>
</head>
<body>
	<!-- 데이터를 표시하는 부분 : Bootstrap을 이용하여 쉽게 나타내자 : 라이브러리 필요 -> sitemesh에서 처리-->
	<!-- 제목 -->
	<h1 align="center">투자 정보 분석 게시판</h1>
	<!-- 검색 : 제목, 내용, 작성자, 그 외 복합 -->
	<!-- 페이지는 1 페이지, 한 페이지에 표시할 데이터 갯수는 전달 (hidden) -->

	<div style="float:right">
	<button id="keyWordTractBtn" class="btn btn-default btn-xs" type="button">키워드 보기</button>
	</div>
	<div class="row" style="display:list-item; list-style: none;">
	<div style="float:right; padding: 30px 0px 10px 0px; vertical-align: middle">
		<div id="searchDiv">
			<form action="list.do" class="form-inline">
				<input name="page" value="1" type="hidden"/>
				
				<div class="form-group">
					<select class="form-control" id="gradeType" name="gradeType">
						<option value="a" ${(param.gradeType == "a")?"selected='selected'":"" }>전체</option>
						<option value="b" ${(param.gradeType == "b")?"selected='selected'":"" }>전문분석가</option>
					</select>
				</div>
				<div class="form-group">
					<select class="form-control" id="orderType" name="orderType">
						<option value="h" ${(param.orderType == "h")?"selected='selected'":"" }>최신 글</option>
						<option value="rn" ${(param.orderType == "rn")?"selected='selected'":"" }>추천 수</option>
					</select>
				</div>
				<div class="form-group">
					<select class="form-control" id="headerType" name="headerType">
						<option value="all" ${(param.headerType == "all")?"selected='selected'":"" }>전체</option>
						<option value="real" ${(param.headerType == "real")?"selected='selected'":"" }>주식</option>
						<option value="fake" ${(param.headerType == "fake")?"selected='selected'":"" }>가상화폐</option>
						<option value="etc" ${(param.headerType == "etc")?"selected='selected'":"" }>기타</option>
					</select>
				</div>
				<div class="form-group">
					<select class="form-control" id="key" name="key">
						<option value="t" ${(param.key == "t")?"selected='selected'":"" }>제목</option>
						<option value="c" ${(param.key == "c")?"selected='selected'":"" }>내용</option>
						<option value="w" ${(param.key == "w")?"selected='selected'":"" }>작성자</option>
						<option value="tc" ${(param.key=="tc")?"selected='selected'":"" }>제목/내용</option>
					</select>
				</div>
				<div class="input-group">
					<input type="text" class="form-control" placeholder="Search"
						name="word" value="${param.word }">
					<div class="input-group-btn">
						<button class="btn btn-default" type="submit">
							<i class="glyphicon glyphicon-search"></i>
						</button>
					</div>
				</div>
			</form>
		</div>
		</div>
	</div><!-- 	end div row -->
	<!-- 데이터 테이블 -->
	<table class="table">
		<tr style="width: 100%">
			<th style="width: 10%; text-align: center; height:30px; line-height: 30px;">글번호</th>
			<th style="width: 50%; text-align: center; height:30px; line-height: 30px;">제목</th>
			<th style="width: 10%; text-align: center; height:30px; line-height: 30px;">작성자</th>
			<th style="width: 15%; text-align: center; height:30px; line-height: 30px;">조회수</th>
			<th style="width: 15%; text-align: center; height:30px; line-height: 30px;">작성일</th>
		</tr>
		<!-- 데이터의 갯수만큼 tr을 만든다. : 반복문  -> jsp jstl 사용 태그로 작성-->
		<c:forEach items="${list}" var="dto">
			<tr class="dataRow">
				<%-- 클릭-> 1개 :id, 여러개:class --%>
				<td class="no" style="text-align: center">${dto.no }</td>
				<td>
				<font color="${(dto.grade == 8) ? 'blue':''}">
				<c:if test="${dto.titleType == 1}">[주식]</c:if>
				<c:if test="${dto.titleType == 2}">[가상화폐]</c:if>
				<c:if test="${dto.titleType == 3}">[기타]</c:if>
				${dto.title }
				</font>
				<span>&nbsp;[${dto.reply_cnt }]</span></td>
				<td style="text-align: center">${dto.writer }</td>
				<td style="text-align: center">${dto.hit }<span>&nbsp;[${dto.r_cnt }/${dto.n_cnt }]</span></td>
				<td style="text-align: center"><fmt:formatDate value="${dto.writeDate }"
						pattern="yyyy-MM-dd" /></td>
			</tr>
		</c:forEach>
		<!-- 페이지 처리 : 나중에 -->
		<tr>
			<td colspan="5">
				<p:pageNav endPage="${pageObject.endPage }" 
				totalPage="${pageObject.totalPage }" 
				startPage="${pageObject.startPage }" 
				page="${pageObject.page }"></p:pageNav>
			</td>
		</tr>
		<!-- 글쓰기 버튼 -->
		<c:if test="${login.id!=null}">
		<tr>
			<td colspan="5">
			<!-- get:주소에 입력, a href, location.href -->
				<a href="write.do"><button>글쓰기</button></a>
			</td>
		</tr>
		</c:if>
	</table>
</body>
</html>