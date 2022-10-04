///msh_nameentry_step()
function msh_nameentry_step() {
	if(k_b && !p_b){
		//Erase last character
		var str = ggui_frame_element_string[name_entry_string_frame,name_entry_string_elm];
		if(str == ""){
			//Don't do anything
		}
		else{
			//Erase
			ggui_frame_element_string[name_entry_string_frame,name_entry_string_elm] = string_delete(str,string_length(str),1)
		}
		sfx(snd_menu_buzzer)
	}


}
