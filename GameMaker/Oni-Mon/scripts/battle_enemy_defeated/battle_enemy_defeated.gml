///battle_enemy_defeated()
function battle_enemy_defeated() {
	for(var c = AMP_FIRST_ENEMY;c < AMP_FIRST_ENEMY + PARTYSIZE_MAX_ENEMY; c++){
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
