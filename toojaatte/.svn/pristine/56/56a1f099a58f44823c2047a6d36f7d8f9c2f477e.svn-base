<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ tag trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ attribute name="page" required="true" type="java.lang.Integer"%>
<%@ attribute name="startPage" required="true" type="java.lang.Integer"%>
<%@ attribute name="endPage" required="true" type="java.lang.Integer"%>
<%@ attribute name="totalPage" required="true" type="java.lang.Integer"%>

<ul class="pagination">
<!-- jquery에서 대이터 찾아올 때 : this.data("page") ==>속성중에서 data-page라는 속성의 값을 가져온다. -->
	
	<!-- 두개짜리뒤로가기버튼누르면1페이지로 이동한다. -->
	<li data-page=1><a href="#">&lt;&lt;</a></li>
	
	<!-- 페이지 12345 678910 11,12,13,14,15이런식으로 묶여있다고 치면 -->
	<!-- ex. startpage가 6이면 뒤로가기버튼&lt;누르면 5번째페이지로 이동한다.-->
	<c:if test="${startPage > 1 }">
		<li data-page=${startPage -1 }>
		<a href="#">&lt;</a></li>
	</c:if>
	
	<!-- ex. 678910 페이지가 한 그룹이면 각 페이지가 cnt 시작페이지가 6 마지막페이지가 10  -->
	<c:forEach begin="${startPage }" end="${endPage }" var="cnt">
		<!-- 현재페이지가 cnt와같으면 class="active"클래스 부여 => 현재페이지와같은번호클릭시 이동 방지하는 javascript 구현위함-->
		<li ${(page == cnt)?"class=\"active\"":"" } data-page=${cnt }>
			<a href="#">${cnt}</a>
		</li>
	</c:forEach>
	
	<c:if test="${endPage < totalPage }">
		<li data-page=${endPage + 1 }><a href="#">&gt;</a></li>
	</c:if>
	
	<!-- 마지막페이지로 이동 -->
	<li data-page=${totalPage }><a href="#">&gt;&gt;</a></li>
</ul>
