$(function(){

	$('.move-btn').click(function(){
		var val = $('input[name=r-btn]:checked').val();
		App.notifications.move(val);
	});

	$('.show-btn').click(function(){
		var users = "";

		$('input[name=user]:checked').each(function(){
			users += $(this).val() + ",";
		});

		users = users.slice(0, -1);

		if (users == ""){
			alert("Please tick a checkbox!");
		} else {
			App.notifications.show(users);
		}
	});

	$('.hide-btn').click(function(){
		App.notifications.hide();
	});
	
});