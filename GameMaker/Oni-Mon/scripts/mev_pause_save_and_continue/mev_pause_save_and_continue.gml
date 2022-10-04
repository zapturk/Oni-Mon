///mev_pause_save_and_continue()
function mev_pause_save_and_continue() {
	with(obj_player){
		global.load_room = room
		global.load_x    = x
		global.load_y    = y
	}

	savefile_save(global.savefile_filename)
	with(parent_menu){
		instance_destroy()
	}
	sfx(jingle_monupgrade)
	message_spawn(tsprintf("% saved the game!",global.player_name))


}
