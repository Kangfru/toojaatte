<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>

<title>Insert title here</title>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>

<script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);

      var coinDatas = {};

      <c:forEach items="${keylist }" var="key">
      	coinDatas.${key } = ${jsMap.get(key) };
      </c:forEach>

	    

	function getData(key){
// 		alert(coinDatas.BTC);
	      <c:forEach items="${keylist }" var="key">
	      	if ("${key}"==key)
		      	return coinDatas.${key};
		  </c:forEach>
			return false;
		  
	}
    
      function drawChart(key) {
//         alert(key);
        if(!key) key ="BTC";
        var data = google.visualization.arrayToDataTable(getData(key));

        var options = {
          title: 'Virtual Money :' + key,
          curveType: 'function',
          legend: { position: 'bottom' }
        };

        var chart = new google.visualization.LineChart(document.getElementById('curve_chart'));

        chart.draw(data, options);
      }

      $(function(){
			$(".coinBtn").click(function(){
				var key = $(this).text();
				drawChart(key);
				});

          })
          
          function numberFormat(inputNumber) {
   			return inputNumber.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		}
      $(function(){
			$(".updateBtn").click(function(event){
				event.preventDefault();
				$.ajax({
					type:"GET",
					url:"/vm/load.do",
					success:function(result, status, xhr){
					},
					error:function(){
					}
				});
			});
      });


		
      </script>
      

<style type="text/css">
.left-box{
float:left;
width:50%;
font-size:25px;
}
.right-box{
float:right;
width:50%;
font-size:25px;

}
.container{
 padding :50px;
}

.coName{
font-size: 10px;
}

</style>


</head>

<body>


<div class="container" >
	
	<h2 align="center">가 상 화 폐 실 시 간 시  세 현 황</h2><br/>
	
	
	<div id="myCarousel" class="carousel" data-ride="carousel" data-interval="false">
	
	  <!-- Wrapper for slides -->
	  <div class="carousel-inner">
	
		<c:forEach items="${cm}" var="c" varStatus="vs">
		<div class ="item ${vs.index ==0?"active":"" }">
	      <div style= "width:60%; margin: auto;">
	        <div align="center"><h2> 코  인  명: ${c}</h2></div> <br/>
			<div class='left-box' align="center">
			시  가 : <fmt:formatNumber value= "${vmdata.get(c).opening_p}" pattern="#,###"/> <br/>
			종   가 : <fmt:formatNumber value= "${vmdata.get(c).closing_p}" pattern="#,###"/><br/>
			</div>
			<div class='right-box' align="center">
			최고가 :<fmt:formatNumber value= "${vmdata.get(c).max_p}" pattern="#,###"/><br/>
			최저가 : <fmt:formatNumber value= "${vmdata.get(c).min_p}" pattern="#,###"/><br/>
			</div>
			<br/>
			
			<div class='right-box' align="center" style="font-size: 15px;">
			등락률 : <fmt:formatNumber type="number"  pattern="#,###" value="${((vmdata.get(c).closing_p - vmdata.get(c).opening_p )/vmdata.get(c).opening_p)*100}"/>%<br/> 
			</div>
			
			<div class='left-box' align="center" style="font-size: 15px;">
			등락가 : <fmt:formatNumber type="number"  pattern="#,###" value="${(vmdata.get(c).closing_p - vmdata.get(c).opening_p )}"/>
			</div>
		  </div>
		  </div>
		</c:forEach>
		
		  <!-- Left and right controls -->
		  <a class="left carousel-control" href="#myCarousel" data-slide="prev" style="background: #004a99; width: 50px;">
		      <span class="glyphicon glyphicon-chevron-left"></span>
		      <span class="sr-only">Previous</span>
		  </a>
		    <a class="right carousel-control" href="#myCarousel" data-slide="next" style="background: #004a99; width: 50px;">
		      <span class="glyphicon glyphicon-chevron-right"></span>
		      <span class="sr-only">Next</span>
		    </a>
		</div>
	
	
	
	</div>
</div>
	 <div class ="coName">
	 <p>* 코인명 = 한글명<br/>
	 	[BTC=비트코인] [IPX=타키온 프로토콜] [BZN=베잔트] [XEM=넴]  [FLETA=플레타]<br/>
	 	[CTXC=코르텍스] [FZZ=피즈토큰] [WTC=월트체인] [OMG=오미세고] [XVG=버지]</p>
	 </div><br/>	
<hr/>
<hr/>


<div align="center" ><h2>일별 시세 변동 그래프</h2></div><br/>


<div align="center">
<br/>
<c:forEach items="${keylist }" var="key" >
		<button class="coinBtn btn btn-primary">${key }</button>
	</c:forEach>
</div>
<div align="center">
<h5>** 코인명을 누르면 코인 그래프가 나옵니다. **</h5>
</div>
<br/>


<div align="center">
<div id="curve_chart" style="width: 900px; height: 500px;" ></div>
</div>	
	<div>
	<button class="updateBtn btn btn-primary"> 일 별 업데이트 </button>
	</div>	
    
</body>
</html>