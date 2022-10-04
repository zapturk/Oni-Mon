///monster_get_def(amp_id)
function monster_get_def(argument0) {
	return floor(
	lerp(
	5,
	global.monster_data[global.active_monster_party[argument0,amp_MONID],mond_BASESTAT_DEF]*2 +
	global.active_monster_party[argument0,amp_IV_DEF] +
	global.active_monster_party[argument0,amp_EV_DEF]*0.3,
	global.active_monster_party[argument0,amp_LEVEL]/LEVEL_CAP)
	);


}
