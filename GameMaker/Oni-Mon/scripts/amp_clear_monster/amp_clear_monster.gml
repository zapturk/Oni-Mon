///amp_clear_monster(amp_id)
function amp_clear_monster(argument0) {
	//Reset to NONE
	for(var c = AMP_MAX; c >= 0; c--){
		global.active_monster_party[argument0,c] = NONE
	}
	//Reset strings manually
	global.active_monster_party[argument0,amp_NICKNAME] = "" 


}
