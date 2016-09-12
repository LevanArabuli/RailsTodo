function checkTodo(item){
	console.log('check', item.id);
}

function uncheckTodo(item){
	console.log('uncheck', item.id);
	$(item).closest('tr').remove();
}