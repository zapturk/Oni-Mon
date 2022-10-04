///monster_get_res(amp_id)
function monster_get_res(argument0) {
	return floor(
	lerp(
	5,
	global.monster_data[global.active_monster_party[argument0,amp_MONID],mond_BASESTAT_RES]*2 +
	global.active_monster_party[argument0,amp_IV_RES] +
	global.active_monster_party[argument0,amp_EV_RES]*0.3,
	global.active_monster_party[argument0,amp_LEVEL]/LEVEL_CAP)
	);


}
