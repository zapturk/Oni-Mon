///monster_get_mhp(amp_id)
function monster_get_mhp(argument0) {
	return floor(
	global.active_monster_party[argument0,amp_LEVEL] + 
	lerp(
	20,
	global.monster_data[global.active_monster_party[argument0,amp_MONID],mond_BASESTAT_HP]*2.5 +
	global.active_monster_party[argument0,amp_IV_MHP] +
	global.active_monster_party[argument0,amp_EV_MHP]*0.3,
	global.active_monster_party[argument0,amp_LEVEL]/LEVEL_CAP)
	);


}
