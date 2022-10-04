///amp_get_new_box_id()
function amp_get_new_box_id() {
	for(var c = 0; c < PARTYSIZE_BOXED; c++){
		var d = ((global.selected_monster_box*PARTYSIZE_MONSTERS_PER_BOXPAGE + c) mod PARTYSIZE_BOXED) + AMP_FIRST_BOX;
		if(global.active_monster_party[d,amp_MONID] == NONE){
			return d;
		}
	}
	return NONE


}
