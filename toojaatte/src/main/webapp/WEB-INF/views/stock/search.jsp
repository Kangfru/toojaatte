<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주식 메인</title>
<style type="text/css">
	.dataRow:hover {
		background: #eee;
		cursor: pointer; 
	}
</style>
</head>
<body>
		<p>주식 결과 목록</p>
		<table class="table">
		<tr>
			<th>종목코드</th>
			<th>종목명</th>
			<th>상장시장</th>
			<th>업종</th>
			<th>영위사업</th>
			<th>상장일</th>
		</tr>
		<!-- 데이터의 갯수 만큼 tr을 만든다. : 반복문 -> jsp jstl 사용 태그로 작성 -->
		<c:forEach items="${result }" var="result">
			<tr class="dataRow">
				<td class="code">${result.code}</td>
				<td>${result.name }</td>
				<td>${result.market }</td>
				<td>${result.sector }</td>
				<td>${result.industry }</td>
				<!-- 날짜형을 특별한 형식에 맞춰서 출력 : JSTL - fmt : JAVA-SimpleDateFormat -->
				<td>
					<fmt:formatDate value="${result.listingDate }"
					 pattern="yyyy.MM.dd" />
				</td>
			</tr>
		</c:forEach>
	</table>
	<script type="text/javascript">
		$(function(){
			$(".dataRow").click(function(){
				// 글번호 찾기 - 클릭한 것(this=tr) 안에 글번호 클래스 객체(td) 안에 글자(text)
				var code = $(this).find(".code").text();
				// 글보기로 이동 - 글번호를 붙여서
				location = "data.do?code=" + code;
			});
		
		});
</script>
</body>
</html>