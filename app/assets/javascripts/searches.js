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

// $(document).ready(function() {
// 	$('.row').hide()
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
// })