///amp_get_new_party_id()
function amp_get_new_party_id() {
	for(var c = AMP_FIRST_ACTIVE; c < AMP_FIRST_ACTIVE + PARTYSIZE_ACTIVE; c++){
		if(global.active_monster_party[c,amp_MONID] == NONE){
			return c;
		}
	}
	return NONE


}
