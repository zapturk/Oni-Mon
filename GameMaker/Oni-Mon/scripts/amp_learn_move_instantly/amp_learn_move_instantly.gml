///amp_learn_move_instantly(amp,move)
function amp_learn_move_instantly(argument0, argument1) {
	//Tries to put the move in an empty slot, if any. Returns whether successful.
	for(var c = 0;c < MONSTER_MAX_NUMBER_OF_MOVES;c++){
		if( global.active_monster_party[argument0,amp_MOVE1   +c] == NONE){
			global.active_monster_party[argument0,amp_MOVE1   +c] =                  argument1
			global.active_monster_party[argument0,amp_MOVE1_MP+c] = global.move_data[argument1,mvd_MP]
			return true
		}
	}
	return false


}
