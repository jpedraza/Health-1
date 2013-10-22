$(function () { 
    newData = [];
    for (i in gon.entries) {
        newData.push( [ new Date(gon.entries[i][0]).getTime(), parseInt(gon.entries[i][1]) ] );
    }
	var weightchart = new Highcharts.Chart({
		chart: {
			renderTo: "weight_chart",
			type: 'line'
		},
		title: {
			text: gon.user_name + '\'s weight loss history'
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
		plotOptions: {
			series: {
                allowPointSelect: true
            }
        },
		series: [{
			name: 'Weight loss history',
			data: newData
		}]
	});
});
