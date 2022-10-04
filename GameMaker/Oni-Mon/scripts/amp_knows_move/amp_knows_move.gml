///amp_knows_move(amp,moveid)
function amp_knows_move(argument0, argument1) {
	for(var c = amp_MOVE1; c < amp_MOVE1 + MONSTER_MAX_NUMBER_OF_MOVES; c++){
		if(global.active_monster_party[argument0, c] == argument1){
			return true
		}
	}
	return false


}
