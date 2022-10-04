///battle_get_monster_name(side,number)
function battle_get_monster_name(argument0, argument1) {
	with(obj_battlemonster){
		if(side == argument0){
			if(ordering_number == argument1){
				return name;
			}
		}
	}
	//Offer a default placeholder
	return "???"


}
