<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>가상화폐 그래프</title>

<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);

      var coinDatas = {};

      <c:forEach items="${keylist }" var="key">
      	coinDatas.${key } = ${jsMap.get(key) };
      </c:forEach>

	alert(coinDatas) ;    

	function getData(key){
		alert(coinDatas.BTC);
		return coinDatas.BTC;
	}
    
      function drawChart() {
        var data = google.visualization.arrayToDataTable(getData("BTC"));

        var options = {
          title: 'Company Performance',
          curveType: 'function',
          legend: { position: 'bottom' }
        };

        var chart = new google.visualization.LineChart(document.getElementById('curve_chart'));

        chart.draw(data, options);
      }

      $(function(){
			$(".coinBtn").click(function(){
				alert("버튼 클릭");

				});



          })
          
          
      </script>
      
      
      
</head>
<body>
	<div id="curve_chart" style="width: 900px; height: 500px"></div>
	
	<c:forEach items="${keylist }" var="key">
		<button class="coinBtn">${key }</button>
	</c:forEach>
	
</body>
</html>