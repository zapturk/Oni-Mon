///mev_monster_learnmove_cancel()
function mev_monster_learnmove_cancel() {
	with(parent_menu){
		instance_destroy()
	}
	message_spawn(tsprintf("% didn't learn %.",monster_get_name(my_monster),global.move_data[my_newmove,mvd_NAME]))


}
