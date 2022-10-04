///battle_messages_empty()
function battle_messages_empty() {
	with(obj_battlecontrol){
		return ds_queue_empty(message_queue) && !message_active;
	}


}
