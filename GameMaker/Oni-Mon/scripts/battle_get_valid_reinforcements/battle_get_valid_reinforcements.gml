///battle_get_valid_reinforcements(first,howmany)
function battle_get_valid_reinforcements(argument0, argument1) {
	var mons = [];
	for(var c = argument0; c < argument0 + argument1; c++){
		var mon = c;
		if(global.active_monster_party[mon,amp_HP] > 0){
			//It's an alive monster! But is it valid to send out?
			var ok = true;
			with(obj_battlemonster){
				if(amp_id == mon){
					ok = false
					break
				}
			}
			if(ok){
				mons[array_length_1d(mons)] = mon
			}
		}
	}

	return mons


}
