///mev_title_newgame()
function mev_title_newgame() {

	//Reset globals, in case we tried to load a file before.
	init_player_data()
	init_party()
	init_default_finishing_touches()

	//Find first valid file
	for(var c = 0; c < SAVEFILES_MAX_ALLOWED; c++){
		var fn = filenameify_savefile(c)
		if(!file_exists(fn)){
			global.savefile_filename = fn
			break
		}
	}

	//Ready to start!
	room_goto(rm_intro)


}
