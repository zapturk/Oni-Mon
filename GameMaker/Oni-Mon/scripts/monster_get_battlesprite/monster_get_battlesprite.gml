///monster_get_battlesprite(amp_id)
function monster_get_battlesprite(argument0) {
	return global.monster_data[amp_read_var(argument0,amp_MONID),mond_SPRITE_BATTLE]


}
