///mev_battle_escape()
function mev_battle_escape() {
	if(global.encounter_type == encountertype_TRAINER){
		message_spawn("No way! Running from a trainer battle is dishonorable!")
	}
	else{
		if(choose(false,true)){
			message_spawn_script("Got away in one piece!",mev_battle_escape_actually_escape)
		}
		else{
			battle_message("You couldn't escape!")
			with(obj_battlecontrol){
				substate = bcontrolstate_ACTIONSELECT_END
			}
			with(parent_menu){
				instance_destroy()
			}
		}
	}


}
