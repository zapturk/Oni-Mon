///mev_monster_learnmove_confirm()
function mev_monster_learnmove_confirm() {
	var mv = global.active_monster_party[my_monster,amp_MOVE1 + menuvalue_y];
	global.active_monster_party[my_monster,amp_MOVE1    + menuvalue_y] =				  my_newmove
	global.active_monster_party[my_monster,amp_MOVE1_MP + menuvalue_y] = global.move_data[my_newmove,mvd_MP]
	with(parent_menu){
		instance_destroy()
	}
	sfx(jingle_monupgrade)
	message_spawn(tsprintf("Poof! % forgot %... and learned % instead!",monster_get_name(my_monster),global.move_data[mv,mvd_NAME],global.move_data[my_newmove,mvd_NAME]))


}
