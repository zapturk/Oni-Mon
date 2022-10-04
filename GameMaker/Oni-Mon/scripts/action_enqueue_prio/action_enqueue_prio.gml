///action_enqueue_prio(user,target,type,action)
function action_enqueue_prio(argument0, argument1, argument2, argument3) {
	//Puts an action in the "priority lane" FIFO.
	//Used for side-effects of an attack that should be handled before the next attack starts.
	var argray = [argument0,argument1,argument2,argument3];
	with(obj_battlecontrol){
		ds_queue_enqueue(aq_hiprio,argray);
	}


}
