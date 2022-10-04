///mev_nameentry_confirm_player()
function mev_nameentry_confirm_player() {
	var str = ggui_frame_element_string[name_entry_string_frame,name_entry_string_elm];
	if(str != "" || name_entry_allow_empty){
		global.player_name = str
		instance_destroy()
		csc_proceed()
	}
	else{
		audio_stop_sound(snd_menu_ok)
		sfx(snd_menu_buzzer)
		message_spawn("Name can't be empty!")
	}


}
