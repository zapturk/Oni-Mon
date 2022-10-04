///monster_learnmove_message_step()
function message_menu_step() {
	message_handle()
	if(message_done && !message_active){
		instance_destroy()
	}


}
