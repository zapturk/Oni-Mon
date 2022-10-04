///battle_is_alive(monobj)
function battle_is_alive(argument0) {
	var alive = false;
	with(argument0){
		if(amp_id != NONE){
			if(amp_read_var(amp_id,amp_HP) > 0){
				alive = true
			}
		}
	}
	return alive


}
