///monster_get_stat(amp_id,stat)
function monster_get_stat(argument0, argument1) {
	switch(argument1){
		case stat_MHP:	return monster_get_mhp(argument0);
		case stat_ATK:	return monster_get_atk(argument0);
		case stat_DEF:	return monster_get_def(argument0);
		case stat_MAG:	return monster_get_mag(argument0);
		case stat_RES:	return monster_get_res(argument0);
		case stat_SPD:	return monster_get_spd(argument0);

		default:		return NONE
	}


}
