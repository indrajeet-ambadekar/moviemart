$(document).ready(function(){
	displaypie();
	console.log("Working");
    $(".bar-chart").barChart();
	$( ".containts" ).css("width","100%");

	$(".form-control").typing({
		stop: function( event, $elem ) {
			$(".flipper").css("display","block");
			console.log("Working");
			$(".flip-first").css("width","149px");
			$(".flip-back").css("width","0px");
			$( ".results" ).animate({
				visiblity: "visible",
				opacity: 0.9,
				width: '100%',
				height: '500px',
			}, 1500 );

			$( ".containts" ).animate({
				visiblity: "hidden",
				width: '0%',
				opacity: 0,
				height: '0px',
			}, 1500 );

			$( ".search" ).animate({
				opacity: 0.7,  
				marginTop: "-50px",
			}, 1500 );

			$(".flipper").mouseleave(function(){
				console.log($(this).find("flip-back"));
				$(this).find('div:first').find('img:first').animate({
					width: '149px',
				}, 500 );
				$(this).find("div:last").find('img:first').animate( {
					width: '0px',
				}, 500 );
			});
			$(".flipper").mouseenter(function(){
				console.log($(this).find("div:last"));
				$(this).find('div:first').find('img:first').animate({
					width: '0px',
				}, 500 );
				
				$(this).find("div:last").find('img:first').animate( {
					width: '149px',
				}, 500 );
			});
		},
		delay: 400
	});

});

$(window).mouseover(displaypie);


function displaypie(){
	$('.chart').easyPieChart({
		easing: 'easeOutBounce',
		size : 150,
		
		lineWidth : 10,
		onStep: function(from, to, percent) {
			$(this.el).find('.percent').text(Math.round(percent));
		}
	});
	var chart = window.chart = $('.chart').data('easyPieChart');
}