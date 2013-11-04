$(function () {
	carbs = [];
	fat = [];
	protein = [];
	points = [];
	for (i in gon.calories) {
			protein.push( [ new Date(gon.calories[i][0]).getTime(), parseInt(gon.calories[i][1]) ] );
			fat.push( [ new Date(gon.calories[i][0]).getTime(), parseInt(gon.calories[i][2]) ] );
			carbs.push( [ new Date(gon.calories[i][0]).getTime(), parseInt(gon.calories[i][3]) ] );
			points.push( [ new Date(gon.calories[i][0]).getTime(), parseInt(gon.calories[i][4]) ] );
	}
	var caloriechart = new Highcharts.Chart({
		chart: {
			renderTo: "calorie_chart",
			zoomType: 'x'
		},
		title: {
			text: 'Calorie history chart'
		},
	    rangeSelector: {
	    	enabled: true
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
		yAxis: [{
			min: 0,
			title: {
				text: 'Total Calories'
			},
			stackLabels: {
				enabled: false,
				style: {
					fontWeight: 'bold',
					color: (Highcharts.theme && Highcharts.theme.textColor) || 'black'
				}
			}
		}, {
			min: 0,
			max: 7,
			title: {
				text: 'Points'
				},
				opposite: true
		}],
		legend: {
			align: 'right',
			x: -70,
			verticalAlign: 'top',
			y: 20,
			floating: true,
			backgroundColor: (Highcharts.theme && Highcharts.theme.legendBackgroundColorSolid) || 'white',
			borderColor: '#CCC',
			borderWidth: 1,
			shadow: false
		},
		tooltip: {
			formatter: function() {
				if (this.series.name == "Points") {
					return '<b>'+ Highcharts.dateFormat('%A, %b %e, %Y', this.x) +'</b><br/>'+
						this.series.name +': '+ this.y +' points<br/>'
				
				} else {
					return '<b>'+ Highcharts.dateFormat('%A, %b %e, %Y', this.x) +'</b><br/>'+
						this.series.name +': '+ this.y +' calories<br/>'+
						'Total: '+ this.point.stackTotal + ' calories';
				}
			}
		},
		plotOptions: {
			column: {
				stacking: 'normal',
				dataLabels: {
					enabled: false,
					color: (Highcharts.theme && Highcharts.theme.dataLabelsColor) || 'white'
				}
			}, 
			series: {
	            pointWidth: 18
	        }
		},
		series: [{
				type: 'column',
                name: 'Carbs',
                data: carbs
            }, {
				type: 'column',
                name: 'Fat',
                data: fat
            }, {
				type: 'column',
                name: 'Protein',
                data: protein
			}, {
				type: 'scatter',
				name: 'Points',
				data: points,
				yAxis: 1
				
		}]
	});
});
