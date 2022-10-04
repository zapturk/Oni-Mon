///action_enqueue(user,target,actiontype,actionarg,speedprio)
function action_enqueue(argument0, argument1, argument2, argument3, argument4) {
	//Puts an action into the action queue. Used to enqueue a move or item use (someone's whole turn).
	var argray = [argument0,argument1,argument2,argument3,argument4];
	with(obj_battlecontrol){
		ds_priority_add(aq_normal,argray,argument4);
	}


}
