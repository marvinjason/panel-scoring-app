$(function(){

	$('.move-btn').click(function(){
		var val = $('input[name=r-btn]:checked').val();
		App.notifications.move(val);
	});

	$('.show-btn').click(function(){
		App.notifications.show();
	});

	$('.hide-btn').click(function(){
		App.notifications.hide();
	});
	
});