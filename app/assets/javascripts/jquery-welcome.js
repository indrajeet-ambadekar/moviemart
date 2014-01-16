var maxh,flip=0,count;
$(document).ready(function(){
	resize();
	count =0;
	flipper(3);
	//setInterval(flipper,9900);
	
	$(window).mouseover(function(){
		resize();
		//console.log("Over");
	});
	$(window).mouseout(function(){
		resize();
        //console.log("Out");
    });
	$('.search-field input').focus(function(){
		//moveUpSearch();
	});
	$('.footer').mouseover(function(){
		$('.footer').animate().stop();
		$('.footer').animate({
           height: '10%',
        },250);
	});
	$('.footer').mouseout(function(){
		$('.footer').animate({
           height: '6%',
        },250);
	});
	
});
function resize(){
	maxh = Number($( window ).height()*0.9)+"px";
	maxw = $( window ).width()+"px";
	maxi = (Number($( window ).height()))+"px";
	$('.image-hor').css("height",maxh);
	$('.image-hor').css("width",maxw);
	console.log(maxw);
	$('.slid-background').css("width",maxw);
	//$('img').css("width","99.9%");
    $('.slid-background').css("height",maxh);
}
function moveUpSearch(){
	    //$('.search-bar').animate().stop();
		$('.search-bar').animate({
			top: '3px',
			left:'30%',
			height:"6%",
			width: "40%",
			height:"6%",
			color: "#ffffff",
			backgroundColor: "#333",
		},500);
		resize();
		
		$('.footer').mouseout(function(){
          $('.footer').css("height","10%");
	    });
}
function flipper(count){
	if(count%4 == 0 ){
		count =1;
		console.log(count);
	    $('.img-block') .cycle({
		fx: 'scrollUp', //'scrollLeft,scrollDown,scrollRight,scrollUp',blindX, blindY, blindZ, cover, curtainX, curtainY, fade, fadeZoom, growX, growY, none, scrollUp,scrollDown,scrollLeft,scrollRight,scrollHorz,scrollVert,shuffle,slideX,slideY,toss,turnUp,turnDown,turnLeft,turnRight,uncover,ipe ,zoom
		speed:  'slow', 
   		timeout: 4900, 
	});
    }
    else if(count%4 == 1){
    	count =2;
    	console.log(count);
    	$('.img-block') .cycle({
		fx: 'scrollLeft', //'scrollLeft,scrollDown,scrollRight,scrollUp',blindX, blindY, blindZ, cover, curtainX, curtainY, fade, fadeZoom, growX, growY, none, scrollUp,scrollDown,scrollLeft,scrollRight,scrollHorz,scrollVert,shuffle,slideX,slideY,toss,turnUp,turnDown,turnLeft,turnRight,uncover,ipe ,zoom
		speed:  'slow', 
   		timeout: 4900, 
	    });
    }
	
    else if(count%4 == 2){
    	count =3;
    	console.log(count);
        $('.img-block') .cycle({
		fx: 'scrollDown', //'scrollLeft,scrollDown,scrollRight,scrollUp',blindX, blindY, blindZ, cover, curtainX, curtainY, fade, fadeZoom, growX, growY, none, scrollUp,scrollDown,scrollLeft,scrollRight,scrollHorz,scrollVert,shuffle,slideX,slideY,toss,turnUp,turnDown,turnLeft,turnRight,uncover,ipe ,zoom
		speed:  'slow', 
   		timeout: 4900, 
	    });
    }
	
    else{
    	count =4;
    	console.log(count);
        $('.img-block') .cycle({
		fx: 'scrollRight', //'scrollLeft,scrollDown,scrollRight,scrollUp',blindX, blindY, blindZ, cover, curtainX, curtainY, fade, fadeZoom, growX, growY, none, scrollUp,scrollDown,scrollLeft,scrollRight,scrollHorz,scrollVert,shuffle,slideX,slideY,toss,turnUp,turnDown,turnLeft,turnRight,uncover,ipe ,zoom
		speed:  'slow', 
   		timeout: 4900, 
	    });
    }
}	
