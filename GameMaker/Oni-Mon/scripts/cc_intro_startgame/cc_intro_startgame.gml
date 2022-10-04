///cc_intro_startgame()
function cc_intro_startgame() {
	//Default to center of the lab
	global.load_room = rm_town1_indoors
	global.load_x    = 1840
	global.load_y	 = 572
	room_goto_fade(global.load_room,45)//Destroys the cutscenecontrol, nothing else


}
