///battle_amp_get_monobj(amp)
function battle_amp_get_monobj(argument0) {
	var ret = NONE;
	with(obj_battlemonster){
		if(amp_id == argument0){
			ret = id;
			break;
		}
	}
	return ret;


}
