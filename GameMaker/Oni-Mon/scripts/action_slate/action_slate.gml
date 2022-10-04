///action_slate(user,target,actiontype,actionarg,speedprio)
function action_slate(argument0, argument1, argument2, argument3, argument4) {
	//Puts an action into the buffer of listed actions.
	if(DEBUG_MODE){
		show_debug_message(tsprintf("Slate attack for % --> % (type %:%)",argument0,argument1,argument2,argument3))
	}
	var argray = [argument0,argument1,argument2,argument3,argument4];
	with(obj_battlecontrol){
		selected_actions[action_order_current] = argray;
	}


}
