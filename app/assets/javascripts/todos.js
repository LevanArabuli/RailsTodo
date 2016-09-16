function updateProgressBar(diff) {
	var bar = $('.progress-bar');
	var done = parseInt(bar.attr('aria-valuenow'));
	done += diff;

	var max = bar.attr('aria-valuemax');
	bar.attr('aria-valuenow', done);

	bar.width(((done * 100) / max) + '%');

	bar.text(done + ' / ' + max);
}

function saveStatus(id, status) {
	return $.post('/todos/updatestatus', { id: id, isDone: status });
}

$(document).on('change', '[name=checkbox]', function (e) {
	box = e.target;
	setTimeout(function () {
		saveStatus($(box).attr('id'), box.checked).success(function (response) {
			$(box).closest('tr').remove();
			var dest = box.checked ? $('#doneItems') : $('#todoItems');
			dest.append($(box).closest('tr'));

			updateProgressBar(box.checked ? 1 : -1);
		}).error(function (err) {
			console.log('error', err);
		})
	}, 200);
});

var ix = 0;
$(function () {
	$('#switch').click(function () {
		ix++;
		$('.background-image').css('background-image', 'url(/images/bg' + ix % 4 + '.jpg)');
	})
});

$(function () {
	$('#due_date').datetimepicker();
});