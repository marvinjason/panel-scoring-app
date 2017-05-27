$(function(){

	$('.move').click(function(){
		var val = $('input[name=r-btn]:checked').val();
		App.notifications.move(val);
	});

	$('.show').click(function(){
		App.notifications.show();
	});

	$('.hide').click(function(){
		App.notifications.hide();
	});

});