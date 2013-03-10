$(function() {

    //	Basic carousel, no options
    $('#foo0').carouFredSel();

    //	Basic carousel + timer, using CSS-transitions
    $('#foo1').carouFredSel({
        auto: {
            pauseOnHover: 'resume',
            progress: '#timer1'
        }
    }, {
        transition: true
    });

    //	Scrolled by user interaction
    $('#foo2').carouFredSel({
        auto: false,
        prev: '#prev2',
        next: '#next2',
        pagination: "#pager2",
        mousewheel: true,
        swipe: {
            onMouse: true,
            onTouch: true
        }
    });

    //	Variable number of visible items with variable sizes
    $('#foo3').carouFredSel({
        width: 360,
        height: 'auto',
        prev: '#prev3',
        next: '#next3',
        auto: false
    });

    //	Responsive layout, resizing the items
    $('#foo4').carouFredSel({
        responsive: true,
        width: '100%',
        scroll: 2,
        items: {
            width: 400,
            //	height: '30%',	//	optionally resize item-height
            visible: {
                min:3,
                max: 6
            }
        }
    });

    //	Fuild layout, centering the items
    $('#foo5').carouFredSel({
        width: '100%',
        scroll: 2
    });

});