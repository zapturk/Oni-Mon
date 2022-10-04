///monster_get_name(amp_id)
function monster_get_name(argument0) {
	var amp_id = argument0;
	var s = amp_read_var(amp_id,amp_NICKNAME);
	if(s != ""){
		//Nickname is given, use that
		return s;
	}
	else{
		//There's no nickname, use species name instead.
		return global.monster_data[amp_read_var(amp_id,amp_MONID),mond_NAME]
	}
	//Failsafe
	return "???"


}
