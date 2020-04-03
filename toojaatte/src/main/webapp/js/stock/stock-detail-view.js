/**
 * 
 */

const CODE = document.querySelector('.stock-code').innerText.substring(1, 7);
const days_btn = document.querySelector('#days');
const month_btn = document.querySelector('#month');
const three_btn = document.querySelector('#three');
const six_btn = document.querySelector('#six');
const year_btn = document.querySelector('#year');

String.prototype.replaceAll = function(org, dest) {
			return this.split(org).join(dest);
		}
		document.addEventListener("DOMContentLoaded", function() {
			const daily_stock_date = document.getElementsByClassName('daily_stock_date');
			const daily_stock_volume = document.getElementsByClassName('daily_stock_volume');
			const daily_stock_closing_price = document.getElementsByClassName('daily_stock_closing_price');
			var last = document.getElementsByName('lastDay');
			var lastDaily = document.getElementsByName('lastDayDaily');

			for (i = 0; i < last.length; i++) {
				if (last[i].value === '1' || last[i].value === '2') {
					last[i].parentNode.classList.add("up");
				} else if (last[i].value === '4' || last[i].value === '5') {
					last[i].parentNode.classList.add("down");
				}
			}
			
			for (i = 0; i < lastDaily.length; i++) {
				if (lastDaily[i].value === '1' || lastDaily[i].value === '2') {
					lastDaily[i].parentNode.classList.add("up");
				} else if (lastDaily[i].value === '4' || lastDaily[i].value === '5') {
					lastDaily[i].parentNode.classList.add("down");
				}
			}

			function drawBarChart() {
				var data = new google.visualization.DataTable();
				data.addColumn('string', '일자')
				data.addColumn('number', '거래량')
				for (i = daily_stock_date.length - 1; i >= 0; i--) {
					data.addRow([daily_stock_date[i].innerText,	daily_stock_volume[i].innerText.replaceAll(",", "") * 1 ])
				}
				var options = {
					title : '일자별 거래량',
					legend : {
						position : 'bottom'
					},
					textStyle : {
						fontName : 'Noto Sans KR'
					},
					width : '100%',
					height : 200,
					colors : [ '#9d8c7c' ],
				};
				var chart = new google.visualization.ColumnChart(document.getElementById('stock_bar_chart'));
				chart.draw(data, options);
				window.addEventListener('resize', function() {
					chart.draw(data, options);
				}, false);
			};

			function drawLineChart() {
				var data = new google.visualization.DataTable();
				data.addColumn('string', '일자');
				data.addColumn('number', '종가');
				for (i = daily_stock_date.length - 1; i >= 0; i--) {
					data.addRow([daily_stock_date[i].innerText,daily_stock_closing_price[i].innerText.replaceAll(",", "") * 1 ])
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
			};
			
			// chart draw
			function drawChart(){
				google.charts.load('current', {'packages' : [ 'corechart' ]});
				google.charts.setOnLoadCallback(drawLineChart);
				google.charts.setOnLoadCallback(drawBarChart);
			}
			
			drawChart();
			
			function drawNewChart(result){
				var data = new google.visualization.DataTable();
				data.addColumn('string', '일자');
				data.addColumn('number', '종가');
				for(i=1; i < result.length; i++){
//					console.log(result[i].date.substring(2, result[i].date.length));
//					console.log(result[i].close);
//					console.log(typeof result[i].close);
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
//						drawNewChart(result);
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