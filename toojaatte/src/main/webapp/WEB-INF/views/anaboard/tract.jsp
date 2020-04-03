<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>키워드 추출</title>
<style type="text/css">
.dataRow:hover {
	background: #eee;
	cursor: pointer;
}
</style>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
google.charts.load('current', {'packages':['treemap']});
google.charts.setOnLoadCallback(drawChart);

//주식 전체
var ra_ = new Array();
ra_[0] = new Array('word', 'type', 'count(size)');
ra_[1] = new Array('[주식] 전체', null, 0);
var i =2;
<c:if test="${!empty ra}">
<c:forEach items="${ra }" var="real_all">
	ra_[i] = new Array(${real_all[0] },'[주식] 전체', ${real_all[1] });
	i++;
</c:forEach>
</c:if>
<c:if test="${empty ra}">
ra_[i] = new Array('자료 없음','[주식] 전체', 20);
</c:if>
//주식분석가
 var rm_ = new Array();
 rm_[0] = new Array('word', 'type', 'count(size)');
 rm_[1] = new Array('[주식] 분석가', null, 0);
i =2;
<c:if test="${!empty rm}">
<c:forEach items="${rm }" var="real_master">
	rm_[i] = new Array(${real_master[0] },'[주식] 분석가', ${real_master[1] });
	i++;
</c:forEach>
</c:if>
<c:if test="${empty rm}">
rm_[i] = new Array('자료 없음','[주식] 분석가', 20);
</c:if>
//가상화폐 전체
var fa_ = new Array();
fa_[0] = new Array('word', 'type', 'count(size)');
fa_[1] = new Array('[가상화폐] 전체', null, 0);
i =2;
<c:if test="${!empty fa}">
<c:forEach items="${fa }" var="fake_all">
	fa_[i] = new Array(${fake_all[0] },'[가상화폐] 전체', ${fake_all[1] });
	i++;
</c:forEach>
</c:if>
<c:if test="${empty fa}">
fa_[i] = new Array('자료 없음','[가상화폐] 전체', 20);
</c:if>

//가상화폐 분석가
 var fm_ = new Array();
 fm_[0] = new Array('word', 'type', 'count(size)');
 fm_[1] = new Array('[가상화폐] 분석가', null, 0);
 i =2;
 <c:if test="${!empty fm}">
<c:forEach items="${fm }" var="fake_master">
	fm_[i] = new Array(${fake_master[0] },'[가상화폐] 분석가', ${fake_master[1] });
	i++;
</c:forEach>
</c:if>
<c:if test="${empty fm}">
fm_[i] = new Array('자료 없음','[가상화폐] 분석가', 20);
</c:if>

//기타 전체
var ea_ = new Array();
ea_[0] = new Array('word', 'type', 'count(size)');
ea_[1] = new Array('[기타] 전체', null, 0);
i =2;
<c:if test="${!empty ea}">
<c:forEach items="${ea }" var="etc_all">
	ea_[i] = new Array(${etc_all[0] },'[기타] 전체', ${etc_all[1] });
	i++;
</c:forEach>
</c:if>
<c:if test="${empty ea}">
ea_[i] = new Array('자료 없음','[기타] 전체', 20);
</c:if>

//기타 분석가
 var em_ = new Array();
 em_[0] = new Array('word', 'type', 'count(size)');
 em_[1] = new Array('[기타] 분석가', null, 0);
 i =2;
<c:if test="${!empty em}">
<c:forEach items="${em }" var="etc_master">
	em_[i] = new Array(${etc_master[0] },'[기타] 분석가', ${etc_master[1] });
	i++;
