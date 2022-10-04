///mev_nameentry_character()
function mev_nameentry_character() {
	var str = ggui_frame_element_string[name_entry_string_frame,name_entry_string_elm];
	if(string_length(str) < maximal_allowed_name_length){
		ggui_frame_element_string[name_entry_string_frame,name_entry_string_elm] = str + my_substring[menuvalue_x,menuvalue_y]
	}
	else{
		audio_stop_sound(snd_menu_ok)
		sfx(snd_menu_buzzer)
	}


}
