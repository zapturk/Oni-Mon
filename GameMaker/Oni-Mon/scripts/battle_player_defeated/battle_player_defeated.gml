///battle_player_defeated()
function battle_player_defeated() {
	for(var c = AMP_FIRST_ACTIVE;c < AMP_FIRST_ACTIVE + PARTYSIZE_ACTIVE; c++){
		if(amp_read_var(c,amp_MONID) != NONE){
			if(amp_read_var(c,amp_HP) > 0){
				//Found an alive monster, so they're not done yet!
				return false
			}
		}
	}
	//Okay, all dead
	return true


}
