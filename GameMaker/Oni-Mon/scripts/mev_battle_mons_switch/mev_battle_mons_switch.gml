///mev_battle_mons_switch()
function mev_battle_mons_switch() {

	var total_monster = my_monster;

	//Check that the monster is OK!
	if(global.active_monster_party[total_monster,amp_MONID] == NONE){
		message_spawn("There's nobody there!")
		return NONE;
	}
	if(global.active_monster_party[total_monster,amp_HP] <= 0){
		message_spawn(tsprintf("% is dead!",amp_get_monster_name(total_monster)))
		return NONE;
	}
	var itsok = true;
	with(obj_battlemonster){
		if(amp_id == total_monster){
			itsok = false;
		}
	}
	if(!itsok){
		message_spawn(tsprintf("% is already in battle!",amp_get_monster_name(total_monster)))
		return NONE;
	}

	//All right, we can do the switch!
	action_slate(obj_battlecontrol.action_monster,obj_battlecontrol.action_monster,battleaction_SWITCH,total_monster,monster_get_spd(obj_battlecontrol.action_monster.amp_id) + BATTLEACTION_SPEEDBONUS_SWITCH)

	//Done, let's go!
	battle_menu_done_proceed()


}
