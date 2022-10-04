///amp_heal_hpmp(amp_id)
function amp_heal_HPMP(argument0) {
	global.active_monster_party[argument0,amp_HP]		= monster_get_mhp(argument0)
	for(var c = 0; c < MONSTER_MAX_NUMBER_OF_MOVES; c++){
		var mv = global.active_monster_party[argument0,amp_MOVE1 + c];
		if(mv == NONE){
			global.active_monster_party[argument0,amp_MOVE1_MP + c] = 0;
		}
		else{
			global.active_monster_party[argument0,amp_MOVE1_MP + c] = global.move_data[mv,mvd_MP]
		}
	}


}
