///battle_messages_pop()
function battle_messages_pop() {
	var m = ds_queue_dequeue(message_queue);
	return m;


}
