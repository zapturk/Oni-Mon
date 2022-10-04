///mev_title_continue_fileselected()
function mev_title_continue_fileselected() {
	global.savefile_filename = selected_filename[menuvalue_y]
	savefile_load(global.savefile_filename)

	if(!room_exists(global.load_room)){
		//Default to center of the lab
		global.load_room = rm_town1_indoors
		global.load_x    = 1840
		global.load_y	 = 572
	}

	if(!room_exists(global.last_saved_shrine_room)){
		//Default to first town's shrine
		global.last_saved_shrine_room = rm_town1_indoors
		global.last_saved_shrine_x    = 608
		global.last_saved_shrine_y    = 1200
	}

	room_goto_fade(global.load_room,30)
	
	//Remove all menus so player can't do anything stupid mid-transition
	with(parent_menu){
		instance_destroy()
	}


}
