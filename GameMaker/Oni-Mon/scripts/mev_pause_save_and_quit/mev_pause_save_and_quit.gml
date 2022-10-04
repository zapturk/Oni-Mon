///mev_pause_save_and_quit()
function mev_pause_save_and_quit() {
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
	message_spawn_script(tsprintf("% saved the game, and decided to call it a day!",global.player_name),mev_pause_save_and_quit_actually_quit)


}
