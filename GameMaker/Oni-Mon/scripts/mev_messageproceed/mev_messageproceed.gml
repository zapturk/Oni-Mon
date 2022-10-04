///mev_messageproceed()
function mev_messageproceed() {
	if(!message_active){
		//Done, let's gone
		instance_destroy()
	}
	else{
		//Stop the BLOOP sound that plays by default if you try to proceed
		audio_stop_sound(snd_menu_ok)
	}


}
