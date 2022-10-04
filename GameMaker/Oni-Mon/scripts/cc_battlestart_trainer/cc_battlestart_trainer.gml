///cc_battlestart_trainer()
function cc_battlestart_trainer() {
	global.encounter_type			= encountertype_TRAINER
	var trainernum = array_length_1d(global.encounter_trainer_data);
	global.enemy_side_monsters		= trainernum
	global.player_side_monsters		= trainernum

	with(obj_player){
		global.load_x			= x
		global.load_y			= y
		global.load_room		= room
		global.load_direction	= drawdir
	
	
		//Stop the music!
		bgm(NONE)
		sfx(jingle_battle_intro)
	
		instance_create_depth(x,y,-15500,obj_battletransitioneffect)
			
		room_goto_fade(rm_battle,30)
	}


}
