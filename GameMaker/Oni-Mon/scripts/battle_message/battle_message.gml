///battle_message(string)
function battle_message(argument0) {
	with(obj_battlecontrol){
		ds_queue_enqueue(message_queue,argument0)
	}


}
