// $(document).ready(function() {

// 	$.ajax({
// 		url: 'http://www.email-validator.net/api/verify',
//         type: 'POST',
//         data: { EmailAddress: 'yilunzh@gmail.com', APIKey: 'ev-ceba647090c72c15f0c2d608b22ff943' },
//         dataType: 'json',
//         success: function (json) {
//         	if (typeof(json.status) != "undefined") {
//         		res = parseInt(json.status)
//         		if (res/100 == 2) {
//         			console.log(res)
//         			$('.confirmation').prepend('<span class="glyphicon glyphicon-ok"></span>')
//         		}
//         	}
//         }
// 	})
// });

$(document).ready(function() {
    var moveLeft = 0;
    var moveDown = 0;
    $('a.popper').hover(function(e) {
   
        var target = '#' + ($(this).attr('data-popbox'));
         
        $(target).show();
        moveLeft = $(this).outerWidth();
        moveDown = ($(target).outerHeight() / 2);
    }, function() {
        var target = '#' + ($(this).attr('data-popbox'));
        $(target).hide();
    });
 
    $('a.popper').mousemove(function(e) {
        var target = '#' + ($(this).attr('data-popbox'));
         
        leftD = e.pageX + parseInt(moveLeft);
        maxRight = leftD + $(target).outerWidth();
        windowLeft = $(window).width() - 40;
        windowRight = 0;
        maxLeft = e.pageX - (parseInt(moveLeft) + $(target).outerWidth() + 20);
         
        if(maxRight > windowLeft && maxLeft > windowRight)
        {
            leftD = maxLeft;
        }
     
        topD = e.pageY - parseInt(moveDown);
        maxBottom = parseInt(e.pageY + parseInt(moveDown) + 20);
        windowBottom = parseInt(parseInt($(document).scrollTop()) + parseInt($(window).height()));
        maxTop = topD;
        windowTop = parseInt($(document).scrollTop());
        if(maxBottom > windowBottom)
        {
            topD = windowBottom - $(target).outerHeight() - 20;
        } else if(maxTop < windowTop){
            topD = windowTop + 20;
        }
     
        $(target).css('top', topD).css('left', leftD);
     
     
    });
 
});