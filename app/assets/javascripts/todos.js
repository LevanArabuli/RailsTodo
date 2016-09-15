$(document).on('change', '[type=checkbox]', function (e) {
	box = e.target;
	setTimeout(function () {
		$(box).closest('tr').remove();
		var dest = box.checked ? $('#doneItems') : $('#todoItems');
		dest.append($(box).closest('tr'));
	}, 500);	
});