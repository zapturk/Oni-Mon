///monster_get_mag(amp_id)
function monster_get_mag(argument0) {
	return floor(
	lerp(
	5,
	global.monster_data[global.active_monster_party[argument0,amp_MONID],mond_BASESTAT_MAG]*2 +
	global.active_monster_party[argument0,amp_IV_MAG] +
	global.active_monster_party[argument0,amp_EV_MAG]*0.3,
	global.active_monster_party[argument0,amp_LEVEL]/LEVEL_CAP)
	);


}
