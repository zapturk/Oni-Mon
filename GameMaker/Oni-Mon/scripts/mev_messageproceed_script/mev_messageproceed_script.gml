///mev_messageproceed_script()
function mev_messageproceed_script() {
	if(!message_active){
		//Done, let's gone
		if(script_proceed != NONE){
			script_execute(script_proceed)
		}
	
		instance_destroy()
	}
	else{
		//Stop the BLOOP sound that plays by default if you try to proceed
		audio_stop_sound(snd_menu_ok)
	}


}
