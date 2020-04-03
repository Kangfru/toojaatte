<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style type="text/css">
.dataRow:hover {
	background: #eee;
	cursor: pointer;
}
</style>
</head>
<body>
	<div class="container">
		<hr />
		<div class="col-md-9">
			<div class="today-index-box">
				<h4>
					<strong>증시 지표</strong>
				</h4>
				<div class="col-md-6">
					<h5>
						<strong>코스피 지수</strong>
					</h5>
					<p class="exc">
						<strong style="size: 20px;">${kospi[0].open}</strong>
						<fmt:formatNumber value="${kospi[0].open - kospi[1].open}"
							pattern="0.00"></fmt:formatNumber>
						<fmt:formatNumber value="${kospi[0].change}" pattern="0.00%"></fmt:formatNumber>
					</p>
					<div id="kospi_chart"></div>
				</div>
				<div class="col-md-6">
					<h5>
						<strong>코스닥 지수</strong>
					</h5>
					<p class="exc">
						<strong style="size: 20px;"> ${kospi[0].open}</strong>
						<fmt:formatNumber value="${kospi[0].open - kospi[1].open}"
							pattern="0.00"></fmt:formatNumber>
						<fmt:formatNumber value="${kospi[0].change}" pattern="0.00%"></fmt:formatNumber>
					</p>
					<div id="kosdaq_chart"></div>
				</div>
			</div>


			<div>
				<hr />
				<h4>
					<strong>환율 지표</strong>
				</h4>
				<div class="col-md-6">
					<div class="exchange_contents" style="size: 10px;">
						<h5>
							<strong>달러 환율</strong>
						</h5>
						<p>
						<p class="exc">
							<strong style="size: 20px;">${usdkrw[0].close} USD/KRW</strong> <i
								id="upordown"></i>
							<fmt:formatNumber value="${usdkrw[0].close - usdkrw[1].close}"
								pattern="+0.00;-0.00"></fmt:formatNumber>
							<fmt:formatNumber value="${usdkrw[0].change}"
								pattern="+0.00%;-0.00%"></fmt:formatNumber>
						</p>
					</div>
					<div id="usdkrw_chart"></div>
				</div>
				<div class="col-md-6">
					<div class="exchange_contents" style="size: 10px;">
						<h5>
							<strong>엔화 환율</strong>
						</h5>
						<p>
						<p class="exc">
							<strong style="size: 20px;">${jpykrw[0].close} JPY/KRW</strong> <i
								id="upordown"></i>
							<fmt:formatNumber value="${jpykrw[0].close - jpykrw[1].close}"
								pattern="+0.00;-0.00"></fmt:formatNumber>
							<fmt:formatNumber value="${jpykrw[0].change}"
								pattern="+0.00%;-0.00%"></fmt:formatNumber>
						</p>
					</div>
					<div id="jpykrw_chart"></div>
				</div>
			</div>
			
			
			<hr/>
				
				<div>
				<h4>가상화폐</h4>
				
					<div align="center">
						<div id="curve_chart" style="width: 900px; height: 500px;" ></div>
					</div>	
				
				
				</div>

		
		<hr/>
		
		</div>
		<div class="col-md-3">
			<table class="table">
				<tr>
					<th>이 시각 주요 뉴스</th>
				</tr>
				<c:forEach items="${mostViewed }" var="mostView">
					<tr>
						<td>
							<p>${mostView.press }</p> <a
							href="/news/view.do?nno=${mostView.nno}&cnt=1">${mostView.title}</a>
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<div class="col-md-12">
			<h4>분석게시판 최다 추천</h4>
			<table class="table">
				<tr style="width: 100%">
					<th
						style="width: 10%; text-align: center; height: 30px; line-height: 30px;">글번호</th>
					<th
						style="width: 50%; text-align: center; height: 30px; line-height: 30px;">제목</th>
					<th
						style="width: 10%; text-align: center; height: 30px; line-height: 30px;">작성자</th>
					<th
						style="width: 15%; text-align: center; height: 30px; line-height: 30px;">조회수</th>
					<th
						style="width: 15%; text-align: center; height: 30px; line-height: 30px;">작성일</th>
				</tr>
				<!-- 데이터의 갯수만큼 tr을 만든다. : 반복문  -> jsp jstl 사용 태그로 작성-->
				<c:forEach items="${anaBoardList}" var="dto">
					<tr class="dataRow">
						<%-- 클릭-> 1개 :id, 여러개:class --%>
						<td class="no" style="text-align: center">${dto.no }</td>
						<td><font color="${(dto.grade == 8) ? 'blue':''}"> <c:if
									test="${dto.titleType == 1}">[주식]</c:if> <c:if
									test="${dto.titleType == 2}">[가상화폐]</c:if> <c:if
									test="${dto.titleType == 3}">[기타]</c:if> ${dto.title }
						</font> <span>&nbsp;[${dto.reply_cnt }]</span></td>
						<td style="text-align: center">${dto.writer }</td>
						<td>${dto.hit }<span>&nbsp;[${dto.r_cnt }/${dto.n_cnt }]</span></td>
						<td><fmt:formatDate value="${dto.writeDate }"
								pattern="yyyy-MM-dd" /></td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
	<script type="text/javascript"
		src="https://www.gstatic.com/charts/loader.js"></script>
	<script type="text/javascript" src="/js/main.js"></script>
	<script type="text/javascript">
		$(".dataRow").click(function() {
			//글번호 찾기 - 클릭한 것(this) 안에 글번호 클래스 객체(td)안에 글자(text)
			var no = $(this).find(".no").text();
			//글보기로 이동 - 글번호를 붙여서
			location = "/anaboard/view.do?no="+ no;
		});

		google.charts.load('current', {'packages':['corechart']});
	      google.charts.setOnLoadCallback(drawChart);

	      var coinDatas = {};

	      <c:forEach items="${keylist }" var="key">
	      	coinDatas.${key } = ${jsMap.get(key) };
	      </c:forEach>

		    

		function getData(key){
//	 		alert(coinDatas.BTC);
		      <c:forEach items="${keylist }" var="key">
		      	if ("${key}"==key)
			      	return coinDatas.${key};
			  </c:forEach>
				return false;
			  
		}
	    
	      function drawChart(key) {
//	         alert(key);
// 	        if(!key) key ="BTC";
	        var data = google.visualization.arrayToDataTable(getData("BTC"));

	        var options = {
	          title: 'Virtual Money : BTC' ,
	          curveType: 'function',
	          legend: { position: 'bottom' }
	        };

	        var chart = new google.visualization.LineChart(document.getElementById('curve_chart'));

	        chart.draw(data, options);
	      }

		
	</script>
</body>
</html>