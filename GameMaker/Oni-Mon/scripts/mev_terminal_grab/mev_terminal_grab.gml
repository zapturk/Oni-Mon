///mev_terminal_grab
function mev_terminal_grab() {
	instance_destroy()
	with(daddy){
		grabbing = true
		for(var c = 0; c < AMP_MAX; c++){
			global.active_monster_party[AMP_CLIPBOARD,c] = global.active_monster_party[other.my_monster,c]
		}
		amp_clear_monster(other.my_monster)
		if(menuvalue_x < columns_party){
			grabbed_original_amp = terminal_AMP_GRABBED_FROM_PARTY
		}
		else{
			grabbed_original_amp = other.my_monster
		}
			
		//Sort the party if grabbed from there
		if(menuvalue_x < columns_party){
			for(var c = AMP_FIRST_ACTIVE; c < AMP_FIRST_ACTIVE + PARTYSIZE_ACTIVE; c++){
				if(amp_read_var(c,amp_MONID) == NONE){
					//Empty! Must move the others back a notch. 
					for(var d = c; d < AMP_FIRST_ACTIVE + PARTYSIZE_ACTIVE - 1; d++){
						for(var e = 0; e < AMP_MAX; e++){
							global.active_monster_party[d,e] = global.active_monster_party[d+1,e]
						}
					}
					amp_clear_monster(AMP_FIRST_ACTIVE + PARTYSIZE_ACTIVE - 1)
				}
			}
			//Verify that party isn't empty now
			if(amp_read_var(AMP_FIRST_ACTIVE,amp_MONID) == NONE){
				//It is empty! Put the monster back and abort.
				//HACK: we just assume this can only happen if the player grabs the last party monster manually.
				//This will also happen if the party already was empty before they tried doing this.
				//This shouldn't normally happen, though, unless the player manages to skip getting their first monster.
				for(var e = 0; e < AMP_MAX; e++){
					global.active_monster_party[AMP_FIRST_ACTIVE,e] = global.active_monster_party[AMP_CLIPBOARD,e]
				}
				amp_clear_monster(AMP_CLIPBOARD)
					
				message_spawn("You need to have at least 1 monster in your party!")
				audio_stop_sound(snd_menu_ok)
				sfx(snd_menu_buzzer)
				grabbing = false
				grabbed_original_amp = NONE
			}
		}
			
		//Update menu
		msh_terminal_update()
	}


}
