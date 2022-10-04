///amp_get_new_enemy_id()
function amp_get_new_enemy_id() {
	for(var c = AMP_FIRST_ENEMY; c < AMP_FIRST_ENEMY + PARTYSIZE_MAX_ENEMY; c++){
		if(global.active_monster_party[c,amp_MONID] == NONE){
			return c;
		}
	}
	return NONE


}