</c:forEach>
</c:if>
<c:if test="${empty em}">
em_[i] = new Array('자료 없음','[기타] 분석가', 20);
</c:if>
function drawChart() {

  var dataRA = google.visualization.arrayToDataTable(
	  ra_.splice(0,30)
	  );
  var dataRM = google.visualization.arrayToDataTable(
	  rm_.splice(0,30)
	  );
  var dataFA = google.visualization.arrayToDataTable(
	  fa_.splice(0,30)
	  );
  var dataFM = google.visualization.arrayToDataTable(
	  fm_.splice(0,30)
	  );
  var dataEA = google.visualization.arrayToDataTable(
	  ea_.splice(0,30)
	  );
  var dataEM = google.visualization.arrayToDataTable(
	  em_.splice(0,30)
	  );

  treeRA = new google.visualization.TreeMap(document.getElementById('chartRA'));
  treeRM = new google.visualization.TreeMap(document.getElementById('chartRM'));
  treeFA = new google.visualization.TreeMap(document.getElementById('chartFA'));
  treeFM = new google.visualization.TreeMap(document.getElementById('chartFM'));
  treeEA = new google.visualization.TreeMap(document.getElementById('chartEA'));
  treeEM = new google.visualization.TreeMap(document.getElementById('chartEM'));
  
  treeRA.draw(dataRA, {
    minColor: '#ccff99',
    midColor: '#eee',
    maxColor: '#ff9966',
    headerColor: '#cce6ff',
    headerHeight: 50,
    fontColor: 'black',
//     showScale: true
  });

  treeRM.draw(dataRM, {
    minColor: '#ccff99',
    midColor: '#eee',
    maxColor: '#ff9966',
    headerColor: '#cce6ff',
    headerHeight: 50,
    fontColor: 'black',
//     showScale: true
  });
  treeFA.draw(dataFA, {
    minColor: '#ccff99',
    midColor: '#eee',
    maxColor: '#66ccff',
    headerColor: '#cce6ff',
    headerHeight: 50,
    fontColor: 'black',
//     showScale: true
  });
  treeFM.draw(dataFM, {
    minColor: '#ccff99',
    midColor: '#eee',
    maxColor: '#66ccff',
    headerColor: '#cce6ff',
    headerHeight: 50,
    fontColor: 'black',
//     showScale: true
  });
  treeEA.draw(dataEA, {
    minColor: '#ccff99',
    midColor: '#eee',
    maxColor: '#cc66ff',
    headerColor: '#cce6ff',
    headerHeight: 50,
    fontColor: 'black',
//     showScale: true
  });
  treeEM.draw(dataEM, {
    minColor: '#ccff99',
    midColor: '#eee',
    maxColor: '#cc66ff',
    headerColor: '#cce6ff',
    headerHeight: 50,
    fontColor: 'black',
//     showScale: true
  });

  window.addEventListener('resize', function() {
	  treeRA.draw(dataRA, {
		    minColor: '#ccff99',
		    midColor: '#eee',
		    maxColor: '#ff9966',
		    headerColor: '#cce6ff',
		    headerHeight: 50,
		    fontColor: 'black',
//		     showScale: true
		  });

		  treeRM.draw(dataRM, {
		    minColor: '#ccff99',
		    midColor: '#eee',
		    maxColor: '#ff9966',
		    headerColor: '#cce6ff',
		    headerHeight: 50,
		    fontColor: 'black',
//		     showScale: true
		  });
		  treeFA.draw(dataFA, {
		    minColor: '#ccff99',
		    midColor: '#eee',
		    maxColor: '#66ccff',
		    headerColor: '#cce6ff',
		    headerHeight: 50,
		    fontColor: 'black',
//		     showScale: true
		  });
		  treeFM.draw(dataFM, {
		    minColor: '#ccff99',
		    midColor: '#eee',
		    maxColor: '#66ccff',
		    headerColor: '#cce6ff',
		    headerHeight: 50,
		    fontColor: 'black',
//		     showScale: true
		  });
		  treeEA.draw(dataEA, {
		    minColor: '#ccff99',
		    midColor: '#eee',
		    maxColor: '#cc66ff',
		    headerColor: '#cce6ff',
		    headerHeight: 50,
		    fontColor: 'black',
//		     showScale: true
		  });
		  treeEM.draw(dataEM, {
		    minColor: '#ccff99',
		    midColor: '#eee',
		    maxColor: '#cc66ff',
		    headerColor: '#cce6ff',
		    headerHeight: 50,
		    fontColor: 'black',
//		     showScale: true
		  });

	}, false);
}
$(function() {
	$("#returnListBtn").click(function(){
		location = "list.do";
	}); 
});
</script>
</head>
<body>

	<h1 align="center">키워드 추출</h1>
	<div style="float:right">
	<button id="returnListBtn" class="btn btn-default btn-xs" type="button">목록으로 돌아가기</button>
	</div>
	<div class="row" style="display:list-item; list-style: none;">
	<div style="float:right; padding: 30px 0px 10px 0px; vertical-align: middle">
		<div id="searchDiv">
			<form action="tract.do" class="form-inline">
				<div class="form-group">
               		<span class="input-group-addon">
	                   	<span class="glyphicon glyphicon-calendar">
	                   	</span>
						<input type='date' class="form-control" name="startDate"/>
	                    ~
						<input type='date' class="form-control" name="endDate"/>
<!-- 	                   	<span class="input-group-btn"> -->
						<button class="btn btn-default" type="submit">
							<i class="glyphicon glyphicon-search"></i>
						</button>
<!-- 						</span> -->
                    </span>
				</div>
			</form>
		</div>
		</div>
	</div><!-- 	end div row -->
	<div class="row" style="display:list-item; list-style: none;">
	<div id="chart_div">
	<div id="chartRA"></div>
	<div id="chartRM"></div>
	<div id="chartFA"></div>
	<div id="chartFM"></div>
	<div id="chartEA"></div>
	<div id="chartEM"></div>
	</div>
	</div>
</body>
</html>