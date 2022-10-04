///battle_get_random_targets(monobj,mv)
function battle_get_random_targets(argument0, argument1) {
	var tg = battle_get_valid_targets(argument0,argument1)
	switch(global.move_data[argument1,mvd_TARGET]){
		case movetarg_ALLALLY:
		case movetarg_ALLENE:
		case movetarg_EVERYONE:
		case movetarg_EVERYONEEXCEPTUSER:
			//Multi-target: return all targets.
			return tg;
		break
	
		default:
			//Single-target: return one target.
			return [tg[irandom_range(0,array_length_1d(tg)-1)]]
		break
	}


}
