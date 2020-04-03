<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>toojaatte:: market index</title>
<link
	href="https://fonts.googleapis.com/css?family=Noto+Sans+KR|Sawarabi+Gothic&display=swap"
	rel="stylesheet">
</head>
<body>
	<div class="container">
		<div class="panel-group" id="accordion">

			<!-- 미국 -->
			<div class="panel panel-default">
				<div class="panel-heading">
					<h4 class="panel-title">
						<a data-toggle="collapse" data-parent="#accordion"
							href="#collapse1">미국 USD</a>
					</h4>
				</div>
				<div id="collapse1" class="panel-collapse collapse in">
					<div class="panel-body" align="center" style="size: 15px;">
						<strong>usd/krw ${usdkrw[0].close}</strong> <i id="upordown"></i>
						<fmt:formatNumber value="${usdkrw[0].close - usdkrw[1].close}"
							pattern="0.00"></fmt:formatNumber>
						<fmt:formatNumber value="${usdkrw[0].change}"
							pattern="+0.00%;-0.00%"></fmt:formatNumber>
						<div id="curve_chart" style="width: 800px; height: 340px"></div>
					</div>
				</div>


				<!-- 중국 -->
				<div class="panel panel-default">
					<div class="panel-heading">
						<h4 class="panel-title">
							<a data-toggle="collapse" data-parent="#accordion"
								href="#collapse3">중국 CNY</a>
						</h4>
					</div>
					<div id="collapse3" class="panel-collapse collapse">
						<div class="panel-body" align="center" style="size: 15px;">
							<strong>cnykrw ${cnykrw[0].close}</strong> <i id="upordown"></i>
							<fmt:formatNumber value="${cnykrw[0].close - cnykrw[1].close}"
								pattern="+0.00;-0.00"></fmt:formatNumber>
							<fmt:formatNumber value="${cnykrw[0].change}"
								pattern="+0.00%;-0.00%"></fmt:formatNumber>
							<div id="curve_chart2" style="width: 800px; height: 340px"></div>
						</div>
					</div>


					<!-- 일본 -->
					<div class="panel panel-default">
						<div class="panel-heading">
							<h4 class="panel-title">
								<a data-toggle="collapse" data-parent="#accordion"
									href="#collapse2">일본 JPY</a>
							</h4>
						</div>
						<div id="collapse2" class="panel-collapse collapse">
							<div class="panel-body" align="center" style="size: 15px;">
								<strong>jpykrw ${jpykrw[0].close}</strong> <i id="upordown"></i>
								<fmt:formatNumber value="${jpykrw[0].close - jpykrw[1].close}"
									pattern="+0.00;-0.00"></fmt:formatNumber>
								<fmt:formatNumber value="${jpykrw[0].change}"
									pattern="+0.00%;-0.00%"></fmt:formatNumber>
								<div id="curve_chart3" style="width: 800px; height: 340px"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


	<!-- google chart -->
	<script type="text/javascript"
		src="https://www.gstatic.com/charts/loader.js"></script>
	<script type="text/javascript">
		/*마이너스이면 화살표 아래방향으로 바꾼다.*/
		window.onload = function(){
		var close = ${usdkrw[0].close - usdkrw[1].close};
		var ifminus = close.toString().substring(0, 1);
		if (ifminus == '-') {
			document.getElementById('upordown').innerText = '▼';
		} else {
			document.getElementById('upordown').innerHTML = '▲';
		}
		}
		</script>
	<script type="text/javascript">
		//google chart============================
		google.charts.load('current', {'packages':['corechart']});
	    google.charts.setOnLoadCallback(drawUSChart);
       	function drawUSChart() {
          var data = new google.visualization.arrayToDataTable([
          	['year', 'usd/krw'],
	          	//데이터 과거순이기때문에 역순으로 정렬. foreach에 step=-1없다.
	          	<c:forEach var="i" begin="0" end="51" step="1">
	          		<c:set var="date" value="${usdkrw[51-i].stringDate}"/>
	          		<c:set var="close" value="${usdkrw[51-i].close}"/>
	          	     ['${date}', ${close}], //쉼표 안쓰면 오류난다.
	          	</c:forEach> 
            ]);
        var options = {
          legend: { position: 'none' },
        };
        var chart = new google.visualization.LineChart(document.getElementById('curve_chart'));
        chart.draw(data, options);
      };
      </script>
	<script type="text/javascript">
		//중국=============
		google.charts.load('current', {'packages':['corechart']});
	    google.charts.setOnLoadCallback(drawChinaChart);
      	function drawChinaChart() {
          var data = new google.visualization.arrayToDataTable([
          	[{label : 'year', type:"string"}, {label: 'cnykrw', type:'number'}],
	          	//데이터 과거순이기때문에 역순으로 정렬. foreach에 step=-1없다.
	          	<c:forEach var="i" begin="0" end="51" step="1">
	          		<c:set var="date" value="${cnykrw[51-i].stringDate}"/>
	          		<c:set var="close" value="${cnykrw[51-i].close}"/>
	          	     ['${date}', ${close}], //쉼표 안쓰면 오류난다.
	          	</c:forEach> 
            ]);
        var options = {
          legend: { position: 'none' },
       	 width: 800,
          height: 340
        };
        var chart = new google.visualization.LineChart(document.getElementById('curve_chart2'));
        chart.draw(data, options);
      };
      </script>
      <script type="text/javascript">
	//일본============= 
	google.charts.load('current', {'packages':['corechart']});
	google.charts.setOnLoadCallback(drawJapanChart);
	function drawJapanChart() { 
	var data = new google.visualization.arrayToDataTable([ 
      	[{label : 'year', type:"string"}, {label: 'jpykrw', type:'number'}],
		//데이터 과거순이기때문에 역순으로 정렬. foreach에 step=-1없다.
	<c:forEach var="i" begin="0" end="51" step="1">
		<c:set var="date" value="${jpykrw[51-i].stringDate}" />
		<c:set var="close" value="${jpykrw[51-i].close}" />
	          	     ['${date}', ${close}], //쉼표 안쓰면 오류난다.
	          	</c:forEach>
	]); 
	var options = { legend: { position: 'none' },
	       	 width: 800;
	          height: 340 }; 
	var chart = new google.visualization.LineChart(document.getElementById('curve_chart3'));
	chart.draw(data, options);
	}
	</script>
</body>
</html>