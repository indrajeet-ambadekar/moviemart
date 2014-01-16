(function($){
	$.fn.barChart = function(){
		var len = this.attr('data-percent')+"px";
		console.log(this.attr('data-percent'));
		this.animate({
			width: len,
		} ,1500);
	};
})(jQuery);