///mev_nameentry_confirm_monster()
function mev_nameentry_confirm_monster() {
	var str = ggui_frame_element_string[name_entry_string_frame,name_entry_string_elm];
	if(str != "" || name_entry_allow_empty){
		var old_name = amp_get_monster_name(my_monster)
		global.active_monster_party[my_monster,amp_NICKNAME] = str
	
		//Enqueue a confirmation message
		if(str == ""){
			csc_enqueue(cc_message,tsprintf("That's fine too! Why change what isn't broken? % is a pretty darn good name.",amp_get_monster_name(my_monster)))
		}
		else{
			csc_enqueue(cc_message,tsprintf("All set! From now on, % will be known as %! It's a really cool name!",old_name,str))
		}
	
		//Done here! Let's move on!
		instance_destroy()
		csc_proceed()
	}
	else{
		audio_stop_sound(snd_menu_ok)
		sfx(snd_menu_buzzer)
		message_spawn("Name can't be empty!")
	}


}
