///amp_get_monster_name(amp)
function amp_get_monster_name(argument0) {
	var nn = global.active_monster_party[argument0,amp_NICKNAME];
	if(nn != ""){
		return nn
	}
	else{
		return global.monster_data[global.active_monster_party[argument0,amp_MONID],mond_NAME]
	}


}
