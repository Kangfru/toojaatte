/**
 * 
 */



document.addEventListener("DOMContentLoaded", function() {
	function drawNewChart(result){
		var data = new google.visualization.DataTable();
		data.addColumn('string', '일자');
		data.addColumn('number', '종가');
		for(i=1; i < result.length; i++){
//			console.log(result[i].date.substring(2, result[i].date.length));
//			console.log(result[i].close);
//			console.log(typeof result[i].close);
			data.addRow([result[i].date.substring(2, result[i].date.length), Number(result[i].close)]);
		}
		var options = {
				legend : {
					position : 'bottom'
				},
				textStyle : {
					fontName : 'Noto Sans KR'
				},
				colors : [ '#9d8c7c' ],
				width : '100%',
				height : 350,
		};
		
		var chart = new google.visualization.LineChart(document	.getElementById('stock_line_chart'));
		chart.draw(data, options);
		window.addEventListener('resize', function() {
			chart.draw(data, options);
		}, false);
	}
	
	function handleClick(event, term){
		event.preventDefault();
		$.ajax({
			type:"GET",
			url:"/stock/graph/data?code=" + CODE + "&term=" + term,
			success:function(result, status, xhr){
				google.charts.load('current', {'packages' : [ 'corechart' ]});
				google.charts.setOnLoadCallback(drawNewChart(result));
//				drawNewChart(result);
			},
			error:function(){
			}
		})
	};

	function init(){
		days_btn.addEventListener("click", function(event){
			const term = days_btn.value;
			event.preventDefault();
			drawChart();
		});
		
		month_btn.addEventListener("click", function(event){
			const term = month_btn.value;
			handleClick(event, term);
		});
		
		three_btn.addEventListener("click", function(event){
			const term = three_btn.value;
			handleClick(event, term);
		});
		
		six_btn.addEventListener("click", function(event){
			const term = six_btn.value;
			handleClick(event, term);
		});
		
		year_btn.addEventListener("click", function(event){
			const term = year_btn.value;
			handleClick(event, term);
		});
	};
	
	init();
});
