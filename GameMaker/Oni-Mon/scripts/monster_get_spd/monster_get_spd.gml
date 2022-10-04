///monster_get_spd(amp_id)
function monster_get_spd(argument0) {
	return floor(
	lerp(
	5,
	global.monster_data[global.active_monster_party[argument0,amp_MONID],mond_BASESTAT_SPD]*2 +
	global.active_monster_party[argument0,amp_IV_SPD] +
	global.active_monster_party[argument0,amp_EV_SPD]*0.3,
	global.active_monster_party[argument0,amp_LEVEL]/LEVEL_CAP)
	);


}
