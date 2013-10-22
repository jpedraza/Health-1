$(function () { 
	var weightchart = new Highcharts.Chart({
		chart: {
			renderTo: "weight_chart2",
			type: 'line'
		},
		title: {
			text: 'weight loss history'
		},
		xAxis: {
			type: 'datetime',
            dateTimeLabelFormats: {
                day: '%e %b'
			}
		},
		yAxis: {
			title: {
				text: 'Weight'
			}
		},
		series: [{
			name: 'Weight loss history',
			data: [[Date.UTC(2013, 1, 1), 87.2],[Date.UTC(2013, 0, 1), 90.2]]
		}]
	});
});
