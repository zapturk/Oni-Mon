///cc_shrineheal()
function cc_shrineheal() {

	//Heal up monsters
	for(var c = 0; c < PARTYSIZE_ACTIVE; c++){
		if(amp_read_var(AMP_FIRST_ACTIVE + c,amp_MONID) != NONE){
			amp_heal_HPMP(AMP_FIRST_ACTIVE + c)
			global.active_monster_party[c,amp_AILMENT] = NONE
		}
	}

	//Spawn effect
	sfx(jingle_shrineheal)
	with(obj_player){
		instance_create_depth(x,y-24,-14000,obj_shrinehealglow)
	}

	//Memorize location
	with(obj_player){
		global.last_saved_shrine_room = room
		global.last_saved_shrine_x    = x
		global.last_saved_shrine_y    = y
	}


}
