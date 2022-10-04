///monster_get_atk(amp_id)
function monster_get_atk(argument0) {
	return floor(
	lerp(
	5,
	global.monster_data[global.active_monster_party[argument0,amp_MONID],mond_BASESTAT_ATK]*2 +
	global.active_monster_party[argument0,amp_IV_ATK] +
	global.active_monster_party[argument0,amp_EV_ATK]*0.3,
	global.active_monster_party[argument0,amp_LEVEL]/LEVEL_CAP)
	);


}
