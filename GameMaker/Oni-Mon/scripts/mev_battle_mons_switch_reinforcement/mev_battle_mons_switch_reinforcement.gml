///mev_battle_mons_switch_reinforcement()
function mev_battle_mons_switch_reinforcement() {

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
	with(parent_menu){
		instance_destroy()
	}
	with(obj_battlecontrol){
		action_monster.state = bmonsterstate_SWITCH
		action_monster.switch_mon = total_monster
								
		n = instance_create_depth(x,y,0,obj_battleswitcher)
		n.my_monobj = action_monster
		var ts = choose("Your turn, %!","You can do it, %!","%, go avenge your buddy!","I'm counting on you, %!","You have to do it, %!","%, this is your chance!","I've got no choice... gotta use %!","You've activated my trap card! %, go get'em!","%, go get'em!","If all else fails, use %!");
		battle_message(tsprintf(ts,amp_get_monster_name(total_monster)))
	}


}
