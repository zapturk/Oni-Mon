///battle_get_valid_targets(userobject,move)
function battle_get_valid_targets(argument0, argument1) {
	var targs = [];
	switch(global.move_data[argument1,mvd_TARGET]){
		case movetarg_USER:
			if(battle_is_alive(argument0)){
				targs[0] = argument0
			}
		break
	
		case movetarg_1ALLY:
		case movetarg_ALLALLY:
			with(obj_battlemonster){
				if(side == argument0.side && battle_is_alive(id)){
					targs[array_length_1d(targs)] = id
				}
			}
		break
	
		case movetarg_1ENE:
		case movetarg_ALLENE:
			with(obj_battlemonster){
				if(side != argument0.side && battle_is_alive(id)){
					targs[array_length_1d(targs)] = id
				}
			}
		break
	
		case movetarg_EVERYONE:
			with(obj_battlemonster){
				if(battle_is_alive(id)){
					targs[array_length_1d(targs)] = id
				}
			}
		break
	
		case movetarg_EVERYONEEXCEPTUSER:
			with(obj_battlemonster){
				if(id != argument0 && battle_is_alive(id)){
					targs[array_length_1d(targs)] = id
				}
			}
		break
	}
	if(DEBUG_MODE){
		show_debug_message(tsprintf("valid targets: %",targs))
	}
	return targs;


}
