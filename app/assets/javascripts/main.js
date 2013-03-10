// Slides
$(function() {
     $('#slides').slides({
        preload: true,
		preloadImage: '/img/loading.gif',
		play: 5000,
		pause: 2500,
		slideSpeed: 450,
		hoverPause: true
     });
     
     $('#main_nav').scrollspy();

     $('#main_nav li.active').removeClass('active');

     $('#main_nav li:first').addClass('active')
     
     $('#slidesjs').click(function(e) {
         e.preventDefault();
         window.scrollTo( 0, 0) ;
     });
    
    $('.expand .show').click(function(e){
        e.preventDefault();
    	var obj = $(this).parents('.expand');
    	if ($(obj).hasClass('expanded')) {
    		$(obj).removeClass('expanded');
    		$('.content',obj).slideUp(100);					
    		$(this).html('<i class="icon-plus-sign"></i> Show example');
    	} else {
    		$(obj).addClass('expanded');
    		$('.content',obj).slideDown(150);
    		$(this).html('<i class="icon-minus-sign"></i> Hide example');
    	}
    });
    
    $('.donate').click(function(e) {
        e.preventDefault();
        
        $('#submit').click();
    });
    
    $('.track_download').click(function(){
		_gaq.push(['_trackEvent', 'Slides', 'Download', 'Slides GitHub Download']);
	});
	$('.track_donate').click(function(){
		_gaq.push(['_trackEvent', 'Slides', 'Donate', 'Slides Donation']);
	});

    Socialite.load();
});
// Fim Slides
