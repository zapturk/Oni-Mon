///battle_menu_done_proceed()
function battle_menu_done_proceed() {
	with(obj_gguimenu){
		instance_destroy()
	}
	//Note that the destroy script will reset this variable, so we need to manually override it here.
	with(obj_battlecontrol){
		action_proceed = true
	}


}
