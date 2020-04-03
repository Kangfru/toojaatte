<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>toojaatte::stock main</title>
<link
	href="https://fonts.googleapis.com/css?family=Noto+Sans+KR|Sawarabi+Gothic&display=swap"
	rel="stylesheet">
<style type="text/css">
<
style>* {
	box-sizing: border-box;
}

body {
	font-family: Arial, Helvetica, sans-serif;
}

/* Style the header */
header {
	padding: 30px;
	text-align: center;
	font-size: 35px;
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

.mostViewedTitles {
	font-size: 16px;
	margin: 4px 4px;
	padding-bottom: 5px;
}

.searchTerm {
	width: 70%;
	border: 3px solid #004a99;
	/* border-right: none;*/
	padding: -10px;
	height: 36px;
	border-radius: 5px 0 0 5px;
	outline: none;
	color: #9DBFAF;
}

.searchTerm:focus {
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
	font-size: 14px;
	padding-left: -5px;
	margin-left: -5px;

}

.tabs {
	margin: 0 auto;
	/* 	padding: 0 20px;
 */
}

#tab-button {
	display: table;
	table-layout: fixed;
	width: 100%;
	margin: 0;
	padding: 0;
	list-style: none;
}

#tab-button li {
	display: table-cell;
	width: 20%;
}

#tab-button li a {
	display: block;
	padding: .5em;
	background: #eee;
	border: 1px solid #ddd;
	text-align: center;
	color: #000;
	text-decoration: none;
}

#tab-button li:not (:first-child ) a {
	border-left: none;
}

#tab-button li a:hover, #tab-button .is-active a {
	border-bottom-color: transparent;
	background: #fff;
}

.tab-contents {
	padding: .5em 2em 1em;
	border: 1px solid #ddd;
}

.tab-button-outer {
	display: none;
}

.tab-contents {
	margin-top: 20px;
}

.topSell {
	color: #eb8787;
}

.topBuy {
	color: #687de3;
}


@media screen and (min-width: 768px) {
	.tab-button-outer {
		position: relative;
		z-index: 2;
		display: block;
	}
	.tab-select-outer {
		display: none;
	}
	.tab-contents {
		position: relative;
		top: -1px;
		margin-top: 0;
	}
}

