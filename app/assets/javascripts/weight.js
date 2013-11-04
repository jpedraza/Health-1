$(function () { 
	newData = [];
	for (i in gon.entries) {
			newData.push( [ new Date(gon.entries[i][0]).getTime(), parseFloat(gon.entries[i][1]) ] );
	}
	var weightchart = new Highcharts.Chart({
		chart: {
			renderTo: "weight",
			type: 'line',
			zoomType: 'x'
		},
		title: {
			text: gon.user_name + '\'s weight loss history'
		},
		xAxis: {
			minRange: 24 * 3600 * 1000 * 4,
			tickInterval: 24 * 3600 * 1000,
			type: 'datetime',
            dateTimeLabelFormats: {
                day: '%e %b'
			},
			labels: {
			  enabled: true,
			  step: 3,
			  maxStaggerLines:1
			}
		},
		yAxis: {
			title: {
				text: 'Weight'
			},
		},
		plotOptions: {
			line: {
				dataLabels: {
					enabled: true
				}
			},
			series: {
				enableMouseTracking: false,
                allowPointSelect: false,
				dataLabels: {
					style:	{
						fontWeight: 'bold'
					}
				}
            }
        },
		series: [{
			name: 'Weight loss history',
			data: newData
		}]
	});
});
