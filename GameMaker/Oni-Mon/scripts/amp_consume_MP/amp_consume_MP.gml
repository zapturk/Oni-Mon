///amp_consume_MP(amp_id,move_id,amount)
function amp_consume_MP(argument0, argument1, argument2) {
	//Drains MP from the first matching move and then exits.
	//Does nothing if the monster doesn't know the move.
	for(var c = 0; c < MONSTER_MAX_NUMBER_OF_MOVES; c++){
		var mv = global.active_monster_party[argument0,amp_MOVE1 + c];
		if(mv == argument1){
			global.active_monster_party[argument0,amp_MOVE1_MP + c] = max(0,global.active_monster_party[argument0,amp_MOVE1_MP + c] - argument2);
			break
		}
	}


}