/* Responsive layout - makes the menu and the content (inside the section) sit on top of each other instead of next to each other */
@media ( max-width : 600px) {
	section {
		-webkit-flex-direction: column;
		flex-direction: column;
	}
}
</style>
</head>
<body>
	<div class="container">
		<section>
			<article>
				<div class="search">
					<form action="/stock/market/search.do" method="GET"
						name="searchForm">
						<div>
							<p>
								<strong>주식 검색</strong>
							</p>
							<input type="text" class="searchTerm"
								placeholder="  단축코드 또는 종목명을 입력하세요." name="searchData">
							<button class="searchButton">
								<i class="fa fa-search"></i>
							</button>
							<br> <br>
						</div>
					</form>
				</div>

				<!-- 탭 -->
				<div class="tabs">
					<div class="tab-button-outer">
						<ul id="tab-button">
							<li><a href="#tab01">코스피 지수</a></li>
							<li><a href="#tab02">코스닥 지수</a></li>
							<li><a href="#tab03">코스피200 지수</a></li>
						</ul>
					</div>
					<div class="tab-select-outer">
						<select id="tab-select">
							<option value="#tab01" onclick="drawKospiChart();">코스피
								지수</option>
							<option value="#tab02" onclick="drawKosdaqChart();">코스닥
								지수</option>
							<option value="#tab03" onclick="drawKospi200Chart();">코스피200
								지수</option>
						</select>
					</div>

					<div id="tab01" class="tab-contents">
						<h2>코스피지수 ${kospi[0].open}</h2>
						<div class="exc" style="font-size: 25px; font-weight: bolder;">
						<fmt:formatNumber value="${kospi[0].open - kospi[1].open}"
							pattern="+0.00;-0.00"></fmt:formatNumber>
						<fmt:formatNumber value="${kospi[0].change}"
							pattern="+0.00%;-0.00%"></fmt:formatNumber>
						</div>
						<div style="padding-top: 5px">
						<p style="float: left; font-size: 16px;">외국인&nbsp;</p>
						<p class="exc" style="float: left; font-size: 16px; font-weight: bold;">
						${stockmain.get(0).get("foreign").getAsString()}
						</p>
						<p style="float: left; font-size: 16px;">&nbsp;&nbsp;&nbsp;기관&nbsp;</p>
						<p class="exc" style="float: left; font-size: 16px; font-weight: bold;">
						${stockmain.get(0).get("institution").getAsString()}
						</p>
						<p style="float: left; font-size: 16px;">&nbsp;&nbsp;&nbsp;개인&nbsp;</p>
						<p class="exc" style="float: left; font-size: 16px; font-weight: bold;">
						${stockmain.get(0).get("person").getAsString()}
						</p>
						<p style="float: left; font-size: 16px;">&nbsp;&nbsp;&nbsp;프로그램&nbsp;</p>
						<p class="exc" style="float: left; font-size: 16px; font-weight: bold;">
						${stockmain.get(0).get("program").getAsString()}
						</p>
						</div>
						<!-- floatleft때문에 안보이면: clear:both 옵션을 준다. -->
						<div id="curve_chart" style="width: 100%; height: 340px;clear: both;">
						</div>
					</div> 
					<div id="tab02" class="tab-contents">
						<h2>${kosdaq[0].open}</h2>
						<fmt:formatNumber value="${kosdaq[0].open - kosdaq[1].open}"
							pattern="+0.00;-0.00"></fmt:formatNumber>
						<fmt:formatNumber value="${kosdaq[0].change}"
							pattern="+0.00%;-0.00%"></fmt:formatNumber>
						<div id="curve_chart2" style="width: 85%; height: 340px"></div>
					</div>
					<div id="tab03" class="tab-contents">
						<h2>${kospi200[0].open}</h2>
						<fmt:formatNumber value="${kospi200[0].open - kospi200[1].open}"
							pattern="+0.00;-0.00"></fmt:formatNumber>
						<fmt:formatNumber value="${kospi200[0].change}"
							pattern="+0.00%;-0.00%"></fmt:formatNumber>
						<div id="curve_chart3" style="width: 85%; height: 340px"></div>
					</div>
				</div>

				<div class="col-md-12" style="padding-top: 20px;">
					<div class="col-md-6">
					<table class="table" >
					<colgroup>
						<col class="topSell" style=""/>
						<col class="topSell" />
						<col class="topBuy" />
						<col class="topBuy" />
					</colgroup>
						<tr>
							<th colspan="2" style="text-align: center;">등락률 상위업종</th>
							<th colspan="2" style="text-align: center;">등락률 하위업종</th>
						</tr>
						<tr>
							<td>${stockmain.get(1).get("1name").getAsString()}</td>
							<td class="exc">${stockmain.get(1).get("1up").getAsString()}</td>
							<td>${stockmain.get(2).get("1name").getAsString()}</td>
							<td class="exc">${stockmain.get(2).get("1up").getAsString()}</td>
						</tr>
						<tr>
							<td>${stockmain.get(1).get("2name").getAsString()}</td>
							<td class="exc">${stockmain.get(1).get("2up").getAsString()}</td>
							<td>${stockmain.get(2).get("2name").getAsString()}</td>
							<td class="exc">${stockmain.get(2).get("2up").getAsString()}</td>
						</tr>
						<tr>
							<td>${stockmain.get(1).get("3name").getAsString()}</td>
							<td class="exc">${stockmain.get(1).get("3up").getAsString()}</td>
							<td>${stockmain.get(2).get("3name").getAsString()}</td>
							<td class="exc">${stockmain.get(2).get("3up").getAsString()}</td>
						</tr>
						<tr>
							<td>${stockmain.get(1).get("4name").getAsString()}</td>
							<td class="exc">${stockmain.get(1).get("4up").getAsString()}</td>
							<td>${stockmain.get(2).get("4name").getAsString()}</td>
							<td class="exc">${stockmain.get(2).get("4up").getAsString()}</td>
						</tr>
						<tr>
							<td>${stockmain.get(1).get("5name").getAsString()}</td>
							<td class="exc">${stockmain.get(1).get("5up").getAsString()}</td>
							<td>${stockmain.get(2).get("5name").getAsString()}</td>
							<td class="exc">${stockmain.get(2).get("5up").getAsString()}</td>
						</tr>
					</table>
				</div>
				<!--  -->
				
				
				<div class="col-md-6">
					<table class="table" >
						<colgroup>
						<col class="topSell" />
						<col class="topSell" />
						<col class="topBuy" />
						<col class="topBuy" />
						</colgroup>
						<tr>
							<th colspan="2" style="text-align: center;">상승종목</th>
							<th colspan="2" style="text-align: center;">하락종목</th>
						</tr>
						<tr>
							<td>${stockmain.get(3).get("1name").getAsString()}</td>
							<td class="exc">${stockmain.get(3).get("1up").getAsString()}</td>
							<td>${stockmain.get(4).get("1name").getAsString()}</td>
							<td class="exc">${stockmain.get(4).get("1up").getAsString()}</td>
						</tr>
						<tr>
							<td>${stockmain.get(3).get("2name").getAsString()}</td>
							<td class="exc">${stockmain.get(3).get("2up").getAsString()}</td>
							<td>${stockmain.get(4).get("2name").getAsString()}</td>
							<td class="exc">${stockmain.get(4).get("2up").getAsString()}</td>
						</tr>
						<tr>
							<td>${stockmain.get(3).get("3name").getAsString()}</td>
							<td class="exc">${stockmain.get(3).get("3up").getAsString()}</td>
							<td>${stockmain.get(4).get("3name").getAsString()}</td>
							<td class="exc">${stockmain.get(4).get("3up").getAsString()}</td>
						</tr>
						<tr>
							<td>${stockmain.get(3).get("4name").getAsString()}</td>
							<td class="exc">${stockmain.get(3).get("4up").getAsString()}</td>
							<td>${stockmain.get(4).get("4name").getAsString()}</td>
							<td class="exc">${stockmain.get(4).get("4up").getAsString()}</td>
						</tr>
						<tr>
							<td>${stockmain.get(3).get("5name").getAsString()}</td>
							<td class="exc">${stockmain.get(3).get("5up").getAsString()}</td>
							<td>${stockmain.get(4).get("5name").getAsString()}</td>
							<td class="exc">${stockmain.get(4).get("5up").getAsString()}</td>
						</tr>
					</table>
				</div>
				<!-- 끝 -->
			</div>
			<!-- 테이블 끝 -->

				<div class="col-md-12" style="padding-top: 20px;">
				<div class="col-md-6">
					<table class="table" >
					<colgroup>
						<col class="topSell" />
						<col class="topSell" />
						<col class="topBuy" />
						<col class="topBuy" />
					</colgroup>
						<tr>
							<th colspan="2" style="text-align: center;">외국인 순매수</th>
							<th colspan="2" style="text-align: center;">외국인 순매도</th>
						</tr>
						<tr>
							<td>${stockmain.get(5).get("1name").getAsString()}</td>
							<td class="exc">${stockmain.get(5).get("1up").getAsString()}</td>
							<td>${stockmain.get(6).get("1name").getAsString()}</td>
							<td class="exc">${stockmain.get(6).get("1up").getAsString()}</td>
						</tr>
						<tr>
							<td>${stockmain.get(5).get("2name").getAsString()}</td>
							<td class="exc">${stockmain.get(5).get("2up").getAsString()}</td>
							<td>${stockmain.get(6).get("2name").getAsString()}</td>
							<td class="exc">${stockmain.get(6).get("2up").getAsString()}</td>
						</tr>
						<tr>
							<td>${stockmain.get(5).get("3name").getAsString()}</td>
							<td class="exc">${stockmain.get(5).get("3up").getAsString()}</td>
							<td>${stockmain.get(6).get("3name").getAsString()}</td>
							<td class="exc">${stockmain.get(6).get("3up").getAsString()}</td>
						</tr>
						<tr>
							<td>${stockmain.get(5).get("4name").getAsString()}</td>
							<td class="exc">${stockmain.get(5).get("4up").getAsString()}</td>
							<td>${stockmain.get(6).get("4name").getAsString()}</td>
							<td class="exc">${stockmain.get(6).get("4up").getAsString()}</td>
						</tr>
						<tr>
							<td>${stockmain.get(5).get("5name").getAsString()}</td>
							<td class="exc">${stockmain.get(5).get("5up").getAsString()}</td>
							<td>${stockmain.get(6).get("5name").getAsString()}</td>
							<td class="exc">${stockmain.get(6).get("5up").getAsString()}</td>
						</tr>
					</table>
				</div>
				<!-- 끝 -->
				
				
				<div class="col-md-6">
					<table class="table" >
					<colgroup>
						<col class="topSell" />
						<col class="topSell" />
						<col class="topBuy" />
						<col class="topBuy" />
					</colgroup>
						<tr>
							<th colspan="2" style="text-align: center;">기관 순매수</th>
							<th colspan="2" style="text-align: center;">기관 순매도</th>
						</tr>
						<tr>
							<td>${stockmain.get(7).get("1name").getAsString()}</td>
							<td class="exc">${stockmain.get(7).get("1up").getAsString()}</td>
							<td>${stockmain.get(8).get("1name").getAsString()}</td>
							<td class="exc">${stockmain.get(8).get("1up").getAsString()}</td>
						</tr>
						<tr>
							<td>${stockmain.get(7).get("2name").getAsString()}</td>
							<td class="exc">${stockmain.get(7).get("2up").getAsString()}</td>
							<td>${stockmain.get(8).get("2name").getAsString()}</td>
							<td class="exc">${stockmain.get(8).get("2up").getAsString()}</td>
						</tr>
						<tr>
							<td>${stockmain.get(7).get("3name").getAsString()}</td>
							<td class="exc">${stockmain.get(7).get("3up").getAsString()}</td>
							<td>${stockmain.get(8).get("3name").getAsString()}</td>
							<td class="exc">${stockmain.get(8).get("3up").getAsString()}</td>
						</tr>
						<tr>
							<td>${stockmain.get(7).get("4name").getAsString()}</td>
							<td class="exc">${stockmain.get(7).get("4up").getAsString()}</td>
							<td>${stockmain.get(8).get("4name").getAsString()}</td>
							<td class="exc">${stockmain.get(8).get("4up").getAsString()}</td>
						</tr>
						<tr>
							<td>${stockmain.get(7).get("5name").getAsString()}</td>
							<td class="exc">${stockmain.get(7).get("5up").getAsString()}</td>
							<td>${stockmain.get(8).get("5name").getAsString()}</td>
							<td class="exc">${stockmain.get(8).get("5up").getAsString()}</td>
						</tr>
					</table>
				</div>
				<!-- 끝 -->
			</div>
			<!-- 테이블 끝 -->

			</article>



			<!--사이드바 -------------------------------->
			<nav>
				<!-- 투자봇 -->
				<div>
					<h4>
						<strong>투자봇의 금일 예상 종가</strong>
					</h4>
					<hr />
					<div class="prediction_list"></div>
				</div>

				<!-- 환율 -->

				<div class="exchange" style="border: medium; border-color: blue;">
					<br> <br>
					<h4>
						<strong>주요국 환율</strong>
					</h4>
					<hr />
					<div class="exchange_contents" style="size: 10px;">
						<strong>미국 USD</strong> ${usdkrw[0].close}<br>
						<p class="exc">
							<fmt:formatNumber value="${usdkrw[0].close - usdkrw[1].close}"
								pattern="+0.00;-0.00"></fmt:formatNumber>
							<fmt:formatNumber value="${usdkrw[0].change}"
								pattern="+0.00%;-0.00%"></fmt:formatNumber>
						</p>

						<strong>중국 CNY</strong> ${cnykrw[0].close}<br>
						<p class="exc">
							<fmt:formatNumber value="${cnykrw[0].close - cnykrw[1].close}"
								pattern="+0.00;-0.00"></fmt:formatNumber>
							<fmt:formatNumber value="${cnykrw[0].change}"
								pattern="+0.00%;-0.00%"></fmt:formatNumber>
						</p>

						<strong>일본 JPY</strong> ${jpykrw[0].close}<br>
						<p class="exc">
							<fmt:formatNumber value="${jpykrw[0].close - jpykrw[1].close}"
								pattern="+0.00;-0.00"></fmt:formatNumber>
							<fmt:formatNumber value="${jpykrw[0].change}"
								pattern="+0.00%;-0.00%"></fmt:formatNumber>
						</p>
					</div>
				</div>



				<!-- 많이본뉴스 -->
				<div class="hitNews">
					<br> <br>
					<h4>
						<strong>많이본 뉴스</strong>
					</h4>
					<hr />
					<div class="hitNews_contents">
						<c:forEach items="${mostViewed }" var="mostViewed">
							<!-- 글자수 길이 자르기 -->
							<c:choose>
								<c:when test="${fn:length(mostViewed.title)>23}">
									<div class="mostViewedTitles">
										<a href="/news/view.do?nno=${mostViewed.nno}&cnt=1"> <c:out
												value="${fn:substring(mostViewed.title,0,23)}" />...
										</a>
									</div>
								</c:when>
								<c:otherwise>
									<div class="mostViewedTitles">
										<a href="/news/view.do?nno=${mostViewed.nno}&cnt=1">
											${mostViewed.title}</a>
									</div>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</div>
				</div>
			</nav>
		</section>
	</div>

	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
	<!-- google chart -->
	<script type="text/javascript"	src="https://www.gstatic.com/charts/loader.js"></script>

	<!-- 탭용 -->
	<script>
		$(function() {
			var $tabButtonItem = $('#tab-button li'), $tabSelect = $('#tab-select'), $tabContents = $('.tab-contents'), activeClass = 'is-active';

			$tabButtonItem.first().addClass(activeClass);
			$tabContents.not(':first').hide();

			$tabButtonItem.find('a').on('click', function(e) {

				var target = $(this).attr('href');

				$tabButtonItem.removeClass(activeClass);
				$(this).parent().addClass(activeClass);
				$tabSelect.val(target);
				$tabContents.hide();
				$(target).show();
				e.preventDefault();
			});

			$tabSelect.on('change', function() {
				var target = $(this).val(), targetSelectNum = $(this).prop(
						'selectedIndex');

				$tabButtonItem.removeClass(activeClass);
				$tabButtonItem.eq(targetSelectNum).addClass(activeClass);
				$tabContents.hide();
				$(target).show();
			});
		});
	</script>

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
		//json데이터 가져오기
		function readTextFile(file, callback) {
			var rawFile = new XMLHttpRequest();
			rawFile.overrideMimeType("application/json");
			rawFile.open("GET", file, true);
			rawFile.onreadystatechange = function() {
				if (rawFile.readyState === 4 && rawFile.status == "200") {
					callback(rawFile.responseText);
				}
			}
			rawFile.send(null);
		}
		var jsonDataKospi;
		var jsonDataKosdaq;
		var jsonDataKospi200;
		var jsonDataStockmain;
		///toojaatte/src/main/resources/com/toojaatte/stock/crawlingtest/stockmain.json
		readTextFile("/upload/crawlingtest/kospi.json", function(text) {
			jsonDataKospi = JSON.parse(text).data;
		})
		readTextFile("/upload/crawlingtest/kosdaq.json", function(text) {
			jsonDataKosdaq = JSON.parse(text).data;
		})
		readTextFile("/upload/crawlingtest/kospi200.json", function(text) {
			jsonDataKospi200 = JSON.parse(text).data;
		})
		//main/webapp/WEB-INF/views/stock/main.jsp
		readTextFile("/upload/crawlingtest/stockmain.json", function(text) {
			jsonDataStockmain = JSON.parse(text).data;
		})

		/* 
		 function Stockmain(){
		 console.log(jsonDataStockmain);
		 console.log(jsonDataStockmain[0]);
		 } */

		function drawKospiChart() {
			var data = new google.visualization.DataTable;
			data.addColumn("string", "date");
			data.addColumn("number", "close");
			for (i = jsonDataKospi.length - 51; i < jsonDataKospi.length; i++) {
				data.addRow([ jsonDataKospi[i].Date.substring(0, 10), jsonDataKospi[i].Close ]);
			}
			var options = {
				legend : {
					position : 'none'
				},
			};
			var chart = new google.visualization.LineChart(document
					.getElementById('curve_chart'));
			chart.draw(data, options);
		};

		function drawKosdaqChart() {
			var data = new google.visualization.DataTable;
			data.addColumn("string", "date1");
			data.addColumn("number", "close");
			for (i = jsonDataKosdaq.length - 51; i < jsonDataKosdaq.length; i++) {
				data
						.addRow([ jsonDataKosdaq[i].Date,
								jsonDataKosdaq[i].Close ]);
			}
			var options = {
				legend : {
					position : 'none'
				},
			};
			var chart = new google.visualization.LineChart(document
					.getElementById('curve_chart2'));
			chart.draw(data, options);
		};

		function drawKospi200Chart() {
			var data = new google.visualization.DataTable;
			data.addColumn("string", "date2");
			data.addColumn("number", "close");
			for (i = jsonDataKospi200.length - 51; i < jsonDataKospi200.length; i++) {
				data.addRow([ jsonDataKospi200[i].Date,
						jsonDataKospi200[i].Close ]);
			}
			var options = {
				legend : {
					position : 'none'
				},
			};
			var chart = new google.visualization.LineChart(document
					.getElementById('curve_chart3'));
			chart.draw(data, options);
		};
		//google chart============================
		google.charts.load('current', {
			'packages' : [ 'corechart' ]
		});
		google.charts.setOnLoadCallback(drawKospiChart);
		google.charts.setOnLoadCallback(drawKosdaqChart);
		google.charts.setOnLoadCallback(drawKospi200Chart);

		//**************************
		$('a[data-toggle="tab"]').on('shown.bs.tab', function(e) {
			google.load('visualization', '1', {
				packages : [ 'corechart' ],
				callback : drawChart
			});
			clearChart();
		})
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