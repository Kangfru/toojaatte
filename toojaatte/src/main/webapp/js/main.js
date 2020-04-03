/**
 * 
 */
var jsonDataKospi;
var jsonDataKosdaq;
var jsonDataUsdKrw;
var jsonDataJpyKrw;

var exc = document.getElementsByClassName("exc");

for (var i = 0; i < exc.length; i++) {
	if (exc[i].innerText.indexOf("-") >= 0) {
		exc[i].style.color = "#687de3";
	} else {
		exc[i].style.color = "#eb8787";
	}
}

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

readTextFile("/upload/crawlingtest/kospi.json", function(text) {
	jsonDataKospi = JSON.parse(text).data;
})
readTextFile("/upload/crawlingtest/kosdaq.json", function(text) {
	jsonDataKosdaq = JSON.parse(text).data;
})
readTextFile("/upload/crawlingtest/usdkrw.json", function(text) {
	jsonDataUsdKrw = JSON.parse(text).data;
})
readTextFile("/upload/crawlingtest/jpykrw.json", function(text) {
	jsonDataJpyKrw = JSON.parse(text).data;
})
function drawKospiChart() {
	var data = new google.visualization.DataTable;
	data.addColumn("string", "date");
	data.addColumn("number", "close");
	for (i = jsonDataKospi.length - 30; i < jsonDataKospi.length; i++) {
		data.addRow([ jsonDataKospi[i].Date.substring(2, 10),
				jsonDataKospi[i].Close ]);
	}
	var options = {
		legend : {
			position : 'none'
		},
		title : "코스피 지수",
		colors : [ '#9d8c7c' ],
	};
	var chart = new google.visualization.LineChart(document
			.getElementById('kospi_chart'));
	chart.draw(data, options);
};

function drawKosdaqChart() {
	var data = new google.visualization.DataTable;
	data.addColumn("string", "date");
	data.addColumn("number", "close");
	for (i = jsonDataKosdaq.length - 30; i < jsonDataKosdaq.length; i++) {
		data.addRow([ jsonDataKosdaq[i].Date.substring(2, 10),
				jsonDataKosdaq[i].Close ]);
	}
	var options = {
		legend : {
			position : 'none'
		},
		title : "코스닥 지수",
		colors : [ '#9d8c7c' ],
	};
	var chart = new google.visualization.LineChart(document
			.getElementById('kosdaq_chart'));
	chart.draw(data, options);
};
function drawUsdKrwChart() {
	var data = new google.visualization.DataTable;
	data.addColumn("string", "date");
	data.addColumn("number", "close");
	for (i = jsonDataUsdKrw.length - 30; i < jsonDataUsdKrw.length; i++) {
		data.addRow([ jsonDataUsdKrw[i].Date.substring(2, 10), jsonDataUsdKrw[i].Close ]);
	}
	var options = {
			legend : {
				position : 'none'
			},
			title : "달러/원화 환율",
			colors : [ '#9d8c7c' ],
	};
	var chart = new google.visualization.LineChart(document.getElementById('usdkrw_chart'));
	chart.draw(data, options);
};
function drawJpyKrwChart() {
	var data = new google.visualization.DataTable;
	data.addColumn("string", "date");
	data.addColumn("number", "close");
	for (i = jsonDataJpyKrw.length - 30; i < jsonDataJpyKrw.length; i++) {
		data.addRow([ jsonDataJpyKrw[i].Date.substring(2, 10), jsonDataJpyKrw[i].Close ]);
	}
	var options = {
			legend : {
				position : 'none'
			},
			title : "엔화/원화 환율",
			colors : [ '#9d8c7c' ],
	};
	var chart = new google.visualization.LineChart(document
			.getElementById('jpykrw_chart'));
	chart.draw(data, options);
};

google.charts.load('current', {
	'packages' : [ 'corechart' ]
});
google.charts.setOnLoadCallback(drawKospiChart);
google.charts.setOnLoadCallback(drawKosdaqChart);
google.charts.setOnLoadCallback(drawUsdKrwChart);
google.charts.setOnLoadCallback(drawJpyKrwChart);